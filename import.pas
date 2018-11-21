unit import;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Spin, StdCtrls, ExtCtrls, ComCtrls;

type
  TfrmImport = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    btnZpracOdj: TButton;
    cbSmery: TComboBox;
    Label4: TLabel;
    cbZeStanice: TComboBox;
    edKolej: TEdit;
    Label5: TLabel;
    rgKam: TRadioGroup;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    seCasJizdy: TSpinEdit;
    OpenDialog: TOpenDialog;
    Label8: TLabel;
    Label9: TLabel;
    btnZpracPrij: TButton;
    cbZeSmeru: TComboBox;
    seCasPrijezdu: TSpinEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    cbPrijede: TComboBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    cb3Ze: TComboBox;
    Label18: TLabel;
    cb3Do: TComboBox;
    btnKoncici: TButton;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Button1: TButton;
    memConsole: TMemo;
    procedure FormShow(Sender: TObject);
    procedure rgKamClick(Sender: TObject);
    procedure btnZpracOdjClick(Sender: TObject);
    procedure btnZpracPrijClick(Sender: TObject);
    procedure btnKonciciClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImport: TfrmImport;

implementation
uses main,gvd;
{$R *.dfm}

type TTypHlasky=(thOK,thPoznamka,thChyba,thVarovani);

procedure Console(typ:TTypHlasky;s:string);
begin
 with frmImport do begin
  case typ of
   thOK:begin
         s:='>>OK: '+s;
        end;
   thPoznamka:begin
         s:='      '+s;
        end;
   thChyba:begin
         s:='>>CHYBA: '+s;
        end;
   thVarovani:begin
         s:='>>POZOR: '+s;
        end;
  end;
  memConsole.Lines.Add(s);
 end;
end;

procedure TfrmImport.FormShow(Sender: TObject);
begin
 cbZeSmeru.Items.AddStrings(IOList.GetIOList2);
 cbZeStanice.clear;
 cbZeStanice.Items.AddStrings(JR.stanice);
 cbPrijede.clear;
 cbPrijede.Items.AddStrings(JR.stanice);
 cb3Ze.clear;
 cb3Ze.Items.AddStrings(JR.stanice);
 cb3Do.clear;
 cb3Do.Items.AddStrings(JR.stanice);
 rgKamClick(sender);
end;

procedure TfrmImport.rgKamClick(Sender: TObject);
begin
 cbSmery.Clear;
 if rgKam.ItemIndex=0 then cbSmery.Items.AddStrings(cbZeStanice.Items) else
 cbSmery.Items.AddStrings(IOList.GetIOList2);
 seCasJizdy.Enabled:=rgKam.ItemIndex=1;
 Label3.Enabled:=rgKam.ItemIndex=1;
 Label6.Enabled:=rgKam.ItemIndex=1;
 Label7.Enabled:=rgKam.ItemIndex=1;
end;

procedure TfrmImport.btnZpracOdjClick(Sender: TObject);
var sl:TStringList;i,j:integer;sg:string;
    odjezdc:string;typ:string;cislo:integer;konecna:string;datumove:string;
    spoj:TSpoj;pridejzast,uzne:boolean;tz:TZastavka;
