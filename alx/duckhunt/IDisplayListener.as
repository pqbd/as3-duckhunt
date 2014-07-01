package alx.duckhunt
{
  import flash.events.Event;

  public interface IDisplayListener
  {
    function onDisplayResize( display:CDisplay, event:Event):void;
  }
}