package alx.common.util
{
  /**
   * Map Entry interface {@see http://grepcode.com/file/repository.grepcode.com/java/root/jdk/openjdk/6-b14/java/util/Map.java#Map}.
   * @author Alexander Volkov
   * @version 1.0
   */
  public interface IMapEntry
  {
    /** Gets key.
     * @return Object
     */
    function getKey():Object;
    /** Gets value.
     * @return Object
     */
    function getValue():Object;
    /** Sets value.
     * @return Object
     */
    function setValue( value:Object):Object;
  }
}