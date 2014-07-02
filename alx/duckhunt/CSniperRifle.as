package alx.duckhunt
{
  import flash.display.DisplayObjectContainer;
  import flash.display.MovieClip;
  import flash.events.Event;

  public class CSniperRifle
  extends CWeapon
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
    public override function addToDisplay( display:DisplayObjectContainer):void
    {
      display.addChild( this.m_aimAnimation);
      display.addChild( this.m_magazineAnimation);
    }
    public override function onDisplayResize( display:CDisplay, event:Event):void
    {
      this.m_magazineAnimation.x = display.getWidth() - 20;
      this.m_magazineAnimation.y = display.getHeight() - 5;
    }
    public override function updatePosition( position:CVector2f):void
    {
      this.m_aimAnimation.x = position.getX();
      this.m_aimAnimation.y = position.getY();
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
      this.m_aimAnimation.gotoAndPlay( 72);
      this.m_magazineAnimation.gotoAndStop( 1);
    }
    protected override function onReloadFail():void
    {
    }
  }
}