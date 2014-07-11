package alx.duckhunt
{
  import alx.common.util.IIterator;
  import alx.common.util.IMap;
  import alx.common.util.IMapEntry;
  import alx.common.util.CHashMap;

  public class CStatistic
  {
    private var m_nScores:uint;
    private var m_nMiss:uint;
    private var m_nShoots:uint;

    private var m_targetCount:IMap;
    private var m_targetHitCount:IMap;

    public function CStatistic():void
    {
      this.m_targetCount = new CHashMap();
      this.m_targetHitCount = new CHashMap();

      this.reset();
    }

    public function reset():CStatistic
    {
      this.m_nShoots = 0;
      this.m_nMiss = 0;
      this.m_nScores = 0;
      this.m_targetCount.clear();
      this.m_targetHitCount.clear();
      return this;
    }
    public function add( statistic:CStatistic):CStatistic
    {
      this.incScores( statistic.getScores());
      this.incMiss( statistic.getMissTotal());
      this.incShoots( statistic.getShootsTotal());
      var iterator:IIterator = statistic.m_targetCount.entrySet().iterator();
      var entry:IMapEntry;
      while ( iterator.hasNext())
      {
        entry = iterator.next() as IMapEntry;
        this.incTarget(( entry.getKey() as String), ( entry.getValue() as uint));
      }
      iterator = statistic.m_targetHitCount.entrySet().iterator();
      while ( iterator.hasNext())
      {
        entry = iterator.next() as IMapEntry;
        this.incHit(( entry.getKey() as String), ( entry.getValue() as uint));
      }
      return this;
    }
    protected function inc( nVar:uint, nOffset:int = 1):uint
    {
      if (( nOffset < 0) && ( this.m_nScores < nOffset))
        nVar = 0;
      else
        nVar += nOffset;
      return nVar;
    }
    public function incScores( nOffset:int = 1):CStatistic
    {
      this.m_nScores = this.inc( this.m_nScores, nOffset);
      return this;
    }
    public function incHit( strKey:String, nOffset:int = 1):CStatistic
    {
      var nCount:uint = 0;
      if ( this.m_targetHitCount.containsKey( strKey))
       nCount = this.m_targetHitCount.get( strKey) as uint;
      nCount = this.inc( nCount, nOffset);
      this.m_targetHitCount.put( strKey, nCount);
      return this;
    }
    public function incMiss( nOffset:int = 1):CStatistic
    {
      this.m_nMiss = this.inc( this.m_nMiss, nOffset);
      return this;
    }
    public function incShoots( nOffset:int = 1):CStatistic
    {
      this.m_nShoots = this.inc( this.m_nShoots, nOffset);
      return this;
    }
    public function incTarget( strKey:String, nOffset:int = 1):CStatistic
    {
      var nCount:uint = 0;
      if ( this.m_targetCount.containsKey( strKey))
       nCount = this.m_targetCount.get( strKey) as uint;
      nCount = this.inc( nCount, nOffset);
      this.m_targetCount.put( strKey, nCount);
      return this;
    }
    public function getShootsTotal():uint
    {
      return this.m_nShoots;
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
      var iterator:IIterator = this.m_targetCount.keySet().iterator();
      while ( iterator.hasNext())
        nResult += this.m_targetCount.get( iterator.next());
      return nResult;
    }
    public function getFinishPercent( nMult:uint = 100):Number
    {
      return ( this.getFinishRate() * nMult);
    }
    public function getFinishRate():Number
    {
      var nResult:Number = 0;
      if ( this.getTargetTotal() > 0)
        nResult = this.getHitTotal() / this.getTargetTotal();
      return nResult;
    }
    public function getAccuracyPercent( nMult:uint = 100):Number
    {
      var nResult:Number = 0;
      if ( this.getShootsTotal() > 0)
        nResult = ( this.getShootsTotal() - this.getMissTotal()) / this.getShootsTotal() * nMult;
      if ( nResult > 100)
        nResult = 100;
      return nResult;
    }
    public function getAccuracyRate():Number
    {
      var nResult:Number = 0;
      if ( this.getShootsTotal() > 0)
        nResult = this.getHitTotal() / this.getShootsTotal();
      return nResult;
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

    public function toString():String
    {
      var strResult:String = '{';
      strResult += 'Scores: '+this.getScores()+'; ';
      strResult += 'Targets: '+this.getTargetTotal()+'; ';
      strResult += 'Shoots: '+this.getShootsTotal()+'; ';
      strResult += 'Hits: '+this.getHitTotal()+'; ';
      strResult += 'Accuracy: '+this.getAccuracyPercent()+'%; ';
      strResult += 'AccuracyRate: '+this.getAccuracyRate()+'; ';
      strResult += 'Finish: '+this.getFinishPercent()+'%; ';
      strResult += 'FinishRate: '+this.getFinishRate()+'; ';
      strResult += 'TargetCount: '+this.getTargetCount()+'; ';
      strResult += 'TargetHitCount: '+this.getTargetHitCount()+'';
      return strResult+'}';
    }
  }
}