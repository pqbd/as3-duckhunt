package alx.common.util
{
  import flash.utils.Timer;
  import flash.net.URLRequest;
  //import flash.system.ApplicationDomain;
  //import flash.system.LoaderContext;
  import flash.display.Loader;
  import flash.display.MovieClip;
  import flash.display.DisplayObjectContainer;
  import flash.events.Event;
  import flash.events.IOErrorEvent;
  import flash.events.TimerEvent;

  public class CEntryRotator
  {
    private var m_timer:Timer;
    private var m_entry:MovieClip;
    private var m_display:DisplayObjectContainer;
    private var m_displayer:MovieClip;
    private var m_xmlEntryList:XMLList;
    private var m_nIndex:int;

    public function CEntryRotator():void
    {
    }

    public function rotate( display:DisplayObjectContainer, xmlEntryList:XMLList):void
    {
      this.m_display = display;
      this.m_xmlEntryList = xmlEntryList;
      this.m_nIndex = 0;
      this.loadNext();
    }

    protected function loadNext():void
    {
      if ( this.m_nIndex < this.m_xmlEntryList.length())
        this.loadEntry( this.m_xmlEntryList[ this.m_nIndex]);
    }
    protected function loadEntry( xmlEntry:XML):void
    {
      var loader:Loader = new Loader();
      loader.contentLoaderInfo.addEventListener( Event.COMPLETE, onLoadCompleteHandler);
      loader.contentLoaderInfo.addEventListener( IOErrorEvent.IO_ERROR, onLoadErrorHandler);
      loader.load( new URLRequest( xmlEntry.url));
    }
    protected function onLoadErrorHandler( event:Event):void
    {
      event.target.removeEventListener( Event.COMPLETE, onLoadCompleteHandler);
      event.target.removeEventListener( IOErrorEvent.IO_ERROR, onLoadErrorHandler);
      this.m_nIndex++;
      this.loadNext();
    }
    protected function onLoadCompleteHandler( event:Event):void
    {
      event.target.removeEventListener( Event.COMPLETE, onLoadCompleteHandler);
      event.target.removeEventListener( IOErrorEvent.IO_ERROR, onLoadErrorHandler);

      this.m_entry = event.target.content as MovieClip;
      var xmlEntry:XML = this.m_xmlEntryList[ this.m_nIndex];

      if ( xmlEntry.scale > 0)
      {
        var nDWidth = xmlEntry.width - this.m_display.stage.stageWidth;
        var nDHeight = xmlEntry.height - this.m_display.stage.stageHeight;
        if ( nDWidth > nDHeight)
        {
          this.m_entry.scaleX = this.m_display.stage.stageWidth / xmlEntry.width;
          this.m_entry.scaleY = this.m_entry.scaleX;
        }
        else
        {
          this.m_entry.scaleY = this.m_display.stage.stageHeight / xmlEntry.height;
          this.m_entry.scaleX = this.m_entry.scaleY;
        }
      }
      this.m_displayer = new MovieClip();
      this.m_displayer.addChild( this.m_entry);
      this.m_display.addChild( this.m_displayer);
      
      var nDuration:int = parseInt( xmlEntry.duration);
      if ( nDuration > 0)
      {
        this.m_timer = new Timer( nDuration, 1);
        this.m_timer.addEventListener( TimerEvent.TIMER, onEntryCompleteHandler);
        this.m_timer.start();
      }

      if ( xmlEntry.play > 0)
        this.m_entry.gotoAndPlay( xmlEntry.play);
    }
    protected function onEntryCompleteHandler( event:TimerEvent):void
    {
      this.m_timer.removeEventListener( TimerEvent.TIMER, onEntryCompleteHandler);
      this.m_display.removeChild( this.m_displayer);
      this.m_entry.loaderInfo.loader.unloadAndStop();
      this.m_nIndex++;
      this.loadNext();
    }
  }
}