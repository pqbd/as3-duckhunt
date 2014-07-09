package alx.duckhunt
{
  import flash.display.MovieClip;
  import flash.utils.Timer;
  import flash.events.Event;
  import flash.events.TimerEvent;

  import alx.common.util.CRandom;

  public class CDuckHuntGame extends CGame
  {
    private var m_dog:MovieClip;
    private var m_headShot:MovieClip;
    private var m_cloudFactory:CTargetFactory;
    private var m_gameStart:MovieClip;
    private var m_gameOver:MovieClip;
    private var m_gameRound:MovieClip;
    private var m_gameRoundOver:MovieClip;

    public function CDuckHuntGame( ...arRound):void
    {
      super( arRound);

      this.setDog( null)
          .setHeadShot( null)
          .setCloudFactory( null)
          .setGameStart( null)
          .setGameOver( null)
          .setGameRound( null)
          .setGameRoundOver( null)
          ;
    }

    public function setDog( dog:MovieClip):CDuckHuntGame
    {
      this.m_dog = dog;
      return this;
    }
    public function setHeadShot( headShot:MovieClip):CDuckHuntGame
    {
      this.m_headShot = headShot;
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
      //if ( this.m_headShot != null)
      if ( this.m_cloudFactory != null)
      if ( this.m_gameStart != null)
      if ( this.m_gameOver != null)
      if ( this.m_gameRound != null)
      if ( this.m_gameRoundOver != null)
        bOk = true;
      return bOk;
    }

    protected override function onTargetMiss():void
    {
      super.onTargetMiss();
      this.m_dog.gotoAndPlay( 2);
    }
    //protected override function onTargetHit( target:CTarget):void
    //{
    //  super.onTargetHit( target);
    //}
    //protected override function onTargetDispose():void
    //{
    //  super.onTargetDispose();
    //}

    protected override function prepare():void
    {
      super.prepare();
      this.m_dog.visible = true;
      //this.m_headShot.visible = false;
      this.m_gameStart.visible = true;
      this.m_gameOver.visible = false;
      this.m_gameRound.visible = false;
      this.m_gameRoundOver.visible = false;

      this.m_dog.stop();
      //this.m_headShot.stop();
      this.m_gameStart.stop();
      this.m_gameOver.stop();
      this.m_gameRound.stop();
      this.m_gameRoundOver.stop();

      var display:CDisplay = new CDisplay( this.getDisplay().getSrc().parent);
      display.add( this.m_dog);
      //display.add( this.m_headShot);
      display.add( this.m_gameOver);
      display.add( this.m_gameRound);
      display.add( this.m_gameRoundOver);
      display.add( this.m_gameStart);
    }
    protected override function roundResults( round:CRound, arRound:Array):void
    {
      super.roundResults( round, arRound);

      this.m_gameRoundOver.c_acuracy.text = ''+round.getStatistic().getAccuracyPercent()+'%';
      this.m_gameRoundOver.c_score.text = ''+round.getStatistic().getScores();
      this.m_gameRoundOver.visible = true;
    }
    protected override function gameResults( round:CRound, arRound:Array):void
    {
      super.gameResults( round, arRound);

      var totalStatistic:CStatistic = new CStatistic();
      for ( var i:int = 0; i < arRound.length; i++)
        totalStatistic.add( arRound[ i].getStatistic());
      this.m_gameOver.c_acuracy.text = totalStatistic.getAccuracyPercent()+'%';
      this.m_gameOver.c_score.text = totalStatistic.getScores();
      this.m_gameRoundOver.visible = false;
      this.m_gameOver.visible = true;
    }
    //protected override function onRoundFinish():void
    //{
    //  super.onRoundFinish();
    //}
    protected override function onRoundStart():void
    {
      super.onRoundStart();
      
      this.m_gameStart.visible = false;
      this.m_gameRoundOver.visible = false;
      this.m_gameOver.visible = false;

      this.m_gameRound.visible = true;
      this.m_gameRound.gotoAndPlay( 1);
    }

    public override function onDisplayResize( display:CDisplay, event:Event):void
    {
      super.onDisplayResize( display, event);

      this.m_gameStart.x = display.getHeight() / 2;
      this.m_gameStart.y = display.getHeight() / 2;

      this.m_dog.x = display.getWidth() / 2;
      this.m_dog.y = display.getHeight();

      //this.m_headShot.x = display.getWidth() - 150;
      //this.m_headShot.y = 0;

      this.m_gameRound.x = display.getWidth() / 2;
      this.m_gameRound.y = display.getHeight() / 2;

      this.m_gameRoundOver.x = display.getWidth() / 2;
      this.m_gameRoundOver.y = display.getHeight() / 2;

      this.m_gameOver.x = display.getWidth() / 2;
      this.m_gameOver.y = display.getHeight() / 2;      
    }
  }
}