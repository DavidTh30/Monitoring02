unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls,
  ExtCtrls, Menus, ECAccordion, ECEditBtns, ECSwitch, strutils,
  TAGraph, TASources, TASeries, TATransformations, Math, windows, TAChartUtils,
  Process, JwaIpHlpAPI, JwaIpRtrMib, BGRABitmap, BGRABitmapTypes;

function DwmGetWindowAttribute(hwnd: HWND; dwAttribute: DWORD; pvAttribute: PVOID; cbAttribute: DWORD): HRESULT; stdcall; external 'dwmapi.dll';

type

  { TForm1 }

  TForm1 = class(TForm)
    AccordionItem1: TAccordionItem;
    AccordionItem2: TAccordionItem;
    Chart2LineSeries1: TLineSeries;
    Chart6: TChart;
    Chart6LineSeries1: TLineSeries;
    Chart6LineSeries2: TLineSeries;
    ChartAxisTransformations1: TChartAxisTransformations;
    ChartAxisTransformations1LinearAxisTransform1: TLinearAxisTransform;
    ChartMenu: TPopupMenu;
    ChartRefreshMenu: TMenuItem;
    ChartZoomOutMenu: TMenuItem;
    ECAccordion1: TECAccordion;
    ECSpeedBtn1: TECSpeedBtn;
    ECSpeedBtn2: TECSpeedBtn;
    ECSpeedBtn3: TECSpeedBtn;
    ECSpeedBtn4: TECSpeedBtn;
    ECSpeedBtn8: TECSpeedBtn;
    Edit1: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Edit2: TEdit;
    Edit20: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Image2: TImage;
    Image5: TImage;
    Label19: TLabel;
    Label_Source7: TLabel;
    Label_Source8: TLabel;
    Memo1: TMemo;
    MenuItem1: TMenuItem;
    PageControl1: TPageControl;
    Shape10: TShape;
    Shape9: TShape;
    SSC: TMenuItem;
    StatusBar1: TStatusBar;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    Timer1: TTimer;
    Timer2: TTimer;
    _Base_: TListChartSource;
    _Source1_: TListChartSource;
    _Source2_: TListChartSource;
    procedure ECSpeedBtn1Click(Sender: TObject);
    procedure ECSpeedBtn2Click(Sender: TObject);
    procedure ECSpeedBtn3Click(Sender: TObject);
    procedure ECSpeedBtn4Click(Sender: TObject);
    procedure ECSpeedBtn8Click(Sender: TObject);
    procedure Edit1EditingDone(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image5MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure SSCClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private

  public
    Function RepairIPAddress(s: string):string;
    Function CheckDirectory(C_DNAME: string;Debug_:TMemo):boolean; //True=Error
    procedure ScreenshotToFile(const Filename: string; Monitor_: integer);
    function get_ss_of(window: hwnd; var bmp: graphics.TBitmap): integer;
    function StrIntToStr(Sender: string): string;
    function StrFloatToStr(Sender: string): string;
    procedure updatePhoto();
    function HLevel(x: integer; y: integer; percent: float; Sufix: string; bmp: TBGRABitmap): TBGRABitmap;
    function Cyc(x: integer; y: integer; xr:integer; yr:integer; Act: float; Sufix: string; bmp: TBGRABitmap): TBGRABitmap;
  end;

var
  Form1: TForm1;
  Base_: array of float;
  CurrentSource1: array of float;
  TargetSource1: array of float;
  CurrentSource2: array of float;
  TargetSource2: array of float;

  TotalPointerX:integer;
  ChartMin:float;
  ChartMax:float;
  ChartForceManualMin:float;
  ChartForceManualMax:float;
  Chatr_Zoom:integer;
  Chart_Enter:boolean;

  StartRecord:boolean;
  Directory_:string;
  fileout : TextFile;
  S_Name:string;
  File_OK:Boolean;
  Txt:String;

implementation

{$R *.lfm}

{ TForm1 }

function TForm1.Cyc(x: integer; y: integer; xr:integer; yr:integer; Act: float; Sufix: string; bmp: TBGRABitmap): TBGRABitmap;
var
  PositionX: integer;
  PositionY:integer;
  ts: TSize;

  Orgx:integer;
  Orgy:integer;
  Radian:float;
  r_t:float;
  x_:integer;
  y_:integer;
  t:float;
  //t=angle
  i1:integer;

  Max_:integer;
  Act_:float;
  De_Pixel:integer;
  Act_Percent:integer;
  c:TColor;
begin
  Max_:=800;
  Act_:=ABS(Act);
  if (Act_>Max_) then Act_:=Max_;

  De_Pixel:=round(Act_/(Max_/100)*(135/100));

  PositionX:= 0; //Round(xr/2);
  PositionY:= 0; //Round(yr/2);

  bmp.Canvas2D.lineWidth:=1;

  bmp.FillEllipseAntialias(x,y,xr,yr,BGRA(192,192,192,255));  //fill
  bmp.EllipseAntialias(x,y,xr,yr,BGRA(0,0,0,255),0.7);        //not fill

  //bmp.Canvas2D.fillStyle('rgb(0,0,0)');
  //bmp.Canvas2D.arc(100,100,55,0,pi,true);
  //bmp.Canvas2D.strokeStyle ('rgb(55,255,55)');
  //bmp.Canvas2D.stroke();

  //$ff000000=alpha $00ff0000=Blue  $0000ff00=Green $000000ff=Red $00000000=black
  //BGRA(0,255,255,255)
  Orgx:=x;
  Orgy:=y;
  Radian:=xr-4;
  r_t:=Radian;
  i1:=0;
  for i1 := -90 to De_Pixel-90 do
  begin
    Act_Percent:=round((i1+90)/135*100);
    t:=DegToRad(i1);
    r_t:=Radian;

    if Act_Percent<70 then c:=$0000D000;
    if Act_Percent>70 then c:=$0000F0F0;
    if Act_Percent>90 then c:=$000000D0;

    x_ := round((0*cos(t)) + (r_t*sin(t)) + Orgx);
    y_ := round((0*sin(t)) - (r_t*cos(t)) + Orgy);
    bmp.Canvas.Pixels[x_,y_]:=c;

    r_t:=Radian+1;
    x_ := round((0*cos(t)) + (r_t*sin(t)) + Orgx);
    y_ := round((0*sin(t)) - (r_t*cos(t)) + Orgy);
    bmp.Canvas.Pixels[x_,y_]:=c;

    r_t:=Radian+2;
    x_ := round((0*cos(t)) + (r_t*sin(t)) + Orgx);
    y_ := round((0*sin(t)) - (r_t*cos(t)) + Orgy);
    bmp.Canvas.Pixels[x_,y_]:=c;

    r_t:=Radian+3;
    x_ := round((0*cos(t)) + (r_t*sin(t)) + Orgx);
    y_ := round((0*sin(t)) - (r_t*cos(t)) + Orgy);
    bmp.Canvas.Pixels[x_,y_]:=c;

    //i1 := i1+1;
    //if i1 >=360 then begin i1:=0;
  end;
  //bmp.InvalidateBitmap;
  //bmp.Canvas2D.stroke();

  bmp.FontHeight := 12;
  //bmp.FontStyle := [fsBold];
  bmp.FontAntialias := true;
  ts := bmp.TextSize(floattostr(Act)+Sufix);
  bmp.TextOut(PositionX+x-round(ts.cx/2), PositionY+y-round(ts.cy/2), floattostr(Act)+Sufix, ColorToBGRA(clBlack));

  result:=bmp;

end;

function TForm1.HLevel(x: integer; y: integer; percent: float; Sufix: string; bmp: TBGRABitmap): TBGRABitmap;
var
  po2: array of TPointF;
  Diatance: integer;
  ActDistance: integer;
  Position_:integer;
  ts: TSize;
  ActPercent: float;
begin
  ActPercent:=percent;
  if (ActPercent>100) then ActPercent:=100;
  if (ActPercent<-100) then ActPercent:=-100;

  Diatance:=76;
  Position_:= Round(Diatance/2);
  ActDistance:= Round((Diatance/2)/100*ActPercent);

  SetLength(po2, 4);

  bmp.Canvas2D.fillStyle('rgb(0,0,0)');
  po2[0] := PointF(x-2, y-2);
  po2[1] := PointF(x-2+Diatance+3, y-2);
  po2[2] := PointF(x-2+Diatance+3, y-2+15+3);
  po2[3] := PointF(x-2, y-2+15+3);
  bmp.DrawPolygonAntialias(po2, cssBlack, 1, CSSLightGray);

  if (ActPercent>=0) then bmp.Canvas2D.fillStyle('rgb(0,205,0)');
  if (ActPercent<0) then bmp.Canvas2D.fillStyle('rgb(205,205,0)');
  bmp.Canvas2D.fillRect(Position_+x,y,ActDistance,15);

  //bmp.FillRect(20, 20, 60, 60, BGRAWhite, dmSet); // draws a white square without transparency
  //bmp.FillRect(40, 40, 80, 80, BGRA(0, 0, 255, 128), dmDrawWithTransparency); // draws a transparent blue square

  bmp.FontHeight := 12;
  //bmp.FontStyle := [fsBold];
  bmp.FontAntialias := true;
  ts := bmp.TextSize(floattostr(percent)+Sufix);
  bmp.TextOut(Position_+x-round(ts.cx/2), y, floattostr(percent)+Sufix, ColorToBGRA(clBlack));

  result:=bmp;

end;

function TForm1.StrIntToStr(Sender: string): string;
var
  i:integer;
begin
  i:=0;
  Try
    i:=StrToInt(Sender);
  except
    On E : EConvertError do
      i:=0;
  end;
  result:= IntToStr(i);
end;

function TForm1.StrFloatToStr(Sender: string): string;
var
  i:Float;
begin
  i:=0;
  Try
    i:=StrToFloat(Sender);
  except
    On E : EConvertError do
      i:=0;
  end;
  result:= FloatToStr(i);
end;

function TForm1.get_ss_of(window: hwnd; var bmp: graphics.TBitmap): integer;
var
  outer: TRect;
  dc: HDC;
begin
  result := 0; // 0 = success
  if not IsWindow(window) then exit(1);
  if not (DwmGetWindowAttribute(window, 9{DWMWA_EXTENDED_FRAME_BOUNDS}, @outer, sizeof(outer)) = S_OK) then exit(2);
  bmp.Width := outer.Width;
  bmp.Height := outer.Height;
  bmp.PixelFormat := pf24bit;
  dc := GetDC(GetDesktopWindow);
  bmp.BeginUpdate(true);
  if not BitBlt(bmp.Canvas.Handle, 0, 0, outer.Width, outer.Height, dc, outer.Left, outer.Top, SRCCOPY) then result := 3;
  bmp.EndUpdate(true);
  bmp.Canvas.Changed;
  ReleaseDC(GetDesktopWindow, dc);
end;

procedure TForm1.updatePhoto();
var
  bmp: TBGRABitmap;
  x_ : Integer;
  y_ : Integer;
  i : Integer;
  i2 : Integer;
  Orgx: integer;
  Orgy: integer;
  i3 : integer;
begin

  //Orgx := Round(Image5.Width/2);
  Orgx := 122;
  Orgy := Round(Image5.Height/2);
  //Orgy := 97;
  Orgx := 0;
  Orgy := 0;
  bmp := TBGRABitmap.Create(Image5.Width,Image5.Height, ColorToBGRA(ColorToRGB(clWhite)));

  bmp.Canvas2D.strokeStyle ('rgb(50,50,50)');
  bmp.Canvas2D.stroke();

  x_:=120;
  for i := 0 to 9 do
  begin
    i2:=80; i3:=39;
    if (i=0) then i2:=0;
    if (i=5)or(i=9) then begin i2:=60; end;
    if (i>5) and (i<9) then begin i2:=40; end;
    if (i>4) and (i<9) then begin i3:=Round(i3/2); end;
    if i mod 2 = 0 then  y_:=Round(Image5.Height/3);
    if i mod 2 <> 0 then  y_:=Round(Image5.Height/3*1.3);

    x_:=x_+i2;

    bmp:=Cyc(x_,y_,i3,i3,108+x_,'rpm',bmp);

  end;

  //bmp.Canvas2D.resetTransform;

  bmp.Canvas2D.translate(0,0);
  bmp.Canvas2D.rotate(0);

  bmp:=HLevel(200,160+0,-40,'%',bmp);
  bmp:=HLevel(200,160+20,-10,'%',bmp);
  bmp:=HLevel(200,160+40,5,'%',bmp);
  bmp:=HLevel(200,160+60,10,'%',bmp);
  bmp:=HLevel(200,160+80,20,'%',bmp);

  bmp:=HLevel(500,160+0,30,'%',bmp);
  bmp:=HLevel(500,160+20,40,'%',bmp);
  bmp:=HLevel(500,160+40,50,'%',bmp);
  bmp:=HLevel(500,160+60,60,'%',bmp);

  bmp:=HLevel(640,160+0,70,'%',bmp);

  bmp.Canvas2D.resetTransform;

  bmp.Draw(Image5.Canvas,0,0);
  bmp.Free;

  image5.Refresh;
end;

procedure TForm1.ScreenshotToFile(const Filename: string; Monitor_: integer);
var
  BMP: Graphics.TBitmap;
  ScreenDC: HDC;
  M: TMonitor;
  W, H, X0, Y0: integer;
begin
  // Initialize coordinates of full composite area
  X0 := Screen.DesktopLeft;
  Y0 := Screen.DesktopTop;
  W  := Screen.DesktopWidth;
  H  := Screen.DesktopHeight;
  // Monitor=-1 takes entire screen, otherwise takes specified monitor
  if (Monitor_ >= 0) and (Monitor_ < Screen.MonitorCount) then begin
    M  := Screen.Monitors[Monitor_];
    X0 := M.Left;
    Y0 := M.Top;
    W  := M.Width;
    H  := M.Height;
  end;
  // prepare the bitmap
  BMP := Graphics.TBitmap.Create;
  BMP.Width  := W;
  BMP.Height := H;
  BMP.Canvas.Brush.Color := clWhite;
  BMP.Canvas.FillRect(0, 0, W, H);
  ScreenDC := GetDC(GetDesktopWindow);
  // copy the required area:
  BitBlt(BMP.Canvas.Handle, 0, 0, W, H, ScreenDC, X0, Y0, SRCCOPY);
  ReleaseDC(0, ScreenDC);
  // save to file (possibly to TStream, etc.)
  BMP.SaveToFile(Filename);
  BMP.Free;
end;

Function TForm1.CheckDirectory(C_DNAME: string;Debug_:TMemo):boolean; //True=Error
var
  tfOut: TextFile;
begin
  result:= false;

  if(C_DNAME<>'')then
  if Not DirectoryExists(C_DNAME) Then
  begin
    {$I-}
    //{$I-} or {$IOCHECKS OFF}
    //{$I-} rewrite (f); {$I+}
    //if IOResult<>0 then begin Writeln ('Error opening file: "file.txt"'); exit; end;
    mkdir(C_DNAME);
    {$I+}
    if IOResult<>0 then
    begin
      Debug_.Append('Directory '+C_DNAME+' error occurred. Details: '+ EInOutError.ClassName);
      ShowMessage('Cannot create '+C_DNAME+' directory. Details: '+ EInOutError.ClassName);
      result:= true;
    end;
  end;

end;

Function TForm1.RepairIPAddress(s: string):string;
var
  i:integer;
  k:integer;
  s2:string;
  c:integer;
  A_s: TStringArray;
begin

  //Edit1.Text:=chr(ord('0'));
  //Edit1.Text:=IntToStr(ord('9');

  s:=Trim(s);
  //s:=leftstr(s,15);

  s2:='';
  for i:=1 to length(s) do
  begin
    if (((ord(s[i]) >= 48) and (ord(s[i]) <= 57)) or (s[i] = '.')) then s2:=s2+s[i];
  end;
  s:=s2;

  if length(s) = 0 then s:=s+'0.0.0.0';

  if (s[1] = '.') then s:='0'+s;

  k:=0;
  for i:=1 to length(s) do
  begin
    if(s[i] = '.') then k:=k+1;
  end;
  if k=0 then s:=s+'.0.0.0';
  if k=1 then s:=s+'.0.0';
  if k=2 then s:=s+'.0';
  if s[length(s)]='.' then s:=s+'0';

  k:=0;
  c:=0;
  s2:='';
  for i:=1 to length(s) do
  begin
    if(s[i] = '.') then begin k:=k+1; c:=0; end;
    if (k>3) then
      begin
        s2:=s2;
      end
    else
      begin
        if not(s[i] = '.')then c:=c+1;
        if (c<=3) then s2:=s2+s[i];
      end;
  end;
  s:=s2;

  A_s:=SplitString(s,'.');

  k:=0;
  Try
    k:=StrToInt(A_s[0]);
  except
    On E : EConvertError do
      k:=0;
  end;
  if (k>255) then k:=255;
  if (k<0) then k:=0;
  s:=IntToStr(k);

  k:=0;
  Try
    k:=StrToInt(A_s[1]);
  except
    On E : EConvertError do
      k:=0;
  end;
  if (k>255) then k:=255;
  if (k<0) then k:=0;
  s:=s+'.'+IntToStr(k);

  k:=0;
  Try
    k:=StrToInt(A_s[2]);
  except
    On E : EConvertError do
      k:=0;
  end;
  if (k>255) then k:=255;
  if (k<0) then k:=0;
  s:=s+'.'+IntToStr(k);

  k:=0;
  Try
    k:=StrToInt(A_s[3]);
  except
    On E : EConvertError do
      k:=0;
  end;
  if (k>255) then k:=255;
  if (k<0) then k:=0;
  s:=s+'.'+IntToStr(k);

  result := s;
end;

procedure TForm1.ECSpeedBtn1Click(Sender: TObject);
begin
  PageControl1.PageIndex:=0;       //PLC IP
end;

procedure TForm1.ECSpeedBtn2Click(Sender: TObject);
begin
  PageControl1.PageIndex:=1;     //Overview
  //showmessage('Overview');
end;


procedure TForm1.ECSpeedBtn3Click(Sender: TObject);
var
  a:integer;
begin
  PageControl1.PageIndex:=2;     //RewindArm
end;

procedure TForm1.ECSpeedBtn4Click(Sender: TObject);
begin
  PageControl1.PageIndex:=3;     //RewindArm
end;

procedure TForm1.ECSpeedBtn8Click(Sender: TObject);
begin
  PageControl1.PageIndex:=4;     //Debug
end;

procedure TForm1.Edit1EditingDone(Sender: TObject);
var
  check:boolean;
  i:integer;
begin

  TEdit(Sender).Text:= StrFloatToStr(TEdit(Sender).Text);

  //if (Sender is TEdit) then
  //(Sender as TEdit).Text:=StrFloatToStr((Sender as TEdit).Text);

  check:=false;
  if (((Sender as TEdit).Name = 'Edit1') and (CurrentSource1[0]<>StrToFloat(TEdit(Sender).Text))) then check:=true;
  if (((Sender as TEdit).Name = 'Edit2') and (CurrentSource1[1]<>StrToFloat(TEdit(Sender).Text))) then check:=true;
  if (((Sender as TEdit).Name = 'Edit3') and (CurrentSource1[2]<>StrToFloat(TEdit(Sender).Text))) then check:=true;
  if (((Sender as TEdit).Name = 'Edit4') and (CurrentSource1[3]<>StrToFloat(TEdit(Sender).Text))) then check:=true;
  if (((Sender as TEdit).Name = 'Edit5') and (CurrentSource1[4]<>StrToFloat(TEdit(Sender).Text))) then check:=true;
  if (((Sender as TEdit).Name = 'Edit6') and (CurrentSource1[5]<>StrToFloat(TEdit(Sender).Text))) then check:=true;
  if (((Sender as TEdit).Name = 'Edit7') and (CurrentSource1[6]<>StrToFloat(TEdit(Sender).Text))) then check:=true;
  if (((Sender as TEdit).Name = 'Edit8') and (CurrentSource1[7]<>StrToFloat(TEdit(Sender).Text))) then check:=true;
  if (((Sender as TEdit).Name = 'Edit9') and (CurrentSource1[8]<>StrToFloat(TEdit(Sender).Text))) then check:=true;
  if (((Sender as TEdit).Name = 'Edit10') and (CurrentSource1[9]<>StrToFloat(TEdit(Sender).Text))) then check:=true;
  if (((Sender as TEdit).Name = 'Edit11') and (CurrentSource2[0]<>StrToFloat(TEdit(Sender).Text))) then check:=true;
  if (((Sender as TEdit).Name = 'Edit12') and (CurrentSource2[1]<>StrToFloat(TEdit(Sender).Text))) then check:=true;
  if (((Sender as TEdit).Name = 'Edit13') and (CurrentSource2[2]<>StrToFloat(TEdit(Sender).Text))) then check:=true;
  if (((Sender as TEdit).Name = 'Edit14') and (CurrentSource2[3]<>StrToFloat(TEdit(Sender).Text))) then check:=true;
  if (((Sender as TEdit).Name = 'Edit15') and (CurrentSource2[4]<>StrToFloat(TEdit(Sender).Text))) then check:=true;
  if (((Sender as TEdit).Name = 'Edit16') and (CurrentSource2[5]<>StrToFloat(TEdit(Sender).Text))) then check:=true;
  if (((Sender as TEdit).Name = 'Edit17') and (CurrentSource2[6]<>StrToFloat(TEdit(Sender).Text))) then check:=true;
  if (((Sender as TEdit).Name = 'Edit18') and (CurrentSource2[7]<>StrToFloat(TEdit(Sender).Text))) then check:=true;
  if (((Sender as TEdit).Name = 'Edit19') and (CurrentSource2[8]<>StrToFloat(TEdit(Sender).Text))) then check:=true;
  if (((Sender as TEdit).Name = 'Edit20') and (CurrentSource2[9]<>StrToFloat(TEdit(Sender).Text))) then check:=true;

   if (check=false) then exit;

    TotalPointerX:=10;

    ChartMin:=999;
    ChartMax:=-999;

    CurrentSource1[0]:= StrToFloat(Edit1.Text);
    CurrentSource1[1]:= StrToFloat(Edit2.Text);
    CurrentSource1[2]:= StrToFloat(Edit3.Text);
    CurrentSource1[3]:= StrToFloat(Edit4.Text);
    CurrentSource1[4]:= StrToFloat(Edit5.Text);
    CurrentSource1[5]:= StrToFloat(Edit6.Text);
    CurrentSource1[6]:= StrToFloat(Edit7.Text);
    CurrentSource1[7]:= StrToFloat(Edit8.Text);
    CurrentSource1[8]:= StrToFloat(Edit9.Text);
    CurrentSource1[9]:= StrToFloat(Edit10.Text);

    CurrentSource2[0]:= StrToFloat(Edit11.Text);
    CurrentSource2[1]:= StrToFloat(Edit12.Text);
    CurrentSource2[2]:= StrToFloat(Edit13.Text);
    CurrentSource2[3]:= StrToFloat(Edit14.Text);
    CurrentSource2[4]:= StrToFloat(Edit15.Text);
    CurrentSource2[5]:= StrToFloat(Edit16.Text);
    CurrentSource2[6]:= StrToFloat(Edit17.Text);
    CurrentSource2[7]:= StrToFloat(Edit18.Text);
    CurrentSource2[8]:= StrToFloat(Edit19.Text);
    CurrentSource2[9]:= StrToFloat(Edit20.Text);

    for i:=0 to TotalPointerX-1 do
    begin
      if (CurrentSource1[i]<ChartMin) then ChartMin:=CurrentSource1[i];
      if (CurrentSource1[i]>ChartMax) then ChartMax:=CurrentSource1[i];
    end;

     for i:=0 to TotalPointerX-1 do
    begin
      if (CurrentSource2[i]<ChartMin) then ChartMin:=CurrentSource2[i];
      if (CurrentSource2[i]>ChartMax) then ChartMax:=CurrentSource2[i];
    end;

    ChartMin:=ChartMin-1;

    ChartMax:=ChartMax+1;

    Chart6.Extent.YMin:=ChartMin;
    Chart6.Extent.YMax:=ChartMax;
    Chart6.ExtentSizeLimit.YMin:=ChartMin;
    Chart6.ExtentSizeLimit.YMax:=ChartMax;

    _Source1_.Clear;
    _Base_.Clear;
    _Source2_.Clear;
    for i:=0 to TotalPointerX-1 do
    begin
      _Source1_.Add(i,CurrentSource1[i] );
      _Source2_.Add(i,CurrentSource2[i] );
    end;

end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i:integer;
begin

  StartRecord:=false;
  Directory_:='';
  S_Name:='';

  //Randomize();

  TotalPointerX:=10;

  Setlength(Base_,TotalPointerX);
  Setlength(CurrentSource1,TotalPointerX);
  Setlength(TargetSource1,TotalPointerX);
  Setlength(CurrentSource2,TotalPointerX);
  Setlength(TargetSource2,TotalPointerX);

  ChartMin:=999;
  ChartMax:=-999;

    CurrentSource1[0]:= StrToFloat(Edit1.Text);
    CurrentSource1[1]:= StrToFloat(Edit2.Text);
    CurrentSource1[2]:= StrToFloat(Edit3.Text);
    CurrentSource1[3]:= StrToFloat(Edit4.Text);
    CurrentSource1[4]:= StrToFloat(Edit5.Text);
    CurrentSource1[5]:= StrToFloat(Edit6.Text);
    CurrentSource1[6]:= StrToFloat(Edit7.Text);
    CurrentSource1[7]:= StrToFloat(Edit8.Text);
    CurrentSource1[8]:= StrToFloat(Edit9.Text);
    CurrentSource1[9]:= StrToFloat(Edit10.Text);

    CurrentSource2[0]:= StrToFloat(Edit11.Text);
    CurrentSource2[1]:= StrToFloat(Edit12.Text);
    CurrentSource2[2]:= StrToFloat(Edit13.Text);
    CurrentSource2[3]:= StrToFloat(Edit14.Text);
    CurrentSource2[4]:= StrToFloat(Edit15.Text);
    CurrentSource2[5]:= StrToFloat(Edit16.Text);
    CurrentSource2[6]:= StrToFloat(Edit17.Text);
    CurrentSource2[7]:= StrToFloat(Edit18.Text);
    CurrentSource2[8]:= StrToFloat(Edit19.Text);
    CurrentSource2[9]:= StrToFloat(Edit20.Text);

  //for i:=0 to TotalPointerX-1 do
  //begin
  // Base_[i]:=random(50)+30;
  //end;

  for i:=0 to TotalPointerX-1 do
  begin
    //CurrentSource1[i]:=Base_[i]+5;
    //CurrentSource2[i]:=Base_[i]-5;

    if (CurrentSource1[i]<ChartMin) then ChartMin:=CurrentSource1[i];
    if (CurrentSource1[i]>ChartMax) then ChartMax:=CurrentSource1[i];
    if (CurrentSource2[i]<ChartMin) then ChartMin:=CurrentSource2[i];
    if (CurrentSource2[i]>ChartMax) then ChartMax:=CurrentSource2[i];
  end;

  if (ChartMin>0) then
    ChartMin:=0
  else
    ChartMin:=ChartMin-3;

  ChartMax:=ChartMax+3;

  Chart6.Extent.YMin:=ChartMin;
  Chart6.Extent.YMax:=ChartMax;
  Chart6.ExtentSizeLimit.YMin:=ChartMin;
  Chart6.ExtentSizeLimit.YMax:=ChartMax;

  _Source1_.Clear;
  _Base_.Clear;
  _Source2_.Clear;
  for i:=0 to TotalPointerX-1 do
  begin
    _Source1_.Add(i,CurrentSource1[i] );
    //_Base_.Add(i,Base_[i] );
    _Source2_.Add(i,CurrentSource2[i] );
  end;
  updatePhoto();
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  if StartRecord then CloseFile(fileout);

  StartRecord:=false;
  Timer1.Enabled:=false;
  Timer2.Enabled:=false;

end;

procedure TForm1.Image2Click(Sender: TObject);
var
  bmp: graphics.TBitmap;
  i:integer;
  FileName_:string;
  Directory__:string;
begin
  if (FormatDateTime('MM YYYY',Now)<>Directory__) then
  begin
    Directory__:=FormatDateTime('MM YYYY',Now); FileName_:= Directory__+'\'+FormatDateTime('DD MM YYYY hh nn ss',Now)+'.bmp';
  end;
  if CheckDirectory(Directory__,Memo1) then begin showmessage('Unable to save file'); Exit; end;

  try
    bmp := graphics.TBitmap.Create;
    for i:=1 to 1000 do
    begin
      Application.ProcessMessages
    end;
    if get_ss_of(Form1.Handle, bmp) = 0 then
    begin
      // display on TImage
      //image1.Picture.Assign(bmp);
      // or save to file
      FileName_:= Directory__+'\'+FormatDateTime('DD MM YYYY hh nn ss',Now)+'.bmp';
      bmp.SaveToFile(FileName_);
      showmessage(FileName_);
    end;
  finally
    bmp.Free;
  end;
  //ScreenshotToFile('123.bmp',0);
end;

procedure TForm1.Image5MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  bmp: TBGRABitmap;
  x_ : Integer;
  y_ : Integer;
  i : Integer;
  i2 : Integer;
  Orgx: integer;
  Orgy: integer;
  i3 : integer;
begin

  //Orgx := Round(Image5.Width/2);
  Orgx := 122;
  Orgy := Round(Image5.Height/2);
  //Orgy := 97;
  Orgx := X;
  Orgy := Y;
  bmp := TBGRABitmap.Create(Image5.Width,Image5.Height, ColorToBGRA(ColorToRGB(clWhite)));

  bmp.Canvas2D.strokeStyle ('rgb(50,50,50)');
  bmp.Canvas2D.stroke();

  bmp.Canvas2D.lineWidth:=1;
  bmp.Canvas2D.fillStyle('rgb(200,200,200)');
  for i := 0 to Image5.Width do
  begin
    x_:= Orgx;
    y_:= Orgy;
    bmp.Canvas2D.fillRect(i,y_,1,1);
  end;
  for i := 0 to Round(Image5.Width/4) do
  begin
    for i2 := Orgy-3 to Orgy+3 do bmp.Canvas2D.fillRect(i*4,i2,1,1);
  end;
  for i := 0 to Image5.Height do
  begin
    x_:= Orgx;
    y_:= Orgy;
    bmp.Canvas2D.fillRect(x_,i,1,1);
  end;
  for i := 0 to Round(Image5.Height/4) do
  begin
    for i2 := Orgx-3 to Orgx+3 do bmp.Canvas2D.fillRect(i2,i*4,1,1);
  end;

  x_:=120;
  for i := 0 to 9 do
  begin
    i2:=80; i3:=39;
    if (i=0) then i2:=0;
    if (i=5)or(i=9) then begin i2:=60; end;
    if (i>5) and (i<9) then begin i2:=40; end;
    if (i>4) and (i<9) then begin i3:=Round(i3/2); end;
    if i mod 2 = 0 then  y_:=Round(Image5.Height/3);
    if i mod 2 <> 0 then  y_:=Round(Image5.Height/3*1.3);

    x_:=x_+i2;

    bmp:=Cyc(x_,y_,i3,i3,108+x_,'rpm',bmp);

  end;

  //bmp.Canvas2D.resetTransform;

  bmp.Canvas2D.translate(0,0);
  bmp.Canvas2D.rotate(0);

  bmp:=HLevel(200,160+0,-40,'%',bmp);
  bmp:=HLevel(200,160+20,-10,'%',bmp);
  bmp:=HLevel(200,160+40,5,'%',bmp);
  bmp:=HLevel(200,160+60,10,'%',bmp);
  bmp:=HLevel(200,160+80,20,'%',bmp);

  bmp:=HLevel(500,160+0,30,'%',bmp);
  bmp:=HLevel(500,160+20,40,'%',bmp);
  bmp:=HLevel(500,160+40,50,'%',bmp);
  bmp:=HLevel(500,160+60,60,'%',bmp);

  bmp:=HLevel(640,160+0,70,'%',bmp);

  bmp.Canvas2D.resetTransform;

  bmp.Draw(Image5.Canvas,0,0,true);
  //bmp.Draw(Canvas, 0, 0, True); // draw the bitmap in opaque mode (faster)

  bmp.Free;

  image5.Refresh;
end;

procedure TForm1.SSCClick(Sender: TObject);
var
  bmp: graphics.TBitmap;
  i:integer;
  FileName_:string;
  Directory__:string;
begin
  if (FormatDateTime('MM YYYY',Now)<>Directory__) then
  begin
    Directory__:=FormatDateTime('MM YYYY',Now); FileName_:= Directory__+'\'+FormatDateTime('DD MM YYYY hh nn ss',Now)+'.bmp';
  end;
  if CheckDirectory(Directory__,Memo1) then begin showmessage('Unable to save file'); Exit; end;

  try
    bmp := graphics.TBitmap.Create;
    for i:=1 to 1000 do
    begin
      Application.ProcessMessages
    end;
    if get_ss_of(Form1.Handle, bmp) = 0 then
    begin
      // display on TImage
      //image1.Picture.Assign(bmp);
      // or save to file
      FileName_:= Directory__+'\'+FormatDateTime('DD MM YYYY hh nn ss',Now)+'.bmp';
      bmp.SaveToFile(FileName_);
      showmessage(FileName_);
    end;
  finally
    bmp.Free;
  end;
  //ScreenshotToFile('123.bmp',0);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  i:integer;
  check:boolean;
begin
  if (PageControl1.TabIndex=2) then
  begin





  end;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
var
  i:integer;
  MaxRecordTime:integer;
  Txt:String;
  Ra1:Double;
  Ra2:Double;
  Ra3:Double;
  ChartSimulate:boolean;

begin
  Randomize();

  MaxRecordTime:=60*60*12;

  Txt:=FormatDateTime('hh',  Now)+':'+FormatDateTime('nn',  Now)+':'+FormatDateTime('ss',  Now);

  //if TCP_UDPPort1.Active then Ra:= PIW272.Value;
  //if not TCP_UDPPort1.Active then Ra:=0.0;
  //if ChartSimulate then Ra:= Int(Random(1*1000));
  //if ChartForceManual.Extent.YMax<Ra then ChartForceManual.Extent.YMax:=Ra+1;
  //if ChartForceManual.Extent.YMin>Ra then ChartForceManual.Extent.YMin:=Ra-1;
  //if ListChartSource1.Count < MaxRecordTime then ListChartSource1.Add(ListChartSource1.Count,Ra,Txt,clBlue);    //I_DC_CheckBox  DB1_DBD68

  //if TCP_UDPPort1.Active then Ra:= PIW272.Value;
  //if not TCP_UDPPort1.Active then Ra:=0.0;
  //if ChartSimulate then Ra:= Int(Random(1*1000));
  //if ChartForceManual.Extent.YMax<Ra then ChartForceManual.Extent.YMax:=Ra+1;
  //if ChartForceManual.Extent.YMin>Ra then ChartForceManual.Extent.YMin:=Ra-1;
  //if ListChartSource4.Count < MaxRecordTime then ListChartSource2.Add(ListChartSource2.Count,Ra,Txt,clMaroon); //V_DC  DB1_DBD72

  //if TCP_UDPPort1.Active then Ra:= PIW272.Value;
  //if not TCP_UDPPort1.Active then Ra:=0.0;
  //if ChartSimulate then Ra:= Int(Random(1*1000));
  //if ChartForceManual.Extent.YMax<Ra then ChartForceManual.Extent.YMax:=Ra+1;
  //if ChartForceManual.Extent.YMin>Ra then ChartForceManual.Extent.YMin:=Ra-1;
  //if ListChartSource5.Count < MaxRecordTime then ListChartSource3.Add(ListChartSource3.Count,Ra,Txt,clFuchsia);   //LineSpeed  DB1_DBD76

  //if TCP_UDPPort1.Active then Ra:= PIW272.Value;
  //if not TCP_UDPPort1.Active then Ra:=0.0;
  //if ChartSimulate then Ra:= Int(Random(1*1000));
  //if ChartForceManual.Extent.YMax<Ra then ChartForceManual.Extent.YMax:=Ra+1;
  //if ChartForceManual.Extent.YMin>Ra then ChartForceManual.Extent.YMin:=Ra-1;
  //if ListChartSource5.Count < MaxRecordTime then ListChartSource4.Add(ListChartSource4.Count,Ra,Txt,clGreen);   //Power_Out  DB1_DBD252

end;

end.

