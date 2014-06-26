package alx.duckhunt
{
  import alx.common.util.CRandom;

  public class CRandomTargetFactory extends CTargetFactory
  {
    private var m_random:CRandom;
    private var m_arTargetFactory:Array;
    private var m_nFactory:uint;

    public function CRandomTargetFactory( random:CRandom, ...arTargetFactory):void
    {
      super();
      if ( random == null)
        this.m_random = new CRandom();
      else
        this.m_random = random;
      this.m_arTargetFactory = arTargetFactory;
      this.m_nFactory = 0;
    }

    protected function addTargetFactory( targetFactory:CTargetFactory):void
    {
      this.m_arTargetFactory.push( targetFactory);
    }
    public function addTargetFactories( ...arTargetFactory):void
    {
      for ( var i:int; i < arTargetFactory.length; i++)
        this.addTargetFactory( arTargetFactory[ i]);
    }
    public override function createTarget( position:CVector2f, force:CVector2f):CTarget
    {
      this.m_nFactory = this.m_random.nextInt( 0, this.m_arTargetFactory.length);
      var factory:CTargetFactory = this.m_arTargetFactory[ this.m_nFactory];
      factory.randomize( this.m_random);
      return factory.createTarget( position, force);
    }
  }
}