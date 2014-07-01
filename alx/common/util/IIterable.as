package alx.common.util
{
  /**
   * Iterable interface {@see http://grepcode.com/file/repository.grepcode.com/java/root/jdk/openjdk/6-b14/java/lang/Iterable.java#Iterable}.
   * @author Alexander Volkov
   * @version 1.0
   */
  public interface IIterable
  {
    /**
     * Gets an iterator over a set of elements.
     * @return {@link IIterator}
     */
    function iterator():IIterator;
  }
}