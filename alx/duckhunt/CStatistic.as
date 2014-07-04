package alx.duckhunt
{
  import alx.common.util.IIterator;
  import alx.common.util.IMap;
  import alx.common.util.CHashMap;

  public class CStatistic
  {
    private var m_nScores:uint;
    private var m_nMiss:uint;

    private var m_targetCount:IMap;
    private var m_targetHitCount:IMap;

    public function CStatistic():void
    {
      this.reset();
      this.m_targetCount = new CHashMap();
      this.m_targetHitCount = new CHashMap();
    }

    public function reset():CStatistic
    {
      this.m_nScores = 0;
      this.m_targetCount.clear();
      this.m_targetHitCount.clear();
      return this;
    }
    public function incScores( nOffset:int = 1):CStatistic
    {
      if (( nOffset < 0) && ( this.m_nScores < nOffset))
        this.m_nScores = 0;
      else
        this.m_nScores += nOffset;
      return this;
    }
    public function incHit( target:CTarget):CStatistic
    {
      var nCount:uint = 0;
      var strKey:String = target.toString();
      if ( this.m_targetHitCount.containsKey( strKey))
       nCount = this.m_targetHitCount.get();
      nCount++;
      this.m_targetHitCount.put( strKey, nCount);
      return this;
    }
    public function incMiss():CStatistic
    {
      this.m_nMiss++;
      return this;
    }
    public function incTarget( target:CTarget):CStatistic
    {
      var nCount:uint = 0;
      var strKey:String = target.toString();
      if ( this.m_targetCount.containsKey( strKey))
       nCount = this.m_targetCount.get();
      nCount++;
      this.m_targetCount.put( strKey, nCount);
      return this;
    }

    public function getShootsTotal():uint
    {
      return ( this.getHitTotal() + this.getMissTotal());
    }
    public function getHitTotal():uint
    {
      var nResult:uint = 0;
      var iterator:IIterator = this.m_targetHitCount.keySet().iterator();
      while ( iterator.hasNext())
        nResult += this.m_targetHitCount.get( iterator.next());
      return nResult;
    }
    public function getMissTotal():uint
    {
      return this.m_nMiss;
    }
    public function getTargetTotal():uint
    {
      var nResult:uint = 0;
      var iterator:IITerator = this.m_targetCount.keySet().iterator();
      while ( iterator.hasNext())
        nResult += this.m_targetCount.get( iterator.next());
      return nResult;
    }
    public function getAccuracyPercent():Number
    {
      return ( this.getHitTotal() / this.getShootsTotal() * 100);
    }
    
    public function getTargetCount():IMap
    {
      return this.m_targetCount;
    }
    public function getTargetHitCount():IMap
    {
      return this.m_targetHitCount;
    }

    public function getScores():uint
    {
      return this.m_nScores;
    }
  }
}