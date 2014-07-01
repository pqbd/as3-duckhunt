package alx.duckhunt
{
  import flash.display.DisplayObject;
  import flash.display.DisplayObjectContainer;
  import flash.events.Event;
  import alx.common.util.IList;
  import alx.common.util.IIterator;
  import alx.common.util.CArrayList;

  public class CDisplay
  {
    private var m_display:DisplayObjectContainer;
    private var m_listDisplayListener:IList;

    public function CDisplay( display:DisplayObjectContainer):void
    {
      this.m_display = display;
      this.m_listDisplayListener = new CArrayList();

      var tmp:DisplayObjectContainer = this.m_display;
      if ( this.m_display.stage != null)
        tmp = this.m_display.stage;

      tmp.addEventListener( Event.RESIZE, this.onResizeHandler);
    }

    public function getSrc():DisplayObjectContainer
    {
      return this.m_display;
    }

    public function getWidth():uint
    {
      if ( this.m_display.stage != null)
        return this.m_display.stage.stageWidth;
      else
        return this.m_display.width;
    }
    public function getHeight():uint
    {
      if ( this.m_display.stage != null)
        return this.m_display.stage.stageHeight;
      else
        return this.m_display.height;
    }
    public function getSize():CVector2f
    {
      return new CVector2f( this.getWidth(), this.getHeight());
    }
    public function add( displayObject:DisplayObject):CDisplay
    {
      this.m_display.addChild( displayObject);
      return this;
    }

    public function addDisplayListener( listener:IDisplayListener):CDisplay
    {
      this.m_listDisplayListener.add( listener);
      return this;
    }
    public function removeDisplayListener( listener:IDisplayListener):CDisplay
    {
      this.m_listDisplayListener.remove( listener);
      return this;
    }

    protected function onResizeHandler( event:Event):void
    {
      var iterator:IIterator = this.m_listDisplayListener.iterator();
      while ( iterator.hasNext())
      {
        var listener:IDisplayListener = iterator.next() as IDisplayListener;
        listener.onDisplayResize( this, event);
      }
    }
  }
}