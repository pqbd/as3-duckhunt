package alx.common.util
{
  import flash.utils.ByteArray;
  /**
   * General Object utils.
   * @author Alexander Volkov
   * @version 1.0
   */
  public class CObjectUtils
  {
    public static function equal( objectA:Object, objectB:Object):Boolean
    {
      var bIs:Boolean = false;
      var bufferA:ByteArray = new ByteArray();
      var bufferB:ByteArray = new ByteArray();

      bufferA.writeObject( objectA);      
      bufferB.writeObject( objectB);      
      if ( bufferA.length == bufferB.length)
      {
        bIs = true;
        bufferA.position = 0;
        bufferB.position = 0;
        while (( bufferA.position < bufferA.length) && ( bIs))
        {
          if ( bufferA.readByte() != bufferB.readByte())
            bIs = false;
        }
      }
      return bIs;
    }

    public static function hashObject( object:Object):String
    {
      trace( object.hashCode());
      for( var prop:Object in object)
      {
        trace('Key: ' +prop)
        trace('Value: ' +object[ prop]);
      }
      return 'a';
    }
  }  
}