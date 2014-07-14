package alx.duckhunt
{
  import flash.display.MovieClip;
  import flash.utils.Timer;
  import flash.events.TimerEvent;

  public class CCloudTarget extends CTarget
  {
    private var m_animation:MovieClip;

    public function CCloudTarget( positionVector:CVector2f
                              , forceVector:CVector2f
                              , animation:MovieClip
                              , nGroupId:uint = 0
                              ):void
    {
      super( positionVector, forceVector, animation, nGroupId);
      this.m_animation = animation;
      this.m_animation.gotoAndPlay( 1);
    }

    public override function checkHit( nX:int, nY:int):Boolean
    {
      return false;
    }
    public override function hit():CTarget
    {
      return this;
    }
    public override function dispose():CTarget
    {
      this.m_animation.stop();
      this.setState( CTarget.STATE_DISPOSED);
      if ( this.m_animation.parent)
        this.m_animation.parent.removeChild( this.m_animation);
      this.m_animation = null;
      return this;
    }
    public override function miss():CTarget
    {
      return this;
    }
  }
}