package alx.duckhunt
{
  import flash.display.MovieClip;
  import alx.common.util.CRandom;

  public class CCloudTargetFactory extends CTargetFactory
  {
    private var m_arAnimationClass:Array;
    private var m_animation:MovieClip;
    private var m_sizeLimitVector:CVector2f;

    public function CCloudTargetFactory( nGroupId:uint, ...arAnimationClass):void
    {
      super( nGroupId);
      this.m_arAnimationClass = arAnimationClass;
      this.setSizeLimit( new CVector2f( 1, 1));
    }

    public function setSizeLimit( limitVector:CVector2f):CCloudTargetFactory
    {
      this.m_sizeLimitVector = limitVector;
      return this;
    }

    public override function randomize( random:CRandom = null):void
    {
      if ( random == null)
        random = new CRandom();

      var nSize:int = random.nextInt( this.m_sizeLimitVector.getX(), this.m_sizeLimitVector.getY());
      if ( nSize > 0)
      {
        this.m_animation = new MovieClip();
        for ( var i:int = 0; i < nSize; i++)
        {
          var nAnimation:int = random.nextInt( 0, this.m_arAnimationClass.length);
          var animationClass:Class = this.m_arAnimationClass[ nAnimation];
          var animationPart:MovieClip = new animationClass();
          animationPart.x = random.nextInt( 0, this.m_animation.width / 1.3);
          animationPart.y = random.nextInt( 0, this.m_animation.height / 1.5);
          this.m_animation.addChild( animationPart);
        }
        this.m_animation.cacheAsBitmap = true;
      }
      else
        this.m_animation = null;
    }
    public override function createTarget( position:CVector2f, force:CVector2f):CTarget
    {
      if ( this.m_animation == null)
        return null;
      else
        return new CCloudTarget( position, force, this.m_animation, this.getGroupId());
    }
  }
}