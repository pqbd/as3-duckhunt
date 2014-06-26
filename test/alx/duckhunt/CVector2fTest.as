package test.alx.duckhunt
{
  import alx.common.test.CUnitTest;
  import alx.duckhunt.CVector2f;

  public class CVector2fTest extends CUnitTest
  {
    public function CVector2fTest( strLabel:String):void
    {
      super( strLabel);
    }

    protected override function testList():Array
    {
      return new Array( this.testCreation
                      , this.testSet
                      , this.testNegate
                      , this.testSum
                      , this.testNorm
                      , this.testMult
                      , this.testDiv
                      );
    }

    public function testCreation():void
    {
      var vector:CVector2f = new CVector2f();
      this.getTester().isEqual( 'new CVector2f() getX'
                              , vector.getX()
                              , 0
                              );
      this.getTester().isEqual( 'new CVector2f() getY'
                              , vector.getY()
                              , 0
                              );

      vector = new CVector2f( 5, -13.5);
      this.getTester().isEqual( 'new CVector2f( 5, -13.5) getX'
                              , vector.getX()
                              , 5
                              );
      this.getTester().isEqual( 'new CVector2f( 5, -13.5) getY'
                              , vector.getY()
                              , -13.5
                              );
      
      vector = new CVector2f( 5);
      this.getTester().isEqual( 'new CVector2f( 5) getX'
                              , vector.getX()
                              , 5
                              );
      this.getTester().isEqual( 'new CVector2f(  5) getY'
                              , vector.getY()
                              , 0
                              );
    }
    public function testSet():void
    {
      var vector:CVector2f = new CVector2f();
      vector.set( 5, 10);
      this.getTester().isEqual( 'vector.set( 5, 10) getX'
                              , vector.getX()
                              , 5
                              );
      this.getTester().isEqual( 'vector.set( 5, 10) getY'
                              , vector.getY()
                              , 10
                              );
      
      vector.setX( 100);
      this.getTester().isEqual( 'vector.setX( 100) getX'
                              , vector.getX()
                              , 100
                              );
      
      vector.setY( 50);
      this.getTester().isEqual( 'vector.setY( 50) getY'
                              , vector.getY()
                              , 50
                              );
    }    
    public function testNegate():void
    {
      var vector:CVector2f = new CVector2f();
      vector.set( 5, 10);     
      vector.negateX();
      this.getTester().isEqual( 'vector.negateX() getX'
                              , vector.getX()
                              , -5
                              );
      
      vector.negateY();
      this.getTester().isEqual( 'vector.negateY() getY'
                              , vector.getY()
                              , -10
                              );
      
      vector.negate();
      this.getTester().isEqual( 'vector.negate() getX'
                              , vector.getX()
                              , 5
                              );
      this.getTester().isEqual( 'vector.negate() getY'
                              , vector.getY()
                              , 10
                              );
    }

    public function testSum():void
    {
      var vectorA:CVector2f = new CVector2f( 0, 0);
      var vectorB:CVector2f = new CVector2f( 5, -7);
      var vectorC:CVector2f = new CVector2f( -0.01, 10.3);
      var vectorN:CVector2f = new CVector2f( 0, 0);

      this.getTester().isEqual( 'vectorA.sumX( 1) getX'
                              , vectorA.sumX( 1).getX()
                              , 1
                              );
      this.getTester().isEqual( 'vectorA.sumY( 10) getY'
                              , vectorA.sumY( 10).getY()
                              , 10
                              );
      
      vectorA.sum( 3, -4);
      this.getTester().isEqual( 'vectorA.sum( 3, -4) getX'
                              , vectorA.getX()
                              , 4
                              );
      this.getTester().isEqual( 'vectorA.sum( 3, -4) getY'
                              , vectorA.getY()
                              , 6
                              );

      vectorA.sumVector2f( vectorB);
      this.getTester().isEqual( 'vectorA.sumVector2f( vectorB) getX'
                              , vectorA.getX()
                              , 9
                              );
      this.getTester().isEqual( 'vectorA.sumVector2f( vectorB) getY'
                              , vectorA.getY()
                              , -1
                              );

      vectorA.sumVector2f( vectorN);
      this.getTester().isEqual( 'vectorA.sumVector2f( vectorN) getX'
                              , vectorA.getX()
                              , 9
                              );
      this.getTester().isEqual( 'vectorA.sumVector2f( vectorN) getY'
                              , vectorA.getY()
                              , -1
                              );

      vectorA.sumVector2f( vectorC);
      this.getTester().isEqual( 'vectorA.sumVector2f( vectorC) getX'
                              , vectorA.getX()
                              , 8.99
                              );
      this.getTester().isEqual( 'vectorA.sumVector2f( vectorC) getY'
                              , vectorA.getY()
                              , 9.3
                              );
    }

    public function testNorm():void
    {
      var vectorA:CVector2f = new CVector2f( 0, 0);
      var vectorB:CVector2f = new CVector2f( 5, -7);
      var vectorC:CVector2f = new CVector2f( -0.01, 10.5);
      var vectorD:CVector2f = new CVector2f( 3, 4);

      this.getTester().isEqual( 'vectorA.norm2()'
                              , vectorA.norm2()
                              , 0
                              );
      this.getTester().isEqual( 'vectorB.norm2()'
                              , vectorB.norm2()
                              , 74
                              );
      this.getTester().isEqual( 'vectorC.norm2()'
                              , vectorC.norm2()
                              , 110.2501
                              );
      this.getTester().isEqual( 'vectorD.norm2()'
                              , vectorD.norm2()
                              , 25
                              );
      this.getTester().isEqual( 'vectorA.norm()'
                              , vectorA.norm()
                              , 0
                              );
      this.getTester().isEqual( 'vectorD.norm()'
                              , vectorD.norm()
                              , 5
                              );
    }

    public function testMult():void
    {
      var vectorA:CVector2f = new CVector2f( 5, -7);
      var vectorB:CVector2f = new CVector2f( 5, -7);
      var vectorC:CVector2f = new CVector2f( -0.01, 10.5);
      var vectorD:CVector2f = new CVector2f( 3, 4);

      this.getTester().isEqual( 'vectorA.multX( 2).getX()'
                              , vectorA.multX( 2).getX()
                              , 10
                              );
      this.getTester().isEqual( 'vectorA.multY( 2).getX()'
                              , vectorA.multY( 2).getY()
                              , -14
                              );
      this.getTester().isEqual( 'vectorA.mult( 0, 0).getX()'
                              , vectorA.mult( 0, 0).getY()
                              , 0
                              );
      this.getTester().isEqual( 'vectorA.getY()'
                              , vectorA.getY()
                              , 0
                              );

      this.getTester().isEqual( 'vectorB.multVector2f( vectorD).getX()'
                              , vectorB.multVector2f( vectorD).getX()
                              , 15
                              );
      this.getTester().isEqual( 'vectorB.getY()'
                              , vectorB.getY()
                              , -28
                              );

      this.getTester().isEqual( 'vectorB.multVector2f( vectorC).getX()'
                              , vectorB.multVector2f( vectorC).getX()
                              , -0.15
                              );
      
      this.getTester().isEqual( 'vectorB.multVector2f( vectorA).getX()'
                              , vectorB.multVector2f( vectorA).getX()
                              , 0
                              );
    }
    public function testDiv():void
    {
      var vectorA:CVector2f = new CVector2f( 5, -7);
      var vectorB:CVector2f = new CVector2f( 5, -7);
      var vectorC:CVector2f = new CVector2f( 10, 4);
      var vectorD:CVector2f = new CVector2f( 5, 2);

      this.getTester().isEqual( 'vectorA.divVector2f( vectorA).getX()'
                              , vectorA.divVector2f( vectorA).getX()
                              , 1
                              );
      this.getTester().isEqual( 'vectorA.getY()'
                              , vectorA.getY()
                              , 1
                              );
      
      this.getTester().isEqual( 'vectorB.div( 0, 0).getX()'
                              , vectorB.div( 0, 0).getX()
                              , Infinity
                              );
      
      this.getTester().isEqual( 'vectorC.divVector2f( vectorD).getX()'
                              , vectorC.divVector2f( vectorD).getX()
                              , 2
                              );
      this.getTester().isEqual( 'vectorC.getX()'
                              , vectorC.getX()
                              , 2
                              );
    }
  }
}