package alx.app.component.factory
{
  public interface IComponentFactory
  {
    function containsComponent( strName:String):Boolean;
    function getComponent( strName:String, type:Class = null):Object;
    function getComponentType( strName:String):Class;
    function isPrototypeComponent( strName:String):Boolean;
    function isSingletonComponent( strName:String):Boolean;
    function isComponentType( strName:String, type:Class):Boolean;
  }
}