unit main;

{Napoveda je v Editor-readme.txt}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Buttons, ComCtrls, ExtCtrls, StdCtrls, Mask, gvd, shellapi,
  StrUtils, Spin, inifiles, Registry, TrainImages, Math, ToolWin, ImgList,
  bsPolyglotUn, IcXMLParser, filectrl, starting, XPMenu, trtable, kontrola;

type
  TfrmMain = class(TForm)
    MainMenu: TMainMenu;
    mOblast: TMenuItem;
    Nastoblast1: TMenuItem;
    EditovatoblastBuilder1: TMenuItem;
    N1: TMenuItem;
    Importovatjzdnd1: TMenuItem;
    Exportjzdnhodu1: TMenuItem;
    N2: TMenuItem;
    Konec1: TMenuItem;
    Nastavenoblasti1: TMenuItem;
    Vstupyavstupy1: TMenuItem;
    Uloitoblast1: TMenuItem;
    Uloitoblastjako1: TMenuItem;
    Oprogramu1: TMenuItem;
    Splitter: TSplitter;
    pnlSpoj: TPanel;
    Panel1: TPanel;
    lvSpoje: TListView;
    btnSmazVlak: TSpeedButton;
    btnRazeniViceVlaku: TSpeedButton;
    Label1: TLabel;
    lblCisloVlaku: TLabel;
    Label2: TLabel;
    cbTypVlaku: TComboBox;
    cbJednotka: TCheckBox;
    btnPriradCislo: TButton;
    btnVlozVlak: TButton;
    pcVznik: TPageControl;
    tsPrijizdi: TTabSheet;
    tsVznika: TTabSheet;
    pcZanik: TPageControl;
    tsOdjizdi: TTabSheet;
    tsKonci: TTabSheet;
    Label3: TLabel;
    lvZastavky: TListView;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    eOdjezd: TMaskEdit;
    Label7: TLabel;
    cbOdjSmer: TComboBox;
    Label8: TLabel;
    cbOznamSmerOdj: TComboBox;
    cbKolej: TComboBox;
    cbStanice: TComboBox;
    Staniceazastvky1: TMenuItem;
    btnZPridej: TButton;
    btnZSmaz: TButton;
    btnZSmazVse: TButton;
    Label9: TLabel;
    cbPrijezdSmer: TComboBox;
    Label10: TLabel;
    Label11: TLabel;
    cbNaPosun: TCheckBox;
    Label12: TLabel;
    Label13: TLabel;
    cbNoveCislo: TComboBox;
    Label14: TLabel;
    eOdjCas: TMaskEdit;
    Label15: TLabel;
    cbJedeV: TComboBox;
    cbOznamSmerPrij: TComboBox;
    Label16: TLabel;
    cbZastavky: TCheckBox;
    OpenDialog: TOpenDialog;
    ePrijOdjSousedni: TMaskEdit;
    mObnovit: TMenuItem;
    btnZUlozZmenu: TButton;
    pnlInfo: TPanel;
    mReload: TMenuItem;
    cbCestujici: TCheckBox;
    Splitter1: TSplitter;
    N3: TMenuItem;
    Kontrolasprvnosti1: TMenuItem;
    lbConsole: TMemo;
    SaveJRDialog: TSaveDialog;
    GroupBox1: TGroupBox;
    Label17: TLabel;
    sbHodiny: TSpinButton;
    sbMinuty: TSpinButton;
    N4: TMenuItem;
    Nastaveneditoru1: TMenuItem;
    Oprogramu2: TMenuItem;
    Npovda1: TMenuItem;
    N5: TMenuItem;
    btnRazeni: TButton;
    StatusBar: TStatusBar;
    btnAuto: TButton;
    cbRazeni: TComboBox;
    ToolBar1: TToolBar;
    btnOpen: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ImageList1: TImageList;
    ToolButton9: TToolButton;
    mNadMRU: TMenuItem;
    LangManager: TbsPolyglotManager;
    Translator: TbsPolyglotTranslator;
    mLanguage: TMenuItem;
    mGrafikon: TMenuItem;
    Importovatoblastzgvd1: TMenuItem;
    OpenXMLDialog: TOpenDialog;
    N7: TMenuItem;
    mNahodna: TMenuItem;
    Novinky1: TMenuItem;
    SaveDialog: TSaveDialog;
    btnEdPoz: TButton;
    Datumovpoznmky1: TMenuItem;
    Automatickpiazendatumovchpoznmek1: TMenuItem;
    N6: TMenuItem;
    lblDPInfo: TLabel;
    N8: TMenuItem;
    Koprujazenvlakdojinstanice1: TMenuItem;
    btnDaily: TButton;
    edPoznamka: TEdit;
    Label18: TLabel;
    lbRazSez: TListBox;
    Label19: TLabel;
    Pepikolejitstanicejinm1: TMenuItem;
    Zmnasekcgrafikonu1: TMenuItem;
    cbSvaz: TCheckBox;
    cbPovinna: TCheckBox;
    mNovyVl: TMemo;
    mVznikZ: TMemo;
    btnNaPosun: TButton;
    Label20: TLabel;
    edTrainName: TEdit;
    PopupMenu1: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    N9: TMenuItem;
    Seaditpodle1: TMenuItem;
    slavlaku2: TMenuItem;
    Smrupjezdu2: TMenuItem;
    Smruodjezdu2: TMenuItem;
    ypuvlaku2: TMenuItem;
    asupjezdu2: TMenuItem;
    N10: TMenuItem;
    UpdateVOZYINIzInternetu1: TMenuItem;
    XPMenu: TXPMenu;
    cbVjSunuty: TCheckBox;
    abulkavlak1: TMenuItem;
    btnProhodOznameni: TButton;
    edHledac: TEdit;
    tmrSearch: TTimer;
    Editacespojtabulkou1: TMenuItem;
    procedure Oprogramu1Click(Sender: TObject);
    procedure Konec1Click(Sender: TObject);
    procedure Nastoblast1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cbTypVlakuChange(Sender: TObject);
    procedure cbPrijezdSmerChange(Sender: TObject);
    procedure cbOdjSmerChange(Sender: TObject);
    procedure btnVlozVlakClick(Sender: TObject);
    procedure btnPriradCisloClick(Sender: TObject);
    procedure mObnovitClick(Sender: TObject);
    procedure lvSpojeDblClick(Sender: TObject);
    procedure btnZSmazVseClick(Sender: TObject);
    procedure lvZastavkyCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure lvZastavkyClick(Sender: TObject);
    procedure btnZSmazClick(Sender: TObject);
    procedure btnZUlozZmenuClick(Sender: TObject);
    procedure btnZPridejClick(Sender: TObject);
    procedure lvZastavkyEditing(Sender: TObject; Item: TListItem;
      var AllowEdit: Boolean);
    procedure Uloitoblast1Click(Sender: TObject);
    procedure btnSmazVlakClick(Sender: TObject);
    procedure Uloitoblastjako1Click(Sender: TObject);
    procedure EditovatoblastBuilder1Click(Sender: TObject);
    procedure mReloadClick(Sender: TObject);
    procedure lvSpojeColumnClick(Sender: TObject; Column: TListColumn);
    procedure lvSpojeCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure cbZastavkyClick(Sender: TObject);
    procedure Kontrolasprvnosti1Click(Sender: TObject);
    procedure lvSpojeInfoTip(Sender: TObject; Item: TListItem;
      var InfoTip: String);
    procedure lvSpojeKeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Vstupyavstupy1Click(Sender: TObject);
    procedure Exportjzdnhodu1Click(Sender: TObject);
    procedure Staniceazastvky1Click(Sender: TObject);
    procedure sbHodinyDownClick(Sender: TObject);
    procedure sbHodinyUpClick(Sender: TObject);
    procedure sbMinutyDownClick(Sender: TObject);
    procedure sbMinutyUpClick(Sender: TObject);
    procedure lvSpojeCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure cbTypVlakuDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure cbTypVlakuMeasureItem(Control: TWinControl; Index: Integer;
      var Height: Integer);
    procedure Nastaveneditoru1Click(Sender: TObject);
    procedure btnImportClick(Sender: TObject);
    procedure Npovda1Click(Sender: TObject);
    procedure lvSpojeCustomDrawSubItem(Sender: TCustomListView;
      Item: TListItem; SubItem: Integer; State: TCustomDrawState;
      var DefaultDraw: Boolean);
    procedure btnRazeniClick(Sender: TObject);
    procedure btnRazeniViceVlakuClick(Sender: TObject);
    procedure Editujvlak1Click(Sender: TObject);
    procedure Smavlak1Click(Sender: TObject);
    procedure NastavdlkuvlakuClick(Sender: TObject);
    procedure btnAutoClick(Sender: TObject);
    procedure Nastavautomatickyasvzniku1Click(Sender: TObject);
    procedure cbRazeniDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure cbRazeniMeasureItem(Control: TWinControl; Index: Integer;
      var Height: Integer);
    procedure FormShow(Sender: TObject);
    procedure mLanguageClick(Sender: TObject);
    procedure mGrafikonClick(Sender: TObject);
    procedure Importovatoblastzgvd1Click(Sender: TObject);
    procedure mNahodnaClick(Sender: TObject);
    procedure Novinky1Click(Sender: TObject);
    procedure mOblastClick(Sender: TObject);
    procedure mMRUListClick(Sender: TObject);
    procedure btnEdPozClick(Sender: TObject);
    procedure Automatickpiazendatumovchpoznmek1Click(Sender: TObject);
    procedure cbJedeVChange(Sender: TObject);
    procedure cbJedeVDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure Koprujazenvlakdojinstanice1Click(Sender: TObject);
    procedure btnDailyClick(Sender: TObject);
    procedure cbStaniceKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbStaniceChange(Sender: TObject);
    procedure lvZastavkyKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Zmnasekcgrafikonu1Click(Sender: TObject);
    procedure ePrijOdjSousedniChange(Sender: TObject);
    procedure cbPovinnaMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure cbNoveCisloChange(Sender: TObject);
    procedure LangManagerBeforeAllTranslate(Sender: TObject);
    procedure LangManagerAfterAllTranslate(Sender: TObject);
    procedure btnNaPosunClick(Sender: TObject);
    procedure RaditDle(Sender: TObject);
    procedure UpdateVOZYINIzInternetu1Click(Sender: TObject);
    procedure abulkavlak1Click(Sender: TObject);
    procedure btnProhodOznameniClick(Sender: TObject);
    procedure tmrSearchTimer(Sender: TObject);
    procedure Editacespojtabulkou1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PosunCasy(kolik:integer);
    procedure LoadFile(fn:string);
    procedure LoadFromXML(fn:string;vynutzmenu:boolean);
    procedure ReloadDatPozList;
    procedure updatevznik(spoj:integer);
  end;

var
  frmMain: TfrmMain;
  StagINI: Tmeminifile;
  opensfrommru:boolean;
var
  IOList:TIOList;
  JR:TGVD;
  change:boolean;
  path:string;
var  chyb:integer;
  

