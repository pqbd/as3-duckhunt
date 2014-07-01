package alx.common.util
{
  /**
   * Abstract List {@see http://grepcode.com/file/repository.grepcode.com/java/root/jdk/openjdk/6-b14/java/util/AbstractList.java#AbstractList}.
   * @author Alexander Volkov
   * @version 1.0
   */
  public class CAbstractList
  extends CAbstractCollection
  implements IList
  {
    public function CAbstractList():void
    {
    }

    protected function rangeCheck( nIndex:int, bStrict:Boolean = false):void
    {     
      if ( nIndex < 0 || nIndex > this.size() || ( bStrict && nIndex == this.size()))
        throw Error( '(index out of bounds');
    }
    protected function removeRange( nFromIndex:int, nToIndex:int):void
    {
      var iterator:IListIterator = this.listIterator();
      var nCount:int = nToIndex - nFromIndex;
      for ( var i:int = 0; i < nCount; i++)
      {
        iterator.next();
        iterator.remove();
      }
    }

    public override function add( element:Object):Boolean
    {
      this.addTo( this.size(), element);
      return true;
    }
    public function addTo( nIndex:int, element:Object):void
    {
      throw Error( 'addTo must be implemented');
    }
    public function addToAll( nStartIndex:int, colletion:ICollection):Boolean
    {
      this.rangeCheck( nStartIndex);
      var bModified:Boolean = false;
      var iterator:IIterator = colletion.iterator();
      while ( iterator.hasNext())
      {
        this.addTo( nStartIndex++, iterator.next());
        bModified = true;
      }
      return bModified;
    }
    public function get( nIndex:int):Object
    {
      throw Error( 'get must be implemented');
    }
    public function indexOf( element:Object):int
    {
      var bNext:Boolean = true;
      var nIndex:int = -1;
      var iterator:IListIterator = this.listIterator();
      if ( element == null)
      {
        while ( iterator.hasNext() && bNext)
        {
          if ( iterator.next() == null)
          {
            nIndex = iterator.previousIndex();
            bNext = false;
          }
        }
      }
      else
      {
        while ( iterator.hasNext() && bNext)
        {
          if ( element.valueOf() == iterator.next().valueOf())
          {
            nIndex = iterator.previousIndex();
            bNext = false;
          }
        }
      }
      return nIndex;
    }
    public function lastIndexOf( element:Object):int
    {
      var bNext:Boolean = true;
      var nIndex:int = -1;
      var iterator:IListIterator = this.listIterator( this.size());
      if ( element == null)
      {
        while ( iterator.hasPrevious() && bNext)
        {
          if ( iterator.previous() == null)
          {
            nIndex = iterator.nextIndex();
            bNext = false;
          }
        }
      }
      else
      {
        while ( iterator.hasPrevious() && bNext)
        {
          if ( element.valueOf() == iterator.previous().valueOf())
          {
            nIndex = iterator.nextIndex();
            bNext = false;
          }
        }
      }
      return nIndex;
    }
    public override function iterator():IIterator
    {
      return this.listIterator();
    }
    public function listIterator( nStartIndex:int = 0):IListIterator
    {
      return new CListIterator( this, nStartIndex);
    }
    public function removeAt( nIndex:int):Object
    {
      throw Error( 'unsupported operation');
    }
    public function set( nIndex:int, element:Object):Object
    {
      throw Error( 'unsupported operation');
    }
    public function subList( nStartIndex:int, nEndIndex:int):IList
    {
      throw Error( 'unsupported operation');
    }
  }
}

import alx.common.util.IList;
import alx.common.util.IListIterator;

class CListIterator implements IListIterator
{
  private var m_list:IList;
  private var m_nSavedCursor:int;
  private var m_nCursor:int;

  public function CListIterator( list:IList, nStartIndex:int):void
  {
    this.m_list = list;
    this.m_nCursor = nStartIndex;
    this.m_nSavedCursor = -1;
  }
  public function hasNext():Boolean
  {
    return ( this.m_nCursor != this.m_list.size());
  }
  public function next():Object
  {
    var next:Object = this.m_list.get( this.m_nCursor);
    this.m_nSavedCursor = this.m_nCursor;
    this.m_nCursor++;
    return next;
  }
  public function remove():void
  {
    if ( this.m_nSavedCursor < 0)
      throw Error( 'incorrect state');
    this.m_list.removeAt( this.m_nSavedCursor);
    if ( this.m_nSavedCursor < this.m_nCursor)
      this.m_nCursor--;
    this.m_nSavedCursor = -1;
  }
  public function hasPrevious():Boolean
  {
    return ( this.m_nCursor != 0);
  }
  public function previous():Object
  {
    var previous:Object = this.m_list.get(( this.m_nCursor - 1));
    this.m_nSavedCursor = this.m_nCursor;
    this.m_nCursor--;
    return previous;
  }
  public function nextIndex():int
  {
    return this.m_nCursor;
  }
  public function previousIndex():int
  {
    return ( this.m_nCursor - 1);
  }
  public function set( element:Object):void
  {
    if ( this.m_nSavedCursor < 0)
      throw Error( 'incorrect state');
    this.m_list.set( this.m_nSavedCursor, element);
  }
  public function add( element:Object):void
  {
    this.m_list.addTo( this.m_nCursor, element);
    this.m_nSavedCursor = -1;
    this.m_nCursor++;
  }
}