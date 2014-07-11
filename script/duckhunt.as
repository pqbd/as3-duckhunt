import flash.display.DisplayObjectContainer;
import alx.duckhunt.CVector2f;
import alx.duckhunt.CRandomTargetFactory;
import alx.duckhunt.CDuckTargetFactory;
import alx.duckhunt.CCloudTargetFactory;
import alx.duckhunt.CSniperRifle;
import alx.duckhunt.CRound;
import alx.duckhunt.CDuckHuntGame;
//import flash.events.*
//import flash.media.Sound;
//import flash.media.SoundChannel;

var game:CDuckHuntGame = new CDuckHuntGame();

if ( this.stage.loaderInfo.parameters.name != undefined)
  game.setPlayerName( this.stage.loaderInfo.parameters.name);

game.setDog( new _MCDog())
    .setHeadShotClass( _MCHeadShot)
    .setCloudFactory( new CCloudTargetFactory( _MCCloud))
    .setGameStart( new _MCGameStart())
    .setGameOver( new _MCGameOver())
    .setGameRound( new _MCGameRound())
    .setGameRoundOver( new _MCGameRoundOver())
    .setWeapon( new CSniperRifle( new _MCSniperRiffle(), new _MCSniperRiffleRound(), -1))
    ;
game.Init( new CRound( 100
                      , new CDuckTargetFactory( _MCDrake)
                      , 1
                      , 3
                      , new CVector2f( 0.5, 1)
                      )
          , new CRound( 500
                      , new CRandomTargetFactory( null
                                                , new CDuckTargetFactory( _MCDrake)
                                                , new CDuckTargetFactory( _MCDuck)
                                                            .setUseFear( true, 1)
                                                )
                      , 2
                      , 10
                      , new CVector2f( 1, 2)
                      )
          , new CRound( 1000
                      , new CRandomTargetFactory( null
                                                , new CDuckTargetFactory( _MCDrake)
                                                , new CDuckTargetFactory( _MCDuck)
                                                            .setUseFear( true, 1)
                                                )
                      , 5
                      , 10
                      , new CVector2f( 1, 4)
                      )
                    .setSetting( CDuckHuntGame.CLOUD_SIZE, new CVector2f( 1, 3))
                    .setSetting( CDuckHuntGame.CLOUD_RATE, 5)
                    .setSetting( CDuckHuntGame.CLOUD_SPEED, new CVector2f( 0.1, 1))
          , new CRound( 2000
                      , new CRandomTargetFactory( null
                                                , new CDuckTargetFactory( _MCDrake)
                                                , new CDuckTargetFactory( _MCDuckDuck)
                                                            .setXTurnLimit( new CVector2f( 3, 5))
                                                )
                      , 2
                      , 10
                      , new CVector2f( 3, 5)
                      )
          , new CRound( 3000
                      , new CRandomTargetFactory( null
                                                , new CDuckTargetFactory( _MCDrake)
                                                , new CDuckTargetFactory( _MCDuck)
                                                            .setUseFear( true, 1)
                                                            .setXTurnLimit( new CVector2f( 3, 5))
                                                )
                      , 2
                      , 10
                      , new CVector2f( 4, 6)
                      )
          , new CRound( 4000
                      , new CRandomTargetFactory( null
                                                , new CDuckTargetFactory( _MCDrake)
                                                            .setXTurnLimit( new CVector2f( 3, 5))
                                                , new CDuckTargetFactory( _MCDuck)
                                                            .setUseFear( true, 1)
                                                            .setXTurnLimit( new CVector2f( 3, 5))
                                                )
                      , 2
                      , 10
                      , new CVector2f( 4, 6)
                      )
                    .setSetting( CDuckHuntGame.CLOUD_SIZE, new CVector2f( 1, 3))
                    .setSetting( CDuckHuntGame.CLOUD_RATE, 5)
                    .setSetting( CDuckHuntGame.CLOUD_SPEED, new CVector2f( 0.1, 1))
          , new CRound( 5000
                      , new CRandomTargetFactory( null
                                                , new CDuckTargetFactory( _MCDrake)
                                                            .setXTurnLimit( new CVector2f( 5, 10))
                                                , new CDuckTargetFactory( _MCDuck)
                                                            .setUseFear( true, 1)
                                                            .setXTurnLimit( new CVector2f( 5, 10))
                                                , new CDuckTargetFactory( _MCDuckDuck)
                                                            .setXTurnLimit( new CVector2f( 3, 5))
                                                            .setUseFear( true, 1)
                                                )
                      , 3
                      , 10
                      , new CVector2f( 5, 8)
                      )
                    .setSetting( CDuckHuntGame.CLOUD_SIZE, new CVector2f( 3, 7))
                    .setSetting( CDuckHuntGame.CLOUD_RATE, 10)
                    .setSetting( CDuckHuntGame.CLOUD_SPEED, new CVector2f( 0.3, 2))
          , new CRound( 7000
                      , new CRandomTargetFactory( null
                                                , new CDuckTargetFactory( _MCDrake)
                                                            .setXTurnLimit( new CVector2f( 5, 10))
                                                , new CDuckTargetFactory( _MCDuck)
                                                            .setUseFear( true, 1)
                                                            .setXTurnLimit( new CVector2f( 5, 10))
                                                , new CDuckTargetFactory( _MCDuckDuck)
                                                            .setXTurnLimit( new CVector2f( 3, 5))
                                                            .setUseFear( true, 1)
                                                )
                      , 3
                      , 15
                      , new CVector2f( 5, 10)
                      )
                    .setSetting( CDuckHuntGame.CLOUD_SIZE, new CVector2f( 3, 7))
                    .setSetting( CDuckHuntGame.CLOUD_RATE, 5)
                    .setSetting( CDuckHuntGame.CLOUD_SPEED, new CVector2f( 0.1, 1))
          , new CRound( 7000
                      , new CRandomTargetFactory( null
                                                , new CDuckTargetFactory( _MCDrake)
                                                            .setXTurnLimit( new CVector2f( 5, 10))
                                                , new CDuckTargetFactory( _MCDuck)
                                                            .setUseFear( true, 1)
                                                            .setXTurnLimit( new CVector2f( 5, 10))
                                                , new CDuckTargetFactory( _MCDuckDuck)
                                                            .setXTurnLimit( new CVector2f( 3, 5))
                                                            .setUseFear( true, 1)
                                                )
                      , 3
                      , 18
                      , new CVector2f( 5, 10)
                      )
          , new CRound( 10000
                      , new CRandomTargetFactory( null
                                                , new CDuckTargetFactory( _MCDrake)
                                                            .setXTurnLimit( new CVector2f( 5, 10))
                                                , new CDuckTargetFactory( _MCDuck)
                                                            .setUseFear( true, 1)
                                                            .setXTurnLimit( new CVector2f( 5, 10))
                                                , new CDuckTargetFactory( _MCDuckDuck)
                                                            .setXTurnLimit( new CVector2f( 3, 5))
                                                            .setUseFear( true, 1)
                                                )
                      , 3
                      , 18
                      , new CVector2f( 5, 10)
                      )
                    .setSetting( CDuckHuntGame.CLOUD_SIZE, new CVector2f( 3, 7))
                    .setSetting( CDuckHuntGame.CLOUD_RATE, 10)
                    .setSetting( CDuckHuntGame.CLOUD_SPEED, new CVector2f( 0.3, 2))
          , new CRound( 3000
                      , new CRandomTargetFactory( null
                                                , new CDuckTargetFactory( _MCDrake)
                                                , new CDuckTargetFactory( _MCDuck)
                                                            .setUseFear( true, 1)
                                                , new CDuckTargetFactory( _MCDuckDuck)
                                                            .setUseFear( true, 1)
                                                )
                      , 10
                      , 20
                      , new CVector2f( 7, 10)
                      )
                    .setSetting( CDuckHuntGame.CLOUD_SIZE, new CVector2f( 3, 7))
                    .setSetting( CDuckHuntGame.CLOUD_RATE, 15)
                    .setSetting( CDuckHuntGame.CLOUD_SPEED, new CVector2f( 0.3, 2))
          , new CRound( 20000
                      , new CRandomTargetFactory( null
                                                , new CDuckTargetFactory( _MCDrake)
                                                            .setXTurnLimit( new CVector2f( 10, 20))
                                                , new CDuckTargetFactory( _MCDuck)
                                                            .setUseFear( true, 1)
                                                            .setXTurnLimit( new CVector2f( 10, 20))
                                                , new CDuckTargetFactory( _MCDuckDuck)
                                                            .setXTurnLimit( new CVector2f( 9, 18))
                                                            .setUseFear( true, 1)
                                                )
                      , 10
                      , 20
                      , new CVector2f( 7, 10)
                      )
                    .setSetting( CDuckHuntGame.CLOUD_SIZE, new CVector2f( 3, 7))
                    .setSetting( CDuckHuntGame.CLOUD_RATE, 7)
                    .setSetting( CDuckHuntGame.CLOUD_SPEED, new CVector2f( 0.3, 3))
          );

var display:DisplayObjectContainer = this.parent;
display.stage.align = StageAlign.TOP_LEFT;
display.stage.scaleMode = StageScaleMode.NO_SCALE;

game.start( display);

/*
var sound:Sound = new SDuckSong();
var soundChanel:SoundChannel = sound.play();
soundChanel.addEventListener( Event.SOUND_COMPLETE, MainSongCompleteHandler);

function MainSongCompleteHandler( event:Event):void
{
  var sound:Sound = new SDuckSongMinus();
  var soundChanel:SoundChannel = sound.play();
  soundChanel.addEventListener( Event.SOUND_COMPLETE, MainSongCompleteHandler);
}
*/