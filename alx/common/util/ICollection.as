package alx.common.util
{
  /**
   * Collection interface {@see http://grepcode.com/file/repository.grepcode.com/java/root/jdk/openjdk/6-b14/java/util/Collection.java}.
   * @author Alexander Volkov
   * @version 1.0
   */
  public interface ICollection
  extends IIterable
  {
    //+function iterator():IIterator

    /** Adds an element into the collection.
     * @param element Object
     * @return Boolean
     */
    function add( element:Object):Boolean;
    /** Adds all elements from the certain colletion into the collection.
     * @param collection {@link ICollection}
     * @return Boolean
     */
    function addAll( collection:ICollection):Boolean;
    /** Clears collection.*/
    function clear():void;
    /** Checks if the certain object is in the collection.
     * @param element Object
     * @return Boolean
     */
    function contains( element:Object):Boolean;
    /** Checks if the collection contains all elements from another collection.
     * @param collection {@link ICollection}
     * @return Boolean
     */
    function containsAll( collection:ICollection):Boolean;
    //-function equals( element:Object):Boolean;
    //-function hashCode():int;
    function valueOf():Object;
    /** Checks if the collection is empty.
     * @return Boolean
     */
    function isEmpty():Boolean;
    /** Removes the element from the collection.
     * @param element Object
     * @return Boolean
     */
    function remove( element:Object):Boolean;
    /** Removes all elements of another collection from the collection.
     * @param collection {@link ICollection}
     * @return Boolean
     */
    function removeAll( collection:ICollection):Boolean;
    /** Removes all elements from the collection if they are not in the another collection.
     * @param collection {@link ICollection}
     * @return Boolean
     */
    function retainAll( collection:ICollection):Boolean;
    /** Gets number of elements in the collection.
     * @return int
     */
    function size():int;
    /** Gets Array representaion of the collection.
     * @param arr Array
     * @return Array
     */
    function toArray( arr:Array = null):Array;
  }
}