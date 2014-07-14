package test.alx.duckhunt
{
  import flash.display.DisplayObject;
  import flash.display.Sprite;
  import alx.common.test.CUnitTest;
  import alx.duckhunt.CVector2f;
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
                      , this.testGetId
                      , this.testGetGroupId
                      , this.testSetState
                      , this.testIsHittable
                      , this.testIsOk
                      , this.testIsDisposed
                      , this.testIsHit
                      , this.testIsMissed
                      , this.testApplyForce
                      , this.testTurnX
                      , this.testTurnY
                      , this.testMove
                      , this.testGetSize
                      , this.testCheckHit
                      , this.testHit
                      , this.testMiss
                      , this.testDispose
                      );
    }

    public function createTarget( positionVector:CVector2f
                                , forceVector:CVector2f
                                , displayObject:DisplayObject
                                , nGroupId:uint
                                ):CTarget
    {
      throw Error( 'createTarget must be implemented');
    }
    public function testCreation():void
    {
      const target1:CTarget = this.createTarget( new CVector2f( 1, 2)
                                                , new CVector2f( 3, 4)
                                                , new Sprite()
                                                , 0
                                                );
      this.getTester().isEqual( 'target1.getPosition().getX()'
                              , target1.getPosition().getX()
                              , 1
                              );
      this.getTester().isEqual( 'target1.getPosition().getY()'
                              , target1.getPosition().getY()
                              , 2
                              );
    }
    public function testGetId():void
    {
      var nCounterValue:uint = CTarget.getCounterValue();
      const target1:CTarget = this.createTarget( new CVector2f( 1, 2)
                                                , new CVector2f( 3, 4)
                                                , new Sprite()
                                                , 0
                                                );
      this.getTester().isEqual( 'target1.getId()'
                              , target1.getId()
                              , ++nCounterValue
                              );
      const target2:CTarget = this.createTarget( new CVector2f( 1, 2)
                                                , new CVector2f( 3, 4)
                                                , new Sprite()
                                                , 0
                                                );
      this.getTester().isEqual( 'target2.getId()'
                              , target2.getId()
                              , ++nCounterValue
                              );
      const target3:CTarget = this.createTarget( new CVector2f( 1, 2)
                                                , new CVector2f( 3, 4)
                                                , new Sprite()
                                                , 0
                                                );
      this.getTester().isEqual( 'target3.getId()'
                              , target3.getId()
                              , ++nCounterValue
                              );
    }
    public function testGetGroupId():void
    {
      const target1:CTarget = this.createTarget( new CVector2f( 1, 2)
                                                , new CVector2f( 3, 4)
                                                , new Sprite()
                                                , 1
                                                );
      const target2:CTarget = this.createTarget( new CVector2f( 1, 2)
                                                , new CVector2f( 3, 4)
                                                , new Sprite()
                                                , 1
                                                );
      const target3:CTarget = this.createTarget( new CVector2f( 1, 2)
                                                , new CVector2f( 3, 4)
                                                , new Sprite()
                                                , 2
                                                );
      this.getTester().isEqual( 'target1.getGroupId()'
                              , target1.getGroupId()
                              , 1
                              );
      this.getTester().isEqual( 'target2.getGroupId()'
                              , target2.getGroupId()
                              , 1
                              );
      this.getTester().isEqual( 'target3.getGroupId()'
                              , target3.getGroupId()
                              , 2
                              );
    }
    public function testSetState():void
    {
      const target1:CTarget = this.createTarget( new CVector2f( 1, 2)
                                                , new CVector2f( 3, 4)
                                                , new Sprite()
                                                , 0
                                                );
      target1.setState( CTarget.STATE_OK);
      this.getTester().isEqual( 'target1.getState()'
                              , target1.getState()
                              , CTarget.STATE_OK
                              );
      this.getTester().isTrue( 'target1.isState( CTarget.STATE_OK)'
                              , target1.isState( CTarget.STATE_OK)
                              );
      this.getTester().isFalse( 'target1.isState( CTarget.STATE_MISSED)'
                              , target1.isState( CTarget.STATE_MISSED)
                              );
      target1.setState( CTarget.STATE_OK | CTarget.STATE_MISSED);
      this.getTester().isTrue( 'target1.isState( CTarget.STATE_OK)'
                              , target1.isState( CTarget.STATE_OK)
                              );
      this.getTester().isTrue( 'target1.isState( CTarget.STATE_MISSED)'
                              , target1.isState( CTarget.STATE_MISSED)
                              );
    }
    public function testIsHittable():void
    {
      const target1:CTarget = this.createTarget( new CVector2f( 1, 2)
                                                , new CVector2f( 3, 4)
                                                , new Sprite()
                                                , 0
                                                );
      target1.setState( CTarget.STATE_OK);
      this.getTester().isTrue( 'target1.isHittable()'
                              , target1.isHittable()
                              );
      target1.setState( CTarget.STATE_MISSED);
      this.getTester().isTrue( 'target1.isHittable()'
                              , target1.isHittable()
                              );
      target1.setState( CTarget.STATE_HIT);
      this.getTester().isFalse( 'target1.isHittable()'
                              , target1.isHittable()
                              );
      target1.setState( CTarget.STATE_DISPOSED);
      this.getTester().isFalse( 'target1.isHittable()'
                              , target1.isHittable()
                              );
    }
    public function testIsOk():void
    {
      const target1:CTarget = this.createTarget( new CVector2f( 1, 2)
                                                , new CVector2f( 3, 4)
                                                , new Sprite()
                                                , 0
                                                );
      target1.setState( CTarget.STATE_OK);
      this.getTester().isTrue( 'target1.isOk()'
                              , target1.isOk()
                              );
      target1.setState( CTarget.STATE_MISSED);
      this.getTester().isFalse( 'target1.isOk()'
                              , target1.isOk()
                              );
      target1.setState( CTarget.STATE_HIT);
      this.getTester().isFalse( 'target1.isOk()'
                              , target1.isOk()
                              );
      target1.setState( CTarget.STATE_DISPOSED);
      this.getTester().isFalse( 'target1.isOk()'
                              , target1.isOk()
                              );
    }
    public function testIsDisposed():void
    {
      const target1:CTarget = this.createTarget( new CVector2f( 1, 2)
                                                , new CVector2f( 3, 4)
                                                , new Sprite()
                                                , 0
                                                );
      target1.setState( CTarget.STATE_OK);
      this.getTester().isFalse( 'target1.isDisposed()'
                              , target1.isDisposed()
                              );
      target1.setState( CTarget.STATE_MISSED);
      this.getTester().isFalse( 'target1.isDisposed()'
                              , target1.isDisposed()
                              );
      target1.setState( CTarget.STATE_HIT);
      this.getTester().isFalse( 'target1.isDisposed()'
                              , target1.isDisposed()
                              );
      target1.setState( CTarget.STATE_DISPOSED);
      this.getTester().isTrue( 'target1.isDisposed()'
                              , target1.isDisposed()
                              );
    }
    public function testIsHit():void
    {
      const target1:CTarget = this.createTarget( new CVector2f( 1, 2)
                                                , new CVector2f( 3, 4)
                                                , new Sprite()
                                                , 0
                                                );
      target1.setState( CTarget.STATE_OK);
      this.getTester().isFalse( 'target1.isHit()'
                              , target1.isHit()
                              );
      target1.setState( CTarget.STATE_MISSED);
      this.getTester().isFalse( 'target1.isHit()'
                              , target1.isHit()
                              );
      target1.setState( CTarget.STATE_HIT);
      this.getTester().isTrue( 'target1.isHit()'
                              , target1.isHit()
                              );
      target1.setState( CTarget.STATE_DISPOSED);
      this.getTester().isFalse( 'target1.isHit()'
                              , target1.isHit()
                              );
    }
    public function testIsMissed():void
    {
      const target1:CTarget = this.createTarget( new CVector2f( 1, 2)
                                                , new CVector2f( 3, 4)
                                                , new Sprite()
                                                , 0
                                                );
      target1.setState( CTarget.STATE_OK);
      this.getTester().isFalse( 'target1.isMissed()'
                              , target1.isMissed()
                              );
      target1.setState( CTarget.STATE_MISSED);
      this.getTester().isTrue( 'target1.isMissed()'
                              , target1.isMissed()
                              );
      target1.setState( CTarget.STATE_HIT);
      this.getTester().isFalse( 'target1.isMissed()'
                              , target1.isMissed()
                              );
      target1.setState( CTarget.STATE_DISPOSED);
      this.getTester().isFalse( 'target1.isMissed()'
                              , target1.isMissed()
                              );
    }
    public function testApplyForce():void
    {
      const target1:CTarget = this.createTarget( new CVector2f( 1, 2)
                                                , new CVector2f( 0, 0)
                                                , new Sprite()
                                                , 0
                                                );
      this.getTester().isEqual( 'target1.getSpeed().getX()'
                              , target1.getSpeed().getX()
                              , 0
                              );
      this.getTester().isEqual( 'target1.getSpeed().getY()'
                              , target1.getSpeed().getY()
                              , 0
                              );
      target1.applyForce( new CVector2f( 5, 10));
      this.getTester().isEqual( 'target1.getSpeed().getX()'
                              , target1.getSpeed().getX()
                              , ( 5 / target1.getWeight())
                              );
      this.getTester().isEqual( 'target1.getSpeed().getY()'
                              , target1.getSpeed().getY()
                              , ( 10 / target1.getWeight())
                              );
      target1.applyForce( new CVector2f( 5, 0));
      this.getTester().isEqual( 'target1.getSpeed().getX()'
                              , target1.getSpeed().getX()
                              , ( 10 / target1.getWeight())
                              );
      this.getTester().isEqual( 'target1.getSpeed().getY()'
                              , target1.getSpeed().getY()
                              , ( 10 / target1.getWeight())
                              );
    }
    public function testTurnX():void
    {
      const target1:CTarget = this.createTarget( new CVector2f( 1, 2)
                                                , new CVector2f( 3, 4)
                                                , new Sprite()
                                                , 0
                                                );
      this.getTester().isTrue( 'target1.getSpeed().getX() > 0'
                              , ( target1.getSpeed().getX() > 0)
                              );
      target1.turnX();
      this.getTester().isTrue( 'target1.getSpeed().getX() < 0'
                              , ( target1.getSpeed().getX() < 0)
                              );
    }
    public function testTurnY():void
    {
      const target1:CTarget = this.createTarget( new CVector2f( 1, 2)
                                                , new CVector2f( 3, 4)
                                                , new Sprite()
                                                , 0
                                                );
      this.getTester().isTrue( 'target1.getSpeed().getY() > 0'
                              , ( target1.getSpeed().getY() > 0)
                              );
      target1.turnY();
      this.getTester().isTrue( 'target1.getSpeed().getY() < 0'
                              , ( target1.getSpeed().getY() < 0)
                              );
    }
    public function testMove():void
    {
      const target1:CTarget = this.createTarget( new CVector2f( 1, 2)
                                                , new CVector2f( 3, 4)
                                                , new Sprite()
                                                , 0
                                                );
      target1.setSpeed( new CVector2f( 3, 4));
      this.getTester().isEqual( 'target1.getPosition().getX()'
                              , target1.getPosition().getX()
                              , 1
                              );
      this.getTester().isEqual( 'target1.getPosition().getY()'
                              , target1.getPosition().getY()
                              , 2
                              );
      target1.move();
      this.getTester().isEqual( 'target1.getPosition().getX()'
                              , target1.getPosition().getX()
                              , 4
                              );
      this.getTester().isEqual( 'target1.getPosition().getY()'
                              , target1.getPosition().getY()
                              , 6
                              );
    }
    protected function createSprite( nWidth:int, nHeight:int, nColor:int = 0xFFFFFF):Sprite
    {
      var sprite:Sprite = new Sprite();
      sprite.graphics.beginFill( nColor);
      sprite.graphics.drawRect( 0, 0, nWidth, nHeight);
      return sprite;
    }
    public function testGetSize():void
    {
      const target1:CTarget = this.createTarget( new CVector2f( 1, 2)
                                                , new CVector2f( 3, 4)
                                                , new Sprite()
                                                , 0
                                                );
      this.getTester().isEqual( 'target1.getSize().getX()'
                              , target1.getSize().getX()
                              , 0
                              );
      this.getTester().isEqual( 'target1.getSize().getY()'
                              , target1.getSize().getY()
                              , 0
                              );
      const target2:CTarget = this.createTarget( new CVector2f( 1, 2)
                                                , new CVector2f( 3, 4)
                                                , this.createSprite( 10, 50)
                                                , 0
                                                );
      this.getTester().isEqual( 'target2.getSize().getX()'
                              , target2.getSize().getX()
                              , 10
                              );
      this.getTester().isEqual( 'target2.getSize().getY()'
                              , target2.getSize().getY()
                              , 50
                              );
      const target3:CTarget = this.createTarget( new CVector2f( 1, 2)
                                                , new CVector2f( 3, 4)
                                                , this.createSprite( 1, 50)
                                                , 0
                                                );
      this.getTester().isEqual( 'target3.getSize().getX()'
                              , target3.getSize().getX()
                              , 1
                              );
      this.getTester().isEqual( 'target3.getSize().getY()'
                              , target3.getSize().getY()
                              , 50
                              );
    }
    public function testCheckHit():void
    {
    }
    public function testHit():void
    {
    }
    public function testMiss():void
    {
    }
    public function testDispose():void
    {
    }
  }
}