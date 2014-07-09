package alx.duckhunt
{
  import flash.utils.Timer;
  import flash.events.Event;
  import flash.events.TimerEvent;

  import alx.common.util.CRandom;

  public class CDuckHuntGame extends CGame
  {
    public function CDuckHuntGame( ...arRound):void
    {
      super( arRound);
    }

    public function setDog():CDuckHuntGame
    {
      return this;
    }
    public function setHeadShot():CDuckHuntGame
    {
      return this;
    }
    public function setCloudFactory():CDuckHuntGame
    {
      return this;
    }
    public function setGameStart():CDuckHuntGame
    {
      return this;
    }
    public function setGameOver():CDuckHuntGame
    {
      return this;
    }
    public function setGameRound():CDuckHuntGame
    {
      return this;
    }

    protected override function onTargetMiss():void
    {
      super.onTargetMiss();
    }
    protected override function onTargetHit( target:CTarget):void
    {
      super.onTargetHit( target);
    }
    protected override function onTargetDispose():void
    {
      super.onTargetDispose();
    }
    protected override function roundResults( round:CRound, arRound:Array):void
    {
      super.roundResults( round, arRound);
    }
    protected override function gameResults( round:CRound, arRound:Array):void
    {
      super.gameResults( round, arRound);
    }
    protected override function onRoundFinish():void
    {
      super.onRoundFinish();
    }
    protected override function onRoundStart():void
    {
      super.onRoundStart();
    }
  }
}