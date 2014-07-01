package alx.common.util
{
  /**
   * Abstract List {@see http://grepcode.com/file/repository.grepcode.com/java/root/jdk/openjdk/6-b14/java/util/ArrayList.java#ArrayList}.
   * @author Alexander Volkov
   * @version 1.0
   */
  public class CArrayList
  extends CAbstractList
  {
    private var m_arData:Array;

    public function CArrayList():void
    {
      super();
      this.m_arData = new Array();
    }
    public override function size():int
    {
      return this.m_arData.length;
    }
    public override function get( nIndex:int):Object
    {
      this.rangeCheck( nIndex, true);
      return this.m_arData[ nIndex];
    }
    public override function addTo( nIndex:int, element:Object):void
    {
      this.rangeCheck( nIndex);
      var arLeft:Array;
      if ( nIndex == 0)
        arLeft = new Array();
      else
        arLeft = this.m_arData.slice( 0, nIndex);
      arLeft.push( element);
      this.m_arData = arLeft.concat( this.m_arData.slice( nIndex));
    }
    public override function removeAt( nIndex:int):Object
    {
      this.rangeCheck( nIndex);
      var oldElement:Object = this.m_arData[ nIndex];
      this.m_arData = this.m_arData.slice( 0, nIndex).concat( this.m_arData.slice(( nIndex + 1)));
      return oldElement;
    }
    public override function set( nIndex:int, element:Object):Object
    {
      this.rangeCheck( nIndex);
      var oldElement:Object = this.m_arData[ nIndex];
      this.m_arData[ nIndex] = element;
      return oldElement;
    }
  }
}