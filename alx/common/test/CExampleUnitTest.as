package alx.common.test
{
  import alx.common.test.CUnitTest;

  public class CExampleUnitTest extends CUnitTest
  {
    public function CExampleUnitTest( strLabel:String):void
    {
      super( strLabel);
    }

    protected override function testList():Array
    {
      return new Array( this.testSum
                      , this.testMult
                      );
    }

    public function testSum():void
    {
      const nA:int = 5;
      const nB:int = 6;
      this.getTester().isEqual( 'nA + nB'
                              , ( nA + nB)
                              , 11
                              );
      this.getTester().isEqual( 'nA + 1 + nB'
                              , ( nA + 1 + nB)
                              , 12
                              );
      this.getTester().isEqual( 'nA + 0'
                              , ( nA + 0)
                              , 5
                              );
      this.getTester().isEqual( '0 + nA'
                              , ( 0 + nA)
                              , 5
                              );
      this.getTester().isEqual( '(nA + 5) + nB'
                              , (( nA + 5) + nB)
                              , 16
                              );
      this.getTester().isEqual( 'nA + (5 + nB)'
                              , ( nA + (5 + nB))
                              , 16
                              );
      this.getTester().isEqual( 'nA + (-5)'
                              , ( nA + (-5))
                              , 0
                              );
      this.getTester().isEqual( 'nA - 5'
                              , ( nA - 5)
                              , 0
                              );
      this.getTester().isEqual( 'nA - nB'
                              , ( nA - nB)
                              , -1
                              );
      this.getTester().isEqual( '0 - nA - 0'
                              , ( 0 - nA - 0)
                              , -5
                              );
    }
    public function testMult():void
    {
      const nA:int = 2;
      const nB:int = 3;
      this.getTester().isEqual( 'nA * 1'
                              , ( nA * 1)
                              , 2
                              );
      this.getTester().isEqual( 'nA * 0'
                              , ( nA * 0)
                              , 0
                              );
      this.getTester().isEqual( 'nA * 3'
                              , ( nA * 3)
                              , 6
                              );
      this.getTester().isEqual( 'nA * nB'
                              , ( nA * nB)
                              , 6
                              );
      this.getTester().isEqual( 'nB * nA'
                              , ( nB * nA)
                              , 6
                              );
      this.getTester().isEqual( '(nB + 1) * nA'
                              , (( nB + 1) * nA)
                              , 8
                              );
      this.getTester().isEqual( 'nB * nA + 1 * nA'
                              , ( nB * nA + 1 * nA)
                              , 8
                              );
      this.getTester().isEqual( 'nA * ( 1 / 1)'
                              , ( nA * ( 1 / 1))
                              , 2
                              );
      this.getTester().isEqual( 'nA * ( 1 / 2)'
                              , ( nA * ( 1 / 2))
                              , 1
                              );
      this.getTester().isEqual( 'nA / nA'
                              , ( nA / nA)
                              , 1
                              );
      this.getTester().isEqual( '10 / 2'
                              , ( 10 / 2)
                              , 5
                              );
      this.getTester().isEqual( '1 / 2'
                              , ( 1 / 2)
                              , 0.5
                              );
      this.getTester().isEqual( '0 / 2'
                              , ( 0 / 2)
                              , 0
                              );
      this.getTester().isEqual( '5 / 0'
                              , ( 5 / 0)
                              , Infinity
                              );
    }
  }
}