package alx.duckhunt
{
  public class CWeaponMagazine
  {
    private var m_nMaxSize:uint;
    private var m_nSize:uint;

    public function CWeaponMagazine( nMagazineSize:uint):void
    {
      this.m_nMaxSize = nMagazineSize;
      this.reset();
    }

    public function getMaxSize():uint
    {
      return this.m_nMaxSize;
    }
    public function getSize():uint
    {
      return this.m_nSize;
    }
    public function isEmpty():Boolean
    {
      return ( this.getSize() == 0);
    }
    public function reset():CWeaponMagazine
    {
      this.m_nSize = this.getMaxSize();
      return this;
    }
    public function inc( nOffset:int = 1):CWeaponMagazine
    {
      if (( nOffset < 0) && this.m_nSize < -nOffset)
        this.m_nSize = 0;
      else
      if (( nOffset > 0) && (( this.getMaxSize() - this.m_nSize) < nOffset))
          this.m_nSize = this.getMaxSize();
      else
        this.m_nSize += nOffset;
      return this;
    }
    public function dec():CWeaponMagazine
    {
      return this.inc( -1);
    }
    public function fireRound( target:CVector2f):Array
    {
      throw Error( 'fireRound must be implemented');
    }
    public function fire( target:CVector2f):Array
    {
      var arResult:Array = null;
      if ( !this.isEmpty())
      {
        this.dec();
        arResult = this.fireRound( target);
      }
      return arResult;
    }
  }
}