package test.alx.duckhunt
{
  import flash.display.DisplayObject;
  import flash.display.MovieClip;
  import alx.duckhunt.CVector2f;
  import alx.duckhunt.CTarget;
  import alx.duckhunt.CCloudTarget;

  public class CCloudTargetTest extends CTargetTest
  {
    public function CCloudTargetTest( strLabel:String):void
    {
      super( strLabel);
    }

    public override function createTarget( positionVector:CVector2f
                                , forceVector:CVector2f
                                , displayObject:DisplayObject
                                , nGroupId:uint
                                ):CTarget
    {
      var animation:MovieClip = new MovieClip();
      animation.addChild( displayObject);
      return new CCloudTarget( positionVector
                            , forceVector
                            , animation
                            , nGroupId
                            );
    }
    public override function testCheckHit():void
    {
    }
    public override function testHit():void
    {
    }
    public override function testMiss():void
    {
    }
    public override function testDispose():void
    {
      const target1:CTarget = this.createTarget( new CVector2f( 1, 2)
                                                , new CVector2f( 3, 4)
                                                , new MovieClip()
                                                , 0
                                                );
      target1.dispose();
      this.getTester().isTrue( 'target1.isDisposed()'
                              , target1.isDisposed()
                              );
    }
  }
}