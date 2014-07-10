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
game.Init( new CRound( new CRandomTargetFactory( null
                                               , new CDuckTargetFactory( _MCDuck)
                                               , new CDuckTargetFactory( _MCDrake)
                                               , new CDuckTargetFactory( _MCDuckDuck)
                                                      .setXTurnLimit( new CVector2f( 5, 10))
                                                      .setUseFear( true, 1)
                                               //, new CDuckTargetFactory( _MCDrake, _MCDuck)
                                               )
                      , 2
                      , 10
                      )
          , new CRound( new CRandomTargetFactory( null
                                               , new CDuckTargetFactory( _MCDuck)
                                               , new CDuckTargetFactory( _MCDrake)
                                               , new CDuckTargetFactory( _MCDuckDuck)
                                               //, new CDuckTargetFactory( _MCDrake, _MCDuck)
                                               )
                      , 4
                      , 10
                      )
                    .setSetting( CDuckHuntGame.CLOUD_SIZE, new CVector2f( 3, 7))
                    .setSetting( CDuckHuntGame.CLOUD_RATE, 10)
                    .setSetting( CDuckHuntGame.CLOUD_SPEED, new CVector2f( 0.1, 2))
          , new CRound( new CRandomTargetFactory( null
                                               , new CDuckTargetFactory( _MCDuck)
                                               , new CDuckTargetFactory( _MCDrake)
                                               , new CDuckTargetFactory( _MCDuckDuck)
                                               //, new CDuckTargetFactory( _MCDrake, _MCDuck)
                                               )
                      , 8
                      , 15
                      )
                    .setSetting( CDuckHuntGame.CLOUD_SIZE, new CVector2f( 3, 7))
                    .setSetting( CDuckHuntGame.CLOUD_RATE, 15)
                    .setSetting( CDuckHuntGame.CLOUD_SPEED, new CVector2f( 0.1, 3))
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