package test.alx.duckhunt
{
  import flash.display.MovieClip;
  import alx.duckhunt.CVector2f;
  import alx.duckhunt.CTarget;
  import alx.duckhunt.CDuckTarget;

  public class CDuckTargetTest extends CTargetTest
  {
    public function CDuckTargetTest( strLabel:String):void
    {
      super( strLabel);
    }
 
    public override function testCreation():void
    {
      var target1:CTarget = new CDuckTarget( new CVector2f( 0, 0)
                                              , new CVector2f( 5, 3)
                                              , new MovieClip()
                                              , false
                                              );
      this.getTester().isEqual( 'target1.getSpeed().getX()'
                              , target1.getSpeed().getX()
                              , 5 / target1.getWeight()
                              );
      this.getTester().isEqual( 'target1.getSpeed().getY()'
                              , target1.getSpeed().getY()
                              , 3 / target1.getWeight()
                              );

      var target2:CTarget = new CDuckTarget( new CVector2f( 0, 0)
                                              , new CVector2f( 5, 3)
                                              , new MovieClip()
                                              , true
                                              );
      this.getTester().isEqual( 'target2.getSpeed().getX()'
                              , target2.getSpeed().getX()
                              , -5 / target2.getWeight()
                              );
      this.getTester().isEqual( 'target2.getSpeed().getY()'
                              , target2.getSpeed().getY()
                              , 3 / target2.getWeight()
                              );
    }
  }
}