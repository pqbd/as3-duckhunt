package alx.common.util
{
  /**
   * Abstract Collection {@see http://grepcode.com/file/repository.grepcode.com/java/root/jdk/openjdk/6-b14/java/util/AbstractCollection.java#AbstractCollection}.
   * @author Alexander Volkov
   * @version 1.0
   */
  public class CAbstractCollection
  implements ICollection
  {
    public function CAbstractCollection():void
    {
    }

    public function add( element:Object):Boolean
    {
      throw Error( 'add must be implemented');
    }
    public function addAll( collection:ICollection):Boolean
    {
      var bModified:Boolean = false;
      var iterator:IIterator = collection.iterator();
      while ( iterator.hasNext())
      {
        if ( this.add( iterator.next()))
          bModified = true;
      }
      return bModified;
    }
    public function clear():void
    {
      var iterator:IIterator = this.iterator();
      while ( iterator.hasNext())
      {
        iterator.next();
        iterator.remove();
      }
    }
    public function contains( element:Object):Boolean
    {
      var bNext = true;
      var iterator:IIterator = this.iterator();
      if ( element == null)
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
          if ( element.valueOf() == iterator.next().valueOf())
            bNext = false;
        }
      }
      return !bNext;
    }
    public function containsAll( collection:ICollection):Boolean
    {
      var iterator:IIterator = collection.iterator();
      while ( iterator.hasNext())
      {
        if ( !this.contains( iterator.next()))
          return false;
      }
      return true;
    }
    public function isEmpty():Boolean
    {
      return ( this.size() == 0);
    }
    public function iterator():IIterator
    {
      throw Error( 'iterator must be implemented');
    }
    public function remove( element:Object):Boolean
    {
      var bNext = true;
      var iterator:IIterator = this.iterator();
      if ( element == null)
      {
        while ( iterator.hasNext() && bNext)
        {
          if ( iterator.next() == null)
          {
            iterator.remove();
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
            iterator.remove();
            bNext = false;
          }
        }
      }
      return !bNext;
    }
    public function removeAll( collection:ICollection):Boolean
    {
      var bModified:Boolean = false;
      var iterator:IIterator = this.iterator();
      while ( iterator.hasNext())
      {
        if ( collection.contains( iterator.next()))
        {
          iterator.remove();
          bModified = true;
        }
      }
      return bModified;
    }
    public function retainAll( collection:ICollection):Boolean
    {
      var bModified:Boolean = false;
      var iterator:IIterator = this.iterator();
      while ( iterator.hasNext())
      {
        if ( !collection.contains( iterator.next()))
        {
          iterator.remove();
          bModified = true;
        }
      }
      return bModified;
    }
    public function size():int
    {
      throw Error( 'size must be implemented');
    }
    public function toArray( arr:Array = null):Array
    {
      var iterator:IIterator = this.iterator();
      if ( arr == null)
       arr = new Array();
      while ( iterator.hasNext())
        arr.push( iterator.next());
      return arr;
    }
    public function toString():String
    {
      var strResult:String = '';
      var iterator:IIterator = this.iterator();
      strResult += '{';
      while ( iterator.hasNext())
      {
        var item:Object = iterator.next();
        if ( item === this)
          strResult += '(this)';
        else
          strResult += item;
        if ( iterator.hasNext())
          strResult += ', ';
      }
      strResult += '}';
      return strResult;
    }

    public function valueOf():Object
    {
      return this;
    }
  }
}