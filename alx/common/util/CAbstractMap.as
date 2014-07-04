package alx.common.util
{
  /**
   * Abstract Map {@see http://grepcode.com/file/repository.grepcode.com/java/root/jdk/openjdk/6-b14/java/util/AbstractList.java#AbstractList}.
   * @author Alexander Volkov
   * @version 1.0
   */
  public class CAbstractMap
  implements IMap
  {
    /** Cache for keySet()*/
    private var m_keySet:CKeySet;
    /** Cache for values()*/
    private var m_values:CValuesCollection;

    public function CAbstractMap():void
    {
    }

    public function size():int
    {
      return this.entrySet().size();
    }
    public function isEmpty():Boolean
    {
      return ( this.size() == 0);
    }
    public function containsKey( key:Object):Boolean
    {
      var bNext = true;
      var iterator:IIterator = this.keySet().iterator();
      if ( key == null)
      {
        while ( iterator.hasNext() && bNext)
        {
          if ( iterator.next() == null)
            bNext = false;
        }
      }
      else
      {
        while ( iterator.hasNext() && bNext)
        {
          if ( key.valueOf() == iterator.next().valueOf())
            bNext = false;
        }
      }
      return !bNext;
    }
    public function containsValue( value:Object):Boolean
    {
      var bNext = true;
      var iterator:IIterator = this.entrySet().iterator();
      var entry:IMapEntry;
      if ( value == null)
      {
        while ( iterator.hasNext() && bNext)
        {
          entry = iterator.next() as IMapEntry;
          if ( entry.getValue() == null)
            bNext = false;
        }
      }
      else
      {
        while ( iterator.hasNext() && bNext)
        {
          entry = iterator.next() as IMapEntry;
          if ( value.valueOf() == entry.getValue().valueOf())
            bNext = false;
        }
      }
      return !bNext;
    }
    public function get( key:Object):Object
    {
      var bNext = true;
      var iterator:IIterator = this.entrySet().iterator();
      var valueToReturn:Object = null;
      var entry:IMapEntry;
      if ( key == null)
      {
        while ( iterator.hasNext() && bNext)
        {
          entry = iterator.next() as IMapEntry;
          if ( entry.getKey() == null)
          {
            bNext = false;
            valueToReturn = entry.getValue();
          }
        }
      }
      else
      {
        while ( iterator.hasNext() && bNext)
        {
          entry = iterator.next() as IMapEntry;
          if ( key.valueOf() == entry.getKey().valueOf())
          {
            bNext = false;
            valueToReturn = entry.getValue();
          }
        }
      }
      return valueToReturn;
    }
    public function put( key:Object, value:Object):Object
    {
      throw Error( 'put must be implemented');
    }
    public function remove( key:Object):Object
    {
      var bNext = true;
      var iterator:IIterator = this.entrySet().iterator();
      var entryToRemove:IMapEntry = null;
      var entry:IMapEntry;
      if ( key == null)
      {
        while ( iterator.hasNext() && bNext)
        {
          entry = iterator.next() as IMapEntry;
          if ( entry.getKey() == null)
          {
            bNext = false;
            entryToRemove = entry;
          }
        }
      }
      else
      {
        while ( iterator.hasNext() && bNext)
        {
          entry = iterator.next() as IMapEntry;
          if ( key.valueOf() == entry.getKey().valueOf())
          {
            bNext = false;
            entryToRemove = entry;
          }
        }
      }      
      var oldValue:Object = null;
      if ( entryToRemove != null)
      {
        oldValue = entryToRemove.getValue();
        iterator.remove();
      }
      return oldValue;
    }
    public function putAll( map:IMap):void
    {
      var iterator:IIterator = map.entrySet().iterator();
      while ( iterator.hasNext())
      {
        var entry:IMapEntry = iterator.next() as IMapEntry;
        this.put( entry.getKey(), entry.getValue());
      }
    }
    public function clear():void
    {
      this.entrySet().clear();
    }
    public function keySet():ISet
    {
      if ( this.m_keySet == null)
        this.m_keySet = new CKeySet( this);
      return this.m_keySet;
    }    
    public function values():ICollection
    {
      if ( this.m_values == null)
        this.m_values = new CValuesCollection( this);
      return this.m_values;
    }
    public function entrySet():ISet
    {
      throw Error( 'entrySet must be implemented');
    }

    public function toString():String
    {
      var strResult:String = '{';
      if ( !this.isEmpty())
      {
        var iterator:IIterator = this.entrySet().iterator();
        while ( iterator.hasNext())
        {
          strResult += iterator.next();
          if ( iterator.hasNext())
            strResult += ', ';
        }
      }
      strResult += '}';
      return strResult;
    }

    protected function createSimpleEntry( key:Object, value:Object):IMapEntry
    {
      return new CSimpleMapEntry( key, value);
    }
    protected function createSimpleImmutableEntry( key:Object, value:Object):IMapEntry
    {
      return new CSimpleImmutableMapEntry( key, value);
    }
  }
}

