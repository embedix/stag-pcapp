unit grafikon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, CheckLst,math, ComCtrls, bsPolyglotUn;

type
  TfrmGVD = class(TForm)
    ScrollBox: TScrollBox;
    btnKonec: TButton;
    btnSave: TButton;
    btnDraw: TButton;
    GroupBox1: TGroupBox;
    lbIOBody: TCheckListBox;
    GroupBox2: TGroupBox;
    lbStanice: TCheckListBox;
    Animate: TAnimate;
    lblStav: TLabel;
    ProgressBar: TProgressBar;
    SaveDialog: TSaveDialog;
    bsPolyglotTranslator: TbsPolyglotTranslator;
    img: TImage;
    cbViceMista: TCheckBox;
    procedure btnSaveClick(Sender: TObject);
    procedure btnDrawClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnKonecClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Incpr(Sender: TObject; Stage: TProgressStage; PercentDone: Byte; RedrawNow: Boolean; const R: TRect; const Msg: string);
  end;

var
  frmGVD: TfrmGVD;

implementation
uses main, JPEG, gvd;


{$R *.dfm}

procedure TfrmGVD.Incpr(Sender: TObject; Stage: TProgressStage; PercentDone: Byte; RedrawNow: Boolean; const R: TRect; const Msg: string);
begin
 frmGVD.ProgressBar.Position:=PercentDone;
 frmGVD.ProgressBar.Update;
end;


procedure TfrmGVD.btnSaveClick(Sender: TObject);
var jpg:TJPEGImage;
begin
 if SaveDialog.execute then begin
  btnDraw.Click;
  ProgressBar.Max:=100;
  jpg:=TJPEGImage.Create;
  jpg.Assign(img.Picture.Graphic);
  jpg.OnProgress:=Incpr;
  jpg.CompressionQuality:=73;
  jpg.ProgressiveEncoding:=true;
  jpg.Compress;
  jpg.SaveToFile(SaveDialog.FileName);
  jpg.free;
 end;
end;

function TimeToX(t:Ttime):integer;
begin
 result:=30+round(frac(t)*80*24);
end;

procedure TypCary(spoj:TSpoj;pen:TPen);
begin
 pen.color:=clBlack;pen.Width:=1;
 pen.Style:=psSolid;
 if (spoj.typ='R') or (spoj.typ='Ex') or (spoj.typ='EC') or
    (spoj.typ='IC') or (spoj.typ='SC') or (spoj.typ='NEx') then pen.Width:=2;
 if (spoj.typ='Lv') then pen.Style:=psDash;
end;

procedure Usek(n:string;var h:integer);
var i,p,maxv:integer;
    sl:TStringList;
