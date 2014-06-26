package alx.duckhunt
{
  public class CSoundTrack
  {
    private var m_nRepeat:uint;

    public function CSoundTrack( soundClip:Class, nRepeat:uint = 1)
    {
    }

    public function setState( strState:String):CTarget
    {
      this.m_strState = strState;
      return this;
    }
    public function getState():String
    {
      return this.m_strState;
    }

  }
}