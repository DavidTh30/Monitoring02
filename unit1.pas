unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ComCtrls, StdCtrls,
  ExtCtrls, Menus, ECAccordion, ECEditBtns, ECSwitch, IniFiles, DwmApi,
  TAGraph, TASources, TASeries, TATransformations, Math, windows, TAChartUtils,
  Process, BGRABitmap, BGRABitmapTypes, FileUtil, LCLType, Types;

function DwmGetWindowAttribute(hwnd: HWND; dwAttribute: DWORD; pvAttribute: PVOID; cbAttribute: DWORD): HRESULT; stdcall; external 'dwmapi.dll';

type

  { TForm1 }

  TForm1 = class(TForm)
    AccordionItem1: TAccordionItem;
    AccordionItem2: TAccordionItem;
    Button1: TButton;
    Button11: TButton;
    Button12: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Chart2LineSeries2: TLineSeries;
    Chart6LineSeries3: TLineSeries;
    Chart6LineSeries4: TLineSeries;
    Chart7: TChart;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    ClearName1: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Chart2LineSeries1: TLineSeries;
    Chart6: TChart;
    Chart6LineSeries1: TLineSeries;
    Chart6LineSeries2: TLineSeries;
    ChartAxisTransformations1: TChartAxisTransformations;
    ChartAxisTransformations1LinearAxisTransform1: TLinearAxisTransform;
    ChartMenu: TPopupMenu;
    ChartRefreshMenu: TMenuItem;
    ChartZoomOutMenu: TMenuItem;
    ClearName2: TButton;
    ClearName3: TButton;
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
    Edit21: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    Edit24: TEdit;
    Edit25: TEdit;
    Edit26: TEdit;
    Edit27: TEdit;
    Edit28: TEdit;
    Edit29: TEdit;
    Edit3: TEdit;
    Edit30: TEdit;
    Edit31: TEdit;
    Edit32: TEdit;
    Edit33: TEdit;
    Edit34: TEdit;
    Edit35: TEdit;
    Edit36: TEdit;
    Edit37: TEdit;
    Edit38: TEdit;
    Edit39: TEdit;
    Edit4: TEdit;
    Edit40: TEdit;
    Edit41: TEdit;
    Edit42: TEdit;
    Edit43: TEdit;
    Edit44: TEdit;
    Edit45: TEdit;
    Edit46: TEdit;
    Edit47: TEdit;
    Edit48: TEdit;
    Edit49: TEdit;
    Edit5: TEdit;
    Edit50: TEdit;
    Edit51: TEdit;
    Edit52: TEdit;
    Edit53: TEdit;
    Edit54: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Image2: TImage;
    Image3: TImage;
    Image5: TImage;
    Label1: TLabel;
    Label19: TLabel;
    Label2: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label3: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label_Source10: TLabel;
    Label_Source11: TLabel;
    Label_Source7: TLabel;
    Label_Source8: TLabel;
    Label_Source9: TLabel;
    ListBox1: TListBox;
    ListBox2: TListBox;
    ListBox3: TListBox;
    Memo1: TMemo;
    MenuItem1: TMenuItem;
    PageControl1: TPageControl;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Shape13: TShape;
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
    _Base01_: TListChartSource;
    _Base02: TListChartSource;
    _Source1_: TListChartSource;
    _Source3: TListChartSource;
    _Source2_: TListChartSource;
    _Source4: TListChartSource;
    procedure Button11Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure CheckBox1EditingDone(Sender: TObject);
    procedure CheckBox2EditingDone(Sender: TObject);
    procedure CheckBox3EditingDone(Sender: TObject);
    procedure ClearName1Click(Sender: TObject);
    procedure ClearName2Click(Sender: TObject);
    procedure ClearName3Click(Sender: TObject);
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
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure SSCClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private

  public
    Function CheckDirectory(C_DNAME: string;Debug_:TMemo):boolean; //True=Error
    procedure ScreenshotToFile(const Filename: string; Monitor_: integer);
    function get_ss_of(window: hwnd; var bmp: graphics.TBitmap): integer;
    function StrIntToStr(Sender: string): string;
    function StrFloatToStr(Sender: string): string;
    procedure updatePhoto(x: integer; y: integer);
    function VLevel(x: integer; y: integer; percent: float; Sufix: string; bmp: TBGRABitmap): TBGRABitmap;
    function Cyc(x: integer; y: integer; xr:integer; yr:integer; Act: float; Sufix: string; bmp: TBGRABitmap): TBGRABitmap;
    function HLevel(x: integer; y: integer; percent: float; Sufix: string; bmp: TBGRABitmap): TBGRABitmap;
    function HText(x: integer; y: integer; s: string; bmp: TBGRABitmap): TBGRABitmap;
    procedure Transfer();
  end;

var
  Form1: TForm1;
  Base_: array of float;
  CurrentSource1: array of float;
  TargetSource1: array of float;
  CurrentSource2: array of float;
  TargetSource2: array of float;

  TargetSource3: array of float;
  TargetSource4: array of float;

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
  t1:integer;
  MouseX:integer;
  MouseY:integer;

implementation

{$R *.lfm}

{ TForm1 }
procedure TForm1.Transfer();
var
  check:boolean;
  i:integer;
begin

  //if (Sender is TEdit) then
  //(Sender as TEdit).Text:=StrFloatToStr((Sender as TEdit).Text);

  check:=false;
  if (CurrentSource1[0]<>StrToFloat(Edit1.Text)) then check:=true;
  if (CurrentSource1[1]<>StrToFloat(Edit2.Text)) then check:=true;
  if (CurrentSource1[2]<>StrToFloat(Edit3.Text)) then check:=true;
  if (CurrentSource1[3]<>StrToFloat(Edit4.Text)) then check:=true;
  if (CurrentSource1[4]<>StrToFloat(Edit5.Text)) then check:=true;
  if (CurrentSource1[5]<>StrToFloat(Edit6.Text)) then check:=true;
  if (CurrentSource1[6]<>StrToFloat(Edit7.Text)) then check:=true;
  if (CurrentSource1[7]<>StrToFloat(Edit8.Text)) then check:=true;
  if (CurrentSource1[8]<>StrToFloat(Edit9.Text)) then check:=true;
  if (CurrentSource1[9]<>StrToFloat(Edit10.Text)) then check:=true;
  if (CurrentSource2[0]<>StrToFloat(Edit11.Text)) then check:=true;
  if (CurrentSource2[1]<>StrToFloat(Edit12.Text)) then check:=true;
  if (CurrentSource2[2]<>StrToFloat(Edit13.Text)) then check:=true;
  if (CurrentSource2[3]<>StrToFloat(Edit14.Text)) then check:=true;
  if (CurrentSource2[4]<>StrToFloat(Edit15.Text)) then check:=true;
  if (CurrentSource2[5]<>StrToFloat(Edit16.Text)) then check:=true;
  if (CurrentSource2[6]<>StrToFloat(Edit17.Text)) then check:=true;
  if (CurrentSource2[7]<>StrToFloat(Edit18.Text)) then check:=true;
  if (CurrentSource2[8]<>StrToFloat(Edit19.Text)) then check:=true;
  if (CurrentSource2[9]<>StrToFloat(Edit20.Text)) then check:=true;

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

    Edit31.Text:= Edit1.Text;
    Edit32.Text:= Edit2.Text;
    Edit33.Text:= Edit3.Text;
    Edit34.Text:= Edit4.Text;
    Edit35.Text:= Edit5.Text;
    Edit36.Text:= Edit6.Text;
    Edit37.Text:= Edit7.Text;
    Edit38.Text:= Edit8.Text;
    Edit39.Text:= Edit9.Text;
    Edit40.Text:= Edit10.Text;

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
    _Base01_.Clear;
    _Source2_.Clear;
    for i:=0 to TotalPointerX-1 do
    begin
      _Source1_.Add(i,CurrentSource1[i] );
      _Source2_.Add(i,CurrentSource2[i] );
    end;

