import alx.duckhunt.CRandomTargetFactory
import alx.duckhunt.CDuckTargetFactory
import alx.duckhunt.CSniperRifle
import alx.duckhunt.CGame
//import flash.events.*
//import flash.media.Sound;
//import flash.media.SoundChannel;

var game = new CGame();

game.setTargetFactory( new CRandomTargetFactory( null
                                              , new CDuckTargetFactory( _MCDrake, _MCDuck)
                                              , new CDuckTargetFactory( _MCDuckDuck)
                                              )
                     )
    .setWeapon( new CSniperRifle( new _MCSniperRiffle(), new _MCSniperRiffleRound(), -1))
    ;

if ( this.parent)
  game.start( this.parent);
else
  game.start( root);

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