const Verze='1.22';
resourcestring
  _cantfind='Nelze najít soubor ''';
  _musthave='Každý soubor .gvd musí mít ve stejném adresáøi i soubor .dat kolejištì (vytvoøený v Builderu)'+#10#13+
              'se stejným jménem pøed pøíponou (brno.gvd a brno.dat); pokud jste uložili jen GVD pomocí'+#10#13+
              'funkce Ulož jako, zkopírujte soubor .dat s novým jménem ''';
  _autoxmlconv='Automaticky konvertuji do XML...';
  _wasconv='Byla proveden pøenos dat z .gvd do .';
  _warnnewvers='POZOR: v nové verze Stanièáøe používají datový formát ';
  _stagcantfind='STAG nenašel soubor ';
  _doktereho=', do kterého by mohl doplnit '+
   'data z pùvodního formátu .gvd! - program bude pokraèovat s pùvodním datovým formátem.';
  _novyformat='Stanièáø nyní používá nový datový formát .';
  _convnow='  Napøed proveïte konverzi dat v programu Stanièáø a poté pomocí nabídky '+
   'Soubor/Importovat oblast z .gvd importujte do nového formátu dat i jízdní øád. Pøejete si provést import z .gvd ihned?';
  _givetrno='Zadejte èíslo vlaku';
  _givetrno2='Zadejte èíslo vlaku (bez prefixu):';
  _badnum='Chybné zadání èísla: operace zrušena.';
  _lowerthan9='Èíslo vlaku musí být vyšší než 9: operace zrušena.';
  _notrt='Není zadán typ vlaku: operace zrušena.';
  _errt='Chybné zadání èasu pøíjezdu: operace zrušena.';
  _nofr='Není zadána stanice, odkud vlaku pøijede: operace zrušena.';
  _noto='Není zadána stanice, kam vlak pojede: operace zrušena.';
  _toerr='Chybné zadání èasu odjezdu pryè: operace zrušena.';
  _nostop='Vlak, který zde konèí, musí mít alespoò jednu zastávku: operace zrušena.';
  _badnext='Zadáno neplatné èíslo vlaku, na který se má vlak po skonèení'+
     ' jízdy zmìnit. Vlaku bude zmìnìn na posun bez urèeného èísla vlaku.';
  _badtimez='Špatnì zadaný èas v seznamu zastávek: operace zrušena.';
  _overt='Vlak s tímto èíslem již existuje. Pøepsat?';
  _newtrn='Nastavte nové èíslo vlaku';
  _nointeger='Zadaná hodnota není celé èíslo - operace zrušena.';
  _topos='<posun>';
  _starts='zaèíná';
  _ends='konèí ';
  _trains=' vlakù';
  _tgvde='Chyba - nelze najit vlak tohoto cisla v TGVD.';
  _cantrec='Nelze prepocitat cas opusteni oblasti - spatny format';
  _saved='Uloženo.';
  _delete='Opravdu chcete smazat vybrané vlaky?';
  _deleted='Smazán vlak ';
  _changed='Zmìnìno ';
  _predupr='Pøed úpravou kolejištì je nutné je naèíst pomocí Oblast/Naèíst oblast.';
  _waitfor='Èekám na ukonèení úprav ve Stanièáøi...';
  _cantrun='Nelze spustit aplikaci';
  __lowerthan9='Èíslo vlaku je nižší než 10';
  _unknt='Neznámý typ vlaku.';
  _arrdir='Smìr pøíjezdu ';
  _notinthis=' není v tomto kolejišti';
  _depdir='Smìr odjezdu ';
  _trn='Vlak ';
  _nextnot=' který má vzniknout z tohoto vlaku není v JØ.';
  _badp='Vlak má chybnou (textovou?) datum. poznámku';
  _resultin='Výsledek: v ';
  _cons=' spojích ';
  _errs=' chyb.';
  _notsaved='Jízdní øád nebyl uložen. Chcete jej uložit?';
  _razeni='Øazení vlaku ';
  _changedb=' zmìnìno.';

  _notime='Chyba - není zadán žádný èas, ze kterého by šlo odvodit èas vzniku.';
  _notime2=' Èas vzniku nastaven na ';
  _pwr='Výkon ';
  _maxv='Max.rychlost ';
  _trlen='Délka vlaku ';
  _weight='Hmotnost ';
  _readingbmp='Naèítám obrázky vozù...';
  _loaded=' Naèteno ';
  _picts=' obrázkù vozù';
  _xmlneed='Tato funkce vyžaduje nový formát dat Stanièáøe (.';
  _xmln2='). Proveïte prosím konverzi dat (viz návod k editoru).';
  _hastosave='Musíte uložit nebo otevøít soubor pøed použitím této funkce';
  _prevodp='Opravdu chcete pøevést texty v datumových poznámkách na èísla datumových poznámek a '+
 'vygenerovat tabulku se seznamem nových poznámek?';
  _trans='Prevedeno ';
  _notes=' poznamek.';
  _trnres='Seznam datumových poznámek k doplnìní je uložen v souboru poznamky.txt, který '+
  'je umístìn ve stejném adresáøi, jako soubor XML stanice.';
  _plssave='Prosím, napøed uložte soubor.';
  _cantchgto='Nelze upravit cas odjezu z oblasti';
  _nexttrnoinfo='Nejsou žádné informace o pokraèujícím vlaku.';
  _nexttr='Vlak se mìní na: ';
  _vznikzerr='Nejsou žádné informace o pùvodním vlaku.';
  _vznikz='Vlak vzniká z: ';



implementation

uses io,stanice,properities, import,razeni, grafikon, LangSel, stagn,
  datumpoz,imp_raz, update;

var filename:string;
    ColumnToSort:integer;


// RESOURCESTRINGS
{$I resstr.pas}


{$R *.dfm}
{$R resource.res}

function GetS(name:string):string;
begin
end;

procedure TfrmMain.LoadFile(fn:string);
var i:integer;
begin
  lbConsole.Clear;
  //Nacita postaru - z .dat a .gvd

//  fn:=extractfilepath(fn)+copy(extractfilename(fn),1,pos('.',extractfilename(fn))-1)+'.dat';
  fn:=ChangeFileExt(fn,'.dat');
  //pokud neexistuje soubor .dat, vypadneme odsud
  if not FileExists(fn) then begin
   MessageDlg(_cantfind+fn+''''+#10#13+
              _musthave+ExtractFileName(fn)+'''',
              mtError,[mbOK],0);
   exit;
  end;
  //nacist soubor .dat
  IOList.LoadFromFile(fn);
  //pripravime JR
  JR.Clear;
  //do filename dame .gvd
//  filename:=extractfilepath(fn)+copy(extractfilename(fn),1,pos('.',extractfilename(fn))-1)+'.gvd';
  filename:=ChangeFileExt(fn,'.gvd');
  JR.LoadFromFile(filename);
  //obnov seznam
  mObnovit.Click;
  //nacti seznam stanic z .gvd
  cbStanice.Items.Clear;
  for i:=0 to JR.stanice.Count-1 do
   cbStanice.Items.Add(JR.stanice.Names[i]);
  mReload.Enabled:=true;
  //nastav comboboxy
  cbPrijezdSmer.Items.Assign(IOList.GetIOList);
  cbOdjSmer.Items.Assign(IOList.GetIOList);
  cbOznamSmerPrij.Items.Assign(IOList.GetPrijSmerList);
  cbOznamSmerOdj.Items.Assign(IOList.GetOdjSmerList);
  //mame nacteno, hned to ulozime v XML!
  if FileExists({copy(fn,1,pos('.',fn))+xmlsuffix}ChangeFileExt(fn,'.'+XMLsuffix)) then begin
   lbConsole.Lines.Add(_autoxmlconv);
   lbConsole.Refresh;
   Uloitoblast1Click(self);
   showmessage(_wasconv+xmlsuffix);
  end else begin
   showmessage(_warnnewvers+xmlsuffix+'.'+#13#10+
   _stagcantfind+ChangeFileExt(fn,'.'+xmlsuffix)+_doktereho);
   doc.Free;
  end;

end;

