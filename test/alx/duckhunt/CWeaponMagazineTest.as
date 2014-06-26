package test.alx.duckhunt
{
  import alx.common.test.CUnitTest;
  import alx.duckhunt.CVector2f;
  import alx.duckhunt.CWeaponMagazine;

  public class CWeaponMagazineTest extends CUnitTest
  {
    public function CWeaponMagazineTest( strLabel:String):void
    {
      super( strLabel);
    }

    protected override function testList():Array
    {
      return new Array( this.testCreation
                      , this.testIncDec
                      , this.testFireRound
                      , this.testReset
                      , this.testFire
                      );
    }

    public function createMagazine( nSize:uint):CWeaponMagazine
    {
      throw Error( 'createMagazine must be implemented');
    }
    public function testCreation():void
    {
      const magazine1:CWeaponMagazine = this.createMagazine( 5);

      this.getTester().isEqual( 'magazine1.getMaxSize()'
                              , magazine1.getMaxSize()
                              , 5
                              );
      this.getTester().isTrue( 'magazine1.getMaxSize() == magazine1.getSize()'
                              , ( magazine1.getMaxSize() == magazine1.getSize())
                              );
      this.getTester().isFalse( 'magazine1.isEmpty()'
                              , magazine1.isEmpty()
                              );
    }    
    public function testIncDec():void
    {
      const magazine1:CWeaponMagazine = this.createMagazine( 5);
      this.getTester().isEqual( 'magazine1.inc().getSize()'
                              , magazine1.inc().getSize()
                              , 5
                              );
      this.getTester().isEqual( 'magazine1.dec().getSize()'
                              , magazine1.dec().getSize()
                              , 4
                              );
      this.getTester().isEqual( 'magazine1.inc( -2).getSize()'
                              , magazine1.inc( -2).getSize()
                              , 2
                              );
      this.getTester().isEqual( 'magazine1.inc().getSize()'
                              , magazine1.inc().getSize()
                              , 3
                              );
      this.getTester().isEqual( 'magazine1.inc( 2).getSize()'
                              , magazine1.inc( 2).getSize()
                              , 5
                              );      
      this.getTester().isEqual( 'magazine1.inc( -6).getSize()'
                              , magazine1.inc( -6).getSize()
                              , 0
                              );
      this.getTester().isEqual( 'magazine1.inc( 6).getSize()'
                              , magazine1.inc( 6).getSize()
                              , 5
                              );
    }
    public function testFireRound():void
    {
      const magazine1:CWeaponMagazine = this.createMagazine( 5);
      var arBullet:Array = magazine1.fireRound( new CVector2f( 0, 0));
      this.getTester().isTrue( 'arBullet.length == 0'
                              , arBullet.length == 0
                              );
    }
    public function testReset():void
    {
      const magazine1:CWeaponMagazine = this.createMagazine( 5);
      magazine1.fire( new CVector2f( 0, 0));
      this.getTester().isEqual( 'magazine1.getSize()'
                              , magazine1.getSize()
                              , 4
                              );
      magazine1.fire( new CVector2f( 0, 0));
      this.getTester().isEqual( 'magazine1.getSize()'
                              , magazine1.getSize()
                              , 3
                              );
      this.getTester().isEqual( 'magazine1.reset().getSize()'
                              , magazine1.reset().getSize()
                              , 5
                              );
    }
    public function testFire():void
    {
      const magazine1:CWeaponMagazine = this.createMagazine( 5);
      magazine1.fire( new CVector2f( 0, 0));
      this.getTester().isEqual( 'magazine1.getSize()'
                              , magazine1.getSize()
                              , 4
                              );
      magazine1.fire( new CVector2f( 0, 0));
      this.getTester().isEqual( 'magazine1.getSize()'
                              , magazine1.getSize()
                              , 3
                              );
      magazine1.fire( new CVector2f( 0, 0));
      this.getTester().isEqual( 'magazine1.getSize()'
                              , magazine1.getSize()
                              , 2
                              );
      magazine1.fire( new CVector2f( 0, 0));
      this.getTester().isEqual( 'magazine1.getSize()'
                              , magazine1.getSize()
                              , 1
                              );
      magazine1.fire( new CVector2f( 0, 0));
      this.getTester().isEqual( 'magazine1.getSize()'
                              , magazine1.getSize()
                              , 0
                              );
      magazine1.fire( new CVector2f( 0, 0));
      this.getTester().isEqual( 'magazine1.getSize()'
                              , magazine1.getSize()
                              , 0
                              );
    }
  }
}