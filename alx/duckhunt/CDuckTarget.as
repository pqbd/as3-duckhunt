package alx.duckhunt
{
  import flash.display.MovieClip;

  public class CDuckTarget extends CTarget
  {
    private var m_animation:MovieClip;

    public function CDuckTarget( positionVector:CVector2f
                              , forceVector:CVector2f
                              , animation:MovieClip
                              , bTurn:Boolean = false
                              ):void
    {
      super( positionVector, forceVector, animation);
      this.m_animation = animation;
      this.m_animation.gotoAndPlay( 1);
      if ( bTurn)
        this.turnX();
    }

    public override function turnX():CTarget
    {
      this.m_animation.scaleX *= -1;
      return super.turnX();
    }

    public override function checkHit( nX:int, nY:int):Boolean
    {
      var bHit:Boolean = false;
      var nMult:int = 1;
      if ( this.m_animation.scaleX < 0)
       nMult = -1;

      var nDuckX:Number =  18 * nMult;
      var nDuckY:Number = -8;
      var nRadiusX:int = 8;
      var nRadiusY:int = 8;
      var nHitX:Number = nX - this.getPosition().getX();
      var nHitY:Number = nY - this.getPosition().getY();

      var nTest:Number = Math.pow(( nHitX - nDuckX), 2) / Math.pow( nRadiusX, 2)
                         + Math.pow(( nHitY - nDuckY), 2) / Math.pow( nRadiusY, 2)
                         ;
      if( nTest <= 1)
        bHit = true;
      return bHit;
    }

    /*
    public override function miss():CTarget
    {
      double n = this.getSpeed().();
      this.m_animation.gotoAndPlay( 'miss_1');
      this.setSpeed( this.getSpeed());
      setTimeout( function()
                  {
                    this.m_animation.gotoAndPlay( 'miss_2');
                  }
                , 1000
                );
    }
    public override function hit( nX:int, nY:int):Boolean
    {
      return false;
    }
    public override function destroy():void
    {
    }


    public override function miss():void
    {
      throw Error( 'miss must be implemented');
    }
    public override function destroy():void
    {
      this.m_animation.gotoAndStop( 'destroy');
    }
    */
  }
}