procedure TfrmMain.Oprogramu1Click(Sender: TObject);
begin
 showmessage('Editor GVD pro Stanièáøe (v. '+verze+')'+#10#13+
  '(c) 2003-4 Ivo Strasil, ivo.strasil@centrum.cz'+#10#13+
  'Souèást simulátoru Stanièáø (flint.vlaksim.com)'+#10#13+
  'zdrojové kódy dostupné na flint.vlaksim.com'+#10#13+
  ''+#10#13+
  'Program je šíøen pod Obecnou veøejnou licencí GNU'+#10#13+
  'Editor JØ je ABSOLUTNÌ BEZ ZÁRUKY; podrobnosti v soubor Editor-readme.txt'+#10#13+
  'Jde o volné programové vybavení a jeho šíøení za jistých podmínek '+
  'je vítáno.'+#10#13+
  ''+#10#13+
  'Pøeji pøíjemnou zábavu.'+#10#13#10#13+
  'Timetable Editor for Stanicar (v. '+verze+')'+#10#13+
  '(c) 2003-4 Ivo Strasil, ivo.strasil@centrum.cz'+#10#13+
  'Part of Stanicar simulator (flint.vlaksim.com)'+#10#13+
  'source code available na flint.vlaksim.com'+#10#13+
  ''+#10#13+
  'Timetable Editor comes with ABSOLUTELY NO WARRANTY; for details'+
  'read Editor-readme-english.txt'+#10#13+
  'This is free software, and you are welcome to redistribute it '+
  'under certain conditions.'+#10#13+
  ''+#10#13+
  'I wish you a lot of fun.'+#10#13  );
end;

procedure TfrmMain.Konec1Click(Sender: TObject);
begin
 Application.Terminate;
end;

procedure TfrmMain.loadfromxml;
var i:integer;
begin
//   filename:=extractfilepath(fn)+copy(extractfilename(fn),1,pos('.',extractfilename(fn))-1)+'.gvd';
   filename:=ChangeFileExt(fn,'.gvd');
//   fn:=extractfilepath(fn)+copy(extractfilename(fn),1,pos('.',extractfilename(fn))-1)+'.xml';
   fn:=ChangeFileExt(fn,'.xml');
   JR.LoadFromXML(fn,vynutzmenu);
   mObnovitClick(self);

   //nacti seznam stanic
   cbStanice.Items.Clear;
   for i:=0 to JR.stanice.Count-1 do
    cbStanice.Items.Add(JR.stanice.Names[i]);
   mReload.Enabled:=true;
   //nastav comboboxy
   cbPrijezdSmer.Items.Assign(IOList.GetIOList);
   cbOdjSmer.Items.Assign(IOList.GetIOList);
   cbOznamSmerPrij.Items.Assign(IOList.GetPrijSmerList);
   cbOznamSmerOdj.Items.Assign(IOList.GetOdjSmerList);
   ReloadDatPozList;
end;

procedure MRUListAdd(fn:string);
var i:integer;
begin
 //zjistime, jestli tam tato polozka uz nahodou neni na 1. pozici
 if fn<>StagINI.ReadString('MRU','0','') then begin
 //napred presuneme stare polozky ve StagIni
  for i:=3 downto 1 do
   StagINI.WriteString('MRU',inttostr(i),StagINI.ReadString('MRU',inttostr(i-1),''));
 //pridame novou polozku
   StagINI.WriteString('MRU','0',fn);
 end;
end;

procedure TfrmMain.Nastoblast1Click(Sender: TObject);
begin
 if frmGVD<>nil then begin
  frmGVD.close;
  frmGVD.Free;
  frmGVD:=nil;
 end;
 //nacitani z XML
 //pokud otevira .dat nebo .gvd, hlasku a jdi na import
 if OpensFromMRU or (OpenXMLDialog.Execute) then begin
  OpensFromMRU:=false;
  if ansilowercase(ExtractFileExt(OpenXMLDialog.FileName))='.xml' then begin
   //volej nacitani XML
   LoadFromXML(OpenXMLDialog.FileName,false);
   //pridej do MRU listu
   MRUListAdd(OpenXMLDialog.FileName);
  end else
   if MessageDlg(_novyformat+xmlsuffix+_convnow,mtWarning,[mbYes,mbNo],0)=mrYes then LoadFile(OpenXMLDialog.FileName);
 end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var reg:TRegistry;
begin

 //zjistit cestu k exaci
 path:=extractfilepath(Application.ExeName);
 //nacist INI
 StagINI:=TMemIniFile.Create(ExtractFilePath(Application.ExeName)+'stag.ini');
 if StagINI.SectionExists('Typ_vlaku') then begin
        cbTypVlaku.Clear;
        StagINI.ReadSection('Typ_vlaku',cbTypVlaku.Items);
 end;
 //prelozit
 LangManager.LangsDir:=path+'lang';
 LangManager.CurrentLang:=StagINI.ReadString('Stag','Language','Czech');
 //pokud neni nastaven jazyk, zeptej se
 if StagINI.ReadString('Stag','Language','')='' then mLanguageClick(sender);
 //poloha okna
 left:=StagINI.ReadInteger('Okno','Left',236);
 top:=StagINI.ReadInteger('Okno','Top',131);
 width:=StagINI.ReadInteger('Okno','Width',697);
 height:=StagINI.ReadInteger('Okno','Height',481);
 XPMenu.Active:=STAGini.ReadBool('STAG','NiceMenu',false);
 //pripravime vse pro GVD
 LongTimeFormat:='hh:nn';
 IOList:=TIOList.Create;
 JR:=TGVD.Create(IOList);
 Randomize;
 frmMain.Caption:=frmMain.Caption+' v. '+Verze;
 //asociovat .gvd s timto programem?
 if not (StagINI.ReadBool('STAG','NoReg',false)) then begin
  reg:=TRegistry.Create;
  reg.RootKey := HKEY_CLASSES_ROOT;
  reg.OpenKey('\.gvd', True);
  reg.WriteString('','stanicar_gvd');
  reg.OpenKey('\stanicar_gvd', True);
  reg.WriteString('','Grafikon Stanièáøe');
  reg.OpenKey('\stanicar_gvd\DefaultIcon', True);
  reg.WriteString('',Application.ExeName+',1');
  reg.OpenKey('\stanicar_gvd\shell\open\command', True);
  reg.WriteString('',Application.ExeName+' %1');
  reg.Free;
 end;

end;

procedure TfrmMain.FormDestroy(Sender: TObject);
begin
 frmRazeni.Free;
 StagINI.WriteInteger('Okno','Left',left);
 StagINI.WriteInteger('Okno','Top',top);
 StagINI.WriteInteger('Okno','Width',width);
 StagINI.WriteInteger('Okno','Height',height);
 StagINI.UpdateFile;
 StagINI.Free;
 IOList.free;
 JR.Free;
 TrainImgDestroy;
end;

procedure TfrmMain.cbTypVlakuChange(Sender: TObject);
begin
 cbZastavky.checked:= cbTypVlaku.text='Os';
 if (cbTypVlaku.Text<>'Os') and (cbTypVlaku.Text<>'Sp') and
  (cbTypVlaku.Text<>'R') and (cbTypVlaku.Text<>'Ex')  then
  cbJednotka.checked:=false;
end;

procedure TfrmMain.cbPrijezdSmerChange(Sender: TObject);
begin
 cbOznamSmerPrij.ItemIndex:=cbPrijezdSmer.ItemIndex;
end;

procedure TfrmMain.cbOdjSmerChange(Sender: TObject);
begin
 cbOznamSmerOdj.ItemIndex:=cbOdjSmer.ItemIndex;
end;

procedure TfrmMain.btnVlozVlakClick(Sender: TObject);
var spoj:TSpoj;i:integer;
begin
 //vytvori objekt spoje
 change:=true;
 spoj:=TSpoj.Create;
 try
  spoj.cislo:=strtoint(lblCisloVlaku.caption);
 except
  try
   spoj.cislo:=strtoint(InputBox(_givetrno,_givetrno2,inttostr(random(7000)+1000)));
   lblCisloVlaku.Caption:=inttostr(spoj.cislo);
   updatevznik(spoj.cislo);
  except
   showmessage(_badnum);
   spoj.free;
   exit;
  end;
 end;
 if spoj.cislo<10 then begin
  showmessage(_lowerthan9);
  exit;
 end;
 if cbTypVlaku.ItemIndex=-1 then begin
  showmessage(_notrt);
  spoj.free;
  exit;
 end;
 spoj.vjsunuty:=cbVjSunuty.Checked;
 spoj.typ:=cbTypVlaku.Text;
 spoj.jednotka:=cbJednotka.Checked;
 spoj.zastavuje:=cbZastavky.checked;
 spoj.vznika:=pcVznik.ActivePage=tsVznika;
 spoj.jmeno:=edTrainName.Text;
 try
  spoj.odjezdsem:=StrToTime(ePrijOdjSousedni.text);
 except
  showmessage(_errt);
  spoj.free;
  exit;
 end;
 if (cbPrijezdSmer.ItemIndex<0) and (not spoj.vznika) then begin
  showmessage(_nofr);
  spoj.free;
  exit;
 end;
 spoj.smerprijezdu:=trim(copy(cbPrijezdSmer.Text,1,pos('(',cbPrijezdSmer.Text)-1));
 spoj.oznamenismeruprijezdu:=cbOznamSmerPrij.Text;
 spoj.konci:=pcZanik.ActivePage=tsKonci;
 if (cbOdjSmer.ItemIndex<0) and (not spoj.konci) then begin
  showmessage(_noto);
  spoj.free;
  exit;
 end;
 spoj.smerodjezdu:=trim(copy(cbOdjSmer.Text,1,pos('(',cbOdjSmer.Text)-1));
 spoj.oznamenismeruodjezdu:=cbOznamSmerOdj.Text;
 spoj.vystup:=cbCestujici.Checked;
 spoj.poznamka:=edPoznamka.Text;

 if not (spoj.konci) then
  try
   spoj.odjezdpryc:=StrToTime(eOdjCas.text);
  except
   showmessage(_toerr);
   spoj.free;
   exit;
 end else begin
  spoj.naposun:=cbNaPosun.Checked;
  if lvzastavky.Items.Count<1 then begin
   showmessage(_nostop);
   spoj.free;
   exit;
  end;
  if cbNoveCislo.ItemIndex=0 then spoj.novecislo:=0 else
  try
   spoj.novecislo:=strtoint(cbNoveCislo.Text);
  except
   spoj.novecislo:=-1;
   showmessage(_badnext);
  end;
 end;
// if cbJedeV.text='' then cbJedeV.ItemIndex:=0;
 spoj.kdyjede:=cbJedeV.Text;
 spoj.razeni:=cbRazeni.Items.CommaText;
 //nastav zastavky vlaku
 setlength(spoj.zastavky,lvZastavky.Items.Count);
 try
  for i:=0 to lvZastavky.Items.Count-1 do begin
   spoj.zastavky[i].stanice:=lvZastavky.Items[i].Caption;
   spoj.zastavky[i].kolej:=lvZastavky.Items[i].SubItems[0];
   spoj.zastavky[i].odjezd:=strtotime(lvZastavky.Items[i].SubItems[1]);
   spoj.zastavky[i].kolejpovinna:=lvZastavky.Items[i].SubItems[2]<>'';
  end;
 except
  showmessage(_badtimez);
  spoj.free;
  exit;
 end;

 //uloz do JR
 //pokud vlak s timto cislem existuje,zeptame se, zda ho prepsat
 if not JR.JeVlak(spoj.cislo) or (MessageDlg(_overt,
  mtWarning,[mbYes,mbNo],0)=mrYes) then begin
  JR.DeleteSpoj(spoj.cislo); //pokud takovy spoj neni, nic neudela
  JR.Add(spoj);
 end;
 mObnovitClick(sender);


end;

{$HINTS OFF}
procedure TfrmMain.btnPriradCisloClick(Sender: TObject);
var s:string;i,err:integer;
begin
 s:=lblCisloVlaku.Caption;
 val(s,i,err);
 if err=0 then begin
  //je nastaveno platné èíslo vlaku, zkusíme najít další volné
  repeat
   i:=i+2; //jdeme po nasobcich 2
  until not JR.JeVlak(i);
 end else i:=random(6000)+1000;
 s:=inttostr(i);
 if InputQuery(_newtrn,_newtrn,s) then
  begin
   val(s,i,err);
   if err>0 then showmessage(_nointeger) else
    lblCisloVlaku.Caption:=s;
    updatevznik(i);
    edPoznamka.Text:='';
  end;

end;
{$HINTS ON}

procedure TfrmMain.mObnovitClick(Sender: TObject);
var i,j:integer;ListItem:TListItem;tlastitem,lastitem,ncis:string;
begin
 //vypise do lvSpoje seznam podle JR
 if (lvSpoje.Selected<>nil) and (lvSPoje.TopItem<>nil) then begin
  lastitem:=lvSpoje.Selected.Caption;
  tlastitem:=lvSpoje.TopItem.Caption;
 end else lastitem:='';
 cbNoveCislo.Sorted:=false;
 cbNoveCislo.Items.Clear;
 cbNoveCislo.Items.Add(_topos);
 cbNoveCislo.Items.BeginUpdate;
 lvSpoje.Items.BeginUpdate;
 lvSpoje.clear;
 lvSpoje.AllocBy:=JR.count;
 //smaz prebytecne objekty
 for i:=0 to JR.count-1 do begin
  ListItem:=lvSpoje.Items.Add;
  with JR.Items[i] as TSpoj do begin
   ListItem.Caption:=typ+' '+inttostr(cislo);
   if jednotka then ListItem.Caption:='M'+ListItem.Caption;
   cbNoveCislo.Items.add(inttostr(cislo));
   if vznika then
    ListItem.SubItems.Add(_starts+' ('+timetostr(odjezdsem)+')')
   else
    ListItem.SubItems.Add(smerprijezdu+' ('+timetostr(odjezdsem)+')');
   if konci then
    ListItem.SubItems.Add(_ends+zastavky[length(zastavky)-1].stanice)
   else
    ListItem.SubItems.Add(smerodjezdu);
   if vznika then begin
    //najdi vlak, ze ktereho vznikame
    ncis:='nedef.';
    for j:=0 to jr.Count-1 do
     if (jr.Items[j] as TSpoj).novecislo=cislo then
     begin ncis:=inttostr((jr.Items[j] as TSpoj).cislo); break; end;
    //zadat do listview
    ListItem.SubItems.add(ncis)
   end else
    ListItem.SubItems.add('vjezd');

   if konci then
    if novecislo>10 then ListItem.SubItems.add(inttostr(novecislo)) else
    ListItem.SubItems.add('konèí')
   else
    ListItem.SubItems.add('odjezd');

  end;
 end;
 lvSpoje.Items.EndUpdate;
 if (lastitem<>'') and (lvSpoje.FindCaption(0,lastitem,false,true,false)<>nil) and
  (lvSpoje.FindCaption(0,tlastitem,false,true,false)<>nil) then begin
  lvSpoje.Selected:=lvSpoje.FindCaption(0,lastitem,false,true,false);
  lvSpoje.Scroll(0,lvSpoje.FindCaption(0,tlastitem,false,true,false).Top-20);
 end;
 cbNoveCislo.Items.EndUpdate;
 cbNoveCislo.Sorted:=true;
 StatusBar.Panels[1].Text:=inttostr(JR.count)+_trains;
 if change then StatusBar.Panels[1].Text:=StatusBar.Panels[1].Text+' *';
end;

procedure NastavCombo(combo:TComboBox;zkratka:string);
var i:integer;
begin
 combo.ItemIndex:=-1;
 for i:=0 to combo.Items.Count-1 do begin
  if trim(copy(combo.items[i],1,pos(' ',combo.items[i])-1))=trim(zkratka) then
  begin
   combo.ItemIndex:=i;
   break;
  end;
 end;
end;

procedure TfrmMain.updatevznik;
var i:integer;
begin
 mVznikZ.clear;
 for i:=0 to jr.Count-1 do
  if (jr.Items[i] as TSpoj).novecislo=(spoj) then
   with (jr.Items[i] as TSpoj) do begin
    mVznikZ.Lines.add(_vznikz+typ+' '+IntToStr(cislo)+': '+CelaTrasa);
    break;
   end;
 if mVznikZ.Lines.Count=0 then
  mVznikZ.Lines.Add(_vznikzerr);
 mVznikZ.SelStart:=0;
 mVznikZ.SelLength:=0; 
end;

procedure TfrmMain.lvSpojeDblClick(Sender: TObject);
var spoj:TSpoj;i:integer;temp:TListItem;
begin
 //reakce na dvojklik - zobrazi vlak v okne vpravo
 //napred najdeme vlak podle cisla
 if lvSpoje.selected=nil then exit;
 spoj:=JR.GetVlak(strtoint(copy(lvSpoje.Selected.Caption,pos(' ',lvSpoje.Selected.Caption)+1,20)));
 if spoj=nil then begin
  showmessage(_tgvde);
  exit;
 end;
 //nastavime vsechno podle ziskaneho objektu
 LongTimeFormat:='hh:nn';
 lblCisloVlaku.Caption:=inttostr(spoj.cislo);
 cbTypVlaku.ItemIndex:= cbTypVlaku.items.IndexOf(spoj.typ);
 cbJednotka.Checked:=spoj.jednotka;
 edTrainName.Text:=spoj.jmeno;
 cbZastavky.Checked:=spoj.zastavuje;
 if spoj.vznika then pcVznik.ActivePage:=tsVznika else pcVznik.ActivePage:=tsPrijizdi;
 NastavCombo(cbPrijezdSmer,spoj.smerprijezdu);
 cbOznamSmerPrij.Text:=spoj.oznamenismeruprijezdu;
 ePrijOdjSousedni.EditText:=TimeToStr(spoj.odjezdsem);
 if spoj.konci then pcZanik.ActivePage:=tsKonci else pcZanik.ActivePage:=tsOdjizdi;
 NastavCombo(cbOdjSmer,spoj.smerodjezdu);
 cbOznamSmerOdj.Text:=spoj.oznamenismeruodjezdu;
 eOdjCas.EditText:=timetostr(spoj.odjezdpryc);
 cbNoveCislo.Text:=inttostr(spoj.novecislo);
 cbVjSunuty.Checked:=spoj.vjsunuty;
 //nasledujici
 cbNoveCisloChange(sender);

 if spoj.novecislo<10 then begin
  //proc to musi byt takhle, aby se provedl 2. radek, to teda nechapu
  cbNoveCislo.ItemIndex:=-1;
  cbNoveCislo.ItemIndex:=0;
 end;
 cbNaPosun.Checked:=spoj.naposun;
 cbCestujici.Checked:=spoj.vystup;
 cbJedeV.Text:=spoj.kdyjede;
 edPoznamka.Text:=spoj.poznamka;
 cbRazeni.Items.Delimiter:=',';
 cbRazeni.Items.QuoteChar:='"';
 cbRazeni.Items.DelimitedText:=spoj.razeni;

 if cbRazeni.Items.count>0 then cbRazeni.ItemIndex:=0;
 //zastavky vlaku
 lvZastavky.Clear;
 cbstanice.ItemIndex:=-1;cbkolej.ItemIndex:=-1;eOdjezd.EditText:='00:00';
 temp:=nil;
 for i:=0 to length(spoj.zastavky)-1 do begin
  temp:=lvZastavky.Items.Add;

  temp.Caption:=spoj.zastavky[i].stanice;
  temp.SubItems.add(spoj.zastavky[i].kolej);
  temp.SubItems.add(timetostr(spoj.zastavky[i].odjezd));

  if spoj.zastavky[i].kolejpovinna then
   temp.SubItems.add('*')
  else
   temp.SubItems.add('');

   lvZastavkyClick(sender);
 end;
 if lvZastavky.Items.Count>0 then begin
  lvZastavky.selected:=lvZastavky.Items[0];
  lvZastavkyClick(sender);
 end;
 //datumove pozn.
 cbJedeVChange(sender);
 //update poli informaci o predchozim a nasledujicim vlaku
 //predchozi
 UpdateVznik(spoj.cislo);
 lbRazSez.Clear;
 for i:=0 to cbRazeni.Items.Count-1 do begin
  if i>=4 then
   lbRazSez.items.add(cbRazeni.Items.Names[i]);
 end;
end;

procedure TfrmMain.btnZSmazVseClick(Sender: TObject);
begin
 lvZastavky.Clear;
end;

procedure TfrmMain.lvZastavkyCompare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);
begin
 if (item1.SubItems.Count=3) and (item2.SubItems.Count=3) then
 begin
  if
   ((strtotime(item1.SubItems[1])-strtotime(item2.SubItems[1]))>0) and
   ((strtotime(item1.SubItems[1])-strtotime(item2.SubItems[1]))<0.25)
   then compare:=1
  else compare:=-1;
 end else compare:=0;
