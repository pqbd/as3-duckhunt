package alx.duckhunt
{
  import flash.display.DisplayObjectContainer;
  import flash.display.StageAlign;
  import flash.display.StageScaleMode;
  import flash.utils.Timer;
  import flash.ui.Mouse;
  import flash.ui.Keyboard;
  import flash.events.Event;
  import flash.events.TimerEvent;
  import flash.events.MouseEvent;
  import flash.events.KeyboardEvent;

  import alx.common.util.CRandom;

  public class CDuckHuntGame extends CGame
  {
    public function CDuckHuntGame():void
    {
      tsuper();
    }

    public function setCursor():CGame
    {
    }
    protected function onTargetMiss():void
    {
    }
    protected function onTargetHit():void
    {
    }
    protected function onTargetDispose():void
    {
    }
  }
}