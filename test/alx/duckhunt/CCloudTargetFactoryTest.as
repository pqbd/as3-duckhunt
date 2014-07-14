package test.alx.duckhunt
{
  import flash.display.MovieClip;
  import alx.common.util.CFakeRandom;
  import alx.duckhunt.CVector2f;
  import alx.duckhunt.CTarget;
  import alx.duckhunt.CCloudTarget;
  import alx.duckhunt.CTargetFactory;
  import alx.duckhunt.CCloudTargetFactory;

  public class CCloudTargetFactoryTest extends CTargetFactoryTest
  {
    public function CCloudTargetFactoryTest( strLabel:String):void
    {
      super( strLabel);
    }

    protected override function testList():Array
    {
      return super.testList().concat( new Array( this.testSizeLimit
                                                )
                                    );
    }

    public override function testCreation():void
    {
      var targetFactory1:CTargetFactory = new CCloudTargetFactory( 0, MovieClip);
    }
    public override function testCreateTarget():void
    {
    }
    public override function testRandomize():void
    {
    }
    public function testSizeLimit():void
    {
    }
  }
}