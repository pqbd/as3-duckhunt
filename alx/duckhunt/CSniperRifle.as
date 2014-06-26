package alx.duckhunt
{
  import flash.display.DisplayObjectContainer;
  import flash.display.MovieClip;

  public class CSniperRifle extends CWeapon
  {
    private var m_aimAnimation:MovieClip;
    private var m_magazineAnimation:MovieClip;

    public function CSniperRifle( aimAnimation:MovieClip
                                , magazineAnimation:MovieClip
                                , nNumberOfMagazines:int = -1
                                ):void
    {
      super( nNumberOfMagazines);
      this.m_aimAnimation = aimAnimation;
      this.m_magazineAnimation = magazineAnimation;
    }

    public override function createMagazine():CWeaponMagazine
    {
      return new CSniperRifleMagazine();
    }
    public override function timeBetweenShots():uint
    {
      return 3000;
    }
    public override function addToDisplay( display:DisplayObjectContainer):CWeapon
    {
      display.addChild( this.m_aimAnimation);
      display.addChild( this.m_magazineAnimation);
      return this;
    }
    public override function updatePosition( position:CVector2f):CWeapon
    {
      this.m_aimAnimation.x = position.getX();
      this.m_aimAnimation.y = position.getY();
      return this;
    }
    public override function isReady():Boolean
    {
      if ( this.m_aimAnimation != null)
      if ( this.m_magazineAnimation != null)
      if ( super.isReady())
        return true;
      return false;
    }
    protected override function onFireSuccess():void
    {
      this.m_magazineAnimation.gotoAndStop( 2);
      this.m_aimAnimation.gotoAndPlay( 2);
    }
    protected override function onFireFail():void
    {
    }
    protected override function onReloadSuccess():void
    {
      this.m_magazineAnimation.gotoAndStop( 1);
    }
    protected override function onReloadFail():void
    {
    }
  }
}