end;

procedure TfrmMain.lvZastavkyClick(Sender: TObject);
begin
 //nastav podle zvolene polozky edit.pole
 if lvZastavky.Selected=nil then exit;
 with lvZastavky.Selected do begin
  cbStanice.Text:=Caption;
  if lvzastavky.selected.SubItems.Count=3 then begin
   cbPovinna.checked:= SubItems[2]<>'' ;
   cbKolej.Text:=SubItems[0];
   eOdjezd.Text:=SubItems[1];

  end;
 end;
 
end;

procedure TfrmMain.btnZSmazClick(Sender: TObject);
begin
 if lvZastavky.Selected<>nil then lvZastavky.Selected.Delete;
end;

procedure TfrmMain.btnZUlozZmenuClick(Sender: TObject);
var i,od:integer;oldtime,newtime:TTime;
begin
 if (trim(cbStanice.Text)='') or (trim(cbKolej.Text)='') then exit;
 if lvZastavky.Selected<>nil then begin
  with lvZastavky.Selected do begin
   Caption:=cbStanice.Text;
   SubItems[0]:=cbKolej.Text;
   subitems[2]:=ifthen(cbPovinna.Checked,'*','');
   oldtime:=strtotime(SubItems[1]);
   if (trim(copy(eOdjezd.Text,1,2))<>'') and
   (trim(copy(eOdjezd.Text,4,2))<>'')
   and (strtoint(trim(copy(eOdjezd.Text,1,2)))<=23) and
    (strtoint(trim(copy(eOdjezd.Text,4,2)))<=59) then
      SubItems[1]:=eOdjezd.Text;
    newtime:=strtotime(SubItems[1]);
  end;
  //pokud je SVAZANO, tak prepocitame ostatni casy
  if cbSvaz.checked then begin
    od:=lvZastavky.Items.IndexOf(lvZastavky.selected);
    for i:=od+1 to lvZastavky.items.Count-1 do begin
     with lvZastavky.Items[i] do
      subitems[1]:=timetostr(strtotime(subitems[1])-oldtime+newtime+1);
    end;
    if pcZanik.ActivePage=tsOdjizdi then begin
     try
     eOdjCas.Text:=timetostr(strtotime(eOdjCas.Text)-oldtime+newtime+1);;
     except on E:Exception do lbConsole.Lines.add(_cantrec);
     end;
    end;
  end;

 end;
 lvZastavky.AlphaSort;
end;

procedure TfrmMain.btnZPridejClick(Sender: TObject);
var temp:TListItem;
begin
 if (trim(cbStanice.Text)='') or (trim(cbKolej.Text)='') then exit;
 lvZastavky.Items.BeginUpdate;
 temp:=lvZastavky.Items.Add;
 with temp do begin
  Caption:=cbStanice.Text;
  SubItems.Add(cbKolej.Text);
  SubItems.Add(eOdjezd.Text);
  if cbPovinna.checked then
   SubItems.Add('*') else SubItems.Add(''); 
 end;
 lvZastavky.Selected:=temp;
 lvZastavky.Items.EndUpdate;
// lvZastavkyClick(sender);
end;

procedure TfrmMain.lvZastavkyEditing(Sender: TObject; Item: TListItem;
  var AllowEdit: Boolean);
begin
 allowedit:=false;
end;

procedure TfrmMain.Uloitoblast1Click(Sender: TObject);
var frmKontrola:TfrmKontrola;
begin
 //kontrola vyplneni polozek
 if StagINI.ReadBool('STAG','BuzeracniDialog',true) then begin
        frmMain.Kontrolasprvnosti1.Click;
        if chyb>0 then begin
                frmKontrola:=TfrmKontrola.Create(frmMain);
                frmKontrola.ShowModal;
                frmKontrola.Free;
        end;
 end;

 if filename<>'' then begin
  change:=false;
  JR.SaveToFile(filename);
  lbConsole.lines.add(_saved);
  mObnovitClick(sender);
 end else Uloitoblastjako1.Click;
end;

procedure TfrmMain.btnSmazVlakClick(Sender: TObject);
var i,s:integer;
begin
 if lvSpoje.Selected=nil then exit;
 s:=0;
 if MessageDlg(_delete,mtWarning,[mbYes,mbNo],0)=mrYes then
  for i:=0 to lvSpoje.Items.Count-1 do if lvSpoje.items[i].Selected then begin
   JR.DeleteSpoj(strtoint(copy(lvSpoje.Items[i].Caption,pos(' ',lvSpoje.Items[i].Caption)+1,20)));
   lbConsole.Lines.Add(_deleted+lvSpoje.Items[i].Caption);
   inc(s);
  end;
 lbConsole.Lines.Add(_changed+inttostr(s)+_trains+'.');
 change:=true;
 mObnovit.Click;
end;

procedure TfrmMain.Uloitoblastjako1Click(Sender: TObject);
begin
 if SaveDialog.Execute then begin
  change:=false;
  filename:=SaveDialog.FileName;
  JR.SaveToFile(filename);
  lbConsole.lines.add(_saved);
 end;
end;

procedure TfrmMain.EditovatoblastBuilder1Click(Sender: TObject);
var temp:string;
  proc_info: TProcessInformation;
  startinfo: TStartupInfo;
begin
 if filename='' then begin
  showmessage(_predupr);
  exit;
 end;
 //napred ulozime
 Uloitoblast1.Click;
 //spustime Builder
