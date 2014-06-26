package alx.duckhunt
{
  public class CSniperRifleMagazine extends CWeaponMagazine
  {
    public function CSniperRifleMagazine( nSize:uint = 1):void
    {
      super( nSize);
    }
    public override function fireRound( target:CVector2f):Array
    {
      return new Array( target);
    }
  }
}