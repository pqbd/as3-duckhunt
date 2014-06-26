package test.alx.duckhunt
{
  import alx.common.test.CUnitTest;
  import alx.duckhunt.CTarget;

  public class CTargetTest extends CUnitTest
  {
    public function CTargetTest( strLabel:String):void
    {
      super( strLabel);
    }

    protected override function testList():Array
    {
      return new Array( this.testCreation
                      );
    }

    public function testCreation():void
    {
      throw Error( 'testCreation must be implemented');
    }
  }
}