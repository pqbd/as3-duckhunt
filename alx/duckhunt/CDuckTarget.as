package alx.duckhunt
{
  import flash.display.MovieClip;
  import flash.utils.Timer;
  import flash.events.TimerEvent;

  public class CDuckTarget extends CTarget
  {
    private var m_animation:MovieClip;
    private var m_nXTurns:int;
    private var m_bFear:Boolean;

    public function CDuckTarget( positionVector:CVector2f
                              , forceVector:CVector2f
                              , animation:MovieClip
                              , nGroupId:uint = 0
                              , bTurn:Boolean = false
                              , nXTurns:int = -1
                              , bFear:Boolean = false
                              ):void
    {
      super( positionVector, forceVector, animation, nGroupId);
      this.m_animation = animation;
      if ( nXTurns < 0)
        nXTurns = -1;
      this.m_nXTurns = nXTurns;
      this.m_bFear = bFear;
      this.m_animation.gotoAndPlay( 1);
      if ( bTurn)
      {
        if ( this.m_nXTurns > -1)
          this.m_nXTurns++;
        this.turnX();
      }
    }

    public function getXTurns():int
    {
      return this.m_nXTurns;
    }
    public function isFear():Boolean
    {
      return this.m_bFear;
    }
    public override function turnX():CTarget
    {
      if ( !this.isDisposed())
      {
        this.m_animation.scaleX *= -1;
        super.turnX();
        if ( this.m_nXTurns == 0)
          this.miss();
        else
        if ( this.m_nXTurns > 0)
          this.m_nXTurns--;
      }
      return this;
    }
    public override function turnY():CTarget
    {
      if ( this.isState( CTarget.STATE_OK))
        super.turnY();
      return this;
    }

    public override function checkHit( nX:int, nY:int):Boolean
    {
      var bHit:Boolean = false;
      var nMult:int = 1;
      if ( this.m_animation.scaleX < 0)
       nMult = -1;

      var nXCorrection:int = 18;
      var nYCorrection:int = -8;
      if ( this.m_animation.currentFrame > 65)
      {
        nXCorrection = 0;
        nYCorrection = -20;
      }
      else
      if ( this.m_animation.currentFrame > 49)
      {
        nXCorrection = 15;
        nYCorrection = -18;
      }

      var nDuckX:Number = nXCorrection * nMult;
      var nDuckY:Number = nYCorrection;
      var nRadiusX:int = 12;
      var nRadiusY:int = 10;
      var nHitX:Number = nX - this.getPosition().getX();
      var nHitY:Number = nY - this.getPosition().getY();

      var nTest:Number = Math.pow(( nHitX - nDuckX), 2) / Math.pow( nRadiusX, 2)
                         + Math.pow(( nHitY - nDuckY), 2) / Math.pow( nRadiusY, 2)
                         ;
      if( nTest <= 1)
        bHit = true;
      else
      if ( this.m_bFear)
      if ( nTest <= 3)
        this.turnX();
      return bHit;
    }

    public override function hit():CTarget
    {
      this.setState( CTarget.STATE_HIT);
      this.m_animation.gotoAndPlay( 17);
      this.getSpeed().setX( 0).setY( 0);
      var timer:Timer = new Timer( 500, 1);
      timer.addEventListener( TimerEvent.TIMER, hitTimerHandler);
      timer.start();
      return this;
    }
    protected function hitTimerHandler( event:TimerEvent):void
    {
      if ( this.m_animation != null)
      {
        this.m_animation.gotoAndPlay( 23);
        this.applyForce( new CVector2f( 0, 9.8));
      }
    }

    public override function dispose():CTarget
    {
      if ( this.isHit())
        this.m_animation.gotoAndPlay( 45);
      this.setState( CTarget.STATE_ZERO);
      var timer:Timer = new Timer( 200, 1);
      timer.addEventListener( TimerEvent.TIMER, disposeTimerHandler);
      timer.start();
      return this;
    }
    protected function disposeTimerHandler( event:TimerEvent):void
    {
      this.m_animation.gotoAndStop( 18);
      super.dispose();
    }

    public override function miss():CTarget
    {
      if ( this.isOk())
      {
        this.m_animation.gotoAndPlay( 50);
        this.setState( CTarget.STATE_MISSED);
        this.getSpeed().setY(( -Math.abs( this.getSpeed().getY()) * 1.5));
        var timer:Timer = new Timer( 1500, 1);
        timer.addEventListener( TimerEvent.TIMER, missTimerHandler);
        timer.start();
      }
      return this;
    }
    protected function missTimerHandler( event:TimerEvent):void
    {
      if ( this.isMissed())
      {
        this.m_animation.gotoAndPlay( 66);
        this.getSpeed().set( 0, -this.getSpeed().norm());
      }
    }
  }
}