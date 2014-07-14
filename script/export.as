import flash.display.DisplayObjectContainer;
import alx.duckhunt.CVector2f
import alx.duckhunt.CRandomTargetFactory
import alx.duckhunt.CDuckTargetFactory
import alx.duckhunt.CSniperRifle
import alx.duckhunt.CRound
import alx.duckhunt.CGame

var game:CGame = new CGame();
game.setWeapon( new CSniperRifle( new _MCSniperRiffle(), new _MCSniperRiffleRound(), -1));
game.Init( new CRound( 100
                      ,new CRandomTargetFactory( null
                                               , new CDuckTargetFactory( 1, _MCDuck)
                                               , new CDuckTargetFactory( 2, _MCDrake)
                                                          .setUseFear( true, 1)
                                               )
                      , 4
                      , 8
                      , new CVector2f( 2, 4)
                      )
          , new CRound( 500
                      , new CRandomTargetFactory( null
                                               , new CDuckTargetFactory( 1, _MCDuck)
                                               , new CDuckTargetFactory( 2, _MCDrake)
                                                          .setUseFear( true, 1)
                                               )
                      , 10
                      , 30
                      , new CVector2f( 4, 8)
                      )
          , new CRound( 1000
                      , new CRandomTargetFactory( null
                                               , new CDuckTargetFactory( 1, _MCDuck)
                                               , new CDuckTargetFactory( 2, _MCDrake)
                                               , new CDuckTargetFactory( 3, _MCDuckDuck)
                                                      .setXTurnLimit( new CVector2f( 5, 10))
                                                      .setUseFear( true, 1)
                                               )
                      , 2
                      , 10
                      , new CVector2f( 5, 10)
                      )
          );

var display:DisplayObjectContainer = this.parent;
display.stage.align = StageAlign.TOP_LEFT;
display.stage.scaleMode = StageScaleMode.NO_SCALE;

game.start( display);