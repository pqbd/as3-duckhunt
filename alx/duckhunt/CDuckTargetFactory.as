package alx.duckhunt
{
  import alx.common.util.CRandom;

  public class CDuckTargetFactory extends CTargetFactory
  {
    private var m_arAnimationClass:Array;
    private var m_nAnimation:uint;
    private var m_bTurn:Boolean;

    public function CDuckTargetFactory( ...arAnimationClass):void
    {
      super();
      this.m_arAnimationClass = arAnimationClass;
      this.m_nAnimation = 0;
      this.m_bTurn = false;
    }

    public override function randomize( random:CRandom = null):void
    {
      if ( random == null)
        random = new CRandom();
      this.m_bTurn = random.nextBoolean();
      this.m_nAnimation = random.nextInt( 0, this.m_arAnimationClass.length);
    }
    public override function createTarget( position:CVector2f, force:CVector2f):CTarget
    {
      var animationClass:Class = this.m_arAnimationClass[ this.m_nAnimation];
      return new CDuckTarget( position, force, new animationClass(), this.m_bTurn);
    }
  }
}