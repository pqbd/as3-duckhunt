package alx.common.util
{
  /**
   * List interface {@see http://grepcode.com/file/repository.grepcode.com/java/root/jdk/openjdk/6-b14/java/util/List.java#List}.
   * @author Alexander Volkov
   * @version 1.0
   */
  public interface IList
  extends ICollection
  {
    //+function add( element:Object):Boolean;
    //+function addAll( collection:ICollection):Boolean;
    //+function clear():void;
    //+function contains( element:Object):Boolean;
    //+function containsAll( collection:ICollection):Boolean;
    //+function isEmpty():Boolean;
    //+function iterator():IIterator;
    //+function removeAll( collection:ICollection):Boolean;
    //+function retainAll( collection:ICollection):Boolean;
    //+function remove( element:Object):Boolean;
    //+function size():int;
    //+function toArray( arr:Array = null):Array;
    //+function valueOf():Object;

    /**
     * Insert element to specified position.
     * @param nIndex int
     * @param element Object
     */
    function addTo( nIndex:int, element:Object):void;    
    /**
     * Insert elements to specified position.
     * @param nStartIndex int
     * @param colletion {@link ICollection}
     * @return Boolean
     */
    function addToAll( nStartIndex:int, colletion:ICollection):Boolean;    
    /**
     * Gets element from specified position.
     * @param nIndex int
     * @return Object
     */
    function get( nIndex:int):Object;    
    /**
     * Gets index of element in the list.
     * @param element Object
     * @return int
     */
    function indexOf( element:Object):int;
    /**
     * Gets last index of element in the list.
     * @param element Object
     * @return int
     */
    function lastIndexOf( element:Object):int;
    /**
     * Gets list iterator.
     * @param element Object
     * @return int
     */
    function listIterator( nStartIndex:int = 0):IListIterator;
    /**
     * Deletes element in specified position.
     * @param nIndex int
     * @return Object
     */
    function removeAt( nIndex:int):Object;
    /**
     * Sets element in specified position.
     * @param nIndex int
     * @param element Object
     * @return Object
     */
    function set( nIndex:int, element:Object):Object;
    /**
     * Gets a sublist.
     * @param nStartIndex int
     * @param nEndIndex int
     * @return {@link IList}
     */
    function subList( nStartIndex:int, nEndIndex:int):IList;
  }
}