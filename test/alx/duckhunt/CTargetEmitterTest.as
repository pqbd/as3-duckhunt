package test.alx.duckhunt
{
  import alx.common.test.CUnitTest;
  import alx.common.util.CFakeRandom;
  import alx.duckhunt.CVector2f;
  import alx.duckhunt.CTarget;
  import alx.duckhunt.CTargetEmitter;

  public class CTargetEmitterTest extends CUnitTest
  {
    public function CTargetEmitterTest( strLabel:String):void
    {
      super( strLabel);
    }

    protected override function testList():Array
    {
      return new Array( this.testCreation
                      , this.testEmitOne
                      , this.testEmitRandomOne
                      , this.testSetMaxMinForce
                      );
    }

    public function testCreation():void
    {
      var targetEmitter:CTargetEmitter = new CTargetEmitter();
    }

    public function testEmitOne()
    {
      const targetEmitter:CTargetEmitter = new CTargetEmitter();

      var target1:CTarget = targetEmitter.EmitOne( new CTargetFactory1()
                                                  , new CVector2f( 100, 120)
                                                  , new CVector2f( 5, 7)
                                                  );
      this.getTester().isTrue( '( target1 is CTarget1)'
                              , ( target1 is CTarget1)
                              );
      this.getTester().isEqual( 'target1.getPosition.getX()'
                              , target1.getPosition().getX()
                              , 100
                              );
      this.getTester().isEqual( 'target1.getPosition.getY()'
                              , target1.getPosition().getY()
                              , 120
                              );
      this.getTester().isEqual( 'target1.getSpeed.getX()'
                              , target1.getSpeed().getX()
                              , 5
                              );
      this.getTester().isEqual( 'target1.getSpeed.getY()'
                              , target1.getSpeed().getY()
                              , 7
                              );
    }

    public function testEmitRandomOne()
    {
      const targetEmitter:CTargetEmitter = new CTargetEmitter();
      const random:CFakeRandom = new CFakeRandom( 47);

      targetEmitter.setMinForce( new CVector2f( 1, 15)).setMaxForce( new CVector2f( 5, 30));
      var target1:CTarget = targetEmitter.EmitRandomOne( new CTargetFactory1()
                                                        , new CVector2f( 640, 480)
                                                        , random.ask( 0.2
                                                                    , 0.7
                                                                    , 0.5
                                                                    )
                                                        );
      this.getTester().isTrue( '( target1 is CTarget1)'
                              , ( target1 is CTarget1)
                              );
      this.getTester().isEqual( 'target1.getPosition.getX()'
                              , target1.getPosition().getX()
                              , 320
                              );
      this.getTester().isEqual( 'target1.getPosition.getY()'
                              , target1.getPosition().getY()
                              , 480
                              );
      this.getTester().isEqual( 'target1.getSpeed.getX()'
                              , target1.getSpeed().getX()
                              , 1.8
                              );
      this.getTester().isEqual( 'target1.getSpeed.getY()'
                              , target1.getSpeed().getY()
                              , 0.7749199742549312
                              );
    }

    public function testSetMaxMinForce():void
    {
      const targetEmitter:CTargetEmitter = new CTargetEmitter();
      try
      {
        targetEmitter.setMinForce( new CVector2f( -1, 15));
        this.getTester().notHere( 'targetEmitter.setMinForce( new CVector2f( -1, 15))');
      }
      catch ( e:Error){}
      try
      {
        targetEmitter.setMinForce( new CVector2f( 1, -1));
        this.getTester().notHere( 'targetEmitter.setMinForce( new CVector2f( 1, -1))');
      }
      catch ( e:Error){}
      try
      {
        targetEmitter.setMinForce( new CVector2f( 1, 91));
        this.getTester().notHere( 'targetEmitter.setMinForce( new CVector2f( 1, 91))');
      }
      catch ( e:Error){}
      try
      {
        targetEmitter.setMaxForce( new CVector2f( -1, 15));
        this.getTester().notHere( 'targetEmitter.setMaxForce( new CVector2f( -1, 15))');
      }
      catch ( e:Error){}
      try
      {
        targetEmitter.setMaxForce( new CVector2f( 1, -1));
        this.getTester().notHere( 'targetEmitter.setMaxForce( new CVector2f( 1, -1))');
      }
      catch ( e:Error){}
      try
      {
        targetEmitter.setMaxForce( new CVector2f( 1, 91));
        this.getTester().notHere( 'targetEmitter.setMaxForce( new CVector2f( 1, 91))');
      }
      catch ( e:Error){}
    }
  }
}

import flash.display.DisplayObject;
import flash.display.Sprite;
import alx.duckhunt.CVector2f;
import alx.duckhunt.CTarget;
import alx.duckhunt.CTargetFactory;

class CTarget1 extends CTarget
{
  public function CTarget1( positionVector:CVector2f
                            , forceVector:CVector2f
                            , displayObject:DisplayObject
                            ):void
  {
    super( positionVector, forceVector, displayObject);
  }
}
class CTargetFactory1 extends CTargetFactory
{
  public function CTargetFactory1():void
  {
    super();
  }
  public override function createTarget( position:CVector2f, force:CVector2f):CTarget
  {
    return new CTarget1( position, force, new Sprite());
  }
}