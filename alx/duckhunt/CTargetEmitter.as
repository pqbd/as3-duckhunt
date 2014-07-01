package alx.duckhunt
{
  import alx.common.util.CRandom;

  public class CTargetEmitter
  {
    private var m_minForce:CVector2f;
    private var m_maxForce:CVector2f;

    public function CTargetEmitter():void
    {
      this.setMinForce( new  CVector2f( 1, 5)).setMaxForce( new CVector2f( 2, 55));
    }

    protected function checkForce( force:CVector2f):CVector2f
    {
      if ( force.getX() < 0)
        throw ArgumentError( "X should be not less than 0");
      if ( force.getY() < 0 || force.getY() > 90)
        throw ArgumentError( "Y should be in [0;90]");
      return force;
    }
    public function setMinForce( force:CVector2f):CTargetEmitter
    {
      this.m_minForce = this.checkForce( force);
      return this;
    }
    public function getMinForce():CVector2f
    {
      return this.m_minForce;
    }
    public function setMaxForce( force:CVector2f):CTargetEmitter
    {
      this.m_maxForce = this.checkForce( force);
      return this;
    }
    public function getMaxForce():CVector2f
    {
      return this.m_maxForce;
    }

    public function EmitOne( targetFactory:CTargetFactory
                            , position:CVector2f
                            , force:CVector2f
                            ):CTarget
    {
      return targetFactory.createTarget( position, force);
    }
    public function EmitRandomOne( targetFactory:CTargetFactory, size:CVector2f, random:CRandom = null):CTarget
    {
      if ( random == null)
        random = new CRandom();
      targetFactory.randomize( random);

      var nForceX:Number = random.nextFloat( this.getMinForce().getX(), this.getMaxForce().getX());
      var nAngle:Number = random.nextFloat( this.getMinForce().getY(), this.getMaxForce().getY());
      var nForceY:Number = Math.sin((( Math.PI * nAngle) / 180)) * nForceX;
      return this.EmitOne( targetFactory
                          , new CVector2f( random.nextInt( 0, size.getX())
                                          , size.getY()
                                          )
                          , new CVector2f( nForceX, nForceY)
                          );
    }
  }
}