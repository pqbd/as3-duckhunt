package alx.common.util
{
  /**
   * Hash Set {@see http://grepcode.com/file/repository.grepcode.com/java/root/jdk/openjdk/6-b14/java/util/HashSet.java#HashSet}.
   * @author Alexander Volkov
   * @version 1.0
   */
  public class CHashSet
  extends CAbstractSet
  {
    private static const DUMMY = true;

    private var m_map:CHashMap;
    public function CHashSet():void
    {
      super();
      this.m_map = new CHashMap();
    }

    public override function add( element:Object):Boolean
    {
      return ( this.m_map.put( element, CHashSet.DUMMY) == null);
    }
    public override function iterator():IIterator
    {
      return this.m_map.keySet().iterator();
    }
    public override function size():int
    {
      return this.m_map.size();
    }
  }
}