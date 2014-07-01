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

  public class CGame
  implements IDisplayListener
  {
    private var m_display:CDisplay;
    private var m_targetFactory:CTargetFactory;
    private var m_targetEmitter:CTargetEmitter;
    private var m_arTarget:Array;

    private var m_weapon:CWeapon;

    public function CGame():void
    {
      this.setTargetFactory( null);
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
        this.m_arTarget = new Array();
        for ( var i:int = 0; i < 1; i++)
        {
          var target:CTarget = this.m_targetEmitter.EmitRandomOne( this.m_targetFactory, this.m_display.getSize(), random);
          this.m_arTarget.push( target);
          target.addToDisplay( this.m_display);
        }
      }
      else
        throw Error( 'Game not set');
    }

    protected function timerHandler( event:TimerEvent):void
    {
      for ( var i:int; i < this.m_arTarget.length; i++)
      {
        var target:CTarget = this.m_arTarget[ i];
        if (( target.getPosition().getX() < 0) || ( target.getPosition().getX() > this.m_display.getWidth()))
          target.turnX();
        if (( target.getPosition().getY() < 0) || ( target.getPosition().getY() > this.m_display.getHeight()))
          target.turnY();
        target.move();
      }
    }

    protected function onTargetMiss():void
    {
    }
    protected function onTargetHit():void
    {
    }
    protected function onTargetDispose():void
    {
    }

    //protected function onMouseClickHandler( event:MouseEvent):void
    //{
    //  var target:CTarget = this.m_targetEmitter.EmitRandomOne( this.m_targetFactory, this.m_display.getSize(), null);
    //  this.m_arTarget.push( target);
    //  target.addToDisplay( this.m_display);
    //}

    protected function onMouseClickHandler( event:MouseEvent):void
    {
      if ( this.m_weapon != null)
      {
        var arBullet:Array = this.m_weapon.fire( new CVector2f( event.stageX, event.stageY));
        var nBulletCount:int = arBullet.length;
        if ( nBulletCount > 0)
        {          
          for ( var i:int; i < this.m_arTarget.length; i++)
          {
            var target:CTarget = this.m_arTarget[ i];
            //if ( target.is())
            {
              for ( var j:int = 0; j < nBulletCount; j++)
              {
                var bullet:CVector2f = arBullet[ j];
                if ( target.checkHit( bullet.getX(), bullet.getY()))
                {
                  target.hit();

                  target = this.m_targetEmitter.EmitRandomOne( this.m_targetFactory, this.m_display.getSize(), null);
                  this.m_arTarget.push( target);
                  target.addToDisplay( this.m_display);
                }
                else
                {
                  
                }
              }
            }
          }
          //this.m_weapon.reload();
        }
      }
    }

    /*
    protected function MouseClickHandler( event:MouseEvent):void
    {
      // scores
      if ( target.checkHit( event.stageX, event.stageY))
      {
        // scores
        target.hit();
      }
      else
      {
        //miss
      }


      this.m_bFire = true;
      if ( !this.m_bReload)
      {
        if ( this.m_bLevelSet)
        {
          this.m_myPatron.gotoAndStop( 2);
          this.m_bReload = true;

          this.m_arScore[ this.m_nLevel].IncShots();
          this.m_cursor.gotoAndPlay( 2);
          var bHit:Boolean = false;
          var nCount:int = 0;
          for ( var i:int = 0; i < this.m_arDuck.length; i++)
          {
            var item:MovieClip = this.m_arDuck[ i];
            if ( item)
            {
              if ( CheckHit( event.stageX, event.stageY, item))
              {
                this.m_arDuck[ i] = null;
                this.DuckDie( item);
                bHit = true;

                var headshot:MovieClip = new this.m_headshot();
                headshot.c_nick1.text = this.GetPlayerName();
                if ( item is this.m_duck1)
                  headshot.c_nick2.text = 'Drake['+i+']';
                else
                  headshot.c_nick2.text = 'Duck['+i+']';
                this.m_arHeadshot.push( headshot);

                trace( this.m_arScore[ this.m_nLevel]);
              }
              else
              {
                if ( item[ 'strState'] == 'play')
                  nCount++;
              }
            }
          }
          if ( !bHit)
          {
            this.m_myDog.gotoAndPlay( 1);
            this.EmitRandomDuck();
            if ( nCount >= this.MaxDucks())
              this.MissOneDuck();
            nCount++;
          }
          else
          {
            this.ShowHeadshot();
          }

          if ( nCount == 0)
          {
            this.ShowScores();
            this.m_nLevel++;
            this.m_bLevelSet = false;
            if ( this.m_nLevel <= 15)
            {
              this.m_arScore[ this.m_nLevel] = new CScore();
              this.DefragmentDucks();
            }
            else
              this.m_nLevel = -1;
          }

          var timer:Timer = new Timer( 3000, 1);
          timer.addEventListener( TimerEvent.TIMER, FireOverTimerHandler);
          timer.start();
        }
      }
      this.m_bFire = false;
    }
    */

    protected function onMouseMoveHandler( event:MouseEvent):void
    {
      if ( this.m_weapon)
        this.m_weapon.updatePosition( new CVector2f( event.stageX, event.stageY));
    }
    public function onDisplayResize( display:CDisplay, event:Event):void
    {
      for ( var i:int; i < this.m_arTarget.length; i++)
      {
        var target:CTarget = this.m_arTarget[ i];
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