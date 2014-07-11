package alx.duckhunt
{
  import alx.common.util.CHashMap;

  public class CRound
  {
    private static var s_nIdCounter:uint = 1;
    private var m_nId:uint;
    private var m_nScore:uint;
    private var m_targetFactory:CTargetFactory;
    private var m_nTargetLimit:uint;
    private var m_nTargetTotal:uint;
    private var m_statistic:CStatistic;
    private var m_settings:CHashMap;
    private var m_targetForceLimit:CVector2f;
    private var m_targetAngleLimit:CVector2f;

    public function CRound( nScore:uint
                          , targetFactory:CTargetFactory
                          , nTargetLimit:uint
                          , nTargetTotal:uint
                          , targetForceLimit:CVector2f
                          , targetAngleLimit:CVector2f = null
                          ):void
    {
      this.m_nId = CRound.s_nIdCounter++;
      this.m_nScore = nScore;
      this.m_statistic = new CStatistic();
      this.m_targetFactory = targetFactory;
      this.m_nTargetLimit = nTargetLimit;
      this.m_nTargetTotal = nTargetTotal;
      this.m_settings = new CHashMap();
      this.m_targetForceLimit = targetForceLimit;
      if ( targetAngleLimit == null)
        targetAngleLimit = new CVector2f( 5, 60);
      this.m_targetAngleLimit = targetAngleLimit;
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

    public function getScore():uint
    {
      return this.m_nScore;
    }
    public function getId():uint
    {
      return this.m_nId;
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
      return new CVector2f( this.m_targetForceLimit.getX(), this.m_targetAngleLimit.getX());
    }
    public function getTargetMaxForce():CVector2f
    {
      return new CVector2f( this.m_targetForceLimit.getY(), this.m_targetAngleLimit.getY());
    }
  }
}