// temp:=extractfilepath(FileName)+copy(extractfilename(FileName),1,pos('.',extractfilename(FileName))-1)+'.dat';
 temp:=ChangeFileExt(filename,'.xml');
 FillChar(proc_info, sizeof(TProcessInformation), 0);
 FillChar(startinfo, sizeof(TStartupInfo), 0);
 startinfo.cb := sizeof(TStartupInfo);
 if (CreateProcess(pchar(extractfilepath(Application.ExeName)+StagINI.ReadString('builder','filename','builder.exe')),
    pchar(' /b '+' "'+temp+'"'), nil,
    nil, false, NORMAL_PRIORITY_CLASS, nil, nil,
    startinfo, proc_info) <> False)
    or
    (CreateProcess(pchar(extractfilepath(Application.ExeName)+'..\'+StagINI.ReadString('builder','filename','builder.exe')),
    pchar(' /b '+' "'+temp+'"'), nil,
    nil, false, NORMAL_PRIORITY_CLASS, nil, nil,
    startinfo, proc_info) <> False)
     then
 begin
    pnlInfo.Caption:=_waitfor;
    pnlInfo.Show;
    mOblast.Enabled:=false;
    Application.ProcessMessages;
    while (WAIT_TIMEOUT=WaitForSingleObject(proc_info.hProcess, 50)) and
     not (Application.Terminated) do
     Application.ProcessMessages;
    CloseHandle(proc_info.hProcess);
    pnlInfo.Hide;
    mOblast.Enabled:=true;
    //nacteme
    mReload.Click;
    change:=false;
 end
 else Application.MessageBox(pchar(_cantrun), 'Error', MB_ICONEXCLAMATION);
end;

procedure TfrmMain.mReloadClick(Sender: TObject);
begin
 LoadFromXML(filename,true);
end;

procedure TfrmMain.lvSpojeColumnClick(Sender: TObject;
  Column: TListColumn);
begin
  ColumnToSort := Column.Index;
  if ColumnToSort>2 then ColumnToSort:=10+ColumnToSort;
  (Sender as TCustomListView).AlphaSort;
end;

procedure TfrmMain.lvSpojeCompare(Sender: TObject; Item1, Item2: TListItem;
  Data: Integer; var Compare: Integer);
var
  ix: Integer;
begin
  if ColumnToSort = 0 then
    Compare := strtoint(copy(Item1.Caption,pos(' ',Item1.Caption),10))-strtoint(copy(Item2.Caption,pos(' ',Item2.Caption),10))
  else if ColumnToSort in [1..2] then begin
   ix := ColumnToSort - 1;
   Compare := AnsiCompareText(Item1.SubItems[ix],Item2.SubItems[ix]);
  end else if ColumnToSort in [10..20] then begin
   ix := ColumnToSort - 11;
   Compare := AnsiCompareText(format('%8s',[Item1.SubItems[ix]]),format('%8s',[Item2.SubItems[ix]]));
  end else if ColumnToSort=3 then
   begin
    Compare := AnsiCompareText(copy(Item1.Caption,1,pos(' ',item1.caption)),copy(Item2.Caption,1,pos(' ',item2.caption)));
    if compare=0 then Compare := strtoint(copy(Item1.Caption,pos(' ',Item1.Caption),10))-strtoint(copy(Item2.Caption,pos(' ',Item2.Caption),10));
   end
  else if ColumnToSort=4 then

   Compare := AnsiCompareText(copy(Item1.SubItems[0],max(0,pos('(',Item1.SubItems[0])),6),copy(Item2.SubItems[0],max(0,pos('(',Item2.SubItems[0])),6));

end;



procedure TfrmMain.cbZastavkyClick(Sender: TObject);
begin
 if cbZastavky.Checked then cbCestujici.Checked:=true;
end;

procedure WriteErr(chyba,typ:string;cislo:integer;var chyb:integer);
begin
 chyb:=chyb+1;
 frmMain.lbConsole.lines.Add('> '+typ+' '+inttostr(cislo)+': '+chyba)
end;

procedure TfrmMain.Kontrolasprvnosti1Click(Sender: TObject);
var i,j,v:integer;pom:boolean;sl:TStringList;rsl:TStringList;
begin
 lbConsole.Clear;
 chyb:=0;
 //provedeni kontroly souboru
 if (trim(filename)='') or (not FileExists(ChangeFileExt(filename,'.xml'))) then begin
        lbConsole.Lines.Add('Soubor stanice '+filename+' neexistuje - napøed alespoò èásteènì nakreslete stanici v Builderu, teprve poté ji otevøete ve STAGu! Opaèný postup není možný. (ignorujte toto hlášení, pokud pracujete se starým formátem .dat/.gvd souborù)');
        chyb:=chyb+1;
 end;


 //provedeni kontroly IOlistu
 if IOList.Count=0 then begin
        lbConsole.Lines.Add('Seznam vstupních a výstupních bodù neobsahuje žádné položky - je stanice správnì v Builderu navržená?');
        chyb:=chyb+1;
 end else
 begin
  j:=0;
  for i:=0 to IOList.Count-1 do begin
   if trim((IOList[i] as TIO).celynazev) = '' then begin
    inc(j);
    lbConsole.Lines.Add('Není vyplnìn celý název vstupnì výstupního bodu '+(IOList[i] as TIO).zkratka+' - opravte chybu v Nastavení/Vstupy a výstupy.');
   end;
  end;
  chyb:=chyb+j;
 end;

 if JR.stanice.Count=0 then begin
        lbConsole.Lines.Add('Seznam stanic neobsahuje žádné položky, definujte páry zkratka - stanice (Nastavení/Stanice a zastávky).');
        inc(chyb);
 end;


 sl:=TStringList.Create;
 rsl:=TStringList.Create;
 for i:=0 to JR.Count-1 do begin
  //kontrola vsech vlaku
  with JR.Items[i] as TSpoj do begin
   //if cislo<10 then WriteErr(__lowerthan9,typ,cislo,chyb);
   if cbTypVlaku.Items.IndexOf(typ)<0 then WriteErr(_unknt,typ,cislo,chyb);
   if vznika then begin
   end else begin
    pom:=false;
    for j:=0 to IOList.Count-1 do if (IOList.Items[j] as TIO).zkratka=
     smerprijezdu then pom:=true;
    if not pom then WriteErr(_arrdir+smerprijezdu+_notinthis,typ,cislo,chyb);
   end;
   if konci then begin
    if novecislo>9 then begin
     pom:=false;
     for j:=0 to JR.Count-1 do if (JR.Items[j] as TSpoj).cislo=novecislo then pom:=true;
     if not pom then WriteErr(_trn+inttostr(novecislo)+_nextnot,typ,cislo,chyb);
    end;
   end else begin
    pom:=false;
    for j:=0 to IOList.Count-1 do if (IOList.Items[j] as TIO).zkratka=
     smerodjezdu then pom:=true;
    if not pom then WriteErr(_depdir+smerodjezdu+_notinthis,typ,cislo,chyb);
   end;
   if trim(datpoztotext(kdyjede))='' then WriteErr(_badp,typ,cislo,chyb);
   //kontrola existence vozu v razeni
   rsl.Delimiter:=',';
   rsl.QuoteChar:='"';
   rsl.DelimitedText:=razeni;
   for v:=4 to rsl.Count-1 do
    if vozy.ReadString(rsl.names[v],'delka','err')='err' then
     if sl.IndexOf(rsl.names[v])<0 then sl.Add(rsl.Names[v]);
  end;
 end;
 lbConsole.lines.Add(_resultin+inttostr(jr.Count)+_cons+inttostr(chyb)+_errs);
 if sl.Count>0 then lbConsole.lines.Add('Chybne vozy (definovane ve stanici, ale ne ve vozy.ini):');
 lbConsole.lines.AddStrings(sl);
 sl.Free;
 rsl.Free;
end;

procedure TfrmMain.lvSpojeInfoTip(Sender: TObject; Item: TListItem;
  var InfoTip: String);
var Spoj:TSpoj;
begin
 if item<>nil then begin
  Spoj:=JR.GetVlak(strtoint(copy(item.Caption,pos(' ',item.Caption)+1,20)));
  if spoj<>nil then begin
   InfoTip:=spoj.CelaTrasa+#13#10+spoj.OdkudKam(JR,StagINI.ReadString('Typ_vlaku',spoj.typ,'Vlak'));
  end;
 end;
end;

procedure TfrmMain.lvSpojeKeyPress(Sender: TObject; var Key: Char);
var li:TListItem;
begin
 if key=#13 then lvSpojeDblClick(sender);
 if key in ['0'..'9'] then begin

        //stisk klavesy pro hledani
        edHledac.Visible:=true;
        edHledac.Color:=clWindow;
        edHledac.Text:=edHledac.Text+key;
        //hledej
        if lvSpoje.Items.Count>0 then begin
                if lvSpoje.Selected=nil then li:=lvSpoje.Items[0] else
                        li:=lvSpoje.Selected;
                while (li<>nil) and
                 (copy(trim(copy(li.Caption,pos(' ',li.Caption)+1,20)),1,length(edHledac.Text))<>edHledac.Text)
                 do begin
                    li:=lvSpoje.GetNextItem(li,sdBelow,[]);
                end;
                //zkusime jeste hledani nahoru
                if li=nil then begin
                        li:=lvSpoje.Selected;
                        while
                         (li<>nil) and  
                         (copy(trim(copy(li.Caption,pos(' ',li.Caption)+1,20)),1,length(edHledac.Text))<>edHledac.Text)
                         do begin
                            li:=lvSpoje.GetNextItem(li,sdAbove,[]);
                        end;
                end;
                if li<>nil then begin
                 lvSpoje.ClearSelection;
                 lvSpoje.selected:=li;
                 lvSpoje.ItemFocused:=li;
                 li.MakeVisible(false);
                end else begin
                 edHledac.Color:=clRed;
                end;

        end;
        //aktivace timeoutu
        tmrSearch.Enabled:=false;
        tmrSearch.Enabled:=true;

 end else begin
        //ruseni hledani
        edHledac.Visible:=false;
        edHledac.Text:='';
        tmrSearch.Enabled:=false;
 end;
end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var res:integer;
begin
 if change then
  res:=MessageDlg(_notsaved,mtConfirmation,[mbYes,mbNo,mbCancel],0)
 else res:=mrNo;
 canclose:=res<>mrCancel;
 if res=mrYes then Uloitoblast1.Click;
end;

procedure TfrmMain.Vstupyavstupy1Click(Sender: TObject);
var i:integer;
begin
 frmIO:=TfrmIO.Create(frmMain);
 LangManager.TranslateForm(frmIO);
 frmIO.lbIO.Clear;
 for i:=0 to IOList.Count-1 do
  frmIO.lbIO.AddItem((IOList.Items[i] as TIO).zkratka,(IOList.Items[i] as TIO));
 frmIO.ShowModal;
 //nacteme nove udaje do comboboxu atd.
 //nastav comboboxy
 cbPrijezdSmer.Items.Assign(IOList.GetIOList);
 cbOdjSmer.Items.Assign(IOList.GetIOList);
 cbOznamSmerPrij.Items.Assign(IOList.GetPrijSmerList);
 cbOznamSmerOdj.Items.Assign(IOList.GetOdjSmerList);
 //uvolnime formular
 frmIO.Free;
 change:=true;
end;

procedure TfrmMain.Exportjzdnhodu1Click(Sender: TObject);
var t:TextFile;s,barva:string;i,j,k,km,sumwidth,kmin:integer;spoj:TSpoj;grazeni:boolean;sl:TStringList;
   var temp:TIcXMLElement;
begin
 //exportuje po vlacich
 if SaveJRDialog.Execute then begin
  sl:=TStringList.Create;
  sl.Delimiter:=',';
  sl.QuoteChar:='"';
  assignfile(t,SaveJRDialog.filename);
  grazeni:=mrYes=Application.MessageBox('Pøejete si vygenerovat i grafické øazení vlakù?','Export HTML',MB_YESNO);
  try
   rewrite(t);
   writeln(t,'<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">');
   writeln(t,'<html><head><title>Jízdní øád</title>');
   writeln(t,'<META content="text/html; charset=windows-1250" http-equiv="Content-Type"><style type="text/css">');
   i:=1;
   while StagINI.ReadString('Export','CSS'+inttostr(i),'') <> '' do begin
    writeln(t,StagINI.ReadString('Export','CSS'+inttostr(i),''));
    inc(i);
   end;
   writeln(t,'</style></head><body>');
   writeln(t,'<h2>Jízdní øád</h2>');
   LongTimeFormat:='hh:nn';
   //kazdy vlak vypiseme
   for i:=0 to JR.count-1 do with JR.items[i] as TSpoj do begin
    barva:='rgb('+inttostr(StagINI.Readinteger('Barvy_vlaku',typ,0) and $FF)
    +','+inttostr((StagINI.Readinteger('Barvy_vlaku',typ,0) div $100) and $FF)
    +','+inttostr((StagINI.Readinteger('Barvy_vlaku',typ,0) div $10000) and $FF)+')';
    //link
    write(t,'<a name="'+inttostr(cislo)+'" />');
    //nadpis
    write(t,'<h3 style="color:'+barva+'">'+
     IfThen(jednotka,'M','')
     +typ+' '+inttostr(cislo)+'</h3>');
    //informace o smeru - textove
    write(t,'<i>'+IfThen(vznika,'*',oznamenismeruprijezdu)+' -> ');
    if konci then write(t,
     JR.stanice.values[zastavky[length(zastavky)-1].stanice]+' (konèí)') else
     write(t,oznamenismeruodjezdu);
    writeln(t,'</i><br />');
    //informace o omezeni
    writeln(t,IfThen(trim(kdyjede)='','Jede dennì','Jede v <span class="datpoz">'+kdyjede+'</span>'));
    writeln(t,'<br /><pre>');
    //ted textova tabulka odjezdu
    //1. radek: kurzivou oznam. smer prijezdu
    s:=IfThen(not vznika,'Z: '+oznamenismeruprijezdu,'Vlak vzniká');
    writeln(t,'<i>'+s+'</i>');
    //2. radek: vjezd do obvodu Stanicare
    s:=IfThen(not vznika,IOList.GetIOTexts(smerprijezdu).celynazev+' ('+smerprijezdu+')',
     'sestavení vlaku od:');
    writeln(t,'<b>'+s+StringOfChar(' ',48-length(s))+timetostr(odjezdsem)+'-></b>');
    //3.-(n-2).radek: seznam zastavek
    for j:=0 to length(zastavky)-1 do begin
     s:=JR.stanice.Values[zastavky[j].stanice]+' ('+zastavky[j].stanice+')';
     writeln(t,s+StringOfChar(' ',38-length(s))+'<i>'+zastavky[j].kolej+'. '+IfThen(zastavky[j].kolejpovinna,'*',' ')+'</i>'+
      StringOfChar(' ',9-length(zastavky[j].kolej))+timetostr(zastavky[j].odjezd));
    end;
    //n-1. radek: odjezd pryc - sousedni stanice nebo napis "konci"
    //n. radek: smer odjezdu nebo link na vlak, kterym koncici pokracuje
    if konci then begin
     writeln(t,StringOfChar(' ',49)+'<i><b>konèí</b></i>');
     //jak pokracuje?
     if novecislo>9 then begin
      writeln(t,'<i>Pokraèuje jako vlak <a href="#'+
      inttostr(novecislo)+'">'+inttostr(novecislo)+'</a>'+
      IfThen(naposun,', po zastavení se mìní na posun','')
      +'</i>');
      //zjistime neco o novem vlaku
      spoj:=JR.GetVlak(novecislo);
      if spoj=nil then writeln(t,'<b>Chyba: vznikající vlak není definován!</b>') else
       writeln(t,'Ve smìru: <i>'+spoj.celatrasa+'</i>');
     end else
      writeln(t,'<i>Vlak konèí a mìní se na posun.</i>');
    end else begin
     s:=IOList.GetIOTexts(smerodjezdu).celynazev+' ('+smerodjezdu+')';
     writeln(t,'<b>'+s+StringOfChar(' ',48-Length(s))+'->'+TimeToStr(odjezdpryc)+'</b>');
     writeln(t,'<i>Do: '+oznamenismeruodjezdu+'</i>');
    end;
    writeln(t,'</pre>');
    if zastavuje then writeln(t,'Vlak zastavuje v osobních zastávkách<br />');
    if vystup then writeln(t,'Vlak èeká ve stanicích na výstup cestujících<br />');
    if poznamka<>'' then writeln(t,'Poznámka: ',poznamka,'<br />');
    //vypis razeni
    sl.Clear;
    sl.DelimitedText:=razeni;
    writeln(t,'<h4>Øazení vlaku</h4>');
    writeln(t,'<div class="razeni">');
    writeln(t,'<b>Parametry vlaku:</b><br />');
    writeln(t,'<table>');
    writeln(t,'<tr><th widht="30%">Parametr</th><th>Hodnota</th></tr>');
    for k:=0 to min(3,sl.Count-1) do begin
     writeln(t,'<tr>');
     writeln(t,'<td width="30%">',sl.names[k],'</td><td>',copy(sl[k],length(sl.names[k])+2,100),'</td>');
     writeln(t,'</tr>');
    end;
    writeln(t,'</table>');
    if grazeni then begin
     try
      if not DirectoryExists(expandfilename(SaveJRDialog.filename)+'_soubory') then CreateDir(expandfilename(SaveJRDialog.filename)+'_soubory');
     except
      on E:Exception do begin
       showmessage('Nelze vytvoøit adresáø '+expandfilename(SaveJRDialog.filename)+'_soubory'+' pro obrázky.');
       grazeni:=false;
      end;
     end;
    end;
    if sl.count<5 then writeln(t,'Detailní øazení není zadáno.') else begin
     writeln(t,'<b>Detailní øazení:</b><br />');
     //k:=3;
     km:=3;
      repeat
       writeln(t,'<table><tr>');
       writeln(t,'<th>'+typ+' '+inttostr(cislo)+'</th>');
       sumwidth:=0;
       k:=km;
       kmin:=k+1;
       while (k<=sl.count-2) and (sumwidth<StagINI.ReadInteger('Export','PictWidthLimit',700)) do begin
        inc(k);km:=k;
        if VuzHeightText(sl[k])>0 then begin
         sumwidth:=sumwidth+VuzWidthText(sl[k]);
         if not FileExists(ExpandFileName(SaveJRDialog.filename)+'_soubory\'+sl.names[k]+'.bmp') then begin
          try
           CopyFile(pchar(path+'vozy\vuz_'+sl.names[k]+'.bmp'),pchar(ExpandFileName(SaveJRDialog.filename)+'_soubory\'+sl.names[k]+'.bmp'),false);
           writeln(t,'<td><img src="',extractfilename(SaveJRDialog.filename)+'_soubory','/',sl.names[k],'.bmp" /></td>');
          except
           on E:Exception do writeln(t,'<td>Chyba pøi kopírování obrázku</td>');
          end;
         end else
         writeln(t,'<td><img src="',extractfilename(SaveJRDialog.filename)+'_soubory','/',sl.names[k],'.bmp" /></td>');
        end else begin
         writeln(t,'<td>N/A</td>');sumwidth:=sumwidth+100;
        end;
       end;
      writeln(t,'</tr>');
      writeln(t,'<tr>');
      writeln(t,'<th>Vùz:</th>');
       for k:=kmin to km do begin
        writeln(t,'<td>',sl.names[k],'</td>');
       end;
      writeln(t,'</tr>');
      writeln(t,'<tr>');
      writeln(t,'<th>Smìr nákladu:</th>');
       for k:=kmin to km do begin
        writeln(t,'<td>',copy(sl[k],length(sl.names[k])+2,100),'</td>');
       end;
      writeln(t,'</tr>');
      writeln(t,'</table>');
    until km>=sl.count-1;
    //ukonceni
   end;
    writeln(t,'</div>');
    writeln(t,'<hr size="1" />');
   end;
   //datpoz
   if pGVD<>nil then begin
    writeln(t,'<h4>Datumové poznámky</h4><dl>');
    //nacti seznam poznamek z XML
    temp:= FindChild(pGVD,'dates');
    temp:= temp.GetFirstChild;
    while (temp<>nil) do begin
     writeln(t,('<dt><span class="datpoz">'+temp.GetAttribute('name')+'</span> </dt><dd>'+DatPozToText(temp.GetAttribute('name'))+'</dd>'));
     temp:=temp.NextSibling;
    end;
   end;
   writeln(t,'</dl>');
   //ukonceni
   writeln(t,'Generátor: '+frmMain.Caption);
   writeln(t,'</body></html>');
   closefile(t);sl.Free;
   //otevreme soubor
   ShellExecute(handle,'open',pchar(expandfilename(SaveJRDialog.FileName)),'','',SW_MAXIMIZE);
  except
   on E:Exception do Showmessage('Chyba: '+E.Message);
  end;
 end;
end;

procedure TfrmMain.Staniceazastvky1Click(Sender: TObject);
var frmStanice:TfrmStanice;    i:integer;
begin
 frmStanice:=TfrmStanice.Create(frmMain);
 LangManager.TranslateForm(frmStanice);
 frmStanice.vleStanice.Strings.Clear;
 frmStanice.vleStanice.Strings.AddStrings(JR.stanice);
 if frmStanice.ShowModal=mrOK then begin
  change:=true;
  JR.stanice.Clear;
  JR.stanice.AddStrings(frmStanice.vleStanice.Strings);
  cbStanice.Items.Clear;
  for i:=0 to JR.stanice.Count-1 do
   cbStanice.Items.Add(JR.stanice.Names[i]);
 end;
 frmStanice.Free;
end;

function PosunCas(s:string;kolik:integer):string;
var t:TDateTime;
begin
 result:=s;
 t:=0;
 try
  t:=StrToTime(s);
 finally
  t:=t+kolik/1440;
  if t<0 then t:=t+1;
  result:=timetostr(t);
 end;
end;

procedure TfrmMain.PosunCasy;
var i:integer;
begin
 ePrijOdjSousedni.edittext:=PosunCas(ePrijOdjSousedni.text,kolik);
 eOdjCas.edittext:=PosunCas(eOdjCas.text,kolik);
 for i:=0 to lvZastavky.Items.Count-1 do
  lvZastavky.Items[i].SubItems[1]:=PosunCas(lvZastavky.Items[i].SubItems[1],kolik);
end;



procedure TfrmMain.sbHodinyDownClick(Sender: TObject);
begin
 //posune o 60 minut dolu
 PosunCasy(-60);
end;

procedure TfrmMain.sbHodinyUpClick(Sender: TObject);
begin
 //posune o 60 minut nahoru
 PosunCasy(+60);
end;

procedure TfrmMain.sbMinutyDownClick(Sender: TObject);
begin
 //posune o 1 minutu dolu
 PosunCasy(-1);
end;

procedure TfrmMain.sbMinutyUpClick(Sender: TObject);
begin
 //posune o 1 minutu nahoru
 PosunCasy(+1);
end;

procedure TfrmMain.lvSpojeCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
var typvlaku:string; spoj:TSpoj;
var idvlaku:string;
begin
  sender.Canvas.Brush.Color:=clWhite;

  idvlaku:=item.Caption;


  spoj:=JR.GetVlak(strtoint(copy(item.Caption,pos(' ',idvlaku)+1,20)));
  if spoj<>nil then begin
          typvlaku:=spoj.typ;
  end else typvlaku:='??';


  //nalezeni MOs apod.
{  if spoj.jednotka then begin
   idvlaku:='M'+idvlaku;
  end;}



  sender.Canvas.font.Color:=StagINI.ReadInteger('Barvy_vlaku',typvlaku,0);
  Sender.Canvas.Font.Style:=[];
  if StagINI.ReadBool('Tucne_vlaky',typvlaku,false) then
   Sender.Canvas.Font.Style:=Sender.Canvas.Font.Style+[fsBold];
  if (spoj<>nil) and (length(spoj.razeni)<20) then
   Sender.Canvas.Font.Style:=Sender.Canvas.Font.Style+[fsItalic];

  DefaultDraw:=true;
end;

procedure TfrmMain.cbTypVlakuDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
 cbTypVlaku.canvas.font.size:=8;
 cbTypVlaku.Canvas.font.Color:=StagINI.ReadInteger('Barvy_vlaku',cbTypVlaku.Items[index],0);
 cbTypVlaku.Canvas.Pen.Style:=pssolid;
 cbTypVlaku.Canvas.Pen.color:=clWhite;
 if odSelected in state then begin
  cbTypVlaku.Canvas.font.Color:=clWhite;
  cbTypVlaku.Canvas.Brush.Color:=clActiveCaption;
 end else begin
  cbTypVlaku.Canvas.Brush.Color:=clWhite;
 end;
 cbTypVlaku.Canvas.Rectangle(rect);
 if  StagINI.ReadBool('Tucne_vlaky',cbTypVlaku.Items[index],false) then
  cbTypVlaku.Canvas.font.Style:=[fsBold]
 else
  cbTypVlaku.Canvas.font.Style:=[];
 cbTypVlaku.Canvas.Textout(rect.Left+5,rect.Top+1,cbTypVlaku.Items[index]);
 cbTypVlaku.Canvas.font.Style:=[];
 cbTypVlaku.Canvas.font.color:=clGray;
 cbTypVlaku.canvas.font.size:=7;
 cbTypVlaku.Canvas.TextOut(rect.Left+50,rect.Top+2,
   StagINI.ReadString('Typ_vlaku',cbTypVlaku.Items[index],''));
end;

procedure TfrmMain.cbTypVlakuMeasureItem(Control: TWinControl;
  Index: Integer; var Height: Integer);
begin
 height:=15;
end;

procedure TfrmMain.Nastaveneditoru1Click(Sender: TObject);
var frmProperities:TfrmProperities;
begin
 frmProperities:=TfrmProperities.CreateWINI(self,StagINI);
// LangManager.TranslateForm(frmProperities);
 frmProperities.ShowModal;
 frmProperities.Free;
 mObnovit.Click;
end;

procedure TfrmMain.btnImportClick(Sender: TObject);
begin
 frmImport:=TfrmImport.create(self);
 frmImport.showmodal;
 frmImport.free;
 mObnovit.Click;
 change:=true;
end;

procedure TfrmMain.Npovda1Click(Sender: TObject);
var handle:integer;
begin
 //otevøi .txt
 handle:=0;
 ShellExecute(handle,'open',pchar(extractfilepath(
  Application.ExeName)+'Editor-help.pdf'),'','',SW_MAXIMIZE);
end;

procedure TfrmMain.lvSpojeCustomDrawSubItem(Sender: TCustomListView;
  Item: TListItem; SubItem: Integer; State: TCustomDrawState;
  var DefaultDraw: Boolean);
begin
  if not StagINI.ReadBool('STAG','Z_Do_tucne',false) then
   sender.Canvas.Font.Style:=[] else
   sender.Canvas.Font.Style:=sender.Canvas.Font.Style+[fsBold];    
  DefaultDraw:=true;
end;

procedure TfrmMain.btnRazeniClick(Sender: TObject);
begin
 frmRazeni.ShowModal;
 cbRazeni.Repaint;
 cbRazeni.ItemIndex:=0;
 change:=true;
end;

procedure TfrmMain.btnRazeniViceVlakuClick(Sender: TObject);
var i,s:integer;
begin
 //pouzijeme proceduru z hlavni editace
 btnRazeni.Click;
 s:=0;
 if MessageDlg('Chcete zmìnit øazení všech vybraných vlakù?',mtConfirmation,
    [mbYes,mbNo],0)=mrYes then begin
  for i:=0 to lvSPoje.Items.Count-1 do
   if lvSpoje.Items[i].Selected then begin
    JR.GetVlak(strtoint(copy(lvSpoje.Items[i].Caption,pos(' ',lvSpoje.Items[i].Caption)+1,20))).razeni:=cbRazeni.Items.CommaText;
    lbConsole.lines.add(_razeni+lvSPoje.Items[i].Caption+_changedb);
    inc(s);
   end;
  change:=true;
 end;
 lbConsole.Lines.Add(_changed+inttostr(s)+_trains+'.');

end;

procedure TfrmMain.Editujvlak1Click(Sender: TObject);
begin
 lvSpojeDblClick(sender);
end;

procedure TfrmMain.Smavlak1Click(Sender: TObject);
begin
 btnSmazVlak.Click;
end;

procedure TfrmMain.NastavdlkuvlakuClick(Sender: TObject);
begin
 btnRazeniViceVlaku.Click;
end;

procedure TfrmMain.btnAutoClick(Sender: TObject);
var time:TTime;i:integer;
begin
 time:=1;
 cbSvaz.Checked:=false;
 for i:=0 to lvZastavky.Items.Count-1 do if
  strtotime(lvZastavky.Items[i].SubItems[1])<time then time:=strtotime(lvZastavky.Items[i].SubItems[1]);
 if (pcZanik.ActivePage=tsOdjizdi) and (strtotime(eOdjCas.Text)<time) then time:=strtotime(eOdjCas.Text);
 if time=1 then begin
  showmessage(_notime);
  exit;
 end;
 if (time)<(1/24/60*StagINI.ReadInteger('STAG','AutoCasVz',20)) then time:=time+1;
 ePrijOdjSousedni.EditText:=TimeToStr(time-(1/24/60*StagINI.ReadInteger('STAG','AutoCasVz',20)));
end;

procedure TfrmMain.Nastavautomatickyasvzniku1Click(Sender: TObject);
var i,j:integer;time:Ttime;spoj:TSpoj;
begin
 cbSvaz.checked:=false;
 if lvSpoje.Selected=nil then exit;
 change:=true;
 for i:=0 to lvSpoje.Items.Count-1 do
  if (lvSpoje.Items[i].Selected) then begin
   time:=1;
   spoj:=JR.GetVlak(strtoint(copy(lvSpoje.Items[i].Caption,pos(' ',lvSpoje.Items[i].Caption)+1,20)));
   if spoj.vznika and (spoj.odjezdsem=0) then begin
    for j:=0 to length(spoj.zastavky)-1 do if
     spoj.zastavky[j].odjezd<time then time:=(spoj.zastavky[j].odjezd);
    if (not spoj.konci) and (spoj.odjezdpryc<time) then time:=spoj.odjezdpryc;
    if time=1 then begin
     lbConsole.Lines.Add(spoj.typ+' '+inttostr(spoj.cislo)+' '+_notime);
    end else begin
     lbConsole.Lines.Add(spoj.typ+' '+inttostr(spoj.cislo)+_notime2+timetostr(time-1/24/3));
     if (time)<(1/24/60*StagINI.ReadInteger('STAG','AutoCasVz',20)) then time:=time+1;
     spoj.odjezdsem:=time-1/24/60*StagINI.ReadInteger('STAG','AutoCasVz',20);
    end;
   end;
 end;
end;

procedure TfrmMain.cbRazeniDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var i:integer;
begin
 with (Control as TComboBox).Canvas do begin
  font.size:=8;
  font.Color:=clBlack;
  Pen.Style:=pssolid;
  Pen.color:=clTeal;
  if odSelected in state then begin
    font.Color:=clWhite;
    Brush.Color:=clActiveCaption;
  end else begin
    Brush.Color:=clWhite;
  end;
  if (odComboBoxEdit in state) or (index=0) then begin
   brush.color:=clCream;
   font.Color:=clBlack;
   font.Style:=[];
   brush.Style:=bsSolid;
   Rectangle(rect);
   Textout(rect.Left+125,rect.Top+16,_pwr+(Control as TComboBox).items.Values['vykon']+' kW');
   Textout(rect.Left+5,rect.Top+1,_maxv+(Control as TComboBox).items.Values['maxv']+' km/h');
   Textout(rect.Left+5,rect.Top+16,_trlen+IfThen(AnsiUpperCase((Control as TComboBox).items.Values['delka'])='RANDOM','náhodná',(Control as TComboBox).items.Values['delka']+' m'));
   Textout(rect.Left+125,rect.Top+1,_weight+(Control as TComboBox).items.Values['hmotnost']+' t');
   if ((Control as TComboBox).items.Count>=5) and (odComboboxedit in state) then if VuzImgText((Control as TComboBox).items[4])<>nil then
    StretchDraw(classes.Rect(rect.left+240,rect.Top+1,rect.left+240+round(VuzWidthText((Control as TComboBox).items[4])*24/VuzHeightText((Control as TComboBox).items[4])),rect.top+25),VuzImgText((Control as TComboBox).items[4]));
  end else begin
   brush.color:=clTeal;
   font.Color:=clWhite;
   font.Style:=[fsBold];
   brush.Style:=bsSolid;
   TextOut(rect.Right-TextWidth((Control as TComboBox).items.names[index])-35,rect.top+1,(Control as TComboBox).items.names[index]);
   if VuzImgText((Control as TComboBox).items[index])<>nil then
    Draw(rect.left+10,rect.Top+1,VuzImgText((Control as TComboBox).items[index]));
  end;
 end;
end;

procedure TfrmMain.cbRazeniMeasureItem(Control: TWinControl;
  Index: Integer; var Height: Integer);
begin
 if index<0 then height:=30 else
  if (index=0) then height:=30 else
  if index in [1..3] then height:=0 else height:=max(15,VuzHeightText(((control as TComboBox).items[index]))+5);
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
 if frmInit<>nil then frmInit.BringToFront;
{ Application.ProcessMessages;
 pnlInfo.Caption:=_readingbmp;
 pnlInfo.Visible:=true;
 Application.ProcessMessages;}
 if frmInit<>nil then begin frmInit.lblInfo.Caption:='Obrázky vozù'; frmInit.Update; end;
 TrainImgLoad;
{ Application.ProcessMessages;
 pnlInfo.Visible:=false;}
 lbConsole.lines.add(_loaded+inttostr(images)+_picts);

 if frmInit<>nil then begin frmInit.lblInfo.Caption:='Øazení'; frmInit.Update; end;
 //vytvorit dialog razeni
 frmRazeni:=TfrmRazeni.Create(self);
 LangManager.TranslateForm(frmRazeni);

 if frmInit<>nil then begin frmInit.lblInfo.Caption:='Naèítám XML...'; frmInit.Update; end;
  if fileexists(paramstr(1)) then
  LoadFromXML(paramstr(1),false);

 if frmInit<>nil then begin frmInit.free;frmInit:=nil;end;
end;

procedure TfrmMain.mLanguageClick(Sender: TObject);
var frmLanguage:TfrmLanguage;
begin
 frmLanguage:=TfrmLanguage.Create(frmMain);
 frmLanguage.ShowModal;
 frmLanguage.free;
 if frmRazeni<>nil then
  LangManager.TranslateForm(frmRazeni);
end;

procedure TfrmMain.mGrafikonClick(Sender: TObject);
begin
 if frmGVD=nil then begin
  frmGVD:=TfrmGVD.Create(frmMain);
 end;
 frmGVD.Show;
 frmGVD.btnDraw.Click;
{ frmGVD.Free;}
end;

procedure TfrmMain.Importovatoblastzgvd1Click(Sender: TObject);
begin
 if OpenDialog.Execute then
  LoadFile(OpenDialog.FileName);
end;

procedure TfrmMain.mNahodnaClick(Sender: TObject);

begin
 //otevre dialog s nast. nahodne nakl. dopravy
 if doc<>nil then begin
  frmNakladni:=TfrmNakladni.Create(self);
  frmNakladni.ShowModal;
  frmNakladni.Free;
 end else begin
  showmessage(_xmlneed+XMLsuffix+_xmln2);
 end;
end;

procedure TfrmMain.Novinky1Click(Sender: TObject);
begin
 ShellExecute(handle,'open',pchar(extractfilepath(
  Application.ExeName)+'Editor-readme.txt'),'','',SW_MAXIMIZE);
end;

procedure TfrmMain.mOblastClick(Sender: TObject);
var i:integer;MI:TMenuItem;
begin
 //smaz MRU
 for i:=mOblast.Count-1 downto 0 do if ((mOblast.items[i].Caption[1]) in ['0'..'9']) or ((mOblast.items[i].Caption[2])  in ['0'..'9']) then mOblast.Delete(i);
 //pridej
 for i:=0 to 3 do
  if FileExists(StagINI.ReadString('MRU',inttostr(i),'eeeee')) then begin
   MI:=TMenuItem.Create(MainMenu);
   MI.Caption:=inttostr(i+1)+' '+MinimizeName(StagINI.ReadString('MRU',inttostr(i),'eeeee'),frmMain.Canvas,200);
   MI.Tag:=i;
   MI.OnClick:=mMRUListClick;
   mOblast.Insert(mOblast.IndexOf(mNadMRU)+1,MI);
 end;
end;


procedure TfrmMain.mMRUListClick(Sender: TObject);
begin
 if FileExists(StagINI.ReadString('MRU',inttostr((sender as TMenuItem).tag),'eeeee')) then begin
  opensfrommru:=true;
  OpenXMLDialog.FileName:=StagINI.ReadString('MRU',inttostr((sender as TMenuItem).tag),'eeeee');
  btnOpen.Click;
 end;
end;

procedure TfrmMain.btnEdPozClick(Sender: TObject);
begin
 if doc<>nil then begin
  frmDatPoz:=TfrmDatPoz.Create(frmMain);
  frmDatPoz.showmodal;
  frmDatPoz.free;
  change:=true;
  ReloadDatPozList;
 end else showmessage(_hastosave);
end;

procedure TfrmMain.Automatickpiazendatumovchpoznmek1Click(Sender: TObject);
var sl:Tstringlist;i,j,v,c:integer;ok:boolean;
begin
 //funkce priradi jedinecna cisla DP tam, kde jsou dosud jen texty
 if MessageDlg(_prevodp,mtInformation,[mbYes,mbNo],0)=mrYes then begin

  sl:=TStringList.Create;
  //projdeme vsechny vlaky, kde je text, nahradime cislem
  for i:=0 to JR.Count-1 do with JR.Items[i] as TSpoj do begin
   kdyjede:=trim(kdyjede);
   if (AnsiStartsText('1-7',kdyjede)) then kdyjede:='';
   if (kdyjede<>'') then begin
    //je to uz cislo?
    val(kdyjede,v,c);
    if c<>0 then begin
     //ne - napred hledame stavajici
     ok:=false;
     for j:=0 to sl.Count-1 do if kdyjede=copy(sl[j],pos('=',sl[j])+1,200) then
     begin ok:=true; kdyjede:=sl.Names[j]; end;
     if not ok then begin
      //vytvorime novou
      kdyjede:=sl.names[sl.Add(inttostr(sl.count+10)+'='+kdyjede)];
     end;
    end;
   end;
  end;

  lbConsole.Lines.Add(_trans+inttostr(sl.Count)+_notes);
  showmessage(_trnres);
  sl.SaveToFile(extractfilepath(filename)+'poznamky.txt');
  sl.Free;
 end;
end;

procedure TfrmMain.ReloadDatPozList;
var lt:string;   temp:TIcXMLElement;
begin
 lt:=cbJedeV.Text;
 cbJedeV.Clear;
 //nacti seznam poznamek z XML
 temp:= FindChild(pGVD,'dates');
 temp:= temp.GetFirstChild;
 while (temp<>nil) do begin
  cbJedeV.Items.Add(temp.GetAttribute('name'));
  temp:=temp.NextSibling;
 end;
 cbJedeV.Sorted:=true;
 cbJedeV.Text:=lt;
end;

procedure TfrmMain.cbJedeVChange(Sender: TObject);
begin
 lblDPInfo.Caption:=DatPozToText(cbJedeV.Text);
end;

procedure TfrmMain.cbJedeVDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
 with control as TComboBox do begin
  canvas.font.size:=8;
  Canvas.font.Color:=clBlue;
  Canvas.Pen.Style:=pssolid;
  Canvas.Pen.color:=clWhite;
  if odSelected in state then begin
   Canvas.font.Color:=clWhite;
   Canvas.Brush.Color:=clActiveCaption;
  end else begin
   Canvas.Brush.Color:=clWhite;
  end;
  Canvas.Rectangle(rect);
  Canvas.font.Style:=[fsBold];
  Canvas.Textout(rect.Left+5,rect.Top+1,Items[index]);
  Canvas.font.Style:=[];
  Canvas.font.color:=clGray;
  canvas.font.size:=7;
  Canvas.TextOut(rect.Left+35,rect.Top+2,
   DatPozToText(items[index]));
 end;
end;

procedure TfrmMain.Koprujazenvlakdojinstanice1Click(Sender: TObject);
begin
 if doc<>nil then begin
  frmRazImp:=TfrmRazImp.Create(self);
  frmRazImp.showmodal;
  frmRazImp.free;
 end else showmessage(_hastosave);
end;

procedure TfrmMain.btnDailyClick(Sender: TObject);
begin
 cbJedeV.Text:='';
 lblDPInfo.Caption:='';
end;

procedure TfrmMain.cbStaniceKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var j:integer;
begin
 if (key=VK_DOWN) and (ssShift	in Shift) then begin
  for j:=0 to lvZastavky.Items.Count-2 do if lvZastavky.Items[j]=lvZastavky.Selected
   then begin lvZastavky.Selected:=lvZastavky.Items[j+1];break;end;
       lvZastavkyClick(sender);
 end;
 if (key=VK_UP) and (ssShift	in Shift) then begin
  for j:=1 to lvZastavky.Items.Count-1 do if lvZastavky.Items[j]=lvZastavky.Selected
   then lvZastavky.Selected:=lvZastavky.Items[j-1];
    lvZastavkyClick(sender);
 end;
 if (key=VK_return) then btnZPridej.Click;
 key:=0;

end;

procedure TfrmMain.cbStaniceChange(Sender: TObject);
begin
 btnZUlozZmenu.Click;
end;

procedure TfrmMain.lvZastavkyKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 lvZastavkyClick(sender);
end;

procedure TfrmMain.Zmnasekcgrafikonu1Click(Sender: TObject);
begin
 //pri ukladani se zeptame na zmeny, pak znovu nacteme soubor
 if filename<>'' then begin
  change:=false;
  JR.SaveToFile(filename,true);
  lbConsole.lines.add('Uloženo.');
  mObnovitClick(sender);
  mReload.Click;
 end else showmessage(_plssave);

end;

var lastpotime:TTime;

procedure TfrmMain.ePrijOdjSousedniChange(Sender: TObject);
var newtime:ttime;
begin
 if not ePrijOdjSousedni.Modified then begin
  lastpotime:=strtotime(ePrijOdjSousedni.Text);
 end else
 if (cbSvaz.checked)
 and (trim(copy(ePrijOdjSousedni.Text,1,2))<>'') and
     (trim(copy(ePrijOdjSousedni.Text,4,2))<>'')
 and (strtoint(trim(copy(ePrijOdjSousedni.Text,1,2)))<=23) and
     (strtoint(trim(copy(ePrijOdjSousedni.Text,4,2)))<=59) then
 begin
  newtime:=strtotime(ePrijOdjSousedni.Text);
  //mame zastavky?
  if lvZastavky.Items.Count>0 then begin

   lvZastavky.Selected:=lvZastavky.Items[0];
   lvZastavkyClick(sender);
   with lvZastavky.items[0] do
    eOdjezd.text:=timetostr(strtotime(subitems[1])+newtime-lastpotime+1);
   btnZUlozZmenu.Click;
  end else if pcZanik.ActivePage=tsOdjizdi then begin
   try
    eodjcas.Text:=timetostr(strtotime(eodjcas.Text)+newtime-lastpotime+1);
   except on e:exception do
    frmMain.lbConsole.LineS.Add(_cantchgto);
   end;
  end;
  lastpotime:=newtime;

 end;
end;

procedure TfrmMain.cbPovinnaMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 btnZUlozZmenu.Click;
end;

procedure TfrmMain.cbNoveCisloChange(Sender: TObject);
var id,err:integer;
begin
 val(cbNoveCislo.text,id,err);
 if (err=0) and (id>10) and (jr.GetVlak(id)<>nil) then begin
  mNovyVl.Lines.Text:=_nexttr+jr.GetVlak(id).CelaTrasa;
 end else mNovyVl.Lines.Text:=_nexttrnoinfo;
end;

procedure TfrmMain.LangManagerBeforeAllTranslate(Sender: TObject);
begin
 if frmInit<>nil then begin frmInit.lblInfo.Caption:='Lokalizace'; frmInit.Update; end;
end;

procedure TfrmMain.LangManagerAfterAllTranslate(Sender: TObject);
begin
 if frmInit<>nil then begin frmInit.lblInfo.Caption:='Pøeloženo.'; frmInit.Update; end;
end;

procedure TfrmMain.btnNaPosunClick(Sender: TObject);
begin
 cbNoveCislo.ItemIndex:=-1;
 cbNoveCislo.itemindex:=0;
// cbNoveCisloChange(sender);
 mNovyVl.Clear;
 
end;

procedure TfrmMain.RaditDle(Sender: TObject);
begin
  ColumnToSort := (sender as TMenuItem).Tag;
  lvSpoje.AlphaSort;
end;

procedure TfrmMain.UpdateVOZYINIzInternetu1Click(Sender: TObject);
begin
 frmUpdate:=TfrmUpdate.Create(frmMain);
 frmUpdate.showmodal;
 frmUpdate.Free;
end;

procedure TfrmMain.abulkavlak1Click(Sender: TObject);
var frmTrTab:TfrmTrTable;
begin
 frmTrTab:=TfrmTrTable.create(frmMain);
 frmTrTab.showmodal;
 change:=true;
 frmTrTab.free;
 mObnovit.Click;
end;

procedure TfrmMain.btnProhodOznameniClick(Sender: TObject);
var tmp:integer;
var tmp2:string;
begin
 tmp:=cbPrijezdSmer.itemindex;
 tmp2:=cbOznamSmerPrij.Text;
 cbPrijezdSmer.itemindex:=cbOdjSmer.itemindex;
 cbOznamSmerPrij.Text:=cbOznamSmerOdj.Text;
 cbOdjSmer.itemindex:=tmp;
 cbOznamSmerOdj.text:=tmp2;
end;

procedure TfrmMain.tmrSearchTimer(Sender: TObject);
begin
 edHledac.Text:='';
 edHledac.Hide;
 tmrSearch.Enabled:=true;
end;

procedure TfrmMain.Editacespojtabulkou1Click(Sender: TObject);
var frmTrTable:TfrmTrTable;
begin
 frmTrTable:=TfrmTrTable.Create(frmMain);
 if frmTrTable.ShowModal=mrYes then begin
 end;
 frmTrTable.Free;
end;

end.