end;

function TForm1.HText(x: integer; y: integer; s: string; bmp: TBGRABitmap): TBGRABitmap;
var
  po2: array of TPointF;
  Diatance: integer;
  ActDistance: integer;
  Position_:integer;
  ts: TSize;
  ActPercent: float;
begin
  ActPercent:=100;
  if (ActPercent>100) then ActPercent:=100;
  if (ActPercent<-100) then ActPercent:=-100;

  bmp.FontHeight := 12;
  //bmp.FontStyle := [fsBold];
  bmp.FontAntialias := true;
  ts := bmp.TextSize(s);

  Diatance:=ts.cx;
  Position_:= Round(Diatance/2);
  ActDistance:= Round((Diatance/2)/100*ActPercent);

  SetLength(po2, 4);

  bmp.Canvas2D.fillStyle('rgb(0,0,0)');
  po2[0] := PointF(x-2, y-2);
  po2[1] := PointF(x-2+Diatance+3, y-2);
  po2[2] := PointF(x-2+Diatance+3, y-2+15+3);
  po2[3] := PointF(x-2, y-2+15+3);
  bmp.DrawPolygonAntialias(po2, cssBlack, 1, CSSWhite);

  //bmp.Canvas2D.fillStyle('rgb(255,205,255)');
  //bmp.Canvas2D.fillRect(Position_+x,y,ActDistance,15);

  //bmp.FillRect(20, 20, 60, 60, BGRAWhite, dmSet); // draws a white square without transparency
  //bmp.FillRect(40, 40, 80, 80, BGRA(0, 0, 255, 128), dmDrawWithTransparency); // draws a transparent blue square

  bmp.TextOut(Position_+x-round(ts.cx/2), y, s, ColorToBGRA(clBlack));

  result:=bmp;

end;

function TForm1.VLevel(x: integer; y: integer; percent: float; Sufix: string; bmp: TBGRABitmap): TBGRABitmap;
var
  PositionX: integer;
  PositionY:integer;
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
  ActDistance:= Round((Diatance/2)/100*ActPercent)*(-1);

  PositionX:= Round(15/2);
  PositionY:= Round(Diatance/2);

  SetLength(po2, 4);

  bmp.Canvas2D.fillStyle('rgb(0,0,0)');
  po2[0] := PointF(x-2, y-2);
  po2[1] := PointF(x-2, y-2+Diatance+3);
  po2[2] := PointF(x-2+15+3, y-2+Diatance+3);
  po2[3] := PointF(x-2+15+3, y-2);
  bmp.DrawPolygonAntialias(po2, cssBlack, 1, CSSLightGray);

  if (ActPercent>=0) then bmp.Canvas2D.fillStyle('rgb(0,205,0)');
  if (ActPercent<0) then bmp.Canvas2D.fillStyle('rgb(205,205,0)');
  bmp.Canvas2D.fillRect(x,Position_+y,15,ActDistance);

  //bmp.FillRect(20, 20, 60, 60, BGRAWhite, dmSet); // draws a white square without transparency
  //bmp.FillRect(40, 40, 80, 80, BGRA(0, 0, 255, 128), dmDrawWithTransparency); // draws a transparent blue square

  //bmp.Canvas2D.resetTransform;
  //bmp.Canvas2D.translate(x,y);
  //bmp.Canvas2D.rotate(90);

  bmp.FontHeight := 12;
  //bmp.FontStyle := [fsBold];
  bmp.FontAntialias := true;
  ts := bmp.TextSize(floattostr(percent)+Sufix);
  //bmp.TextOut(x+PositionX-round(ts.cx/2), y+PositionY-round(ts.cy/2), floattostr(percent)+Sufix, ColorToBGRA(clBlack));
  bmp.TextOutAngle(x,y+PositionY+round(ts.cy/2),900,floattostr(percent)+Sufix, ColorToBGRA(clBlack));
  //bmp.Canvas2D.resetTransform;

  result:=bmp;

end;

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

  De_Pixel:=round(50/(100/100)*(135/100));
  for i1 := t1 to De_Pixel+t1 do
  begin
    Act_Percent:=round((i1+90)/135*100);
    t:=DegToRad(i1);

    c:=$00F0F000;

    r_t:=Radian-3;
    x_ := round((0*cos(t)) + (r_t*sin(t)) + Orgx);
    y_ := round((0*sin(t)) - (r_t*cos(t)) + Orgy);
    bmp.Canvas.Pixels[x_,y_]:=c;

    r_t:=Radian-4;
    x_ := round((0*cos(t)) + (r_t*sin(t)) + Orgx);
    y_ := round((0*sin(t)) - (r_t*cos(t)) + Orgy);
    bmp.Canvas.Pixels[x_,y_]:=c;

    r_t:=Radian+-5;
    x_ := round((0*cos(t)) + (r_t*sin(t)) + Orgx);
    y_ := round((0*sin(t)) - (r_t*cos(t)) + Orgy);
    bmp.Canvas.Pixels[x_,y_]:=c;

    r_t:=Radian-6;
    x_ := round((0*cos(t)) + (r_t*sin(t)) + Orgx);
    y_ := round((0*sin(t)) - (r_t*cos(t)) + Orgy);
    bmp.Canvas.Pixels[x_,y_]:=c;

    t:=DegToRad(i1+180);

    c:=$00F0F000;

    r_t:=Radian-3;
    x_ := round((0*cos(t)) + (r_t*sin(t)) + Orgx);
    y_ := round((0*sin(t)) - (r_t*cos(t)) + Orgy);
    bmp.Canvas.Pixels[x_,y_]:=c;

    r_t:=Radian-4;
    x_ := round((0*cos(t)) + (r_t*sin(t)) + Orgx);
    y_ := round((0*sin(t)) - (r_t*cos(t)) + Orgy);
    bmp.Canvas.Pixels[x_,y_]:=c;

    r_t:=Radian+-5;
    x_ := round((0*cos(t)) + (r_t*sin(t)) + Orgx);
    y_ := round((0*sin(t)) - (r_t*cos(t)) + Orgy);
    bmp.Canvas.Pixels[x_,y_]:=c;

    r_t:=Radian-6;
    x_ := round((0*cos(t)) + (r_t*sin(t)) + Orgx);
    y_ := round((0*sin(t)) - (r_t*cos(t)) + Orgy);
    bmp.Canvas.Pixels[x_,y_]:=c;
  end;

  t1 := t1+2;
  if t1 >=360 then begin t1:=0; end;

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
  if not IsWindow(window) then begin showmessage('Not windows'); exit(1); end;
  if not (DwmGetWindowAttribute(window, DWMWA_EXTENDED_FRAME_BOUNDS, @outer, sizeof(outer)) = S_OK) then
  begin
    //showmessage('Can not get attribute'); exit(2);
    Windows.GetWindowRect(window, @outer);
  end;
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

