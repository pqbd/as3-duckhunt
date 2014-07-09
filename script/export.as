import flash.display.DisplayObjectContainer;
import alx.duckhunt.CVector2f
import alx.duckhunt.CRandomTargetFactory
import alx.duckhunt.CDuckTargetFactory
import alx.duckhunt.CSniperRifle
import alx.duckhunt.CRound
import alx.duckhunt.CGame
//import flash.events.*
//import flash.media.Sound;
//import flash.media.SoundChannel;

var game:CGame = new CGame();
game.setWeapon( new CSniperRifle( new _MCSniperRiffle(), new _MCSniperRiffleRound(), -1));
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
          , new CRound( new CRandomTargetFactory( null
                                               , new CDuckTargetFactory( _MCDuck)
                                               , new CDuckTargetFactory( _MCDrake)
                                               , new CDuckTargetFactory( _MCDuckDuck)
                                               //, new CDuckTargetFactory( _MCDrake, _MCDuck)
                                               )
                      , 8
                      , 15
                      )
          );

var display:DisplayObjectContainer = this.parent;
display.stage.align = StageAlign.TOP_LEFT;
display.stage.scaleMode = StageScaleMode.NO_SCALE;

game.start( display);

/*
game.SetDuck1( _MCDuck1)
    .SetDuck2( _MCDuck2)
    .SetDog( _MCDog)
    .SetTarget( _MCTarget)
    .SetHeadshot( _MCHeadshot)
    .SetPatron( _MCPatron)
    .SetScores( _MCScores)
    ;

game.SetPlayerName( 'Player');

if ( this.parent)
  game.Run( this.parent);
else
  game.Run( root);

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