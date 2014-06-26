package test.alx.duckhunt
{
  import flash.display.MovieClip;
  import alx.common.util.CFakeRandom;
  import alx.duckhunt.CVector2f;
  import alx.duckhunt.CTarget;
  import alx.duckhunt.CDuckTarget;
  import alx.duckhunt.CTargetFactory;
  import alx.duckhunt.CDuckTargetFactory;

  public class CDuckTargetFactoryTest extends CTargetFactoryTest
  {
    public function CDuckTargetFactoryTest( strLabel:String):void
    {
      super( strLabel);
    }

    public override function testCreation():void
    {
      var targetFactory1:CTargetFactory = new CDuckTargetFactory( MovieClip);
    }

    public override function testCreateTarget():void
    {
      var targetFactory1:CTargetFactory = new CDuckTargetFactory( MovieClip);
      var target1:CTarget = targetFactory1.createTarget( new CVector2f( 0, 0)
                                                        , new CVector2f( 5, 5)
                                                        );
      this.getTester().isTrue( '( target1 is CDuckTarget)'
                              , ( target1 is CDuckTarget)
                              );
    }

    public override function testRandomize():void
    {
      var targetFactory1:CTargetFactory = new CDuckTargetFactory( MovieClip1, MovieClip2);
      var target1:CTarget = targetFactory1.createTarget( new CVector2f( 0, 0)
                                                        , new CVector2f( 5, 5)
                                                        );
      this.getTester().isTrue( '( target1.getDisplayObject() is MovieClip1)'
                              , ( target1.getDisplayObject() is MovieClip1)
                              );
      this.getTester().isTrue( 'target1.getSpeed().getX() > 0'
                              , ( target1.getSpeed().getX() > 0)
                              );

      var random:CFakeRandom = new CFakeRandom( 27);
      targetFactory1.randomize( random);
      var targetN:CTarget = targetFactory1.createTarget( new CVector2f( 0, 0)
                                                        , new CVector2f( 5, 5)
                                                        );

      this.getTester().isTrue( '( targetN is CDuckTarget)'
                              , ( targetN is CDuckTarget)
                              );
      this.getTester().isTrue( 'targetN.getSpeed().getX() > 0'
                              , ( targetN.getSpeed().getX() > 0)
                              );
      this.getTester().isTrue( '( targetN.getDisplayObject() is MovieClip1)'
                              , ( targetN.getDisplayObject() is MovieClip1)
                              );

      targetFactory1.randomize( random);
      targetN = targetFactory1.createTarget( new CVector2f( 0, 0)
                                           , new CVector2f( 5, 5)
                                           );
      this.getTester().isTrue( '1targetN.getSpeed().getX() > 0'
                              , ( targetN.getSpeed().getX() > 0)
                              );
      this.getTester().isTrue( '1( targetN.getDisplayObject() is MovieClip2)'
                              , ( targetN.getDisplayObject() is MovieClip2)
                              );

      targetFactory1.randomize( random);
      targetN = targetFactory1.createTarget( new CVector2f( 0, 0)
                                           , new CVector2f( 5, 5)
                                           );
      this.getTester().isTrue( '2targetN.getSpeed().getX() < 0'
                              , ( targetN.getSpeed().getX() < 0)
                              );
      this.getTester().isTrue( '2( targetN.getDisplayObject() is MovieClip1)'
                              , ( targetN.getDisplayObject() is MovieClip1)
                              );

      targetFactory1.randomize( random);
      targetN = targetFactory1.createTarget( new CVector2f( 0, 0)
                                           , new CVector2f( 5, 5)
                                           );
      this.getTester().isTrue( '3targetN.getSpeed().getX() < 0'
                              , ( targetN.getSpeed().getX() < 0)
                              );
      this.getTester().isTrue( '3( targetN.getDisplayObject() is MovieClip1)'
                              , ( targetN.getDisplayObject() is MovieClip1)
                              );
    }
  }
}

import flash.display.MovieClip;

class MovieClip1 extends MovieClip{}
class MovieClip2 extends MovieClip{}