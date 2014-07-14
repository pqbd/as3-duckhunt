package alx.duckhunt
{
  import alx.common.util.CRandom;

  public class CDuckTargetFactory extends CTargetFactory
  {
    private var m_arAnimationClass:Array;
    private var m_nAnimation:uint;
    private var m_bTurn:Boolean;
    private var m_nXTurns:int;
    private var m_xTurnLimit:CVector2f;
    private var m_bUseFear:Boolean;
    private var m_nFearChance:Number;
    private var m_bFear:Boolean;

    public function CDuckTargetFactory( nGroupId:uint, ...arAnimationClass):void
    {
      super( nGroupId);
      this.m_arAnimationClass = arAnimationClass;
      this.m_nAnimation = 0;
      this.m_bTurn = false;
      this.m_nXTurns = -1;
      this.setXTurnLimit( new CVector2f( -2, -1));
      this.m_bFear = false;
      this.setUseFear( false);
    }

    public function setXTurnLimit( limitVector:CVector2f):CDuckTargetFactory
    {
      this.m_xTurnLimit = limitVector;
      return this;
    }
    public function setUseFear( bFlag:Boolean, nChance:Number = 1):CDuckTargetFactory
    {
      this.m_bUseFear = bFlag;
      this.m_nFearChance = nChance;
      return this;
    }

    public override function randomize( random:CRandom = null):void
    {
      if ( random == null)
        random = new CRandom();
      this.m_bTurn = random.nextBoolean();
      this.m_nAnimation = random.nextInt( 0, this.m_arAnimationClass.length);
      if ( this.m_bUseFear)
        this.m_bFear = random.nextBoolean( this.m_nFearChance);
      this.m_nXTurns = random.nextInt( this.m_xTurnLimit.getX(), this.m_xTurnLimit.getY());
    }
    public override function createTarget( position:CVector2f, force:CVector2f):CTarget
    {
      var animationClass:Class = this.m_arAnimationClass[ this.m_nAnimation];
      return new CDuckTarget( position
                            , force
                            , new animationClass()
                            , this.getGroupId()
                            , this.m_bTurn
                            , this.m_nXTurns
                            , this.m_bFear
                            );
    }
  }
}