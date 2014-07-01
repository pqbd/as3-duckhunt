package alx.duckhunt
{
  import flash.display.DisplayObjectContainer;
  import flash.utils.Timer;
  import flash.events.Event;
  import flash.events.TimerEvent;

  public class CWeapon
  implements IDisplayListener
  {
    private var m_bReady:Boolean;
    private var m_nNumberOfMagazines:int;
    private var m_magazine:CWeaponMagazine;

    public function CWeapon( nNumberOfMagazines:int = -1):void
    {
      this.setReady( true);
      this.setNumberOfMagazines( nNumberOfMagazines);
      this.m_magazine = this.createMagazine();
    }

    public function createMagazine():CWeaponMagazine
    {
      throw Error( 'createMagazine must be implemented');
    }
    public function timeBetweenShots():uint
    {
      return 1000;
    }
    public function addToDisplay( display:DisplayObjectContainer):void
    {
    }
    public function updatePosition( position:CVector2f):void
    {
    }

    protected function setReady( bFlag:Boolean):CWeapon
    {
      this.m_bReady = bFlag;
      return this;
    }
    public function isReady():Boolean
    {
      return ( this.m_bReady && !this.m_magazine.isEmpty());
    }

    public function setNumberOfMagazines( nNumber:int):CWeapon
    {
      this.m_nNumberOfMagazines = nNumber;
      return this;
    }
    public function incNumberOfMagazines( nOffset:int = 1):CWeapon
    {
      this.m_nNumberOfMagazines += nOffset;
      return this;
    }
    public function getNumberOfMagazines():int
    {
      return this.m_nNumberOfMagazines;
    }

    protected function onFireSuccess():void
    {
    }
    protected function onFireFail():void
    {
    }
    public function fire( target:CVector2f):Array
    {
      if ( this.isReady())
      {
        this.onFireSuccess();
        this.setReady( false);
        var timer:Timer = new Timer( this.timeBetweenShots(), 1);
        timer.addEventListener( TimerEvent.TIMER, releaseHandler);
        timer.start();
        return this.m_magazine.fire( target);
      }
      else
      {
        this.onFireFail();
        return new Array();
      }
    }
    protected function releaseHandler( event:TimerEvent):void
    {
      this.setReady( true);
    }
    protected function onReloadSuccess():void
    {
    }
    protected function onReloadFail():void
    {
    }
    public function reload():CWeapon
    {
      if (( this.getNumberOfMagazines() < 0) || ( this.getNumberOfMagazines() > 0))
      {
        this.onReloadSuccess();
        if ( this.getNumberOfMagazines() > 0)
          this.incNumberOfMagazines( -1);
        this.m_magazine.reset();
      }
      else
        this.onReloadFail();
      return this;
    }

    public function onDisplayResize( display:CDisplay, event:Event):void
    {
    }
  }
}