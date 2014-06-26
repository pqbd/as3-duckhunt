package alx.duckhunt
{
  import alx.common.util.CRandom;

  public class CTargetFactory
  {
    public function CTargetFactory():void
    {
    }
    
    public function randomize( random:CRandom = null):void
    {
    }
    public function createTarget( position:CVector2f, force:CVector2f):CTarget
    {
      throw Error( 'createTarget must be implemented');
    }
  }
}