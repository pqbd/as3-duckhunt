package test.alx.duckhunt
{
  import flash.display.Sprite;
  import alx.common.test.CUnitTest;
  import alx.duckhunt.CTarget;
  import alx.duckhunt.CVector2f;
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
                      , this.testIncTarget
                      , this.testGetShootsTotal
                      , this.testGetAccuracyPercent
                      , this.testGetTargetCount
                      , this.testGetTargetHitCount
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
      const target1:CTarget = new CTarget1( new CVector2f(), new CVector2f(), new Sprite());
      statistic.incScores( 100);
      statistic.incMiss();
      statistic.incTarget( target1);
      statistic.incHit( target1);

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
      const target1:CTarget = new CTarget1( new CVector2f(), new CVector2f(), new Sprite());
      const target2:CTarget = new CTarget2( new CVector2f(), new CVector2f(), new Sprite());
      statistic.incTarget( target1);
      statistic.incTarget( target1);
      statistic.incTarget( target2);

      this.getTester().isEqual( 'statistic.getTargetCount().size()'
                              , statistic.getTargetCount().size()
                              , 2
                              );
      this.getTester().isEqual( 'statistic.getTargetTotal()'
                              , statistic.getTargetTotal()
                              , 3
                              );
    }
    public function testIncHit():void
    {
      const statistic:CStatistic = new CStatistic();
      const target1:CTarget = new CTarget1( new CVector2f(), new CVector2f(), new Sprite());
      const target2:CTarget = new CTarget2( new CVector2f(), new CVector2f(), new Sprite());
      statistic.incHit( target1);
      statistic.incHit( target1);
      statistic.incHit( target2);

      this.getTester().isEqual( 'statistic.getTargetHitCount().size()'
                              , statistic.getTargetHitCount().size()
                              , 2
                              );
      this.getTester().isEqual( 'statistic.getHitTotal()'
                              , statistic.getHitTotal()
                              , 3
                              );
    }
    public function testGetShootsTotal():void
    {
      const statistic:CStatistic = new CStatistic();
      const target1:CTarget = new CTarget1( new CVector2f(), new CVector2f(), new Sprite());
      const target2:CTarget = new CTarget2( new CVector2f(), new CVector2f(), new Sprite());
      statistic.incHit( target1);
      statistic.incMiss();
      statistic.incHit( target1);
      statistic.incMiss();
      statistic.incHit( target2);
      statistic.incMiss();

      this.getTester().isEqual( 'statistic.getShootsTotal()'
                              , statistic.getShootsTotal()
                              , 6
                              );
    }
    public function testGetAccuracyPercent():void
    {
      const statistic:CStatistic = new CStatistic();
      const target1:CTarget = new CTarget1( new CVector2f(), new CVector2f(), new Sprite());
      const target2:CTarget = new CTarget2( new CVector2f(), new CVector2f(), new Sprite());
      statistic.incHit( target1);
      statistic.incMiss();
      statistic.incHit( target1);
      statistic.incMiss();
      statistic.incHit( target2);
      statistic.incMiss();

      this.getTester().isEqual( 'statistic.getAccuracyPercent()'
                              , statistic.getAccuracyPercent()
                              , 50
                              );
    }
  }
}

import flash.display.DisplayObject;
import alx.duckhunt.CTarget;
import alx.duckhunt.CVector2f;

class CTarget1 extends CTarget
{
  public function CTarget1( positionVector:CVector2f
                            , forceVector:CVector2f
                            , displayObject:DisplayObject
                            ):void
  {
    super( positionVector, forceVector, displayObject);
  }

  public override function toString():String
  {
    return 'target1';
  }
}

class CTarget2 extends CTarget
{
  public function CTarget2( positionVector:CVector2f
                            , forceVector:CVector2f
                            , displayObject:DisplayObject
                            ):void
  {
    super( positionVector, forceVector, displayObject);
  }

  public override function toString():String
  {
    return 'target2';
  }
}