procedure TForm1.updatePhoto(x: integer; y: integer);
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

  bmp:=HLevel(100,160+0,-40,'%',bmp);
  bmp:=HLevel(100,160+20,-10,'%',bmp);
  bmp:=HLevel(100,160+40,5,'%',bmp);
  bmp:=HLevel(100,160+60,10,'%',bmp);
  bmp:=HLevel(100,160+80,20,'%',bmp);

  bmp:=VLevel(250+0,160,-40,'%',bmp);
  bmp:=VLevel(250+20,160,-10,'%',bmp);
  bmp:=VLevel(250+40,160,5,'%',bmp);
  bmp:=VLevel(250+60,160,10,'%',bmp);
  bmp:=VLevel(250+80,160,20,'%',bmp);
  bmp:=VLevel(250+100,160,30,'%',bmp);
  bmp:=VLevel(250+120,160,40,'%',bmp);
  bmp:=VLevel(250+140,160,50,'%',bmp);
  bmp:=VLevel(250+160,160,60,'%',bmp);
  bmp:=VLevel(250+180,160,70,'%',bmp);

  bmp:=HLevel(500,160+0,30,'%',bmp);
  bmp:=HLevel(500,160+20,40,'%',bmp);
  bmp:=HLevel(500,160+40,50,'%',bmp);
  bmp:=HLevel(500,160+60,60,'%',bmp);

  bmp:=HLevel(640,160+0,70,'%',bmp);

  bmp:=HText(3,3,X.ToString+','+Y.ToString,bmp);
  bmp:=HText(118,27,'1',bmp);
  bmp:=HText(199,54,'2',bmp);
  bmp:=HText(279,27,'3',bmp);
  bmp:=HText(358,54,'4',bmp);
  bmp:=HText(439,27,'5',bmp);
  bmp:=HText(498,72,'6',bmp);
  bmp:=HText(538,46,'7',bmp);
  bmp:=HText(578,72,'8',bmp);
  bmp:=HText(618,46,'9',bmp);
  bmp:=HText(675,54,'10',bmp);

  bmp.Canvas2D.resetTransform;

  bmp.Draw(Image5.Canvas,0,0,true);
  //bmp.Draw(Canvas, 0, 0, True); // draw the bitmap in opaque mode (faster)

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

procedure TForm1.ECSpeedBtn1Click(Sender: TObject);
begin
  PageControl1.PageIndex:=0;       //PLC IP
end;

procedure TForm1.Button11Click(Sender: TObject);
var
  i:integer;
  FileList: TStringList;
  P_: Integer;
  s:string;
  s2:string;
  s3:string;

  Select02:integer;
  Select03:integer;
begin

  if CheckDirectory('Recipe',Memo1) then begin Showmessage('Folder Recipe Error'); ListBox1.Clear; exit; end;

  Select02:=-1;
  Select03:=-1;

  if( ListBox2.ItemIndex=ListBox1.ItemIndex) then Select02:=ListBox1.ItemIndex;
  if( ListBox3.ItemIndex=ListBox1.ItemIndex) then Select03:=ListBox1.ItemIndex;

  if (ListBox1.ItemIndex>=0) then
    s:=ListBox1.Items[ListBox1.ItemIndex]
  else
    s:='';

  if (ListBox2.ItemIndex>=0) then
    s2:=ListBox2.Items[ListBox2.ItemIndex]
  else
    s2:='';

  if (ListBox3.ItemIndex>=0) then
    s3:=ListBox3.Items[ListBox3.ItemIndex]
  else
    s3:='';

  ListBox1.Clear;
  ListBox2.Clear;
  ListBox3.Clear;

  FileList := FindAllFiles(GetCurrentDir+'\Recipe', '*', True);
  try
    //ShowMessage('Found ' + IntToStr(FileList.Count) + ' files.');
    if FileList.Count > 0 then
    begin
      for i := 0 to FileList.Count-1 do
      begin
        P_ := Pos('.Recipe', FileList.Strings[i]);
        if (P_ >=1) then ListBox1.Items.Add(ExtractFileName(FileList.Strings[i]));
      end;
    end;
  finally
    FileList.Free;
  end;

  ListBox1.ItemIndex:=-1;
  ListBox2.ItemIndex:=-1;
  ListBox3.ItemIndex:=-1;

  for i:=0 to  ListBox1.Count-1 do
  begin
    if (ListBox1.Items[i]=s) then  begin ListBox1.ItemIndex:=i; Break; end;
  end;

  ListBox2.Items.Assign(ListBox1.Items);
  ListBox3.Items.Assign(ListBox1.Items);

  for i:=0 to  ListBox2.Count-1 do
  begin
    if (ListBox2.Items[i]=s2) then  begin ListBox2.ItemIndex:=i; Break; end;
  end;

  for i:=0 to  ListBox3.Count-1 do
  begin
    if (ListBox3.Items[i]=s3) then  begin ListBox3.ItemIndex:=i; Break; end;
  end;

  if (Select02>=0) then ListBox2.ItemIndex:=Select02;
  if (Select03>=0) then ListBox3.ItemIndex:=Select03;

end;

procedure TForm1.Button1Click(Sender: TObject);
var
  s_Source:string;
  s_Modify:string;
  i:integer;
  p_:integer;
  ResultCode:integer;