begin
 with frmGVD.img.Canvas do begin
 font.Name:='Arial';
 h:=h+4;
 //text nadpisu
 font.Size:=14;
 TextOut(40,h,'Pøíjezdy a odjezdy z/do '+n);
 h:=h+24;
 font.Size:=9;
 h:=h+20;
 //texty hodin
 for i:=0 to 24 do TextOut(25+i*80,h,inttostr(i)+':00');
 //svisla mrizka
 h:=h+18;
 Pen.Color:=clMaroon;
 Pen.Width:=2;
 pen.Style:=psSolid;
 for i:=0 to 24 do Polyline([Point(30+i*80,h-3),Point(30+i*80,h+70)]);
 Pen.Width:=1;
 for i:=0 to 23 do Polyline([Point(30+i*80+40,h),Point(30+i*80+40,h+70)]);
 pen.Style:=psDash;
 for i:=0 to 23 do Polyline([Point(30+i*80+13,h),Point(30+i*80+13,h+70)]);
 for i:=0 to 23 do Polyline([Point(30+i*80+27,h),Point(30+i*80+27,h+70)]);
 for i:=0 to 23 do Polyline([Point(30+i*80+53,h),Point(30+i*80+53,h+70)]);
 for i:=0 to 23 do Polyline([Point(30+i*80+67,h),Point(30+i*80+67,h+70)]);
 //vodorovna mrizka
 Pen.Color:=clMaroon;
 Pen.Width:=2;
 pen.Style:=psSolid;
 Polyline([Point(30-3,h),Point(30+24*80,h)]);
 Polyline([Point(30-3,h+70),Point(30+24*80,h+70)]);
 //popisy vlevo
 TextOut(4,h-5,'obl.');
 TextOut(4,h+75,n);
 //vlaky
 n:=AnsiUpperCase(trim(copy(n,1,pos('(',n)-1)));
 font.Size:=7;
 p:=1;
 sl:=TStringList.Create;
 for i:=0 to JR.count-1 do begin
   sl.Delimiter:=',';
   sl.DelimitedText:=(JR.Items[i] as TSpoj).razeni;
   if sl.Values['maxv']<>'' then maxv:=strtoint(sl.Values['maxv']) else maxv:=50;
  //vlak Z
  if (not (JR.Items[i] as TSpoj).vznika) and
   (AnsiUpperCase((JR.Items[i] as TSpoj).smerprijezdu)=n) then begin
   //vykreslime
   //urcit typ cary
   TypCary((JR.Items[i] as TSpoj),pen);

   Polyline([Point(min(30+24*80,TimeToX((JR.Items[i] as TSpoj).odjezdsem+(60/maxv)*(5/1440))),h),Point(TimeToX((JR.Items[i] as TSpoj).odjezdsem),h+70)]);
   if p=0 then p:=1 else p:=0;
   TextOut(TimeToX((JR.Items[i] as TSpoj).odjezdsem)-10,h+75+10*p,inttostr((JR.Items[i] as TSpoj).cislo));
  end;
  //vlak DO
  if (not (JR.Items[i] as TSpoj).konci) and
   (AnsiUpperCase((JR.Items[i] as TSpoj).smerodjezdu)=n) then begin
   //urcit typ cary
   TypCary((JR.Items[i] as TSpoj),pen);
   Polyline([Point(max(30,TimeToX((JR.Items[i] as TSpoj).odjezdpryc-(5/1440))),h),Point(TimeToX((JR.Items[i] as TSpoj).odjezdpryc),h+70)]);
   if p=0 then p:=1 else p:=0;
   TextOut(TimeToX((JR.Items[i] as TSpoj).odjezdpryc)-10,h-40+10*p,inttostr((JR.Items[i] as TSpoj).cislo));

  end;
 end;
 end;
 sl.Free;
 h:=h+100;
end;


procedure Stanice(n:string;var h:integer);
var i,j,vyska,nmax,x,y:integer;
    uzite:array[0..2000] of boolean;
    sl:TStringList;         vpole:integer;
