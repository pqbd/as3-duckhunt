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
    private var m_targetFactory:CTargetFactory;
    private var m_targetEmitter:CTargetEmitter;
    private var m_targetList:IList;

    private var m_weapon:CWeapon;

    public function CGame():void
    {
      this.setTargetFactory( null);
      this.m_targetList = new CArrayList();
    }

    public function setTargetFactory( targetFactory:CTargetFactory):CGame
    {
      this.m_targetFactory = targetFactory;
      return this;
    }

    public function isReady():Boolean
    {
      var bOk = false;
      if ( this.m_targetFactory != null)
        bOk = true;
      return bOk;
    }
    public function setWeapon( weapon:CWeapon):CGame
    {
      this.m_weapon = weapon;
      return this;
    }


    public function start( display:DisplayObjectContainer, random:CRandom = null):void
    {
      if ( this.isReady())
      {
        this.m_display = new CDisplay( display);

        var timer:Timer = new Timer( 10);
        timer.addEventListener( TimerEvent.TIMER, timerHandler);
        timer.start();

        this.m_weapon.addToDisplay( display.parent);
        Mouse.hide();
        display.stage.addEventListener( MouseEvent.MOUSE_MOVE, onMouseMoveHandler);
        display.stage.addEventListener( MouseEvent.MOUSE_UP, onMouseClickHandler);
        display.stage.addEventListener( KeyboardEvent.KEY_DOWN, onKeyDownEventHandler);
        this.m_display.addDisplayListener( this);
        this.m_display.addDisplayListener( this.m_weapon);

        this.m_targetEmitter = new CTargetEmitter();
        this.m_targetList.clear();
      }
      else
        throw Error( 'Game not set');
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
              }
            }
            else
            if ( target.isMissed())
            {
              if ( target.getPosition().getY() < 0)
              {
                target.dispose();
                bDisposed = true;
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
    }
    protected function onTargetHit( target:CTarget):void
    {
    }
    protected function onTargetDispose():void
    {
    }

    protected function onMouseClickHandler( event:MouseEvent):void
    {
      if ( this.m_weapon != null)
      {
        var arBullet:Array = this.m_weapon.fire( new CVector2f( event.stageX, event.stageY));
        var nBulletCount:int = arBullet.length;
        if ( nBulletCount > 0)
        {
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
                //else
                //  target.miss();
              }
            }
            else
            if ( target.isDisposed())
              iterator.remove();
          }
          if ( bMiss)
            this.onTargetMiss();
        }
      }
    }
    protected function onMouseMoveHandler( event:MouseEvent):void
    {
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
        var target:CTarget = this.m_targetEmitter.EmitRandomOne( this.m_targetFactory, this.m_display.getSize(), null);
        this.m_targetList.add( target);
        target.addToDisplay( this.m_display);
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