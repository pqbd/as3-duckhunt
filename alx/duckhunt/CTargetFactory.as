package alx.duckhunt
{
  import alx.common.util.CRandom;

  public class CTargetFactory
  {
    private var m_nGroupId:uint;

    public function CTargetFactory( nGroupId:uint = 0):void
    {
      this.m_nGroupId = nGroupId;
    }

    public function getGroupId():uint
    {
      return this.m_nGroupId;
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