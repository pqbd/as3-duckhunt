package test.alx.duckhunt
{
  import flash.display.Sprite;
  import alx.common.test.CUnitTest;
  import alx.duckhunt.CDisplay;

  public class CDisplayTest extends CUnitTest
  {
    public function CDisplayTest( strLabel:String):void
    {
      super( strLabel);
    }

    protected override function testList():Array
    {
      return new Array( this.testCreation
                      , this.testGetWidth
                      , this.testGetHeight
                      , this.testGetSize
                      );
    }
    protected function createSprite( nWidth:int, nHeight:int, nColor:int = 0xFFFFFF):Sprite
    {
      var sprite:Sprite = new Sprite();
      sprite.graphics.beginFill( nColor);
      sprite.graphics.drawRect( 0, 0, nWidth, nHeight);
      return sprite;
    }

    public function testCreation():void
    {
      const sprite:Sprite = this.createSprite( 640, 480);
      const display:CDisplay = new CDisplay( sprite);
      this.getTester().isEqual( 'display.getSrc()'
                              , display.getSrc()
                              , sprite
                              );
    }
    public function testGetWidth():void
    {
      const display:CDisplay = new CDisplay( this.createSprite( 640, 480));
      this.getTester().isEqual( 'display.getWidth()'
                              , display.getWidth()
                              , 640
                              );
    }
    public function testGetHeight():void
    {
      const display:CDisplay = new CDisplay( this.createSprite( 640, 480));
      this.getTester().isEqual( 'display.getHeight()'
                              , display.getHeight()
                              , 480
                              );
    }
    public function testGetSize():void
    {
      const display:CDisplay = new CDisplay( this.createSprite( 640, 480));
      this.getTester().isEqual( 'display.getSize().getX()'
                              , display.getSize().getX()
                              , 640
                              );
      this.getTester().isEqual( 'display.getSize().getY()'
                              , display.getSize().getY()
                              , 480
                              );
    }
  }
}