begin
 if frmGVD.cbViceMista.Checked then vpole:=30 else vpole:=15;
 sl:=TStringList.Create;
 with frmGVD.img.Canvas do begin
 font.Name:='Arial';
 h:=h+4;
 //text nadpisu
 font.Size:=14;
 TextOut(40,h,'Odjezdy z '+n);
 h:=h+24;
 font.Size:=9;
 h:=h+20;
 //texty hodin
 for i:=0 to 24 do TextOut(25+i*80,h,inttostr(i)+':00');
 //svisla mrizka
 h:=h+14;
 Pen.Color:=clMaroon;
 Pen.Width:=2;
 pen.Style:=psSolid;
 nmax:=0;
 for i:=0 to 2000 do uzite[i]:=false;
 //najdi pocet pouzivanych koleji ve stanici
 try
 for i:=0 to JR.Count-1 do with (JR.Items[i] as TSpoj) do
  for j:=0 to length(zastavky)-1 do
   if (zastavky[j].stanice=n) and (trim(zastavky[j].kolej)<>'') then
    uzite[strtoint(zastavky[j].kolej)]:=true;
 except
  on E:Exception do showmessage('Cisla koleje v seznamu zastavek musi byt cisla 0 - 2000, bez pismen.');
 end;
 nmax:=0;
 for i:=0 to 2000 do if uzite[i] then begin
  inc(nmax);
  sl.add(inttostr(i));
 end; 
 vyska:=nmax*vpole+15+15;
 pen.Color:=clGreen;
 for i:=0 to 24 do Polyline([Point(30+i*80,h-3),Point(30+i*80,h+vyska)]);
 Pen.Width:=1;
 for i:=0 to 23 do Polyline([Point(30+i*80+40,h),Point(30+i*80+40,h+vyska)]);
 pen.Style:=psDash;
 pen.Color:=RGB(230,230,230);
 for i:=0 to 23 do Polyline([Point(30+i*80+13,h),Point(30+i*80+13,h+vyska)]);
 for i:=0 to 23 do Polyline([Point(30+i*80+27,h),Point(30+i*80+27,h+vyska)]);
 for i:=0 to 23 do Polyline([Point(30+i*80+53,h),Point(30+i*80+53,h+vyska)]);
 for i:=0 to 23 do Polyline([Point(30+i*80+67,h),Point(30+i*80+67,h+vyska)]);
 //vodorovna mrizka
 Pen.Color:=clMaroon;
 Pen.Width:=2;
 pen.Style:=psSolid;
 Polyline([Point(30-3,h),Point(30+24*80,h)]);
 Polyline([Point(30-3,h+vyska),Point(30+24*80,h+vyska)]);
 Pen.Color:=clGray;
 Pen.Width:=1;
 Pen.Style:=psDot;
 for i:=1 to nmax do begin
   Polyline([Point(30-2,h+i*vpole),Point(30+24*80,h+i*vpole)]);
   //popisy vlevo
   TextOut(4,h+i*vpole-6,sl[i-1]);
 end;
 //vlaky
 font.Size:=7;
 Pen.Color:=clBlack;
 Pen.Width:=2;
 Pen.Style:=psSolid;
 for i:=0 to JR.count-1 do begin
  //vlak
  with JR.Items[i] as TSpoj do
   for j:=0 to length(zastavky)-1 do
    if zastavky[j].stanice=n then begin
     if (typ='Ex') or (typ='R') or (typ='EC')
     or (typ='IC') or (typ='SC') then Pen.Color:=clRed else
     if (typ='Pn') or (typ='Pv') or (typ='Rn') or (typ='Sn') or (typ='NEx') then
     pen.color:=clBlue else Pen.Color:=clBlack;
     y:=h+(sl.IndexOf(zastavky[j].kolej)+1) *vpole;
     x:=TimeToX(zastavky[j].odjezd);
     brush.Style:=bsClear;
     //koncici vlaky plnym koleckem - vnitrek cerveny
     if (konci) and (j=length(zastavky)-1) then begin
      brush.color:=clRed;
      brush.Style:=bsSolid;
     end;
     //vychozi vlaky plnym koleckem - vnitrek zeleny
     if (vznika) and (j=0) then begin
      brush.color:=clGreen;
      brush.Style:=bsSolid;
     end;

     Ellipse(x-4,y-4,x+4,y+4);
     brush.Style:=bsClear;
     TextOut(x-7+ifthen(vpole<20,15,0),y-5+ifthen(vpole>20,15,0),inttostr(cislo));
    end;
 end;
 end;
 h:=h+vyska+30;
 sl.Free;
end;


procedure TfrmGVD.btnDrawClick(Sender: TObject);
var i,h:integer;
begin
 ProgressBar.Position:=0;
 Animate.active:=true;
 img.Height:=5000;
 with img.Canvas do begin
  Brush.Color:=clWhite;
  Brush.Style:=bsSolid;
  Rectangle(0,0,img.Width,img.Height);
  Brush.Color:=clWhite;
  Brush.Style:=bsSolid;
  Rectangle(0,0,img.Width,img.Height);
  img.Repaint;
  //vykreslime jednotlive tratove useky
  h:=0;
  ProgressBar.Max:=lbIOBody.Items.Count+lbStanice.Items.Count;
  for i:=0 to lbIOBody.Items.Count-1 do begin
   if lbIOBody.Checked[i] then Usek(lbIOBody.items[i],h);
   ProgressBar.Position:=i+1;
   ProgressBar.Update;
  end;
  //nastupiste
  for i:=0 to lbStanice.Items.Count-1 do begin
   if lbStanice.Checked[i] then Stanice(lbStanice.items[i],h);
   ProgressBar.Position:=lbIOBody.Items.Count+i;
   ProgressBar.Update;
  end;
 end;
 img.Height:=h+40;
 if h=0 then Showmessage('Nebylo co vykreslit!');
 ProgressBar.Position:=   ProgressBar.max;
 ProgressBar.Update;
 Animate.active:=false;
 img.Picture.Graphic.Height:=h+40;
end;

procedure TfrmGVD.FormCreate(Sender: TObject);
var i:integer;
begin
 bsPolyglotTranslator.Translate;
 lbIOBody.Items.Assign(frmMain.cbPrijezdSmer.Items);
 lbStanice.Items.Assign(frmMain.cbStanice.Items);
 for i:=0 to lbIOBody.items.count-1 do lbIOBody.Checked[i]:=true;
 for i:=0 to lbStanice.items.count-1 do lbStanice.Checked[i]:=true;
end;

procedure TfrmGVD.btnKonecClick(Sender: TObject);
begin
 Close;
end;

end.
