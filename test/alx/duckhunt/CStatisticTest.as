package test.alx.duckhunt
{
  import alx.common.test.CUnitTest;
  import alx.duckhunt.CStatistic;

  public class CStatisticTest extends CUnitTest
  {
    public function CStatisticTest( strLabel:String):void
    {
      super( strLabel);
    }

    protected override function testList():Array
    {
      return new Array( this.testCreation
                      , this.testReset
                      , this.testIncScores
                      , this.testIncHit
                      , this.testIncMiss
                      , this.testIncShoots
                      , this.testIncTarget
                      , this.testGetAccuracyRate
                      , this.testGetAccuracyPercent
                      , this.testGetTargetCount
                      , this.testGetTargetHitCount
                      , this.testAdd
                      );
    }

    public function testCreation():void
    {
      const statistic:CStatistic = new CStatistic();
    }

    public function testIncMiss():void
    {
      const statistic:CStatistic = new CStatistic();
      this.getTester().isEqual( '1 statistic.getMissTotal()'
                              , statistic.getMissTotal()
                              , 0
                              );
      statistic.incMiss();
      this.getTester().isEqual( '2 statistic.getMissTotal()'
                              , statistic.getMissTotal()
                              , 1
                              );
      statistic.incMiss( 4);
      this.getTester().isEqual( '3 statistic.getMissTotal()'
                              , statistic.getMissTotal()
                              , 5
                              );
    }
    public function testIncScores():void
    {
      const statistic:CStatistic = new CStatistic();
      this.getTester().isEqual( '1 statistic.getScores()'
                              , statistic.getScores()
                              , 0
                              );
      statistic.incScores();
      this.getTester().isEqual( '2 statistic.getScores()'
                              , statistic.getScores()
                              , 1
                              );
      statistic.incScores( 5);
      this.getTester().isEqual( '3 statistic.getScores()'
                              , statistic.getScores()
                              , 6
                              );
      statistic.incScores( -3);
      this.getTester().isEqual( '4 statistic.getScores()'
                              , statistic.getScores()
                              , 3
                              );
    }
    public function testGetTargetCount():void
    {
      const statistic:CStatistic = new CStatistic();
      this.getTester().isTrue( 'statistic.getTargetCount().isEmpty()'
                              , statistic.getTargetCount().isEmpty()
                              );
    }
    public function testGetTargetHitCount():void
    {
      const statistic:CStatistic = new CStatistic();
      this.getTester().isTrue( 'statistic.getTargetHitCount().isEmpty()'
                              , statistic.getTargetHitCount().isEmpty()
                              );
    }
    public function testReset():void
    {
      const statistic:CStatistic = new CStatistic();
      statistic.incScores( 100);
      statistic.incMiss();
      statistic.incTarget( 'target1');
      statistic.incHit( 'target1');

      statistic.reset();

      this.getTester().isEqual( 'statistic.getScores()'
                              , statistic.getScores()
                              , 0
                              );
      this.getTester().isEqual( 'statistic.getMissTotal()'
                              , statistic.getMissTotal()
                              , 0
                              );
      this.getTester().isEqual( 'statistic.getShootsTotal()'
                              , statistic.getShootsTotal()
                              , 0
                              );
      this.getTester().isEqual( 'statistic.getHitTotal()'
                              , statistic.getHitTotal()
                              , 0
                              );
      this.getTester().isEqual( 'statistic.getTargetTotal()'
                              , statistic.getTargetTotal()
                              , 0
                              );
      this.getTester().isEqual( 'statistic.getAccuracyPercent()'
                              , statistic.getAccuracyPercent()
                              , 0
                              );
    }
    public function testIncTarget():void
    {
      const statistic:CStatistic = new CStatistic();
      statistic.incTarget( 'target1');
      statistic.incTarget( 'target1');
      statistic.incTarget( 'target2');

      this.getTester().isEqual( 'statistic.getTargetCount().size()'
                              , statistic.getTargetCount().size()
                              , 2
                              );
      this.getTester().isEqual( 'statistic.getTargetTotal()'
                              , statistic.getTargetTotal()
                              , 3
                              );
      statistic.incTarget( 'target2', 3);
      this.getTester().isEqual( 'statistic.getTargetTotal()'
                              , statistic.getTargetTotal()
                              , 6
                              );
    }
    public function testIncHit():void
    {
      const statistic:CStatistic = new CStatistic();
      statistic.incHit( 'target1');
      statistic.incHit( 'target1');
      statistic.incHit( 'target2');

      this.getTester().isEqual( 'statistic.getTargetHitCount().size()'
                              , statistic.getTargetHitCount().size()
                              , 2
                              );
      this.getTester().isEqual( 'statistic.getHitTotal()'
                              , statistic.getHitTotal()
                              , 3
                              );
      statistic.incHit( 'target2', 5);
      this.getTester().isEqual( 'statistic.getHitTotal()'
                              , statistic.getHitTotal()
                              , 8
                              );
    }
    public function testIncShoots():void
    {
      const statistic:CStatistic = new CStatistic();
      statistic.incShoots();
      statistic.incShoots( 5);
      statistic.incShoots( -3);

      this.getTester().isEqual( 'statistic.getShootsTotal()'
                              , statistic.getShootsTotal()
                              , 3
                              );
    }
    public function testGetAccuracyRate():void
    {
      const statistic:CStatistic = new CStatistic();
      statistic.incShoots().incHit( 'target1');
      statistic.incTarget( 'target1', 5);
      statistic.incShoots().incHit( 'target1');
      statistic.incShoots().incMiss();
      statistic.incShoots().incHit( 'target2');
      statistic.incShoots().incMiss();

      this.getTester().isEqual( 'statistic.getAccuracyPercent()'
                              , statistic.getAccuracyRate()
                              , 0.6
                              );

      statistic.reset();
      statistic.incShoots().incHit( 'target1', 3);
      this.getTester().isEqual( 'statistic.getAccuracyPercent()'
                              , statistic.getAccuracyRate()
                              , 3
                              );
    }
    public function testGetAccuracyPercent():void
    {
      const statistic:CStatistic = new CStatistic();
      statistic.incShoots().incHit( 'target1');
      statistic.incTarget( 'target1', 5);
      statistic.incShoots().incHit( 'target1');
      statistic.incShoots().incMiss();
      statistic.incShoots().incHit( 'target2');
      statistic.incShoots().incMiss();

      this.getTester().isEqual( 'statistic.getAccuracyPercent()'
                              , statistic.getAccuracyPercent()
                              , 60
                              );

      statistic.reset();
      statistic.incShoots().incHit( 'target1', 3);
      this.getTester().isEqual( 'statistic.getAccuracyPercent()'
                              , statistic.getAccuracyPercent()
                              , 100
                              );
    }
    public function testAdd():void
    {
      const statisticA:CStatistic = new CStatistic();
      const statisticB:CStatistic = new CStatistic();
      statisticB.incTarget( 'target1', 5);
      statisticB.incTarget( 'target2', 2);
      statisticB.incShoots().incHit( 'target1');
      statisticB.incShoots().incMiss();
      statisticB.incShoots().incMiss();
      statisticB.incShoots().incHit( 'target1');
      statisticB.incShoots().incHit( 'target2');
      statisticB.incScores( 1000)
      const statisticC:CStatistic = new CStatistic();
      statisticC.incTarget( 'target1', 3);
      statisticC.incTarget( 'target2', 4);
      statisticC.incTarget( 'target3', 2);
      statisticC.incShoots().incHit( 'target1');
      statisticC.incShoots().incMiss();
      statisticC.incShoots().incMiss();
      statisticC.incShoots().incHit( 'target1');
      statisticC.incShoots().incHit( 'target2');
      statisticC.incShoots().incHit( 'target2');
      statisticC.incShoots().incHit( 'target2');
      statisticC.incShoots().incHit( 'target3');
      statisticC.incScores( 5000);

      statisticA.add( statisticB);
      this.getTester().isEqual( '1 statisticA.getScores()'
                              , statisticA.getScores()
                              , 1000
                              );
      this.getTester().isEqual( '1 statisticA.getMissTotal()'
                              , statisticA.getMissTotal()
                              , 2
                              );
      this.getTester().isEqual( '1 statisticA.getShootsTotal()'
                              , statisticA.getShootsTotal()
                              , 5
                              );
      this.getTester().isEqual( '1 statisticA.getHitTotal()'
                              , statisticA.getHitTotal()
                              , 3
                              );
      this.getTester().isEqual( '1 statisticA.getTargetTotal()'
                              , statisticA.getTargetTotal()
                              , 7
                              );
      this.getTester().isEqual( '1 statisticA.getAccuracyPercent()'
                              , statisticA.getAccuracyPercent()
                              , 60
                              );
      statisticA.add( statisticC);
      this.getTester().isEqual( '2 statisticA.getScores()'
                              , statisticA.getScores()
                              , 6000
                              );
      this.getTester().isEqual( '2 statisticA.getMissTotal()'
                              , statisticA.getMissTotal()
                              , 4
                              );
      this.getTester().isEqual( '2 statisticA.getShootsTotal()'
                              , statisticA.getShootsTotal()
                              , 13
                              );
      this.getTester().isEqual( '2 statisticA.getHitTotal()'
                              , statisticA.getHitTotal()
                              , 9
                              );
      this.getTester().isEqual( '2 statisticA.getTargetTotal()'
                              , statisticA.getTargetTotal()
                              , 16
                              );
      this.getTester().isEqual( '2 statisticA.getAccuracyPercent()'
                              , statisticA.getAccuracyPercent()
                              , 69.23076923076923
                              );
    }
  }
}