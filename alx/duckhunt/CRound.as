package alx.duckhunt
{
  import alx.common.util.CHashMap;

  public class CRound
  {
    private static var s_nIdCounter:uint = 1;
    private var m_nId:uint;
    private var m_targetFactory:CTargetFactory;
    private var m_nTargetLimit:uint;
    private var m_nTargetTotal:uint;
    private var m_statistic:CStatistic;
    private var m_settings:CHashMap;

    public function CRound( targetFactory:CTargetFactory
                          , nTargetLimit:uint
                          , nTargetTotal:uint
                          ):void
    {
      this.m_nId = CRound.s_nIdCounter++;
      this.m_statistic = new CStatistic();
      this.m_targetFactory = targetFactory;
      this.m_nTargetLimit = nTargetLimit;
      this.m_nTargetTotal = nTargetTotal;
      this.m_settings = new CHashMap();
    }

    public function setSetting( strKey:String, value:Object):CRound
    {
      this.m_settings.put( strKey, value);
      return this;
    }
    public function getSetting( strKey:String):Object
    {
      return this.m_settings.get( strKey);
    }

    public function getTargetFactory():CTargetFactory
    {
      return this.m_targetFactory;
    }
    public function getStatistic():CStatistic
    {
      return this.m_statistic;
    }
    public function getRoundNumber():uint
    {
      return this.m_nId;
    }
    public function getTargetTotal():uint
    {
      return this.m_nTargetTotal;
    }
    public function getTargetLeft():uint
    {
      return ( this.getTargetTotal() - this.m_statistic.getTargetTotal());
    }
    public function getTargetLimit():uint
    {
      return this.m_nTargetLimit;
    }
    public function getTargetMinForce():CVector2f
    {
      var nXForce:uint = 1 * this.getRoundNumber();
      if ( nXForce > 10)
        nXForce = 10;
      return new CVector2f( nXForce, 5);
    }
    public function getTargetMaxForce():CVector2f
    {
      var nXForce:uint = 2 * this.getRoundNumber();
      if ( nXForce > 20)
        nXForce = 11;
      else
      if ( nXForce > 10)
        nXForce = 10;
      return new CVector2f( nXForce, 60);
    }
  }
}