begin
 if (cbSmery.ItemIndex<0) or (cbZeStanice.ItemIndex<0) then begin
  Console(thChyba,'Nektere pole neni vyplnene.');
  exit;
 end;


 if OpenDialog.Execute then begin
  sl:=TStringList.Create;
  sl.LoadFromFile(opendialog.FileName);
  //preskoc prvnich 6 radku
  for i:=7 to sl.count-1 do begin
   sg:=sl[i];
   if sg[1]='*' then continue; //datumova poznamka
   if sg[1]='=' then break; //konec - dvojcara
   //v sg jsou data nejakeho vlaku
   //rozdelime data
   odjezdc:=trim(copy(sg,1,5));
   //kontrola jestli je v odjezdc cas
   if sg[3]<>':' then begin
    Console(thVarovani,'VAROVANI: datumova poznamka delsi nez 1 radek - jeji cast nebo cela bude ignorovana.');
    continue;
   end;
   typ:=trim(copy(sg,7,2));
   cislo:=strtoint(trim(copy(sg,9,pos(' ',copy(sg,10,6)))));
   konecna:=trim(copy(sg,30,20));
   datumove:='1-7';
   if (i<(sl.count-1)) and (sl[i+1][1]='*') then datumove:=trim(copy(sl[i+1],2,200));
   Console(thPoznamka,  typ+' '+inttostr(cislo)+' -> '+konecna+' @ '+odjezdc+'  '+datumove);
   //mame data vlaku
   //existuje jiz tento vlak?
   if JR.JeVlak(cislo) then begin
    //vlak existuje
    spoj:=JR.GetVlak(cislo);
   end else begin
    //vlak neexistuje, zalozime ho
    spoj:=TSpoj.Create;
    spoj.cislo:=cislo;
    spoj.typ:=typ;
    spoj.jednotka:=false;
    spoj.zastavuje:=typ='Os';
    spoj.vznika:=true;
    spoj.smerprijezdu:='';
    spoj.odjezdsem:=0;
    setlength(spoj.zastavky,0);
    spoj.konci:=true;
    spoj.smerodjezdu:='';
    spoj.oznamenismeruodjezdu:=konecna;
    spoj.oznamenismeruprijezdu:='';
    spoj.odjezdpryc:=0;
    spoj.novecislo:=0;
    spoj.naposun:=false;
    spoj.vystup:=true;
    spoj.kdyjede:=datumove;
    JR.Add(spoj);
   end;
   //pridame zastavku
   pridejzast:=true;
   for j:=0 to length(spoj.zastavky)-1 do if
    trim(cbZeStanice.Items.Names[cbZeStanice.itemindex])=
     trim(spoj.zastavky[j].stanice) then pridejzast:=false;
   if pridejzast then begin
    SetLength(spoj.zastavky,length(spoj.zastavky)+1);
    with spoj.zastavky[length(spoj.zastavky)-1] do begin
     stanice:=cbZeStanice.Items.Names[cbZeStanice.itemindex];
     kolej:=edKolej.Text;
     odjezd:=strtotime(odjezdc);
    end;
    //seradime zastavky
    if length(spoj.zastavky)>1 then begin
     repeat
      uzne:=true;
      for j:=0 to length(spoj.zastavky)-2 do begin
       if spoj.zastavky[j].odjezd>spoj.zastavky[j+1].odjezd then begin
        tz:=spoj.zastavky[j];
        spoj.zastavky[j]:=spoj.zastavky[j+1];
        spoj.zastavky[j+1]:=tz;
        uzne:=false;
       end;
      end;
     until uzne;
    end;
   end;
   //pokud mame navoleny smer do smerove stanice, nastavime
   //odjezd vlaku tam
   if rgKam.ItemIndex=1 then begin
    spoj.konci:=false;
    spoj.smerodjezdu:=cbSmery.Items.Names[cbSmery.itemindex];
    spoj.odjezdpryc:=strtotime(odjezdc)+seCasJizdy.value/1440;
   end;

  end;

  sl.free;
 end;
 frmMain.mObnovitClick(sender);

end;

procedure TfrmImport.btnZpracPrijClick(Sender: TObject);
var sl:TStringList;i:integer;sg:string;
    prijezdc:string;typ:string;cislo:integer;konecna:string;datumove:string;
    spoj:TSpoj;
begin
 if (cbZeSmeru.ItemIndex<0) or (cbPrijede.ItemIndex<0) then begin
  Console(thChyba,'Nektere pole neni vyplnene.');
  exit;
 end;
 if OpenDialog.Execute then begin
  sl:=TStringList.Create;
  sl.LoadFromFile(opendialog.FileName);
  //preskoc prvnich 6 radku
  for i:=7 to sl.count-1 do begin
   sg:=sl[i];
   if sg[1]='*' then continue; //datumova poznamka
   if sg[1]='=' then break; //konec - dvojcara
   //v sg jsou data nejakeho vlaku
   //rozdelime data
   if sg[3]<>':' then begin
    Console(thVarovani,'VAROVANI: datumova poznamka delsi nez 1 radek - jeji cast nebo cela bude ignorovana.');
    continue;
   end;
   prijezdc:=trim(copy(sg,1,5));
   typ:=trim(copy(sg,7,2));
   cislo:=strtoint(trim(copy(sg,9,pos(' ',copy(sg,10,6)))));
   konecna:=trim(copy(sg,30,20));
   datumove:='1-7';
   if (i<(sl.count-1)) and (sl[i+1][1]='*') then datumove:=trim(copy(sl[i+1],2,200));
   Console(thPoznamka,  typ+' '+inttostr(cislo)+' << '+konecna+' @ '+prijezdc+'  '+datumove);
   //mame data vlaku
   //existuje jiz tento vlak?
   if JR.JeVlak(cislo) then begin
    //vlak existuje
    spoj:=JR.GetVlak(cislo);
   end else begin
    //vlak neexistuje, zalozime ho - takovyto vlak hned konci ve stanici,
    //kam vjede - musime mu tu stanici pridat
    spoj:=TSpoj.Create;
    spoj.cislo:=cislo;
    spoj.typ:=typ;
    spoj.jednotka:=false;
    spoj.zastavuje:=typ='Os';
    spoj.vznika:=false;
    spoj.smerprijezdu:='';
    spoj.odjezdsem:=0;
    setlength(spoj.zastavky,1);
    spoj.konci:=true;
    spoj.smerodjezdu:='';
    spoj.oznamenismeruodjezdu:='';
    spoj.odjezdpryc:=0;
    spoj.novecislo:=0;
    spoj.naposun:=false;
    spoj.vystup:=true;
    spoj.kdyjede:=datumove;
    with spoj.zastavky[length(spoj.zastavky)-1] do begin
     stanice:=cbPrijede.Items.Names[cbPrijede.itemindex];
     kolej:=edKolej.Text;
     odjezd:=strtotime(prijezdc);
    end;
    JR.Add(spoj);
   end;
   //nastavime, odkud vlak prijel
   spoj.vznika:=false;
   spoj.oznamenismeruprijezdu:=konecna;
   spoj.smerprijezdu:=cbZeSmeru.Items.Names[cbZeSmeru.itemindex];
   spoj.odjezdsem:=strtotime(prijezdc)+1-seCasPrijezdu.Value/1440;
   

   //pokud mame navoleny smer do smerove stanice, nastavime
   //odjezd vlaku tam
   if rgKam.ItemIndex=0 then begin
    spoj.konci:=false;
    spoj.smerodjezdu:=cbPrijede.Items.Names[cbPrijede.itemindex];
    spoj.odjezdpryc:=strtotime(prijezdc);
   end;

  end;

  sl.free;
 end;
 frmMain.mObnovitClick(sender);
