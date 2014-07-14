package alx.duckhunt
{
  import flash.display.DisplayObjectContainer;
  import flash.display.MovieClip;
  import flash.display.StageAlign;
  import flash.display.StageScaleMode;

  import flash.events.TimerEvent;
  import flash.events.MouseEvent;
  import flash.events.Event;
  import flash.events.KeyboardEvent;

  import flash.utils.Timer;

  import flash.ui.Mouse;
  import flash.ui.Keyboard;

  import flash.text.TextField;
  import flash.text.TextFieldAutoSize;

  import alx.duckhunt.CScore;

  public class CDraft
  {
    private var m_duck1:Class;
    private var m_duck2:Class;
    private var m_dog:Class;
    private var m_target:Class;
    private var m_headshot:Class;
    private var m_patron:Class;
    private var m_scores:Class;

    private var m_cursor:MovieClip;
    private var m_display:DisplayObjectContainer;
    private var m_myDog:MovieClip;
    private var m_myPatron:MovieClip;
    private var m_myScores:MovieClip;

    private var m_arHeadshot:Array;
    private var m_arDuck:Array;
    private var m_arDeadDuck:Array;

    private var m_nLevel:int;
    private var m_bLevelSet:Boolean;
    private var m_arScore:Array;

    private var m_bFire:Boolean;
    private var m_bReload:Boolean;

    private var m_nWidth:uint;
    private var m_nHeight:uint;

    private var m_strPlayerName;

    public function CDraft()
    {
      this.SetDuck1( null);
      this.SetDuck2( null);
      this.SetDog( null);
      this.SetTarget( null);
      this.SetHeadshot( null);
      this.SetPatron( null);
      this.SetScores( null);

      this.m_cursor = null;
      this.m_display = null;
      this.m_myDog = null;
      this.m_myPatron = null;
      this.m_myScores = null;

      this.m_arHeadshot = new Array();
      this.m_arDuck = new Array();
      this.m_arDeadDuck = new Array();

      this.m_nLevel = 0;
      this.m_bLevelSet = false;
      this.m_arScore = new Array();
      this.m_arScore.push( new CScore());

      this.m_nWidth = 0;
      this.m_nHeight = 0;

      this.m_bFire = false;
      this.m_bReload = false;

      this.SetPlayerName( 'Player');
    }

    public function GetPlayerName():String
    {
      return this.m_strPlayerName;
    }
    public function SetPlayerName( strValue:String):CDraft
    {
      this.m_strPlayerName = strValue;
      return this;
    }

    public function MaxDucks():int
    {
      return (( this.m_nLevel + 1) * 2);
    }
    protected function RandomDuckSpeed():int
    {
      var nValue:int = Math.random() * ( this.m_nLevel + 1) + 1;
      if ( nValue > 10)
        nValue = 10;
      return nValue;
    }

    public function SetScores( scores:Class):CDraft
    {
      this.m_scores = scores;
      return this;
    }
    public function SetPatron( patron:Class):CDraft
    {
      this.m_patron = patron;
      return this;
    }
    public function SetHeadshot( headshot:Class):CDraft
    {
      this.m_headshot = headshot;
      return this;
    }
    public function SetDuck1( duck:Class):CDraft
    {
      this.m_duck1 = duck;
      return this;
    }
    public function SetDuck2( duck:Class):CDraft
    {
      this.m_duck2 = duck;
      return this;
    }
    public function SetDog( dog:Class):CDraft
    {
      this.m_dog = dog;
      return this;
    }
    public function SetTarget( target:Class):CDraft
    {
      this.m_target = target;
      return this;
    }

    public function ShowScores( bInit:Boolean = false)
    {
      var strTitle:String = 'Duck Hunter';
      var strHelp:String = 'press space to start';
      var strScores:String = '';
      if ( bInit)
      {
        this.m_myScores.c_text.visible = false;
      }
      else
      {
        strTitle = 'Great! Your Scores';
        strHelp = 'press space to continue';
        this.m_myScores.c_text.visible = true;

        strScores += 'In this round:'+"\n";
        strScores += "\t"+this.m_arScore[ this.m_nLevel]+"\n";
        strScores += 'Total ('+this.m_arScore.length+' round(s)):'+"\n";
        var tmpScore:CScore = new CScore();
        for ( var i:int = 0; i < this.m_arScore.length; i++)
          tmpScore.Add( this.m_arScore[ i]);
        strScores += "\t"+tmpScore+"\n";
      }
      this.m_myScores.c_title.text = strTitle;
      this.m_myScores.c_help.text = strHelp;
      this.m_myScores.c_text.text = strScores;

      this.m_myScores.visible = true;
    }
    public function HideScores()
    {
      this.m_myScores.visible = false;
    }

    protected function TurnDuck( duck:MovieClip):MovieClip
    {
      duck.scaleX = -duck.scaleX;
      duck[ 'nXDirection'] *= -1;
      return duck;
    }
    protected function EmitRandomDuck( nCount:int = 1)
    {
      for ( var i:int = 0; i < nCount; i++)
      {
        this.EmitDuck( ((( int( Math.random() * 2)) == 1) ? 0 : 1)
                        , ( Math.random() * this.m_nWidth)
                        , this.m_nHeight
                        , ((( int( Math.random() * 2)) == 1) ? 1 : -1)
                        , ((( int( Math.random() * 2)) == 1) ? 1 : -1)
                        , this.RandomDuckSpeed()
                        , ( Math.random() * 15 + 10)
                        );
      }
    }
    protected function EmitDuck( nType:int
                                , nX:int
                                , nY:int
                                , nXDirection:int
                                , nYDirection:int
                                , nSpeed:int
                                , nAngle:Number
                                ):void
    {
      var item:MovieClip;
      switch ( nType)
      {
        case 0:
        {
          item = new this.m_duck1();
          this.m_arScore[ this.m_nLevel].IncCountDuck1();
          break;
        }
        default:
        {
          this.m_arScore[ this.m_nLevel].IncCountDuck2();
          item = new this.m_duck2();
        }
      }
      item.x = nX;
      item.y = nY;
      if ( nXDirection < 0)
        item = TurnDuck( item);
      item[ 'nXDirection'] = nXDirection;
      item[ 'nYDirection'] = nYDirection;
      item[ 'nSpeed'] = nSpeed;
      item[ 'nDegrees'] = nAngle;
      item[ 'strState'] = 'play';

      this.m_display.addChild( item);
      this.m_arDuck.push( item);

      // debug
      //item.graphics.beginFill( 0xFF0000);
      //item.graphics.drawRect( 8, 0, 28, -20);
      //item.graphics.endFill();
    }
    protected function CheckHit( nHitX:Number, nHitY:Number, duck:MovieClip):Boolean
    {
      var bAnswer:Boolean = false;
      var nDuckX:Number;
      var nDuckY:Number;
      var nRadius:int = 10;

      switch ( duck[ 'strState'])
      {
        case 'play':
        {
          if ( duck.scaleX > 0)
            nDuckX = duck.x + 18;
          else
            nDuckX = duck.x - 18;
          nDuckY = duck.y - 8;
          break;
        }
        case 'miss_1':
        {
          if ( duck.scaleX > 0)
            nDuckX = duck.x + 15;
          else
            nDuckX = duck.x - 15;
          nDuckY = duck.y - 18;
          break;
        }
        case 'miss_2':
        {
          nDuckX = duck.x;
          nDuckY = duck.y - 20;
          break;
        }
      }

      if (( nHitX >= ( nDuckX - nRadius - 3)) && ( nHitX <= ( nDuckX + nRadius + 3)))
      if (( nHitY >= ( nDuckY - nRadius)) && ( nHitY <= ( nDuckY + nRadius)))
        bAnswer = true;
      return bAnswer;
    }

    public function Run( display:DisplayObjectContainer)
    {
      if ( this.m_target)
      if ( this.m_dog)
      if ( this.m_duck2)
      if ( this.m_duck1)
      if ( this.m_headshot)
      if ( this.m_patron)
      if ( this.m_scores)
      {
        this.m_display = display;
        this.m_display.stage.align = StageAlign.TOP_LEFT;
        this.m_display.stage.scaleMode = StageScaleMode.NO_SCALE;

        this.m_myScores = new this.m_scores();
        this.m_myScores.x = this.m_display.parent.stage.stageWidth / 2;
        this.m_myScores.y = this.m_display.parent.stage.stageHeight / 2;
        this.m_display.addChild( this.m_myScores);
        this.ShowScores( true);

        this.m_nWidth = this.m_display.parent.stage.stageWidth;
        this.m_nHeight = this.m_display.parent.stage.stageHeight;

        this.m_cursor = new this.m_target();
        this.m_display.parent.addChild( this.m_cursor);

        this.m_myDog = new this.m_dog();
        this.m_myDog.stop();
        this.m_myDog.x = this.m_display.parent.stage.stageWidth / 2;
        this.m_myDog.y = this.m_display.parent.stage.stageHeight;
        this.m_display.addChild( this.m_myDog);

        this.m_myPatron = new this.m_patron();
        this.m_myPatron.gotoAndStop( 1);
        this.m_myPatron.x = this.m_display.parent.stage.stageWidth - 20;
        this.m_myPatron.y = this.m_display.parent.stage.stageHeight - 5;
        this.m_display.addChild( this.m_myPatron);

        var timer:Timer = new Timer( 10);
        timer.addEventListener( TimerEvent.TIMER, TimerHandler);
        timer.start();

        Mouse.hide();
        this.m_display.parent.addEventListener( MouseEvent.MOUSE_MOVE, MouseMoveHandler);
        this.m_display.parent.stage.addEventListener( MouseEvent.CLICK, MouseClickHandler);
        this.m_display.parent.stage.addEventListener( Event.RESIZE, ResizeListener);
        this.m_display.parent.addEventListener( KeyboardEvent.KEY_DOWN, KeyDownEventHandler);
      }
    }

    protected function MissOneDuck():void
    {
      var item:MovieClip;
      var bNext:Boolean = true;
      for ( var i:int = 0;(( i < this.m_arDuck.length) && ( bNext)); i++)
      {
        item = this.m_arDuck[ i];
        if ( item)
        if ( item[ 'strState'] != 'miss_1')
        if ( item[ 'strState'] != 'miss_2')
        {
          bNext = false;
          item.gotoAndPlay( 50);
          item[ 'strState'] = 'miss_1';
        }
      }
    }
    protected function DefragmentDucks():void
    {
      var arDuck:Array = new Array();
      var item:MovieClip;
      for ( var i:int = 0; i < this.m_arDuck.length; i++)
      {
        item = this.m_arDuck[ i];
        if ( item)
          arDuck.push( item);
      }
      this.m_arDuck = arDuck;
    }
    protected function DuckDie( duck:MovieClip):void
    {
      duck.gotoAndPlay( 17);
      this.m_arDeadDuck.push( duck);
      if ( duck is this.m_duck1)
        this.m_arScore[ this.m_nLevel].IncScoreDuck1();
      else
        this.m_arScore[ this.m_nLevel].IncScoreDuck2();
    }

    protected function MoveDuck( duck:MovieClip):void
    {
      if ( duck.x > this.m_nWidth)
        duck = this.TurnDuck( duck);

      if ( duck.x < 0)
        duck = this.TurnDuck( duck);

      if ( duck.y < 0)
        duck[ 'nYDirection'] = 1;
      if ( duck.y > this.m_nHeight)
        duck[ 'nYDirection'] = -1;

      duck.x += Math.cos((( Math.PI * duck[ 'nDegrees']) / 180)) * duck[ 'nSpeed'] * duck[ 'nXDirection'];
      duck.y += Math.sin((( Math.PI * duck[ 'nDegrees']) / 180)) * duck[ 'nSpeed'] * duck[ 'nYDirection'];
    }
    protected function MoveDeadDuck( duck:MovieClip):MovieClip
    {
      if ( duck)
      {
        if ( duck.currentFrame == 22)
          duck.gotoAndPlay( 23);
        if ( duck.y > ( this.m_nHeight + 100))
        {
          if ( duck.currentFrame <= 44)
            duck.gotoAndPlay( 45);
          if ( duck.currentFrame == 49)
          {
            duck.gotoAndStop( 49);
            this.m_display.removeChild( duck);
            duck = null;
          }
        }
        else
        {
          duck.y += 9.8;
        }
      }
      return duck;
    }
    protected function MoveMissDuck( duck:MovieClip):MovieClip
    {
      if ( duck)
      {
        if ( duck.currentFrame > 63)
        if ( duck.currentFrame < 66)
        {
          duck[ 'strState'] = 'miss_2';
          duck.gotoAndPlay( 66);
        }
        if ( duck.y < -100)
        {
          duck.gotoAndStop( 49);
          this.m_display.removeChild( duck);
          duck = null;
        }
        else
        {
          duck.y -= duck[ 'nSpeed'];
          if ( duck[ 'strState'] == 'miss_1')
            duck.x += duck[ 'nXDirection'] * Math.cos((( Math.PI * duck[ 'nDegrees']) / 180)) * duck[ 'nSpeed'];
        }
      }
      return duck;
    }
    protected function ResizeListener( event:Event):void
    {
      this.m_myScores.x = this.m_display.parent.stage.stageWidth / 2;
      this.m_myScores.y = this.m_display.parent.stage.stageHeight / 2;

      this.m_myDog.x = event.target.stageWidth / 2;
      this.m_myDog.y = event.target.stageHeight;

      this.m_myPatron.x = event.target.stageWidth - 20;
      this.m_myPatron.y = event.target.stageHeight - 5;

      this.m_nWidth = event.target.stageWidth;
      this.m_nHeight = event.target.stageHeight;
      var item:MovieClip;
      for ( var i:int = 0; i < this.m_arDuck.length; i++)
      {
        item = this.m_arDuck[ i];
        if ( item)
        {
          if ( item.x > this.m_nWidth)
            item.x = this.m_nWidth;
          if ( item.y > this.m_nHeight)
            item.y = this.m_nHeight;
        }
      }
    }
    protected function TimerHandler( event:TimerEvent):void
    {
      var item:MovieClip;
      if ( !this.m_bFire)
      {
        for ( var i:int = 0; i < this.m_arDuck.length; i++)
        {
          item = this.m_arDuck[ i];
          if ( item)
          {
            switch ( item[ 'strState'])
            {
              case 'play':
              {
                this.MoveDuck( item);
                break;
              }
              case 'miss_1':
              case 'miss_2':
              {
                this.m_arDuck[ i] = this.MoveMissDuck( item);
                break;
              }
            }
          }
        }
        for ( i = 0; i < this.m_arDeadDuck.length; i++)
        {
          item = this.m_arDeadDuck[ i];
          if ( item)
            this.m_arDeadDuck[ i] = this.MoveDeadDuck( item);
        }
      }
    }

    protected function ShowHeadshot():void
    {
      for ( var i:int = 0; i < this.m_arHeadshot.length; i++)
      {
        var item:MovieClip = this.m_arHeadshot[ i];
        item.x = this.m_display.parent.stage.stageWidth - 150;
        item.y = i * 25;
        this.m_display.addChild( item);
      }
    }
    protected function HideHeadshot():void
    {
      for ( var i:int = 0; i < this.m_arHeadshot.length; i++)
      {
        var item:MovieClip = this.m_arHeadshot[ i];
        this.m_display.removeChild( item);
      }
      this.m_arHeadshot = new Array();
    }

    protected function MouseMoveHandler( event:MouseEvent):void
    {
      this.m_cursor.x = event.stageX;
      this.m_cursor.y = event.stageY;
    }
    protected function MouseClickHandler( event:MouseEvent):void
    {
      this.m_bFire = true;
      if ( !this.m_bReload)
      {
        if ( this.m_bLevelSet)
        {
          this.m_myPatron.gotoAndStop( 2);
          this.m_bReload = true;

          this.m_arScore[ this.m_nLevel].IncShots();
          this.m_cursor.gotoAndPlay( 2);
          var bHit:Boolean = false;
          var nCount:int = 0;
          for ( var i:int = 0; i < this.m_arDuck.length; i++)
          {
            var item:MovieClip = this.m_arDuck[ i];
            if ( item)
            {
              if ( CheckHit( event.stageX, event.stageY, item))
              {
                this.m_arDuck[ i] = null;
                this.DuckDie( item);
                bHit = true;

                var headshot:MovieClip = new this.m_headshot();
                headshot.c_nick1.text = this.GetPlayerName();
                if ( item is this.m_duck1)
                  headshot.c_nick2.text = 'Drake['+i+']';
                else
                  headshot.c_nick2.text = 'Duck['+i+']';
                this.m_arHeadshot.push( headshot);

                trace( this.m_arScore[ this.m_nLevel]);
              }
              else
              {
                if ( item[ 'strState'] == 'play')
                  nCount++;
              }
            }
          }
          if ( !bHit)
          {
            this.m_myDog.gotoAndPlay( 1);
            this.EmitRandomDuck();
            if ( nCount >= this.MaxDucks())
              this.MissOneDuck();
            nCount++;
          }
          else
          {
            this.ShowHeadshot();
          }

          if ( nCount == 0)
          {
            this.ShowScores();
            this.m_nLevel++;
            this.m_bLevelSet = false;
            if ( this.m_nLevel <= 15)
            {
              this.m_arScore[ this.m_nLevel] = new CScore();
              this.DefragmentDucks();
            }
            else
              this.m_nLevel = -1;
          }

          var timer:Timer = new Timer( 3000, 1);
          timer.addEventListener( TimerEvent.TIMER, FireOverTimerHandler);
          timer.start();
        }
      }
      this.m_bFire = false;
    }
    protected function FireOverTimerHandler( event:TimerEvent):void
    {
      this.m_bReload = false;
      this.HideHeadshot();
      this.m_myPatron.gotoAndStop( 1);
    }
    protected function KeyDownEventHandler( event:KeyboardEvent):void
    {
      if ( event.keyCode == Keyboard.SPACE)
      {
        if ( !this.m_bLevelSet)
        {
          if ( this.m_nLevel != -1)
          {
            this.HideScores();
            this.EmitRandomDuck((( this.m_nLevel + 1) * 2));
            this.m_bLevelSet = true;
          }
        }
      }
    }
  }
}