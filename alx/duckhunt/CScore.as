package alx.duckhunt
{
  public class CScore
  {
    protected var m_nCountDuck1:uint;
    protected var m_nCountDuck2:uint;
    protected var m_nScoreDuck1:uint;
    protected var m_nScoreDuck2:uint;
    protected var m_nShots:uint;

    public function CScore()
    {
      this.m_nCountDuck1 = 0;
      this.m_nCountDuck2 = 0;
      this.m_nScoreDuck1 = 0;
      this.m_nScoreDuck2 = 0;
      this.m_nShots = 0;
    }

    public function Add( score:CScore):void
    {
      this.m_nCountDuck1 += score.GetCountDuck1();
      this.m_nCountDuck2 += score.GetCountDuck2();
      this.m_nScoreDuck1 += score.GetScoreDuck1();
      this.m_nScoreDuck2 += score.GetScoreDuck2();
      this.m_nShots += score.GetShots();
    }

    public function GetCountDuck1():int
    {
      return this.m_nCountDuck1;
    }
    public function GetCountDuck2():int
    {
      return this.m_nCountDuck2;
    }
    public function GetScoreDuck1():int
    {
      return this.m_nScoreDuck1;
    }
    public function GetScoreDuck2():int
    {
      return this.m_nScoreDuck2;
    }
    public function GetShots():int
    {
      return this.m_nShots;
    }

    public function IncCountDuck1():CScore
    {
      this.m_nCountDuck1++;
      return this;
    }
    public function IncCountDuck2():CScore
    {
      this.m_nCountDuck2++;
      return this;
    }
    public function IncScoreDuck1():CScore
    {
      this.m_nScoreDuck1++;
      return this;
    }
    public function IncScoreDuck2():CScore
    {
      this.m_nScoreDuck2++;
      return this;
    }
    public function IncShots():CScore
    {
      this.m_nShots++;
      return this;
    }

    public function Calculate():uint
    {
      var nDuck1 = this.m_nScoreDuck1 / this.m_nCountDuck1;
      var nDuck2 = this.m_nScoreDuck2 / this.m_nCountDuck2;
      return ( nDuck1 + nDuck2 - this.m_nShots * 5);
    }
    public function toString():String
    {
      return 'Shots['+this.m_nShots+']'
            +'; Duck1['+this.m_nScoreDuck1+'/'+this.m_nCountDuck1+']'
            +'; Duck2['+this.m_nScoreDuck2+'/'+this.m_nCountDuck2+']'
            ;
    }
  }
}