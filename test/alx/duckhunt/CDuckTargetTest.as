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

    protected override function testList():Array
    {
      return super.testList().concat( new Array( this.testXTurnLimit
                                                , this.testFear
                                                )
                                    );
    }
 
    public override function testCreation():void
    {
      var target1:CTarget = new CDuckTarget( new CVector2f( 0, 0)
                                              , new CVector2f( 5, 3)
                                              , new MovieClip()
                                              , false
                                              , 0
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
                                              , 0
                                              , false
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

    public function testXTurnLimit():void
    {
      var target1:CTarget = new CDuckTarget( new CVector2f( 0, 0)
                                              , new CVector2f( 5, 3)
                                              , new MovieClip()
                                              , false
                                              , 5
                                              , false
                                              );
      this.getTester().isTrue( 'target1.isState( CTarget.STATE_OK)'
                              , target1.isState( CTarget.STATE_OK)
                              );
      target1.turnX();
      target1.turnX();
      target1.turnX();
      target1.turnX();
      this.getTester().isTrue( 'target1.isState( CTarget.STATE_OK)'
                              , target1.isState( CTarget.STATE_OK)
                              );
      target1.turnX();
      this.getTester().isFalse( 'target1.isState( CTarget.STATE_MISSED)'
                              , target1.isState( CTarget.STATE_MISSED)
                              );
      target1.turnX();
      this.getTester().isTrue( 'target1.isState( CTarget.STATE_MISSED)'
                              , target1.isState( CTarget.STATE_MISSED)
                              );
    }
    public function testFear():void
    {
      var target1:CTarget = new CDuckTarget( new CVector2f( 0, 0)
                                              , new CVector2f( 5, 3)
                                              , new MovieClip()
                                              , false
                                              , -1
                                              , true
                                              );
      this.getTester().isTrue( 'target1.getSpeed().getX() > 0'
                              , ( target1.getSpeed().getX() > 0)
                              );
      target1.checkHit( 30, 30);
      this.getTester().isTrue( 'target1.getSpeed().getX() > 0'
                              , ( target1.getSpeed().getX() > 0)
                              );
      target1.checkHit( 3, 3);
      this.getTester().isFalse( 'target1.getSpeed().getX() > 0'
                              , ( target1.getSpeed().getX() > 0)
                              );
    }
  }
}