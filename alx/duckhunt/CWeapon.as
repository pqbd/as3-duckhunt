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
    private var m_bReload:Boolean;
    private var m_nNumberOfMagazines:int;
    private var m_magazine:CWeaponMagazine;

    public function CWeapon( nNumberOfMagazines:int = -1):void
    {
      this.setReady( true);
      this.setReload( false);
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
    public function timeForReload():uint
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
    protected function setReload( bFlag:Boolean):CWeapon
    {
      this.m_bReload = bFlag;
      return this;
    }
    public function isReady():Boolean
    {
      return ( this.m_bReady && !this.m_magazine.isEmpty() && !this.m_bReload);
    }
    protected function isReload():Boolean
    {
      return this.m_bReload;
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
      var arBullet:Array = new Array();
      if ( this.isReady())
      {
        this.onFireSuccess();
        this.setReady( false);
        arBullet = this.m_magazine.fire( target);
        if ( !this.m_magazine.isEmpty())
        {
          var timer:Timer = new Timer( this.timeBetweenShots(), 1);
          timer.addEventListener( TimerEvent.TIMER, fireTimeHandler);
          timer.start();
        }
      }
      else
        this.onFireFail();
      return arBullet;
    }
    protected function fireTimeHandler( event:TimerEvent):void
    {
      if ( !this.m_magazine.isEmpty())
        this.setReady( true);
    }
    protected function onReloadStart():void
    {
    }
    protected function onReloadComplete():void
    {
    }
    protected function onReloadFail():void
    {
    }
    public function reload():CWeapon
    {
      if ( !this.isReload())
      {
        this.m_magazine.clear();
        this.setReload( true);
        if (( this.getNumberOfMagazines() < 0) || ( this.getNumberOfMagazines() > 0))
        {
          this.onReloadStart();
          if ( this.getNumberOfMagazines() > 0)
            this.incNumberOfMagazines( -1);
          var timer:Timer = new Timer( this.timeForReload(), 1);
          timer.addEventListener( TimerEvent.TIMER, reloadTimeHandler);
          timer.start();
        }
        else
          this.onReloadFail();
      }
      return this;
    }
    protected function reloadTimeHandler( event:TimerEvent):void
    {
      this.m_magazine.reset();
      this.setReload( false);
      this.setReady( true);
      this.onReloadComplete();
    }

    public function onDisplayResize( display:CDisplay, event:Event):void
    {
    }
  }
}