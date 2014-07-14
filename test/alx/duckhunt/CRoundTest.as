package test.alx.duckhunt
{
  import alx.common.test.CUnitTest;
  import alx.duckhunt.CRound;

  public class CRoundTest extends CUnitTest
  {
    public function CRoundTest( strLabel:String):void
    {
      super( strLabel);
    }

    protected override function testList():Array
    {
      return new Array( this.testCreation
                      , this.testSetSetting
                      );
    }

    public function testCreation():void
    {
      var nCounterValue:uint = CRound.getCounterValue();
      const round:CRound = new CRound( 0
                                      , null
                                      , 0
                                      , 0
                                      , null
                                      , null
                                      );
      this.getTester().isEqual( 'round.getId()'
                              , round.getId()
                              , ( nCounterValue + 1)
                              );
    }
    public function testSetSetting():void
    {
      const round:CRound = new CRound( 0
                                      , null
                                      , 0
                                      , 0
                                      , null
                                      , null
                                      );
      round.setSetting( 'a', 1);
      this.getTester().isEqual( 'round.getSetting( \'a\')'
                              , round.getSetting( 'a')
                              , 1
                              );
      round.setSetting( 'self', round);
      this.getTester().isEqual( 'round.getSetting( \'self\')'
                              , round.getSetting( 'self')
                              , round
                              );
    }
  }
}