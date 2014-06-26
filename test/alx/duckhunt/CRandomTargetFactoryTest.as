package test.alx.duckhunt
{
  import alx.common.util.CFakeRandom;
  import alx.duckhunt.CVector2f;
  import alx.duckhunt.CTarget;
  import alx.duckhunt.CTargetFactory;
  import alx.duckhunt.CRandomTargetFactory;

  public class CRandomTargetFactoryTest extends CTargetFactoryTest
  {
    public function CRandomTargetFactoryTest( strLabel:String):void
    {
      super( strLabel);
    }

    public override function testCreation():void
    {
      var targetFactory1:CTargetFactory = new CRandomTargetFactory( null
                                                                  , new CTargetFactory1()
                                                                  , new CTargetFactory2()
                                                                  , new CTargetFactory3()
                                                                  );

      var targetN:CTarget = targetFactory1.createTarget( new CVector2f( 0, 0)
                                                        , new CVector2f( 5, 5)
                                                        );
      this.getTester().isTrue( '( targetN is CTarget)'
                              , ( targetN is CTarget)
                              );
      this.getTester().isTrue( 'targetN.getSpeed().getX() > 0'
                              , ( targetN.getSpeed().getX() > 0)
                              );
      this.getTester().isTrue( 'targetN.getPosition().getX() == 0'
                              , ( targetN.getPosition().getX() == 0)
                              );
    }
    public override function testCreateTarget():void
    {
      var random:CFakeRandom = new CFakeRandom( 47);
      var targetFactory1:CTargetFactory = new CRandomTargetFactory( random
                                                                  , new CTargetFactory1()
                                                                  , new CTargetFactory2()
                                                                  , new CTargetFactory3()
                                                                  );
      var targetN:CTarget = targetFactory1.createTarget( new CVector2f( 0, 0)
                                                        , new CVector2f( 5, 5)
                                                        );
      this.getTester().isTrue( '1( targetN is CTarget3)'
                              , ( targetN is CTarget3)
                              );
      targetN = targetFactory1.createTarget( new CVector2f( 0, 0)
                                           , new CVector2f( 5, 5)
                                           );
      this.getTester().isTrue( '2( targetN is CTarget1)'
                              , ( targetN is CTarget1)
                              );
      targetN = targetFactory1.createTarget( new CVector2f( 0, 0)
                                           , new CVector2f( 5, 5)
                                           );
      this.getTester().isTrue( '3( targetN is CTarget1)'
                              , ( targetN is CTarget1)
                              );
      targetN = targetFactory1.createTarget( new CVector2f( 0, 0)
                                           , new CVector2f( 5, 5)
                                           );
      this.getTester().isTrue( '4( targetN is CTarget2)'
                              , ( targetN is CTarget2)
                              );
    }

    public override function testRandomize():void
    {
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
class CTarget2 extends CTarget
{
  public function CTarget2( positionVector:CVector2f
                            , forceVector:CVector2f
                            , displayObject:DisplayObject
                            ):void
  {
    super( positionVector, forceVector, displayObject);
  }
}
class CTargetFactory2 extends CTargetFactory
{
  public function CTargetFactory2():void
  {
    super();
  }
  public override function createTarget( position:CVector2f, force:CVector2f):CTarget
  {
    return new CTarget2( position, force, new Sprite());
  }
}
class CTarget3 extends CTarget
{
  public function CTarget3( positionVector:CVector2f
                            , forceVector:CVector2f
                            , displayObject:DisplayObject
                            ):void
  {
    super( positionVector, forceVector, displayObject);
  }
}
class CTargetFactory3 extends CTargetFactory
{
  public function CTargetFactory3():void
  {
    super();
  }
  public override function createTarget( position:CVector2f, force:CVector2f):CTarget
  {
    return new CTarget3( position, force, new Sprite());
  }
}