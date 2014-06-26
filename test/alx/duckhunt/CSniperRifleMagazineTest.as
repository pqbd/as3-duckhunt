package test.alx.duckhunt
{
  import alx.duckhunt.CVector2f;
  import alx.duckhunt.CWeaponMagazine;
  import alx.duckhunt.CSniperRifleMagazine;

  public class CSniperRifleMagazineTest extends CWeaponMagazineTest
  {
    public function CSniperRifleMagazineTest( strLabel:String):void
    {
      super( strLabel);
    }
    public override function createMagazine( nSize:uint):CWeaponMagazine
    {
      return new CSniperRifleMagazine( nSize);
    }
    public override function testFireRound():void
    {
      const magazine1:CWeaponMagazine = this.createMagazine( 1);
      var arBullet:Array = magazine1.fireRound( new CVector2f( 1, 2));
      this.getTester().isTrue( 'arBullet.length == 1'
                              , ( arBullet.length == 1)
                              );
      this.getTester().isEqual( 'arBullet[ 0].getX()'
                              , arBullet[ 0].getX()
                              , 1
                              );
      this.getTester().isEqual( 'arBullet[ 0].getY()'
                              , arBullet[ 0].getY()
                              , 2
                              );
    }
  }
}