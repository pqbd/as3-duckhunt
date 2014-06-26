package test.alx.duckhunt
{
  import alx.common.test.CUnitTest;
  import alx.duckhunt.CVector2f;
  import alx.duckhunt.CWeapon;

  public class CWeaponTest extends CUnitTest
  {
    public function CWeaponTest( strLabel:String):void
    {
      super( strLabel);
    }

    protected override function testList():Array
    {
      return new Array( this.testCreation
                      );
    }

    public function createWeapon( nNumberOfMagazines:int):CWeapon
    {
      throw Error( 'createWeapon must be implemented');
    }
    public function testCreation():void
    {
      const weapon1:CWeapon = this.createWeapon( -1);
    }
  }
}