package alx.duckhunt
{
  import flash.display.MovieClip;
  import flash.utils.Timer;
  import flash.events.Event;
  import flash.events.TimerEvent;

  import alx.common.util.CRandom;
  import alx.common.util.CArrayList;
  import alx.common.util.IIterator;

  public class CDuckHuntGame extends CGame
  {
    private var m_strPlayerName:String;
    
    private var m_headShotClass:Class;
    private var m_headShotList:CArrayList;

    private var m_cloudFactory:CTargetFactory;
    private var m_cloudTargetList:CArrayList;
    
    private var m_dog:MovieClip;
    private var m_gameStart:MovieClip;
    private var m_gameOver:MovieClip;
    private var m_gameRound:MovieClip;
    private var m_gameRoundOver:MovieClip;

    public static const CLOUD_SIZE:String = 'cloud-size';
    public static const CLOUD_SPEED:String = 'cloud-speed';

    public function CDuckHuntGame( ...arRound):void
    {
      super( arRound);

      this.m_cloudTargetList = new CArrayList();
      this.m_headShotList = new CArrayList();

      this.setDog( null)
          .setHeadShotClass( null)
          .setCloudFactory( null)
          .setGameStart( null)
          .setGameOver( null)
          .setGameRound( null)
          .setGameRoundOver( null)
          .setPlayerName( 'Player')
          ;
    }

    public function setPlayerName( strValue:String):CDuckHuntGame
    {
      this.m_strPlayerName = strValue;
      return this;
    }
    public function setDog( dog:MovieClip):CDuckHuntGame
    {
      this.m_dog = dog;
      return this;
    }
    public function setHeadShotClass( headShotClass:Class):CDuckHuntGame
    {
      this.m_headShotClass = headShotClass;
      return this;
    }
    public function setCloudFactory( cloudFactory:CCloudTargetFactory):CDuckHuntGame
    {
      this.m_cloudFactory = cloudFactory;
      return this;
    }
    public function setGameStart( gameStart:MovieClip):CDuckHuntGame
    {
      this.m_gameStart = gameStart;
      return this;
    }
    public function setGameOver( gameOver:MovieClip):CDuckHuntGame
    {
      this.m_gameOver = gameOver;
      return this;
    }
    public function setGameRound( gameRound:MovieClip):CDuckHuntGame
    {
      this.m_gameRound = gameRound;
      return this;
    }
    public function setGameRoundOver( gameRoundOver:MovieClip):CDuckHuntGame
    {
      this.m_gameRoundOver = gameRoundOver;
      return this;
    }

    public override function isReady():Boolean
    {
      var bOk = false;
      if ( super.isReady())
      if ( this.m_dog != null)
      if ( this.m_headShotClass != null)
      if ( this.m_cloudFactory != null)
      if ( this.m_gameStart != null)
      if ( this.m_gameOver != null)
      if ( this.m_gameRound != null)
      if ( this.m_gameRoundOver != null)
        bOk = true;
      return bOk;
    }

    protected function emitCloud( nCount:uint, bInit:Boolean = false):void
    {
      if ( bInit)
      {
        
      }
      else
      {
        var timer:Timer = new Timer( 1000, nCount);
        timer.addEventListener( TimerEvent.TIMER, emitCloudTimerHandler);
        timer.start();
      }
    }
    protected function emitCloudTimerHandler( event:TimerEvent):void
    {
      //this.m_cloudFactory.randomize();
      //var cloud:CTarget = this.m_cloudFactory.createTarget( );
      //this.m_cloudTargetList.add( cloud);
      //cloud.addToDisplay( this.m_display);
    }
    protected override function timerHandler( event:TimerEvent):void
    {
      super.timerHandler( event);
      var iterator:IIterator = this.m_cloudTargetList.iterator();
      while ( iterator.hasNext())
      {
        var target:CTarget = iterator.next() as CTarget;
        target.move();
        if ( target.getPosition().getX() < -target.getSize().getX())
        {
          //target.dispose();
          //iterator.remove();
          //this.emitCloud();
        }
      }
    }
    protected override function onTargetMiss():void
    {
      super.onTargetMiss();
      this.m_dog.gotoAndPlay( 2);
    }
    protected override function onTargetHit( target:CTarget):void
    {
      super.onTargetHit( target);

      var headShot:MovieClip = new this.m_headShotClass();
      headShot.c_nick1.text = this.m_strPlayerName;
      headShot.c_nick2.text = 'Duck['+target.getId()+']';
      
      var display:CDisplay = new CDisplay( this.getDisplay().getSrc().parent);
      headShot.x = display.getWidth() - headShot.width;
      headShot.y = this.m_headShotList.size() * headShot.height;
      display.add( headShot);
      this.m_headShotList.add( headShot);
      var timer:Timer = new Timer( 3000, 1);
      timer.addEventListener( TimerEvent.TIMER, headshotRemoveTimerHandler);
      timer.start();
    }
    protected function headshotRemoveTimerHandler( event:TimerEvent)
    {
      var iterator:IIterator = this.m_headShotList.iterator();
      var i:int = 0;
      while ( iterator.hasNext())
      {
        var headShot:MovieClip = iterator.next() as MovieClip;
        if ( i == 0)
        {          
          headShot.stop();
          headShot.parent.removeChild( headShot);
          iterator.remove();
        }
        else
          headShot.y = headShot.y - headShot.height;
        i++;
      }
    }
    protected override function prepare():void
    {
      this.m_dog.visible = true;
      this.m_gameStart.visible = true;
      this.m_gameOver.visible = false;
      this.m_gameRound.visible = false;
      this.m_gameRoundOver.visible = false;

      this.m_dog.stop();
      this.m_gameStart.stop();
      this.m_gameOver.stop();
      this.m_gameRound.stop();
      this.m_gameRoundOver.stop();

      var display:CDisplay = new CDisplay( this.getDisplay().getSrc().parent);
      display.add( this.m_dog);
      display.add( this.m_gameOver);
      display.add( this.m_gameRound);
      display.add( this.m_gameRoundOver);
      display.add( this.m_gameStart);

      super.prepare();
    }
    protected override function roundResults( round:CRound, arRound:Array):void
    {
      super.roundResults( round, arRound);

      this.m_gameRoundOver.c_acuracy.text = round.getStatistic().getAccuracyPercent().toFixed( 2)+'%';
      this.m_gameRoundOver.c_score.text = round.getStatistic().getScores();
      this.m_gameRoundOver.visible = true;
    }
    protected override function gameResults( round:CRound, arRound:Array):void
    {
      super.gameResults( round, arRound);

      var totalStatistic:CStatistic = new CStatistic();
      for ( var i:int = 0; i < arRound.length; i++)
        totalStatistic.add( arRound[ i].getStatistic());

      this.m_gameOver.visible = true;
      this.m_gameOver.c_player.text = this.m_strPlayerName;
      this.m_gameOver.c_acuracy.text = totalStatistic.getAccuracyPercent().toFixed( 2)+'%';
      this.m_gameOver.c_score.text = totalStatistic.getScores();
      this.m_gameRoundOver.visible = false;

    }
    protected override function onRoundStart():void
    {
      this.m_gameStart.visible = false;
      this.m_gameRoundOver.visible = false;
      this.m_gameOver.visible = false;
      this.m_gameRound.visible = true;
      this.m_gameRound.gotoAndPlay( 1);

      super.onRoundStart();
    }
    public override function onDisplayResize( display:CDisplay, event:Event):void
    {
      super.onDisplayResize( display, event);

      this.m_gameStart.x = display.getWidth() / 2;
      this.m_gameStart.y = display.getHeight() / 2;

      this.m_dog.x = display.getWidth() / 2;
      this.m_dog.y = display.getHeight();

      var iterator:IIterator = this.m_headShotList.iterator();
      while ( iterator.hasNext())
      {
        var headShot:MovieClip = iterator.next() as MovieClip;
        headShot.x = display.getWidth() - headShot.width;
      }

      this.m_gameRound.x = display.getWidth() / 2;
      this.m_gameRound.y = display.getHeight() / 2;

      this.m_gameRoundOver.x = display.getWidth() / 2;
      this.m_gameRoundOver.y = display.getHeight() / 2;

      this.m_gameOver.x = display.getWidth() / 2;
      this.m_gameOver.y = display.getHeight() / 2;
    }
  }
}