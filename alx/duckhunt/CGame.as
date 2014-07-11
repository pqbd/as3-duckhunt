package alx.duckhunt
{
  import flash.display.DisplayObjectContainer;
  import flash.display.StageAlign;
  import flash.display.StageScaleMode;
  import flash.utils.Timer;
  import flash.ui.Mouse;
  import flash.ui.Keyboard;
  import flash.events.Event;
  import flash.events.TimerEvent;
  import flash.events.MouseEvent;
  import flash.events.KeyboardEvent;

  import alx.common.util.CRandom;
  import alx.common.util.IList;
  import alx.common.util.IIterator;
  import alx.common.util.CArrayList;

  public class CGame
  implements IDisplayListener
  {
    private var m_display:CDisplay;
    private var m_arRound:Array;
    private var m_currentRound:CRound;
    private var m_nCurrentRoundIndex:uint;
    private var m_targetEmitter:CTargetEmitter;
    private var m_targetList:IList;

    private var m_weapon:CWeapon;

    public function CGame( ...arRound):void
    {
      this.Init( arRound);
    }

    public function Init( ...arRound):void
    {
      this.m_arRound = arRound;
      this.m_targetList = new CArrayList();
      this.m_targetEmitter = new CTargetEmitter();
      this.m_nCurrentRoundIndex = 0;
    }

    public function isReady():Boolean
    {
      var bOk = false;
      if ( this.m_arRound.length > 0)
        bOk = true;
      return bOk;
    }
    public function setWeapon( weapon:CWeapon):CGame
    {
      this.m_weapon = weapon;
      return this;
    }

    protected function getDisplay():CDisplay
    {
      return this.m_display;
    }
    protected function prepare():void
    {
      this.m_display.addDisplayListener( this);

      this.m_weapon.addToDisplay( this.m_display.getSrc().parent);
      this.m_display.addDisplayListener( this.m_weapon);
    }
    public function start( display:DisplayObjectContainer, random:CRandom = null):void
    {
      if ( this.isReady())
      {
        this.m_display = new CDisplay( display);

        var timer:Timer = new Timer( 10);
        timer.addEventListener( TimerEvent.TIMER, timerHandler);
        timer.start();
        
        Mouse.hide();
        display.stage.addEventListener( MouseEvent.MOUSE_MOVE, onMouseMoveHandler);
        display.stage.addEventListener( MouseEvent.MOUSE_UP, onMouseClickHandler);
        display.stage.addEventListener( KeyboardEvent.KEY_DOWN, onKeyDownEventHandler);        

        this.prepare();
      }
      else
        throw Error( 'Game not set');
    }

    protected function isRoundFinished():Boolean
    {
      var bOK:Boolean = false;
      if ( this.m_currentRound == null)
        bOK = true;
      else
      if ( this.m_currentRound.getStatistic().getTargetTotal() == this.m_currentRound.getTargetTotal())
      {
        if ( this.m_targetList.isEmpty())
          bOK = true;
      }
      return bOK;
    }
    protected function addScores():void
    {
      if ( this.m_currentRound != null)
      {      
        var nBonusScore:uint = this.m_currentRound.getScore() 
                              * this.m_currentRound.getStatistic().getAccuracyRate()
                              * this.m_currentRound.getStatistic().getFinishRate()
                              ;
        if ( this.m_currentRound.getStatistic().getAccuracyPercent() > 80)
          nBonusScore += 200;
        if ( this.m_currentRound.getStatistic().getFinishPercent() == 100)
          nBonusScore += 200;
        this.m_currentRound.getStatistic().incScores( nBonusScore);
      }
    }
    protected function getCurrentRound():CRound
    {
      return this.m_currentRound;
    }
    protected function nextRound():Boolean
    {
      this.m_targetList.clear();
      var bOk:Boolean = true;      
      if ( this.m_nCurrentRoundIndex < this.m_arRound.length)
      {        
        this.m_currentRound = this.m_arRound[ this.m_nCurrentRoundIndex++];
        this.m_targetEmitter.setMinForce( this.m_currentRound.getTargetMinForce())
                            .setMaxForce( this.m_currentRound.getTargetMaxForce())
                            ;
        this.onRoundStart();
      }
      else
        bOk = false;
      return bOk;
    }

    protected function timerHandler( event:TimerEvent):void
    {
      var bDisposed:Boolean = false;
      var iterator:IIterator = this.m_targetList.iterator();
      while ( iterator.hasNext())
      {
        var target:CTarget = iterator.next() as CTarget;
        if ( !target.isDisposed())
        {
          if (( target.getPosition().getX() < 0) || ( target.getPosition().getX() > this.m_display.getWidth()))
          {
            target.turnX();
          }
          if (( target.getPosition().getY() < 0) || ( target.getPosition().getY() > this.m_display.getHeight()))
          {
            if ( target.isHit())
            {
              if ( target.getPosition().getY() > this.m_display.getHeight())
              {
                target.dispose();
                bDisposed = true;
                iterator.remove();
              }
            }
            else
            if ( target.isMissed())
            {
              if ( target.getPosition().getY() < 0)
              {
                target.dispose();
                bDisposed = true;
                iterator.remove();
              }
            }
            else
            {
              target.turnY();
            }
          }
        }
        target.move();
      }
      if ( bDisposed)
        this.onTargetDispose();
    }

    protected function onTargetMiss():void
    {
      this.m_currentRound.getStatistic().incMiss();      
    }
    protected function onTargetHit( target:CTarget):void
    {
      this.m_currentRound.getStatistic().incHit( target.toString());
    }

    protected function emitTarget( nCount:uint = 1):void
    {
      var timer:Timer = new Timer( 100, nCount);
      timer.addEventListener( TimerEvent.TIMER, emitTargetTimerHandler);
      timer.start();
    }
    protected function emitTargetTimerHandler( event:TimerEvent):void
    {
      var target:CTarget = this.m_targetEmitter.EmitRandomOne( this.m_currentRound.getTargetFactory(), this.m_display.getSize(), null);
      this.m_targetList.add( target);
      target.addToDisplay( this.m_display);
      this.m_currentRound.getStatistic().incTarget( target.toString());
    }
    
    protected function onTargetDispose():void
    {
      if ( this.m_currentRound.getTargetTotal() > this.m_currentRound.getStatistic().getTargetTotal())
        this.emitTarget();
      if ( this.isRoundFinished())
        this.onRoundFinish();
    }
    protected function roundResults( round:CRound, arRound:Array):void
    {
      trace( round.getStatistic());
    }
    protected function gameResults( round:CRound, arRound:Array):void
    {
      var totalStatistic:CStatistic = new CStatistic();
      for ( var i:int = 0; i < arRound.length; i++)
        totalStatistic.add( arRound[ i].getStatistic());

      trace( round.getStatistic());
      trace( totalStatistic);
    }
    protected function onRoundFinish():void
    {
      this.addScores();
      this.roundResults( this.m_currentRound, this.m_arRound);
    }
    protected function onRoundStart():void
    {
      this.emitTarget( this.m_currentRound.getTargetLimit());
    }

    protected function onMouseClickHandler( event:MouseEvent):void
    {
      if ( this.m_weapon != null)
      {
        var arBullet:Array = this.m_weapon.fire( new CVector2f( event.stageX, event.stageY));
        if ( !this.isRoundFinished())
        {
          var nBulletCount:int = arBullet.length;
          if ( nBulletCount > 0)
          {
            this.m_currentRound.getStatistic().incShoots();
            var bMiss:Boolean = true;
            var iterator:IIterator = this.m_targetList.iterator();
            while ( iterator.hasNext())
            {
              var target:CTarget = iterator.next() as CTarget;
              if ( target.isHittable())
              {
                for ( var i:int = 0; i < nBulletCount; i++)
                {
                  var bullet:CVector2f = arBullet[ i];
                  if ( target.checkHit( bullet.getX(), bullet.getY()))
                  {
                    target.hit();
                    bMiss = false;
                    this.onTargetHit( target);
                  }
                }
              }
              //else
              //if ( target.isDisposed())
              //  iterator.remove();
            }
            if ( bMiss)
              this.onTargetMiss();
          }
        }
      }
    }
    protected function onMouseMoveHandler( event:MouseEvent):void
    {
      // sometimes it is needed
      Mouse.hide();
      if ( this.m_weapon)
        this.m_weapon.updatePosition( new CVector2f( event.stageX, event.stageY));
    }
    public function onDisplayResize( display:CDisplay, event:Event):void
    {
      var iterator:IIterator = this.m_targetList.iterator();
      while ( iterator.hasNext())
      {
        var target:CTarget = iterator.next() as CTarget;
        var nX:Number = target.getPosition().getX();
        var nY:Number = target.getPosition().getY();
        if ( nX > this.m_display.getWidth())
          nX = this.m_display.getWidth();
        if ( nY > this.m_display.getHeight())
          nY = this.m_display.getHeight();
        target.setPosition( new CVector2f( nX, nY));
      }
    }
    protected function onKeyDownEventHandler( event:KeyboardEvent):void
    {
      if ( event.keyCode == Keyboard.SPACE)
      {
        if ( this.isRoundFinished())
        {
          if ( !this.nextRound())
            this.gameResults( this.m_currentRound, this.m_arRound);
        }
      }
      else
      if ( event.keyCode == Keyboard.R)
      {
        if ( this.m_weapon)
          this.m_weapon.reload();
      }
    }
  }
}