package alx.common.util
{
  /**
   * Map interface {@see http://grepcode.com/file/repository.grepcode.com/java/root/jdk/openjdk/6-b14/java/util/Map.java#Map}.
   * @author Alexander Volkov
   * @version 1.0
   */
  public interface IMap
  {
    /** Gets number of elements in the map.
     * @return int
     */
    function size():int;
    /** Checks if the map is empty.
     * @return Boolean
     */
    function isEmpty():Boolean;
    /** Checks if the certain key is set.
     * @param key Object
     * @return Boolean
     */
    function containsKey( key:Object):Boolean;
    /** Checks if the certain value is in the map.
     * @param value Object
     * @return Boolean
     */
    function containsValue( value:Object):Boolean;
    /** Gets value associated with key.
     * @param value Object
     * @return Object
     */
    function get( key:Object):Object;
    /** Sets key-value association.
     * @param key Object
     * @param value Object
     * @return Object
     */
    function put( key:Object, value:Object):Object;
    /** Removes certain key-value association.
     * @param key Object
     * @return Object
     */
    function remove( key:Object):Object;
    /** Sets all key-value associations from another map.
     * @param map IMap
     */
    function putAll( map:IMap):void;
    /** Clears map.*/
    function clear():void;
    /** Gets keys as a set.
     * @return ISet
     */
    function keySet():ISet;
    /** Gets values as a collection.
     * @return ICollection
     */
    function values():ICollection;
    /** Gets a set of map entries.
     * @return ISet
     */
    function entrySet():ISet;
  }
}