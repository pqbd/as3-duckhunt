package alx.duckhunt
{
  import flash.display.DisplayObject;
  import flash.display.DisplayObjectContainer;

  public class CDisplay
  {
    private var m_display:DisplayObjectContainer;

    public function CDisplay( display:DisplayObjectContainer):void
    {
      this.m_display = display;
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

    protected function onResize()
    {
    }
  }
}