begin
  if (ListBox1.ItemIndex<0) then begin Showmessage('No file select'); exit;  end;

  //if (trim(Edit51.Text) ='') then begin Showmessage('No file to save'); exit; end;
  if (trim(Edit51.Text) ='') then begin Edit51.Text:=FormatDateTime('DD',  Now)+'_'+FormatDateTime('MM',  Now)+'_'+FormatDateTime('YYYY',  Now)+'_'+FormatDateTime('hh',  Now)+'_'+FormatDateTime('nn',  Now)+'_'+FormatDateTime('ss',  Now) end;
  p_:=pos('.',LowerCase(Edit51.Text));
  if (p_=1) then begin Showmessage('error file name'); exit; end;
  p_:=pos('<',LowerCase(Edit51.Text));
  if (p_>0) then begin Showmessage('error file name'); exit; end;
  p_:=pos('>',LowerCase(Edit51.Text));
  if (p_>0) then begin Showmessage('error file name'); exit; end;
  p_:=pos('?',LowerCase(Edit51.Text));
  if (p_>0) then begin Showmessage('error file name'); exit; end;
  p_:=pos(':',LowerCase(Edit51.Text));
  if (p_>0) then begin Showmessage('error file name'); exit; end;
  p_:=pos('/',LowerCase(Edit51.Text));
  if (p_>0) then begin Showmessage('error file name'); exit; end;
  p_:=pos('\',LowerCase(Edit51.Text));
  if (p_>0) then begin Showmessage('error file name'); exit; end;

  p_:=pos('.recipe',LowerCase(Edit51.Text));
  if (p_>1) then
    Edit51.Text := Edit51.Text
  else
    Edit51.Text := Edit51.Text+'.Recipe';

  s_Source:= GetCurrentDir+'\Recipe\'+ ListBox1.Items[ListBox1.ItemIndex];
  s_Modify:= GetCurrentDir+'\Recipe\'+ Edit51.Text;

  if not FileExists(s_Source) then
  begin
    Showmessage('File not exists');
  end
  else
  begin

    ResultCode := Application.MessageBox('Rename recipe' + sLineBreak + '!!!', 'Confirm',MB_ICONQUESTION + MB_YESNO);
    if (ResultCode = IDYES) then
    begin  end
    else
    begin exit; end;

    if RenameFile(PChar(s_Source),PChar(s_Modify)) then
    begin
      Showmessage('File renamed successfully');
    end
    else
      Showmessage('Error: Unable to renamed file');
  end;

  ListBox1.ItemIndex:=-1;
  Button11Click(Sender);
  if FileExists(s_Modify) then
  for i:=0 to ListBox1.Count-1 do
  begin
    if (ListBox1.Items[i] = Edit51.Text  ) then  begin ListBox1.ItemIndex:=i; Break; end;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  i:integer;
  s: string;
  p_:integer;
  MyIni: TIniFile;
  //User: string;
  //Attempts: Integer;
  //IsActive: Boolean;
  ResultCode: Integer;
begin
  //if (trim(Edit52.Text) ='') then begin Showmessage('No file to save'); exit; end;
  if (trim(Edit52.Text) ='') then begin Edit52.Text:=FormatDateTime('DD',  Now)+'_'+FormatDateTime('MM',  Now)+'_'+FormatDateTime('YYYY',  Now)+'_'+FormatDateTime('hh',  Now)+'_'+FormatDateTime('nn',  Now)+'_'+FormatDateTime('ss',  Now) end;
  p_:=pos('.',LowerCase(Edit52.Text));
  if (p_=1) then begin Showmessage('error file name'); exit; end;
  p_:=pos('<',LowerCase(Edit52.Text));
  if (p_>0) then begin Showmessage('error file name'); exit; end;
  p_:=pos('>',LowerCase(Edit52.Text));
  if (p_>0) then begin Showmessage('error file name'); exit; end;
  p_:=pos('?',LowerCase(Edit52.Text));
  if (p_>0) then begin Showmessage('error file name'); exit; end;
  p_:=pos(':',LowerCase(Edit52.Text));
  if (p_>0) then begin Showmessage('error file name'); exit; end;
  p_:=pos('/',LowerCase(Edit52.Text));
  if (p_>0) then begin Showmessage('error file name'); exit; end;
  p_:=pos('\',LowerCase(Edit52.Text));
  if (p_>0) then begin Showmessage('error file name'); exit; end;

  if CheckDirectory('Recipe',Memo1) then begin Showmessage('Folder Recipe Error'); exit; end;

  p_:=pos('.recipe',LowerCase(Edit52.Text));
  if (p_>1) then
    Edit52.Text:= Edit52.Text
  else
    Edit52.Text:= Edit52.Text+'.Recipe';

  s:= GetCurrentDir+'\Recipe\'+ Edit52.Text;

  if FileExists(s) then
  begin
    ResultCode := Application.MessageBox('Over write file?' + sLineBreak + '!!!', 'Confirm',MB_ICONQUESTION + MB_YESNO);
    if (ResultCode = IDYES) then
      begin  end
    else
      begin exit; end;
  end;

  //if FileExists(s) then
  //begin
    MyIni := TIniFile.Create(s);
    try
      //MyIni.WriteString('User-Settings', 'Username', 'gfgg');
      //MyIni.WriteInteger('DB-INFO', 'MaxAttempts', 255522);
      //MyIni.WriteBool('Settings', 'AutoLogin', true);
      //User := MyIni.ReadString('User-Settings', 'Username', 'Guest');
      //Attempts := MyIni.ReadInteger('DB-INFO', 'MaxAttempts', 3);
      //IsActive := MyIni.ReadBool('Settings', 'AutoLogin', False);

      MyIni.WriteString('Roller', 'Roller01', StrFloatToStr(Edit31.Text));
      MyIni.WriteString('Roller', 'Roller02', StrFloatToStr(Edit32.Text));
      MyIni.WriteString('Roller', 'Roller03', StrFloatToStr(Edit33.Text));
      MyIni.WriteString('Roller', 'Roller04', StrFloatToStr(Edit34.Text));
      MyIni.WriteString('Roller', 'Roller05', StrFloatToStr(Edit35.Text));
      MyIni.WriteString('Roller', 'Roller06', StrFloatToStr(Edit36.Text));
      MyIni.WriteString('Roller', 'Roller07', StrFloatToStr(Edit37.Text));
      MyIni.WriteString('Roller', 'Roller08', StrFloatToStr(Edit38.Text));
      MyIni.WriteString('Roller', 'Roller09', StrFloatToStr(Edit39.Text));
      MyIni.WriteString('Roller', 'Roller10', StrFloatToStr(Edit40.Text));

    finally
      // Always free the object
      MyIni.Free;
    end;
  //end
  //else
  if not FileExists(s) then
  begin
    Showmessage('Can not save file');
  end
  else
    Button11Click(Sender);

end;

procedure TForm1.Button3Click(Sender: TObject);
var
  i:integer;
  s: string;
  p_:integer;
  MyIni: TIniFile;
  //User: string;
  //Attempts: Integer;
  //IsActive: Boolean;
  ResultCode: Integer;
begin
  //if (trim(Edit53.Text) ='') then begin Showmessage('No file to save'); exit; end;
  if (trim(Edit53.Text) ='') then begin Edit53.Text:=FormatDateTime('DD',  Now)+'_'+FormatDateTime('MM',  Now)+'_'+FormatDateTime('YYYY',  Now)+'_'+FormatDateTime('hh',  Now)+'_'+FormatDateTime('nn',  Now)+'_'+FormatDateTime('ss',  Now) end;
  p_:=pos('.',LowerCase(Edit53.Text));
  if (p_=1) then begin Showmessage('error file name'); exit; end;
  p_:=pos('<',LowerCase(Edit53.Text));
  if (p_>0) then begin Showmessage('error file name'); exit; end;
  p_:=pos('>',LowerCase(Edit53.Text));
  if (p_>0) then begin Showmessage('error file name'); exit; end;
  p_:=pos('?',LowerCase(Edit53.Text));
  if (p_>0) then begin Showmessage('error file name'); exit; end;
  p_:=pos(':',LowerCase(Edit53.Text));
  if (p_>0) then begin Showmessage('error file name'); exit; end;
  p_:=pos('/',LowerCase(Edit53.Text));
  if (p_>0) then begin Showmessage('error file name'); exit; end;
  p_:=pos('\',LowerCase(Edit53.Text));
  if (p_>0) then begin Showmessage('error file name'); exit; end;

  if CheckDirectory('Recipe',Memo1) then begin Showmessage('Folder Recipe Error'); exit; end;

  p_:=pos('.recipe',LowerCase(Edit53.Text));
  if (p_>1) then
    Edit53.Text := Edit53.Text
  else
    Edit53.Text := Edit53.Text+'.Recipe';

  s:= GetCurrentDir+'\Recipe\'+ Edit53.Text;

  if FileExists(s) then
  begin
    ResultCode := Application.MessageBox('Over write file?' + sLineBreak + '!!!', 'Confirm',MB_ICONQUESTION + MB_YESNO);
    if (ResultCode = IDYES) then
      begin  end
    else
      begin exit; end;
  end;

  //if FileExists(s) then
  //begin
    MyIni := TIniFile.Create(s);
    try
      //MyIni.WriteString('User-Settings', 'Username', 'gfgg');
      //MyIni.WriteInteger('DB-INFO', 'MaxAttempts', 255522);
      //MyIni.WriteBool('Settings', 'AutoLogin', true);
      //User := MyIni.ReadString('User-Settings', 'Username', 'Guest');
      //Attempts := MyIni.ReadInteger('DB-INFO', 'MaxAttempts', 3);
      //IsActive := MyIni.ReadBool('Settings', 'AutoLogin', False);

      MyIni.WriteString('Roller', 'Roller01', StrFloatToStr(Edit41.Text));
      MyIni.WriteString('Roller', 'Roller02', StrFloatToStr(Edit42.Text));
      MyIni.WriteString('Roller', 'Roller03', StrFloatToStr(Edit43.Text));
      MyIni.WriteString('Roller', 'Roller04', StrFloatToStr(Edit44.Text));
      MyIni.WriteString('Roller', 'Roller05', StrFloatToStr(Edit45.Text));
      MyIni.WriteString('Roller', 'Roller06', StrFloatToStr(Edit46.Text));
      MyIni.WriteString('Roller', 'Roller07', StrFloatToStr(Edit47.Text));
      MyIni.WriteString('Roller', 'Roller08', StrFloatToStr(Edit48.Text));
      MyIni.WriteString('Roller', 'Roller09', StrFloatToStr(Edit49.Text));
      MyIni.WriteString('Roller', 'Roller10', StrFloatToStr(Edit50.Text));

    finally
      // Always free the object
      MyIni.Free;
    end;
  //end
  //else
  if not FileExists(s) then
  begin
    Showmessage('Can not save file');
  end
  else
  begin
    Button11Click(Sender);
    for i:=0 to ListBox1.Count-1 do
    begin
      if (ListBox1.Items[i] = Edit53.Text  ) then  begin ListBox1.ItemIndex:=i; Break; end;
    end;
  end;
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  s:string;
  ResultCode:integer;
begin
  if (ListBox1.ItemIndex<0) then begin Showmessage('No file select'); exit;  end;

  s:= GetCurrentDir+'\Recipe\'+ ListBox1.Items[ListBox1.ItemIndex];

  if not FileExists(s) then
  begin
    Showmessage('File not exists');
  end
  else
  begin

    ResultCode := Application.MessageBox('Delete recipe' + sLineBreak + '!!!', 'Confirm',MB_ICONQUESTION + MB_YESNO);
    if (ResultCode = IDYES) then
    begin  end
    else
    begin exit; end;

    if DeleteFile(PChar(s)) then
      Showmessage('File deleted successfully')
    else
      Showmessage('Error: Unable to delete file');
  end;
  ListBox1.ItemIndex:=-1;
  Button11Click(Sender);
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  i:integer;
  s: string;
  p_:integer;
  MyIni: TIniFile;
  //User: string;
  //Attempts: Integer;
  //IsActive: Boolean;
  ResultCode: Integer;
begin
  //if (trim(Edit54.Text) ='') then begin Showmessage('No file to save'); exit; end;
  if (trim(Edit54.Text) ='') then begin Edit54.Text:=FormatDateTime('DD',  Now)+'_'+FormatDateTime('MM',  Now)+'_'+FormatDateTime('YYYY',  Now)+'_'+FormatDateTime('hh',  Now)+'_'+FormatDateTime('nn',  Now)+'_'+FormatDateTime('ss',  Now) end;
  p_:=pos('.',LowerCase(Edit54.Text));
  if (p_=1) then begin Showmessage('error file name'); exit; end;
  p_:=pos('<',LowerCase(Edit54.Text));
  if (p_>0) then begin Showmessage('error file name'); exit; end;
  p_:=pos('>',LowerCase(Edit54.Text));
  if (p_>0) then begin Showmessage('error file name'); exit; end;
  p_:=pos('?',LowerCase(Edit54.Text));
  if (p_>0) then begin Showmessage('error file name'); exit; end;
  p_:=pos(':',LowerCase(Edit54.Text));
  if (p_>0) then begin Showmessage('error file name'); exit; end;
  p_:=pos('/',LowerCase(Edit54.Text));
  if (p_>0) then begin Showmessage('error file name'); exit; end;
  p_:=pos('\',LowerCase(Edit54.Text));
  if (p_>0) then begin Showmessage('error file name'); exit; end;

  if CheckDirectory('Recipe',Memo1) then begin Showmessage('Folder Recipe Error'); exit; end;

  p_:=pos('.recipe',LowerCase(Edit54.Text));
  if (p_>1) then
    Edit54.Text:= Edit54.Text
  else
    Edit54.Text:= Edit54.Text+'.Recipe';

  s:= GetCurrentDir+'\Recipe\'+ Edit54.Text;

  if FileExists(s) then
  begin
    ResultCode := Application.MessageBox('Over write file?' + sLineBreak + '!!!', 'Confirm',MB_ICONQUESTION + MB_YESNO);
    if (ResultCode = IDYES) then
      begin  end
    else
      begin exit; end;
  end;

  //if FileExists(s) then
  //begin
    MyIni := TIniFile.Create(s);
    try
      //MyIni.WriteString('User-Settings', 'Username', 'gfgg');
      //MyIni.WriteInteger('DB-INFO', 'MaxAttempts', 255522);
      //MyIni.WriteBool('Settings', 'AutoLogin', true);
      //User := MyIni.ReadString('User-Settings', 'Username', 'Guest');
      //Attempts := MyIni.ReadInteger('DB-INFO', 'MaxAttempts', 3);
      //IsActive := MyIni.ReadBool('Settings', 'AutoLogin', False);

      MyIni.WriteString('Roller', 'Roller01', StrFloatToStr(Edit21.Text));
      MyIni.WriteString('Roller', 'Roller02', StrFloatToStr(Edit22.Text));
      MyIni.WriteString('Roller', 'Roller03', StrFloatToStr(Edit23.Text));
      MyIni.WriteString('Roller', 'Roller04', StrFloatToStr(Edit24.Text));
      MyIni.WriteString('Roller', 'Roller05', StrFloatToStr(Edit25.Text));
      MyIni.WriteString('Roller', 'Roller06', StrFloatToStr(Edit26.Text));
      MyIni.WriteString('Roller', 'Roller07', StrFloatToStr(Edit27.Text));
      MyIni.WriteString('Roller', 'Roller08', StrFloatToStr(Edit28.Text));
      MyIni.WriteString('Roller', 'Roller09', StrFloatToStr(Edit29.Text));
      MyIni.WriteString('Roller', 'Roller10', StrFloatToStr(Edit30.Text));

    finally
      // Always free the object
      MyIni.Free;
    end;
  //end
  //else
  if not FileExists(s) then
  begin
    Showmessage('Can not save file');
  end
  else
    Button11Click(Sender);

end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  Edit21.Text:= Edit41.Text;
  Edit22.Text:= Edit42.Text;
  Edit23.Text:= Edit43.Text;
  Edit24.Text:= Edit44.Text;
  Edit25.Text:= Edit45.Text;
  Edit26.Text:= Edit46.Text;
  Edit27.Text:= Edit47.Text;
  Edit28.Text:= Edit48.Text;
  Edit29.Text:= Edit49.Text;
  Edit30.Text:= Edit50.Text;
end;

procedure TForm1.Button8Click(Sender: TObject);
var
  ResultCode: Integer;
begin
  Edit21.Text:= StrFloatToStr(Edit21.Text);
  Edit22.Text:= StrFloatToStr(Edit22.Text);
  Edit23.Text:= StrFloatToStr(Edit23.Text);
  Edit24.Text:= StrFloatToStr(Edit24.Text);
  Edit25.Text:= StrFloatToStr(Edit25.Text);
  Edit26.Text:= StrFloatToStr(Edit26.Text);
  Edit27.Text:= StrFloatToStr(Edit27.Text);
  Edit28.Text:= StrFloatToStr(Edit28.Text);
  Edit29.Text:= StrFloatToStr(Edit29.Text);
  Edit30.Text:= StrFloatToStr(Edit30.Text);

  ResultCode := Application.MessageBox('Transfer to PLC?' + sLineBreak + '!!!', 'Confirm',MB_ICONQUESTION + MB_YESNO);
  if (ResultCode = IDYES) then
    begin  end
  else
    begin exit; end;

  Edit1.Text:= Edit21.Text;
  Edit2.Text:= Edit22.Text;
  Edit3.Text:= Edit23.Text;
  Edit4.Text:= Edit24.Text;
  Edit5.Text:= Edit25.Text;
  Edit6.Text:= Edit26.Text;
  Edit7.Text:= Edit27.Text;
  Edit8.Text:= Edit28.Text;
  Edit9.Text:= Edit29.Text;
  Edit10.Text:= Edit30.Text;

  Edit31.Text:= Edit21.Text;
  Edit32.Text:= Edit22.Text;
  Edit33.Text:= Edit23.Text;
  Edit34.Text:= Edit24.Text;
  Edit35.Text:= Edit25.Text;
  Edit36.Text:= Edit26.Text;
  Edit37.Text:= Edit27.Text;
  Edit38.Text:= Edit28.Text;
  Edit39.Text:= Edit29.Text;
  Edit40.Text:= Edit30.Text;

  Transfer();

end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  Edit21.Text:= Edit31.Text;
  Edit22.Text:= Edit32.Text;
  Edit23.Text:= Edit33.Text;
  Edit24.Text:= Edit34.Text;
  Edit25.Text:= Edit35.Text;
  Edit26.Text:= Edit36.Text;
  Edit27.Text:= Edit37.Text;
  Edit28.Text:= Edit38.Text;
  Edit29.Text:= Edit39.Text;
  Edit30.Text:= Edit40.Text;
end;

procedure TForm1.CheckBox1EditingDone(Sender: TObject);
begin
  Chart2LineSeries2.ShowPoints:=CheckBox1.Checked;
  Chart2LineSeries2.ShowLines:=CheckBox1.Checked;
  Chart2LineSeries2.ShowInLegend:=CheckBox1.Checked;
end;

procedure TForm1.CheckBox2EditingDone(Sender: TObject);
begin
  Chart6LineSeries4.ShowPoints:=CheckBox2.Checked;
  Chart6LineSeries4.ShowLines:=CheckBox2.Checked;
  Chart6LineSeries4.ShowInLegend:=CheckBox2.Checked;
end;

procedure TForm1.CheckBox3EditingDone(Sender: TObject);
begin
  Chart6LineSeries3.ShowPoints:=CheckBox3.Checked;
  Chart6LineSeries3.ShowLines:=CheckBox3.Checked;
  Chart6LineSeries3.ShowInLegend:=CheckBox3.Checked;
end;

procedure TForm1.ClearName1Click(Sender: TObject);
begin
  Edit53.Text:='';
end;

procedure TForm1.ClearName2Click(Sender: TObject);
begin
  Edit54.Text:='';
end;

procedure TForm1.ClearName3Click(Sender: TObject);
begin
  Edit52.Text:='';
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
  ChartMin_:float;
  ChartMax_:float;
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

    Edit31.Text:= Edit1.Text;
    Edit32.Text:= Edit2.Text;
    Edit33.Text:= Edit3.Text;
    Edit34.Text:= Edit4.Text;
    Edit35.Text:= Edit5.Text;
    Edit36.Text:= Edit6.Text;
    Edit37.Text:= Edit7.Text;
    Edit38.Text:= Edit8.Text;
    Edit39.Text:= Edit9.Text;
    Edit40.Text:= Edit10.Text;

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
    _Base01_.Clear;
    _Source2_.Clear;
    _Base02.Clear;
    for i:=0 to TotalPointerX-1 do
    begin
      _Source1_.Add(i+1,CurrentSource1[i] );
      _Source2_.Add(i+1,CurrentSource2[i] );
      _Base02.Add(i+1,CurrentSource2[i] );
    end;

    ChartMin_:=9999;
    ChartMax_:=-9999;

    for i:=1 to 10 do
    begin
      if (CurrentSource2[i-1]<ChartMin_) then ChartMin_:=CurrentSource2[i-1];   //Actual
      if (CurrentSource2[i-1]>ChartMax_) then ChartMax_:=CurrentSource2[i-1];   //Actual
      if (TargetSource3[i-1]<ChartMin_) then ChartMin_:=TargetSource3[i-1];    //List1
      if (TargetSource3[i-1]>ChartMax_) then ChartMax_:=TargetSource3[i-1];    //List1
      if (TargetSource4[i-1]<ChartMin_) then ChartMin_:=TargetSource4[i-1];    //List2
      if (TargetSource4[i-1]>ChartMax_) then ChartMax_:=TargetSource4[i-1];    //List2
    end;
    ChartMin_:=ChartMin_-1;
    ChartMax_:=ChartMax_+1;

    Chart7.Extent.YMin:=ChartMin_;
    Chart7.Extent.YMax:=ChartMax_;
    Chart7.ExtentSizeLimit.YMin:=ChartMin_;
    Chart7.ExtentSizeLimit.YMax:=ChartMax_;

end;

procedure TForm1.FormCreate(Sender: TObject);
var
  i:integer;
  FileList: TStringList;
  P_: Integer;
begin

  if CheckDirectory('Recipe',Memo1) then begin Showmessage('Folder Recipe Error'); Application.Terminate; end;

  ListBox1.Clear;
  ListBox2.Clear;
  ListBox3.Clear;

  FileList := FindAllFiles(GetCurrentDir+'\Recipe', '*', True);
  try
    //ShowMessage('Found ' + IntToStr(FileList.Count) + ' files.');
    if FileList.Count > 0 then
    begin
      for i := 0 to FileList.Count-1 do
      begin
        P_ := Pos('.Recipe', FileList.Strings[i]);
        if (P_ >=1) then ListBox1.Items.Add(ExtractFileName(FileList.Strings[i]));
      end;
    end;
  finally
    FileList.Free;
  end;

  ListBox2.Items.Assign(ListBox1.Items);
  ListBox3.Items.Assign(ListBox1.Items);

  ListBox1.ItemIndex:=-1;
  ListBox2.ItemIndex:=-1;
  ListBox3.ItemIndex:=-1;

  StartRecord:=false;
  Directory_:='';
  S_Name:='';

  //Randomize();

  TotalPointerX:=10;

  t1:=0;
  MouseX:=0;
  MouseY:=0;

  Setlength(Base_,TotalPointerX);
  Setlength(CurrentSource1,TotalPointerX);
  Setlength(TargetSource1,TotalPointerX);
  Setlength(CurrentSource2,TotalPointerX);
  Setlength(TargetSource2,TotalPointerX);

  Setlength(TargetSource3,TotalPointerX);
  Setlength(TargetSource4,TotalPointerX);

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
    TargetSource3[i]:=0;
    TargetSource4[i]:=0;

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
  _Base01_.Clear;
  _Source2_.Clear;
  for i:=0 to TotalPointerX-1 do
  begin
    _Source1_.Add(i+1,CurrentSource1[i] );
    //_Base01_.Add(i,Base_[i] );
    _Source2_.Add(i+1,CurrentSource2[i] );
  end;

  _Source3.Clear;
  _Base02.Clear;
  _Source4.Clear;
  for i:=0 to TotalPointerX-1 do
  begin
    //_Source03.Add(i+1,CurrentSource1[i] );
    //_Base01_.Add(i,Base_[i] );
    _Base02.Add(i+1,CurrentSource2[i] );
  end;

  updatePhoto(MouseX,MouseY);
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
begin
  MouseX:=X;
  MouseY:=Y;
end;

procedure TForm1.ListBox1Click(Sender: TObject);
var
  i:integer;
  s: string;

  MyIni: TIniFile;
  //User: string;
  //Attempts: Integer;
  //IsActive: Boolean;
begin
  if (ListBox1.ItemIndex<0) then exit;
  if CheckDirectory('Recipe',Memo1) then begin Showmessage('Folder Recipe Error'); exit; end;

  s:= GetCurrentDir+'\Recipe\'+ ListBox1.Items[ListBox1.ItemIndex];

  Edit51.Text:=ListBox1.Items[ListBox1.ItemIndex];

  if FileExists(s) then
  begin
    MyIni := TIniFile.Create(s);
    try
      //MyIni.WriteString('User-Settings', 'Username', 'gfgg');
      //MyIni.WriteInteger('DB-INFO', 'MaxAttempts', 255522);
      //MyIni.WriteBool('Settings', 'AutoLogin', true);
      //User := MyIni.ReadString('User-Settings', 'Username', 'Guest');
      //Attempts := MyIni.ReadInteger('DB-INFO', 'MaxAttempts', 3);
      //IsActive := MyIni.ReadBool('Settings', 'AutoLogin', False);

      Edit41.Text := MyIni.ReadString('Roller', 'Roller01', '0.0');
      Edit41.Text:=StrFloatToStr(Edit41.Text);
      Edit42.Text := MyIni.ReadString('Roller', 'Roller02', '0.0');
      Edit42.Text:=StrFloatToStr(Edit42.Text);
      Edit43.Text := MyIni.ReadString('Roller', 'Roller03', '0.0');
      Edit43.Text:=StrFloatToStr(Edit43.Text);
      Edit44.Text := MyIni.ReadString('Roller', 'Roller04', '0.0');
      Edit44.Text:=StrFloatToStr(Edit44.Text);
      Edit45.Text := MyIni.ReadString('Roller', 'Roller05', '0.0');
      Edit45.Text:=StrFloatToStr(Edit45.Text);
      Edit46.Text := MyIni.ReadString('Roller', 'Roller06', '0.0');
      Edit46.Text:=StrFloatToStr(Edit46.Text);
      Edit47.Text := MyIni.ReadString('Roller', 'Roller07', '0.0');
      Edit47.Text:=StrFloatToStr(Edit47.Text);
      Edit48.Text := MyIni.ReadString('Roller', 'Roller08', '0.0');
      Edit48.Text:=StrFloatToStr(Edit48.Text);
      Edit49.Text := MyIni.ReadString('Roller', 'Roller09', '0.0');
      Edit49.Text:=StrFloatToStr(Edit49.Text);
      Edit50.Text := MyIni.ReadString('Roller', 'Roller10', '0.0');
      Edit50.Text:=StrFloatToStr(Edit50.Text);
    finally
      // Always free the object
      MyIni.Free;
    end;
  end
  else
  begin
    Showmessage('File not found');
  end;

end;

procedure TForm1.ListBox2Click(Sender: TObject);
var
  s:string;
  Read_Float:float;
  Read_String:string;
  MyIni: TIniFile;
  ChartMin_:float;
  ChartMax_:float;
  i:integer;
begin

  if (ListBox2.ItemIndex<0) then exit;
  if CheckDirectory('Recipe',Memo1) then begin Showmessage('Folder Recipe Error'); exit; end;

  s:= GetCurrentDir+'\Recipe\'+ ListBox2.Items[ListBox2.ItemIndex];

  CheckBox1.Caption:=ListBox2.Items[ListBox2.ItemIndex];

  _Source3.Clear;
  //_Base02.Clear;
  //_Source4.Clear;

  if FileExists(s) then
  begin
    MyIni := TIniFile.Create(s);
    try

      //ChartMin_:=Chart7.Extent.YMin;
      //ChartMax_:=Chart7.Extent.YMax;
      //if (ChartMin_>Chart7.ExtentSizeLimit.YMin) then ChartMin_:=Chart7.ExtentSizeLimit.YMin;
      //if (ChartMax_<Chart7.ExtentSizeLimit.YMax) then ChartMax_:=Chart7.ExtentSizeLimit.YMax;
      //ChartMin_:=ChartMin_+1;
      //ChartMax_:=ChartMax_-1;
      ChartMin_:=9999;
      ChartMax_:=-9999;

      for i:=1 to 10 do
      begin
        Read_String := MyIni.ReadString('Roller', 'Roller0'+i.ToString, '0.0');
        if (i>9) then Read_String := MyIni.ReadString('Roller', 'Roller'+i.ToString, '0.0');
        Read_String:=StrFloatToStr(Read_String);
        Read_Float:=StrToFloat(Read_String);
        _Source3.Add(i,Read_Float);
        TargetSource3[i-1]:=Read_Float;
        if (CurrentSource2[i-1]<ChartMin_) then ChartMin_:=CurrentSource2[i-1];   //Actual
        if (CurrentSource2[i-1]>ChartMax_) then ChartMax_:=CurrentSource2[i-1];   //Actual
        if (TargetSource3[i-1]<ChartMin_) then ChartMin_:=TargetSource3[i-1];    //List1
        if (TargetSource3[i-1]>ChartMax_) then ChartMax_:=TargetSource3[i-1];    //List1
        if (TargetSource4[i-1]<ChartMin_) then ChartMin_:=TargetSource4[i-1];    //List2
        if (TargetSource4[i-1]>ChartMax_) then ChartMax_:=TargetSource4[i-1];    //List2
      end;

    finally
      // Always free the object
      MyIni.Free;

      ChartMin_:=ChartMin_-1;
      ChartMax_:=ChartMax_+1;

      Chart7.Extent.YMin:=ChartMin_;
      Chart7.Extent.YMax:=ChartMax_;
      Chart7.ExtentSizeLimit.YMin:=ChartMin_;
      Chart7.ExtentSizeLimit.YMax:=ChartMax_;
    end;
  end
  else
  begin
    Showmessage('File not found');
  end;

end;

procedure TForm1.ListBox3Click(Sender: TObject);
var
  s:string;
  Read_Float:float;
  Read_String:string;
  MyIni: TIniFile;
  ChartMin_:float;
  ChartMax_:float;
  i:integer;
begin
  if (ListBox3.ItemIndex<0) then exit;
  if CheckDirectory('Recipe',Memo1) then begin Showmessage('Folder Recipe Error'); exit; end;

  s:= GetCurrentDir+'\Recipe\'+ ListBox3.Items[ListBox3.ItemIndex];

  CheckBox2.Caption:=ListBox3.Items[ListBox3.ItemIndex];

  //_Source3.Clear;
  //_Base02.Clear;
  _Source4.Clear;

  if FileExists(s) then
  begin
    MyIni := TIniFile.Create(s);
    try
      //ChartMin_:=Chart7.Extent.YMin;
      //ChartMax_:=Chart7.Extent.YMax;
      //if (ChartMin_>Chart7.ExtentSizeLimit.YMin) then ChartMin_:=Chart7.ExtentSizeLimit.YMin;
      //if (ChartMax_<Chart7.ExtentSizeLimit.YMax) then ChartMax_:=Chart7.ExtentSizeLimit.YMax;
      //ChartMin_:=ChartMin_+1;
      //ChartMax_:=ChartMax_-1;
      ChartMin_:=9999;
      ChartMax_:=-9999;

      for i:=1 to 10 do
      begin
        Read_String := MyIni.ReadString('Roller', 'Roller0'+i.ToString, '0.0');
        if (i>9) then Read_String := MyIni.ReadString('Roller', 'Roller'+i.ToString, '0.0');
        Read_String:=StrFloatToStr(Read_String);
        Read_Float:=StrToFloat(Read_String);
        _Source4.Add(i,Read_Float);
        TargetSource4[i-1]:=Read_Float;
        if (CurrentSource2[i-1]<ChartMin_) then ChartMin_:=CurrentSource2[i-1];   //Actual
        if (CurrentSource2[i-1]>ChartMax_) then ChartMax_:=CurrentSource2[i-1];   //Actual
        if (TargetSource3[i-1]<ChartMin_) then ChartMin_:=TargetSource3[i-1];    //List1
        if (TargetSource3[i-1]>ChartMax_) then ChartMax_:=TargetSource3[i-1];    //List1
        if (TargetSource4[i-1]<ChartMin_) then ChartMin_:=TargetSource4[i-1];    //List2
        if (TargetSource4[i-1]>ChartMax_) then ChartMax_:=TargetSource4[i-1];    //List2
      end;

    finally
      // Always free the object
      MyIni.Free;

      ChartMin_:=ChartMin_-1;
      ChartMax_:=ChartMax_+1;

      Chart7.Extent.YMin:=ChartMin_;
      Chart7.Extent.YMax:=ChartMax_;
      Chart7.ExtentSizeLimit.YMin:=ChartMin_;
      Chart7.ExtentSizeLimit.YMax:=ChartMax_;
    end;
  end
  else
  begin
    Showmessage('File not found');
  end;
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
begin
  timer1.Enabled:=false;
  Application.ProcessMessages;
  if (PageControl1.TabIndex=2) then
  begin

  updatePhoto(MouseX,MouseY);



  end;
  timer1.Enabled:=true;
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