import alx.common.util.CAbstractCollection;
import alx.common.util.IMap;
import alx.common.util.IMapEntry;
import alx.common.util.IIterator;
import alx.common.util.CAbstractSet;

class CValuesCollection 
extends CAbstractCollection
{
  private var m_map:IMap;

  public function CValuesCollection( map:IMap):void
  {
    super();
    this.m_map = map;
  }

  public override function add( element:Object):Boolean
  {
    throw Error( 'not supported operation');
  }
  public override function iterator():IIterator
  {
    return new CValuesCollectionIterator( this.m_map.entrySet().iterator());
  }
  public override function size():int
  {
    return this.m_map.size();
  }
}
class CValuesCollectionIterator
implements IIterator
{
  private var m_iterator:IIterator;

  public function CValuesCollectionIterator( iterator:IIterator):void
  {
    this.m_iterator = iterator;
  }
  protected function getIterator():IIterator
  {
    return this.m_iterator;
  }
  public function hasNext():Boolean
  {
    return this.m_iterator.hasNext();
  }
  public function next():Object
  {
    return this.m_iterator.next().getValue();
  }
  public function remove():void
  {
    this.m_iterator.remove();
  }
}

// class CKeySet extends CValuesCollection implements ISet{}
// But we want CKeySet to be also CAbstractSet. It is a good duplication here.
class CKeySet
extends CAbstractSet
{
  private var m_map:IMap;

  public function CKeySet( map:IMap):void
  {
    super();
    this.m_map = map;
  }

  public override function add( element:Object):Boolean
  {
    throw Error( 'not supported operation');
  }
  public override function iterator():IIterator
  {
    return new CKeySetIterator( this.m_map.entrySet().iterator());
  }
  public override function size():int
  {
    return this.m_map.size();
  }
}
class CKeySetIterator
extends CValuesCollectionIterator
{
  public function CKeySetIterator( iterator:IIterator):void
  {
    super( iterator);
  }
  public override function next():Object
  {
    return this.getIterator().next().getKey();
  }
}

class CSimpleImmutableMapEntry
implements IMapEntry
{
  private var m_key:Object;
  private var m_value:Object;

  public function CSimpleImmutableMapEntry( key:Object, value:Object):void
  {
    this.set( key, value);
  }
  public function getKey():Object
  {
    return this.m_key;
  }
  public function getValue():Object
  {
    return this.m_value;
  }
  public function setValue( value:Object):Object
  {
    throw Error( 'not supported operation');
  }
  protected function set( key:Object, value:Object):void
  {
    this.m_key = key;
    this.m_value = value;
  }
  public function toString():String
  {
    return this.m_key+'='+this.m_value;
  }
}
class CSimpleMapEntry
extends CSimpleImmutableMapEntry
{
  public function CSimpleMapEntry( key:Object, value:Object):void
  {
    super( key, value);
  }
  public override function setValue( value:Object):Object
  {
    var oldValue:Object = this.getValue();
    this.set( this.getKey(), value);
    return oldValue;
  }
}