package test.alx.duckhunt
{
  import flash.display.MovieClip;
  import alx.duckhunt.CWeapon;
  import alx.duckhunt.CSniperRifle;

  public class CSniperRifleTest extends CWeaponTest
  {
    public function CSniperRifleTest( strLabel:String):void
    {
      super( strLabel);
    }

    public override function createWeapon( nNumberOfMagazines:int):CWeapon
    {
      return new CSniperRifle( new MovieClip(), new MovieClip(), nNumberOfMagazines);
    }
  }
}