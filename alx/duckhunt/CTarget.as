package alx.duckhunt
{
  import flash.display.DisplayObject;
  import flash.display.DisplayObjectContainer;

  public class CTarget
  {
    private static var s_nIdCounter:uint = 0;
    private var m_nId:uint;
    private var m_nGroupId:uint;
    private var m_positionVector:CVector2f;
    private var m_speedVector:CVector2f;
    private var m_displayObject:DisplayObject;
    private var m_nState:uint;

    public static const STATE_OK:uint = 2;
    public static const STATE_HIT:uint = 4;
    public static const STATE_MISSED:uint = 8;
    public static const STATE_DISPOSED:uint = 16;
    public static const STATE_ZERO:uint = 32;

    public function CTarget( positionVector:CVector2f
                            , forceVector:CVector2f
                            , displayObject:DisplayObject
                            , nGroupId:uint = 0
                            ):void
    {
      this.m_nId = ++CTarget.s_nIdCounter;
      this.m_nGroupId = nGroupId;
      this.m_displayObject = displayObject;
      this.setSpeed( new CVector2f()).applyForce( forceVector);
      this.setPosition( positionVector);
      this.setState( CTarget.STATE_OK);
    }

    public static function getCounterValue():uint
    {
      return CTarget.s_nIdCounter;
    }
    public function getWeight()
    {
      return 1;
    }
    public function getId():uint
    {
      return this.m_nId;
    }
    public function getGroupId():uint
    {
      return this.m_nGroupId;
    }

    public function applyForce( forceVector:CVector2f):CTarget
    {
      this.getSpeed().sumVector2f( forceVector.div( this.getWeight(), this.getWeight()));
      return this;
    }

    public function setState( nState:uint):CTarget
    {
      this.m_nState = nState;
      return this;
    }
    public function getState():uint
    {
      return this.m_nState;
    }
    public function isState( nState:uint):Boolean
    {
      return (( this.getState() & nState) > 0);
    }
    public function setPosition( vector:CVector2f):CTarget
    {
      this.m_positionVector = vector;
      this.update();
      return this;
    }
    public function getPosition():CVector2f
    {
      return this.m_positionVector;
    }
    public function setSpeed( vector:CVector2f):CTarget
    {
      this.m_speedVector = vector;
      return this;
    }
    public function getSpeed():CVector2f
    {
      return this.m_speedVector;
    }

    public function addToDisplay( display:CDisplay):CTarget
    {
      this.update();
      display.add( this.getDisplayObject());
      return this;
    }
    public function getDisplayObject():DisplayObject
    {
      return this.m_displayObject;
    }
    public function getSize():CVector2f
    {
      var nWidth:Number = 0;
      var nHeight:Number = 0;
      if ( this.m_displayObject)
      {
        nWidth = this.m_displayObject.width;
        nHeight = this.m_displayObject.height;
      }
      return new CVector2f( nWidth, nHeight);
    }
    protected function update():void
    {
      if ( this.m_displayObject)
      {
        this.m_displayObject.x = this.getPosition().getX();
        this.m_displayObject.y = this.getPosition().getY();
      }
    }

    public function turnX():CTarget
    {
      this.getSpeed().negateX();
      return this;
    }
    public function turnY():CTarget
    {
      this.getSpeed().negateY();
      return this;
    }

    public function isHittable():Boolean
    {
      return this.isState(( CTarget.STATE_OK | CTarget.STATE_MISSED));
    }
    public function isOk():Boolean
    {
      return this.isState( CTarget.STATE_OK);
    }
    public function isDisposed():Boolean
    {
      return this.isState( CTarget.STATE_DISPOSED);
    }
    public function isHit():Boolean
    {
      return this.isState( CTarget.STATE_HIT);
    }
    public function isMissed():Boolean
    {
      return this.isState( CTarget.STATE_MISSED);
    }
    public function move():CTarget
    {
      this.m_positionVector.sumVector2f( this.m_speedVector);
      this.update();
      return this;
    }
    public function checkHit( nX:int, nY:int):Boolean
    {
      throw Error( 'checkHit must be implemented');
    }
    public function hit():CTarget
    {
      throw Error( 'hit must be implemented');
    }
    public function miss():CTarget
    {
      throw Error( 'miss must be implemented');
    }
    public function dispose():CTarget
    {
      if ( this.m_displayObject)
      if ( this.m_displayObject.parent)
        this.m_displayObject.parent.removeChild( this.m_displayObject);
      this.setState( CTarget.STATE_DISPOSED);
      return this;
    }
  }
}