end;

procedure TfrmImport.btnKonciciClick(Sender: TObject);
var sl:TStringList;i,j:integer;sg:string;
    odjezdc:string;typ:string;cislo:integer;konecna:string;datumove:string;
    spoj:TSpoj;pridejzast,uzne:boolean;tz:TZastavka;
begin
 if (cb3Do.ItemIndex<0) or (cb3Ze.ItemIndex<0) then begin
  Console(thChyba,'Nektere pole neni vyplnene.');
  exit;
 end;
 if cb3Do.ItemIndex=cb3Ze.ItemIndex then begin
  Console(thChyba,'Prekryti obsahu poli Ze stanice a Do stanice.');
  exit;
 end;

 if OpenDialog.Execute then begin
  sl:=TStringList.Create;
  sl.LoadFromFile(opendialog.FileName);
  //preskoc prvnich 6 radku
  for i:=7 to sl.count-1 do begin
   sg:=sl[i];
   if sg[1]='*' then continue; //datumova poznamka
   if sg[1]='=' then break; //konec - dvojcara
   //v sg jsou data nejakeho vlaku
   //rozdelime data
   if sg[3]<>':' then begin
    Console(thVarovani,'VAROVANI: datumova poznamka delsi nez 1 radek - jeji cast nebo cela bude ignorovana.');
    continue;
   end;
   odjezdc:=trim(copy(sg,1,5));
   typ:=trim(copy(sg,7,2));
   cislo:=strtoint(trim(copy(sg,9,pos(' ',copy(sg,10,6)))));
   konecna:=trim(copy(sg,30,20));
   datumove:='1-7';
   if (i<(sl.count-1)) and (sl[i+1][1]='*') then datumove:=trim(copy(sl[i+1],2,200));
   Console(thPoznamka,  typ+' '+inttostr(cislo)+' -> '+konecna+' @ '+odjezdc+'  '+datumove);
   //mame data vlaku
   //existuje jiz tento vlak?
   if JR.JeVlak(cislo) then begin
    //vlak existuje
    spoj:=JR.GetVlak(cislo);
    //POZOR - vetsina vlaku je v tomto okamziku jiz v poradku.
    //opravdu budeme tento vlak menit???
    //musi 1] mit posl. zastavku ve stanici :ze stanice:
    //     2] koncit
    //     3] nemit tuto stanici v JR
    if (spoj.konci) and (spoj.zastavky[length(spoj.zastavky)-1].stanice=
     cb3Ze.Items.Names[cb3Ze.ItemIndex]) then begin
      //pridame zastavku? Nesmi tam uz byt.
      pridejzast:=true;
      for j:=0 to length(spoj.zastavky)-1 do if
       trim(cb3Do.Items.Names[cb3Do.itemindex])=
        trim(spoj.zastavky[j].stanice) then pridejzast:=false;
      if pridejzast then begin
      spoj.oznamenismeruprijezdu:=konecna;
      SetLength(spoj.zastavky,length(spoj.zastavky)+1);
      with spoj.zastavky[length(spoj.zastavky)-1] do begin
       stanice:=cb3Do.Items.Names[cb3Do.itemindex];
       kolej:=edKolej.Text;
       odjezd:=strtotime(odjezdc);
      end;
      //seradime zastavky
      if length(spoj.zastavky)>1 then begin
       repeat
        uzne:=true;
        for j:=0 to length(spoj.zastavky)-2 do begin
         if spoj.zastavky[j].odjezd>spoj.zastavky[j+1].odjezd then begin
          tz:=spoj.zastavky[j];
          spoj.zastavky[j]:=spoj.zastavky[j+1];
          spoj.zastavky[j+1]:=tz;
          uzne:=false;
         end;
        end;
       until uzne;
      end;
     end;
    end;


   end else
    //vlak neexistuje, coz by teda nemel - vypiseme do konzole a kaslem na nej
    COnsole(thVarovani,  'Vlak '+typ+' '+inttostr(cislo)+' neexistuje, aèkoliv mìl'
    + 'být zanesen již v kroku è. 1 - postupujete opravdu správnì?');
  end;
  sl.free;
 end;
 frmMain.mObnovitClick(sender);

end;


end.
