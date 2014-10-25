package test.alx.duckhunt
{
  import flash.display.DisplayObject;
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

    public override function createTarget( positionVector:CVector2f
                                , forceVector:CVector2f
                                , displayObject:DisplayObject
                                , nGroupId:uint
                                ):CTarget
    {
      var animation:MovieClip = new MovieClip();
      animation.addChild( displayObject);
      return this.createDuckTarget( positionVector
                                  , forceVector
                                  , animation
                                  , nGroupId
                                  , false
                                  , -1
                                  , false
                                  );
    }
    public function createDuckTarget( positionVector:CVector2f
                                , forceVector:CVector2f
                                , animation:MovieClip
                                , nGroupId:uint
                                , bTurn
                                , nXTurns
                                , bFear
                                ):CDuckTarget
    {
      return new CDuckTarget( positionVector
                            , forceVector
                            , animation
                            , nGroupId
                            , bTurn
                            , nXTurns
                            , bFear
                            );
    }

    protected override function testList():Array
    {
      return super.testList().concat( new Array( this.testXTurnLimit
                                                , this.testFear
                                                )
                                    );
    }

    public function testXTurnLimit():void
    {
      const target1:CTarget = this.createDuckTarget( new CVector2f( 0, 0)
                                                  , new CVector2f( 5, 3)
                                                  , new MovieClip()
                                                  , 0
                                                  , true
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
      const target1:CTarget = this.createDuckTarget( new CVector2f( 0, 0)
                                                  , new CVector2f( 5, 3)
                                                  , new MovieClip()
                                                  , 0
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
    public override function testCheckHit():void
    {
      const target1:CTarget = this.createDuckTarget( new CVector2f( 0, 0)
                                                  , new CVector2f( 5, 3)
                                                  , new MovieClip()
                                                  , 0
                                                  , false
                                                  , -1
                                                  , false
                                                  );
      this.getTester().isTrue( 'target1.checkHit( 20, -10)'
                              , target1.checkHit( 20, -10)
                              );
    }
    public override function testHit():void
    {
      const target1:CTarget = this.createDuckTarget( new CVector2f( 0, 0)
                                                  , new CVector2f( 5, 3)
                                                  , new MovieClip()
                                                  , 0
                                                  , false
                                                  , -1
                                                  , false
                                                  );
      target1.hit();
      this.getTester().isTrue( 'target1.isHit()'
                              , target1.isHit()
                              );
    }
    public override function testMiss():void
    {
      const target1:CTarget = this.createDuckTarget( new CVector2f( 0, 0)
                                                  , new CVector2f( 5, 3)
                                                  , new MovieClip()
                                                  , 0
                                                  , false
                                                  , -1
                                                  , false
                                                  );
      target1.miss();
      this.getTester().isTrue( 'target1.isMissed()'
                              , target1.isMissed()
                              );
    }
    public override function testDispose():void
    {
      const target1:CTarget = this.createDuckTarget( new CVector2f( 0, 0)
                                                  , new CVector2f( 5, 3)
                                                  , new MovieClip()
                                                  , 0
                                                  , false
                                                  , -1
                                                  , false
                                                  );
      this.getTester().isTrue( 'target1.isOk()'
                              , target1.isOk()
                              );
      target1.dispose();
      this.getTester().isFalse( 'target1.isOk()'
                              , target1.isOk()
                              );
    }
  }
}