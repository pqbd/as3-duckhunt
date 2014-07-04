package alx.common.util
{
  /**
   * Hash Map {@see http://grepcode.com/file/repository.grepcode.com/java/root/jdk/openjdk/6-b14/java/util/HashMap.java#HashMap}.
   * @author Alexander Volkov
   * @version 1.0
   */
  public class CHashMap
  extends CAbstractMap
  {
    private var m_keyList:IList;
    private var m_entryList:IList;

    public function CHashMap():void
    {
      super();
      this.m_keyList = new CArrayList();
      this.m_entryList = new CArrayList();
    }

    public override function put( key:Object, value:Object):Object
    {
      var oldValue:Object = null;
      var nIndex:int = this.m_keyList.indexOf( key);
      if ( nIndex < 0)
      {
        nIndex = this.m_keyList.size();
        this.m_keyList.set( nIndex, key);
      }
      else
        oldValue = this.m_entryList.get( nIndex).getValue();

      this.m_entryList.set( nIndex, this.createSimpleImmutableEntry( key, value));
      return oldValue;
    }
    public override function get( key:Object):Object
    {
      var valueToReturn:Object = null;
      var nIndex:int = this.m_keyList.indexOf( key);
      if ( nIndex > -1)
        valueToReturn = this.m_entryList.get( nIndex).getValue();
      return valueToReturn;
    }
    public override function entrySet():ISet
    {
      return new CEntrySet( this.m_keyList, this.m_entryList);
    }
  }
}

import alx.common.util.CAbstractSet;
import alx.common.util.IList;
import alx.common.util.IMapEntry;
import alx.common.util.IIterator;

class CEntrySet
extends CAbstractSet
{
  private var m_keyList:IList;
  private var m_entryList:IList;

  public function CEntrySet( keyList:IList, entryList:IList):void
  {
    super();
    this.m_keyList = keyList;
    this.m_entryList = entryList;
  }

  public override function add( element:Object):Boolean
  {
    throw Error( 'not supported operation');
  }
  public override function iterator():IIterator
  {
    return new CEntrySetIterator( this.m_keyList, this.m_entryList);
  }
  public override function size():int
  {
    return this.m_keyList.size();
  }
}
class CEntrySetIterator
implements IIterator
{
  private var m_keyList:IList;
  private var m_entryList:IList;
  private var m_iterator:IIterator;
  private var m_lastIndex:int;

  public function CEntrySetIterator( keyList:IList, entryList:IList):void
  {
    super();
    this.m_keyList = keyList;
    this.m_entryList = entryList;
    this.m_iterator = keyList.iterator();
    this.m_lastIndex = -1;
  }
  public function hasNext():Boolean
  {
    return this.m_iterator.hasNext();
  }
  public function next():Object
  {
    var next:Object = this.m_iterator.next();
    this.m_lastIndex = this.m_keyList.indexOf( next);
    return this.m_entryList.get( this.m_lastIndex);
  }
  public function remove():void
  {
    if ( this.m_lastIndex < 0)
      throw Error( 'incorrect state');
    this.m_iterator.remove();
    this.m_entryList.removeAt( this.m_lastIndex);
  }
}