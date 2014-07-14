package test.alx.duckhunt
{
  import alx.common.test.CUnitTest;
  import alx.common.util.CFakeRandom;
  import alx.duckhunt.CNickGenerator;

  public class CNickGeneratorTest extends CUnitTest
  {
    public function CNickGeneratorTest( strLabel:String):void
    {
      super( strLabel);
    }

    protected override function testList():Array
    {
      return new Array( this.testNext
                      );
    }

    public function testNext():void
    {
      const random:CFakeRandom = new CFakeRandom( 47);
      this.getTester().isEqual( '1 CNickGenerator.next( random)'
                              , CNickGenerator.next( random)
                              , '=XAM='
                              );
      this.getTester().isEqual( '2 CNickGenerator.next()'
                              , CNickGenerator.next( random)
                              , 'ommonbIpeHbIu ynbIPb'
                              );
      random.ask( 0);
      this.getTester().isEqual( '3 CNickGenerator.next()'
                              , CNickGenerator.next( random)
                              , 'Deg omMOPO3'
                              );
    }
  }
}