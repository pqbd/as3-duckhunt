package test.alx.duckhunt
{
  import alx.common.test.CUnitTest;
  import alx.duckhunt.CTargetFactory;

  public class CTargetFactoryTest extends CUnitTest
  {
    public function CTargetFactoryTest( strLabel:String):void
    {
      super( strLabel);
    }

    protected override function testList():Array
    {
      return new Array( this.testCreation
                      , this.testCreateTarget
                      , this.testRandomize
                      );
    }

    public function testCreation():void
    {
      throw Error( 'testCreation must be implemented');
    }
    public function testCreateTarget():void
    {
      throw Error( 'testCreateTarget must be implemented');
    }
    public function testRandomize():void
    {
      throw Error( 'testRandomize must be implemented');
    }
  }
}