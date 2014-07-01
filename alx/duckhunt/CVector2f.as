package alx.duckhunt
{
  public class CVector2f
  {
    private var m_nX:Number;
    private var m_nY:Number;

    public function CVector2f( nX:Number = 0, nY:Number = 0)
    {
      this.set( nX, nY);
    }

    public function getX():Number
    {
      return this.m_nX;
    }
    public function getY():Number
    {
      return this.m_nY;
    }

    public function setX( nValue:Number):CVector2f
    {
      this.m_nX = nValue;
      return this;
    }
    public function setY( nValue:Number):CVector2f
    {
      this.m_nY = nValue;
      return this;
    }
    public function set( nX:Number, nY:Number):CVector2f
    {
      return this.setX( nX).setY( nY);
    }    

    public function negateX():CVector2f
    {
      return this.setX( -this.getX());
    }
    public function negateY():CVector2f
    {
      return this.setY( -this.getY());
    }
    public function negate():CVector2f
    {
      return this.negateX().negateY();
    }

    public function sumX( nValue:Number):CVector2f
    {
      return this.setX(( this.getX() + nValue));
    }
    public function sumY( nValue:Number):CVector2f
    {
      return this.setY(( this.getY() + nValue));
    }
    public function sum( nX:Number, nY:Number):CVector2f
    {
      return this.sumX( nX).sumY( nY);
    }
    public function sumVector2f( vector:CVector2f):CVector2f
    {
      return this.sum( vector.getX(), vector.getY());
    }

    public function multX( nValue:Number):CVector2f
    {
      return this.setX(( this.getX() * nValue));
    }
    public function multY( nValue:Number):CVector2f
    {
      return this.setY(( this.getY() * nValue));
    }
    public function mult( nX:Number, nY:Number):CVector2f
    {
      return this.multX( nX).multY( nY);
    }
    public function multVector2f( vector:CVector2f):CVector2f
    {
      return this.mult( vector.getX(), vector.getY());
    }

    public function divX( nValue:Number):CVector2f
    {
      return this.multX(( 1 / nValue));
    }
    public function divY( nValue:Number):CVector2f
    {
      return this.multY(( 1 / nValue));
    }
    public function div( nX:Number, nY:Number):CVector2f
    {
      return this.divX( nX).divY( nY);
    }
    public function divVector2f( vector:CVector2f):CVector2f
    {
      return this.div( vector.getX(), vector.getY());
    }

    public function norm2():Number
    {
      return ( this.getX() * this.getX() + this.getY() * this.getY());
    }
    public function norm():Number
    {
      return Math.sqrt( this.norm2());
    }

    public function toString():String
    {
      return '['+this.getX()+';'+this.getY()+']';
    }
  }
}