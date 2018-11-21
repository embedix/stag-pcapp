unit razeni;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, CheckLst, inifiles, strutils,math,
  jpeg, bsPolyglotUn;

type
  TfrmRazeni = class(TForm)
    PageControl: TPageControl;
    tsStare: TTabSheet;
    tsRazeni: TTabSheet;
    rgTyp: TRadioGroup;
    edLength: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label2: TLabel;
    lblPocetVozu: TLabel;
    ScrollBox: TScrollBox;
    gbVlastVozu: TGroupBox;
    btnAdd: TButton;
    btnDelete: TButton;
    tvVozy: TTreeView;
    Label3: TLabel;
    btnDeleteAll: TButton;
    Label4: TLabel;
    lblZarazeni: TLabel;
    Label5: TLabel;
    lbParametry: TListBox;
    Label6: TLabel;
    cbLozeny: TCheckBox;
    cbSmer: TCheckListBox;
    Label7: TLabel;
    btnLoad: TButton;
    btnSave: TButton;
    lblChyba: TLabel;
    lvVlak: TListView;
    lblHmotnost: TLabel;
    lblInfo: TLabel;
    cbJednot: TCheckBox;
    SaveDialog: TSaveDialog;
    OpenDialog: TOpenDialog;
    imgVlak: TPaintBox;
    imgNahled: TImage;
    btnOtoc: TButton;
    bsPolyglotTranslator: TbsPolyglotTranslator;
    edHledej: TEdit;
    lbHledac: TListBox;
    edZbozi: TEdit;
    Label1: TLabel;
    pnlNoDirection: TPanel;
    cbSprava: TComboBox;
    Label8: TLabel;
    btnCpy: TButton;
    cbVjSunuty: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure lvVlakDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure lvVlakDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure btnDeleteAllClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure lvVlakKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure lvVlakClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbLozenyClick(Sender: TObject);
    procedure cbSmerClickCheck(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure lvVlakEditing(Sender: TObject; Item: TListItem;
      var AllowEdit: Boolean);
    procedure cbJednotClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure edLengthExit(Sender: TObject);
    procedure tsRazeniShow(Sender: TObject);
    procedure imgVlakEPaint(Sender: TObject);
    procedure lbParametryDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure tvVozyClick(Sender: TObject);
    procedure btnOtocClick(Sender: TObject);
    procedure edHledejChange(Sender: TObject);
    procedure lbHledacClick(Sender: TObject);
    procedure lbHledacDblClick(Sender: TObject);
    procedure edHledejEnter(Sender: TObject);
    procedure edHledejExit(Sender: TObject);
    procedure cbSpravaChange(Sender: TObject);
    procedure imgVlakMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edHledejKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCpyClick(Sender: TObject);
    procedure cbVjSunutyClick(Sender: TObject);

  private
    { Private declarations }
    procedure NactiStrom(sprava:integer);
  public
    { Public declarations }
    function GetParSL(full:boolean):TStringList;
    procedure LoadParSL(sl:TStringList);
    function gMaxV:integer;
    function gHmotnost:integer;
    function gDelka:integer;
    function gVykon:integer;
    procedure Prepis;
    procedure ObnovVlak;
  end;

var
  frmRazeni: TfrmRazeni;

implementation
uses main,TrainImages,gvd;
var allowch:boolean;
{$R *.dfm}

procedure TfrmRazeni.ObnovVlak;
var maxheight,w,i:integer;
begin
 cbVjSunuty.Checked:=frmMain.cbVjSunuty.Checked;
 maxheight:=0;
 w:=0;
 for i:=0 to lvVlak.Items.Count-1 do begin
  if VuzHeight(lvVlak.Items[i].Caption,strtoint('0'+lvVlak.items[i].subitems[2]))>maxheight then
   maxheight:=VuzHeight(lvVlak.Items[i].Caption,strtoint('0'+lvVlak.items[i].subitems[2]));
  if VuzHeight(lvVlak.Items[i].Caption,strtoint('0'+lvVlak.items[i].subitems[2]))=0 then begin
   if VuzHeight('default',0)>maxheight then
    maxheight:=VuzHeight('default',0);
   w:=w+VuzWidth('default',0);
  end else
  w:=w+VuzWidth(lvVlak.Items[i].Caption,strtoint('0'+lvVlak.items[i].subitems[2]));
 end;
 imgVlak.Width:=w+10;
 imgVlak.Height:=maxheight+30;
 imgVlak.canvas.Brush.Style:=bsSolid;
 imgVlak.canvas.Brush.Color:=clWhite;
 imgVlak.canvas.pen.style:=psClear;
 imgVlak.Canvas.Rectangle(imgVlak.Canvas.ClipRect);
 w:=2;
 imgVlak.Canvas.CopyMode:=cmSrcCopy;
 for i:=0 to lvVlak.Items.Count-1 do begin
  if VuzHeight(lvVlak.Items[i].Caption,strtoint('0'+lvVlak.items[i].subitems[2]))>0 then begin
   imgVlak.Canvas.Draw(w,1+maxheight-VuzHeight(lvVlak.items[i].caption,strtoint('0'+lvVlak.items[i].subitems[2])),
   VuzImg(lvVlak.items[i].caption,strtoint('0'+lvVlak.items[i].subitems[2]),(lvVlak.items[i].subitems.count>3) and (lvVlak.items[i].subitems[3]='X')));
   w:=w+VuzWidth(lvVlak.Items[i].Caption,strtoint('0'+lvVlak.items[i].subitems[2]));
  end else begin
   imgVlak.Canvas.Draw(w,1+maxheight-VuzHeight('default',0),VuzImg('default',0,false));
   w:=w+VuzWidth('default',0);
  end;
  lvVlak.Items[i].Data:=pointer(w);
 end;
end;

function TfrmRazeni.gMaxV:integer;
var i,maxvh,maxvv:integer;
    nme:string;
begin
 maxvh:=0;maxvv:=999;
 for i:=0 to lvVlak.Items.count-1 do begin
  nme:=lvVlak.Items[i].Caption;
  if vozy.ReadInteger(nme,'max_rych',999)<maxvv then maxvv:=
   vozy.ReadInteger(nme,'max_rych',999);
  if (vozy.ReadString(nme,'typ','vuz')='hnaci') and
    (vozy.ReadInteger(nme,'max_rych_hnaci',0)>maxvh) then maxvh:=
      vozy.ReadInteger(nme,'max_rych_hnaci',0);
 end;
 result:=min(maxvv,maxvh);
end;

function TfrmRazeni.gHmotnost:integer;
var i,t:integer;
    nme:string;
begin
 t:=0;
 for i:=0 to lvVlak.Items.count-1 do begin
  nme:=lvVlak.Items[i].Caption;
  t:=t+vozy.ReadInteger(nme,'hmotnost',0);
  if lvVlak.Items[i].SubItems[0]<>'' then
   t:=t+vozy.ReadInteger(nme,'naklad',0);
 end;
 result:=t;
end;

function TfrmRazeni.gDelka:integer;
var i:integer;t:real;
    nme:string;
begin
 t:=0;
 for i:=0 to lvVlak.Items.count-1 do begin
  nme:=lvVlak.Items[i].Caption;
  DecimalSeparator:=',';
  t:=t+StrToFloat(vozy.ReadString(nme,'delka','10'));
 end;
 result:=round(t);
end;

function TfrmRazeni.gVykon:integer;
var i,t:integer;
    nme:string;
begin
 t:=0;
 for i:=0 to lvVlak.Items.count-1 do begin
  nme:=lvVlak.Items[i].Caption;
  if vozy.ReadString(nme,'typ','vuz')='hnaci' then
   t:=t+(vozy.ReadInteger(nme,'vykon',0));
 end;
 result:=t;
end;




procedure TfrmRazeni.Prepis;
var t,i:integer;hnaci:boolean;maxvv,maxvh:integer;nme:string;
begin
 lblPocetVozu.Caption:='Poèet vozù: '+inttostr(lvVlak.Items.Count);
 t:=0;
 maxvh:=0;maxvv:=999;hnaci:=false;
 for i:=0 to lvVlak.Items.count-1 do begin
  nme:=lvVlak.Items[i].Caption;
  if vozy.ReadInteger(nme,'max_rych',999)<maxvv then maxvv:=
   vozy.ReadInteger(nme,'max_rych',999);
  if vozy.ReadString(nme,'typ','vuz')='hnaci' then begin
   hnaci:=true;
   if (vozy.ReadInteger(nme,'max_rych_hnaci',0)>maxvh) then maxvh:=
    vozy.ReadInteger(nme,'max_rych_hnaci',0);
  end;

  t:=t+vozy.ReadInteger(nme,'hmotnost',0);
  if lvVlak.Items[i].SubItems[0]<>'' then
   t:=t+vozy.ReadInteger(nme,'naklad',0);
 end;
 lblHmotnost.caption:=inttostr(t)+' tun';
 //kontrola hnacich vozidel
 lblChyba.Caption:='Vlak OK.';
 lblInfo.Caption:='';
 if not hnaci then lblChyba.Caption:='Chyba: vlak nemá hnací vozidlo!' else begin
  //zobrazit info o rychlostech
  lblInfo.Caption:='Max. rychlost vlaku: '+inttostr(min(maxvv,maxvh))+' km/h - max. rychl. hnacích vozidel: '+
   inttostr(maxvh)+', max. rychl. vozù: '+inttostr(maxvv);
  //pokud neni hn. voz. na zacatku, nadavej
  if vozy.ReadString(lvVlak.Items[0].Caption,'typ','vuz')<>'hnaci' then
   lblChyba.Caption:='Varování: Hnací vozidlo není na zaèátku vlaku!';
 end;


end;


procedure TfrmRazeni.NactiStrom(sprava:integer);
var phnaci,pvozy,droot,droot2,pravepridana,pom:TTreeNode;
    sltypy:TStringList;
    i,j:integer;
    nasli:boolean;
    subtyp:string;
    subobrid:integer;
begin
 //pridame jednotlive vozy do TreeView
 tvVozy.Items.Clear;
 sltypy:=TStringList.Create;
 vozy.ReadSections(sltypy);
 with tvVozy.Items do begin
  phnaci:=Add(GetFirstNode,'Hnací vozidla');
  pvozy:=Add(GetFirstNode,'Vozy');
  for i:=0 to sltypy.count-1 do begin
   //default je default a nepatri do seznamu
   if sltypy[i]='default' then continue;
   //kontrola, jestli je vuz spravne spravy
    //Ceske?
    if (sprava=1) and (pos('_',sltypy[i])>1) then continue;
    //Cizi?
    if (sprava>1) and (pos('_'+cbSprava.text,sltypy[i])<1) then continue;
   //kam to dame?
   if vozy.ReadString(sltypy[i],'typ','vuz')='hnaci' then
    droot:=phnaci else droot:=pvozy;
   //uz existuje dana podsekce?
   nasli:=false;
   subtyp:=vozy.ReadString(sltypy[i],'podtrida','Obecné');
   droot2:=droot;
   for j:=0 to droot.Count-1 do
    if droot.Item[j].Text=subtyp then begin
     droot2:=droot.Item[j];     nasli:=true;
    end;
   if not nasli then
    droot2:=AddChild(droot,subtyp);
   //pridej vozidlo
   pravepridana:=AddChild(droot2,sltypy[i]);
   //mame i pomocne obrazky?
   subobrid:=1;
   while IsVuzImg(sltypy[i],subobrid) do begin
    pom:=AddChild(pravepridana,'Obr. '+inttostr(subobrid));
    pom.Data:=(pravepridana);
    inc(subobrid);
   end;
   //trideni nodu
   droot2.AlphaSort(false);
  end;
 end;
 sltypy.Free;
end;

procedure TfrmRazeni.FormCreate(Sender: TObject);
var sl:TStringList; i:integer;
begin
 bsPolyglotTranslator.Translate;
 //existuje seznam vozu?
 if not FileExists(path+'vozy\vozy.ini') then begin
  showmessage('Nelze najít soubor '+path+'vozy\vozy.ini, kde je uložen seznam '+
  'a parametry vozù. Nastavení øazení vlaku po vozech bylo znapøístupnìno.');
  tsRazeni.Enabled:=false;
  PageControl.ActivePage:=tsStare;
 end
 else begin
  //nacti dostupne vozy
  vozy:=TMemIniFile.Create(path+'vozy\vozy.ini');
  vozy.CaseSensitive:=false;
  //nacti obsah komboboxu - seznam sprav
  cbSprava.items.add('Všechny vozy');
  cbSprava.items.add('ÈD/ÈSD/ŽSR');
  //pridavej spravy
  sl:=TStringList.create;
  vozy.ReadSections(sl);
  for i:=0 to sl.count-1 do if
   (pos('_',sl[i])>1) and (cbSprava.items.IndexOf(copy(sl[i],pos('_',sl[i])+1,100))<0) then
    cbSprava.items.add(copy(sl[i],pos('_',sl[i])+1,100));
  cbSprava.itemindex:=0;
  NactiStrom(0);
  sl.Free;
 end;
end;

procedure TfrmRazeni.FormDestroy(Sender: TObject);
begin
 vozy.Free;
end;

procedure TfrmRazeni.btnAddClick(Sender: TObject);
var item:TListItem;nme:string;  pomtv:TTreeNode;   obrid:integer;
begin
 if lbHledac.Visible then begin
  if (lbHledac.ItemIndex<0) and (lbHledac.Items.Count>0) then lbHledac.ItemIndex:=0;
  if lbHledac.ItemIndex<0 then exit;
  tvVozy.Selected:= lbHledac.Items.Objects[lbHledac.itemindex] as TTreeNode;
 end;

 if tvVozy.Selected<>nil then begin

  //uprav "jmeno" na otce, pokud jde o subobrazek
  obrid:=0;
  if tvVozy.selected.Data<>nil then begin
    pomtv:=(tvVozy.selected.data);
    nme:=(pomtv as TTreeNode).Text;
    obrid:=strtoint(copy(tvVozy.selected.text,6,10));
  end else
   nme:=tvVozy.selected.text;



  edHledej.text:='';
  lbHledac.Visible:=false;
  if vozy.SectionExists(nme) then begin
   item:=lvVlak.items.add;
   item.Caption:=nme;
   item.SubItems.Add('');
   item.SubItems.Add('');
   //cislo obrazku
   item.SubItems.Add(inttostr(obrid));
   //prevraceni
   item.SubItems.Add('');
//   item.DropTarget:=true;
   Prepis;
   edHledej.Text:='';
  end else
   ShowMessage('Zvolte si pøesný typ vozu ze seznamu!');
 end;
 ObnovVlak;

end;

procedure TfrmRazeni.lvVlakDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
 accept:=true;
end;

procedure TfrmRazeni.lvVlakDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var indn:integer;
    i:integer;
    item,litem:TListItem;
    done:boolean;
begin
 if not (source is TListView) then exit;
 //presune vsechny oznacene polozky pred polozku nas kterou je kurzor
 //pokud neni polozka, tak na konec
 if lvVlak.GetItemAt(x,y)<>nil then begin
  indn:=lvVlak.GetItemAt(x,y).Index;
  //pokud je cil oznaceny, odznacime jej
  lvVlak.Items[indn].Selected:=false;
 end else
  indn:=lvVlak.Items.Count;
 //vyhledame oznacene polozky a zkopirujeme je neoznacene
 repeat
  done:=true;
  for i:=0 to lvVlak.Items.Count-1 do
   if lvVlak.items[i].Selected then begin
//   item:=TListItem.create(lvVlak.items);
    litem:=lvVlak.Items[i];
    item:=lvVlak.Items.AddItem(nil,indn);
    item.caption:=litem.Caption;
    item.subitems.AddStrings(litem.subitems);
    item.Selected:=false;
    lvVlak.Items.Delete(lvVlak.Items.IndexOf(litem));
    if indn>lvVlak.Items.Count then indn:=lvVlak.Items.Count;
    done:=false;
  end;
 until done;
{ for i:=0 to lvVlak.Items.Count-1 do
  if lvVlak.items[i].Selected then
   lvVlak.Items.Delete(i);}
// indp:=lvVlak.Items.IndexOf(source as TListItem);
// indn:=
 ObnovVlak;
end;

procedure TfrmRazeni.btnDeleteAllClick(Sender: TObject);
begin
 lvVlak.Clear;
 ObnovVlak; 
 Prepis;
end;

procedure TfrmRazeni.btnDeleteClick(Sender: TObject);
begin
 lvVlak.DeleteSelected;
 ObnovVlak;
 Prepis;
end;

procedure TfrmRazeni.lvVlakKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=VK_DELETE then btnDelete.Click else lvVlakClick(sender);
  ObnovVlak;
end;

procedure TfrmRazeni.lvVlakClick(Sender: TObject);
var nme:string;i:integer;sl:TStringList;
begin
 lbParametry.Enabled:=lvVlak.ItemFocused<>nil;
 cbLozeny.Enabled:=lvVlak.ItemFocused<>nil;
 cbSmer.Enabled:=lvVlak.ItemFocused<>nil;
 btnCpy.Enabled:=lvVlak.ItemFocused<>nil; 
 if lvVlak.ItemFocused=nil then begin
 end else begin
  nme:=lvVlak.ItemFocused.Caption;
  vozy.ReadSectionValues(nme,lbParametry.Items);
  lblZarazeni.Caption:=IfThen(
   vozy.ReadString(nme,'typ','vuz')='hnaci',
   'Hnací vozidla - ','Vozy - ')+vozy.ReadString(nme,'podtrida','obecné');
  cbLozeny.Enabled:={vozy.ReadString(nme,'naklad','')<>''} true;
  if lvVlak.ItemFocused.SubItems[0]<>'' then begin
   cbSmer.Enabled:=true;
   sl:=TStringList.Create;
   sl.Delimiter:='|';
   sl.DelimitedText:=lvVlak.ItemFocused.SubItems[0];
   for i:=0 to cbSmer.items.count-1 do
    cbSmer.Checked[i]:=sl.IndexOf(cbSmer.Items.Names[i])>=0;
   sl.Free;
  end else cbSmer.Enabled:=false;
  edZbozi.text:=lvVlak.ItemFocused.SubItems[1];
  allowch:=false;
  cbLozeny.Checked:=lvVlak.ItemFocused.SubItems[0]<>'';
  allowch:=true;

 end;
 ObnovVlak;
end;

procedure TfrmRazeni.FormShow(Sender: TObject);
var sl:TStringList;
begin
 //pridat seznam smeru
 cbSmer.Items.Assign(IOList.GetIOList2);
 //nacist stav pole jednotka
 cbJednot.Checked:=frmMain.cbJednotka.checked;
 //nacist stringlist - pokud ma jen 1 polozku nebo nic, je to jen delka
 //jinak razeni po vozech
 if frmMain.cbRazeni.Items.Count<4 then begin
  rgTyp.ItemIndex:=0;
  if (frmMain.cbRazeni.Items.IndexOfName('delka')>=0) and
    (frmMain.cbRazeni.Items.Values['delka']<>'random') then begin
    edLength.Text:=frmMain.cbRazeni.Items.Values['delka'];
    rgTyp.ItemIndex:=1;
  end;
  PageControl.ActivePage:=tsStare;
 end else begin
  //nacti do lvVlak
  sl:=TStringList.create;
  sl.addstrings(frmMain.cbRazeni.items);
  LoadParSL(sl);
  sl.free;
  PageControl.ActivePage:=tsRazeni;
 end;
 //nacist 
 Prepis;
  ObnovVlak;
end;

procedure TfrmRazeni.cbLozenyClick(Sender: TObject);
var i,j:integer;smersg:string;
begin
 if (lvVlak.ItemFocused=nil) or (not allowch) then exit;
 cbSmer.Enabled:=cbLozeny.Checked;
 if cbLozeny.Checked then begin
  smersg:='';
  for i:=0 to cbSmer.Items.Count-1 do if
   cbSmer.Checked[i] then smersg:=
     smersg+cbSmer.Items.names[i]+'|';
  if length(smersg)>0 then smersg:=copy(smersg,1,length(smersg)-1);
  for j:=0 to lvVlak.Items.Count-1 do
   if (lvVlak.Items[j].Selected) {and (vozy.ReadString(lvVlak.Items[j].Caption,'naklad','')<>'') }then begin
    lvVlak.Items[j].SubItems[0]:=smersg;
  end;
 end else begin
  for j:=0 to lvVlak.Items.Count-1 do
   if lvVlak.Items[j].Selected then begin
    lvVlak.Items[j].SubItems[0]:='';
  end;
 end;
   for j:=0 to lvVlak.Items.Count-1 do
   if lvVlak.Items[j].Selected then
 lvVlak.Items[j].SubItems[1]:=edZbozi.Text;
 Prepis;
end;

procedure TfrmRazeni.cbSmerClickCheck(Sender: TObject);
begin
 cbLozenyClick(sender);
end;

procedure TfrmRazeni.LoadParSL(sl:TStringList);
var i:integer;item:TListItem;
begin
 lvVlak.Clear;
 for i:=4 to sl.Count-1 do begin
  item:=lvVlak.Items.Add;
  //rozparsuj hvezdickama oddeleny smejd
  item.Caption:=sl.Names[i];
  item.SubItems.Delimiter:='*';
  item.SubItems.DelimitedText:=copy(sl[i],length(item.Caption)+2,500);
 end;
 Prepis;
end;

function TfrmRazeni.GetParSL(full:boolean):TStringList;
var i:integer;
begin
 //vytvori stringlist podle dat v lvVlak
 result:=TStringList.Create;
 if full then begin
  result.Add('delka='+inttostr(gDelka));
  result.Add('hmotnost='+inttostr(gHmotnost));
  result.Add('vykon='+inttostr(gVykon));
  result.Add('maxv='+inttostr(gMaxV));
 end;
 //format polozek stringlistu:
 //typ=smer*poznamka*obrid*preklopeni
 for i:=0 to lvVlak.items.count-1 do
  result.Add(lvVlak.Items[i].Caption+'='+lvVlak.Items[i].SubItems[0]+'*'+lvVlak.Items[i].SubItems[1]+'*'+lvVlak.Items[i].SubItems[2]+'*'+lvVlak.Items[i].SubItems[3]+'*');
end;

procedure TfrmRazeni.btnSaveClick(Sender: TObject);
var sl:TStringList;
begin
 if SaveDialog.Execute then begin
  sl:=GetParSL(true);
  sl.SaveToFile(SaveDialog.FileName);
  sl.Free;
 end;
end;

procedure TfrmRazeni.btnLoadClick(Sender: TObject);
var sl:TStringList;
begin
 if OpenDialog.Execute then begin
  sl:=TStringList.Create;
  sl.LoadFromFile(OpenDialog.FileName);
  SaveDialog.FileName:=OpenDialog.FileName;
  LoadParSl(sl);
  sl.Free;
 end;
 ObnovVlak;
end;

procedure TfrmRazeni.lvVlakEditing(Sender: TObject; Item: TListItem;
  var AllowEdit: Boolean);
begin
 allowedit:=false;
end;

procedure TfrmRazeni.cbJednotClick(Sender: TObject);
begin
 frmMain.cbJednotka.Checked:=cbJednot.Checked;
end;

procedure TfrmRazeni.Button1Click(Sender: TObject);
begin
 ModalResult:=mrOK;
 if PageControl.ActivePage=tsStare then begin
  frmMain.cbRazeni.Items.clear;
  if rgTyp.ItemIndex=0 then frmMain.cbRazeni.Items.Add('delka=random')
   else frmMain.cbRazeni.Items.Add('delka='+edLength.Text);
 end else begin
  if gVykon=0 then begin
   showmessage('Vlak nemá hnací vozidlo!!!');
   tvVozy.setfocus;
   ModalResult:=0;
  end;
  frmMain.cbRazeni.Items.clear;
  frmMain.cbRazeni.Items.AddStrings(GetParSL(true));
 end;
end;

procedure TfrmRazeni.edLengthExit(Sender: TObject);
var l:integer;
begin
 try
  l:=strtoint(edLength.text);
  if (l<5) or (l>999) then begin
   showmessage('Delka musi byt v rozmezi 5 - 999 m.');
   edLength.SetFocus;
  end;
 except
  on Exception do begin
   showmessage('Delka musi byt v rozmezi 5 - 999 m.');
   edLength.SetFocus;
  end;
 end;
end;

procedure TfrmRazeni.tsRazeniShow(Sender: TObject);
begin
 ObnovVlak;
end;

procedure TfrmRazeni.imgVlakEPaint(Sender: TObject);
begin
 ObnovVlak;
end;

procedure TfrmRazeni.lbParametryDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var sg,jednotka,hodnota:string;i,j:integer;
begin
 with (control as TListBox).Canvas do begin
  font.color:=clBlack;
  font.Size:=8;
  Pen.Style:=pssolid;
  Pen.color:=clWhite;
  if odSelected in state then begin
   font.Color:=clWhite;
   Brush.Color:=clActiveCaption;
  end else begin
   Brush.Color:=clWhite;
  end;
  Rectangle(rect);
  font.Style:=[];
  sg:=ansilowercase((control as TListBox).Items.Names[index]);
  hodnota:=StagINI.ReadString('VozyIniPolozky',sg,sg);
  if pos('[',hodnota)>0 then begin
   jednotka:=copy(hodnota,pos('[',hodnota)+1,pos(']',hodnota)-pos('[',hodnota)-1);
   hodnota:=copy(hodnota,1,pos('[',hodnota)-1);
  end else jednotka:='';
  Textout(rect.Left+5,rect.Top+1, hodnota);
  font.Style:=[fsBold];
  if sg<>'elektro' then
   Textout(rect.Left+85,rect.Top+1,(control as TListBox).Items.Values[(control as TListBox).Items.Names[index]]+' '+jednotka)
  else begin
   sg:='';
   try
    j:=strtoint((control as TListBox).Items.Values[(control as TListBox).Items.Names[index]]);
    i:=1;
    repeat
     if (j and i)>0 then begin
      if sg<>'' then sg:=sg+', ';
      sg:=sg+StagINI.ReadString('Elektro',inttostr(i),'nezn.soust.('+inttostr(i)+')');
     end;
     i:=i*2;
    until (j*2<i);
    if sg='' then sg:=StagINI.ReadString('Elektro','0','')
   except
    on E:Exception do sg:='chybny udaj';
   end;
   Textout(rect.Left+85,rect.Top+1,sg)
  end;
 end;
end;

procedure TfrmRazeni.tvVozyClick(Sender: TObject);
var nme:string;pomtv:TTreeNode;obrid:integer;
begin
 if tvVozy.Selected=nil then exit;

 cbLozeny.Enabled:=false;
 cbSmer.Enabled:=false;

 //uprav "jmeno" na otce, pokud jde o subobrazek
 obrid:=0;
 if tvVozy.selected.Data<>nil then begin
  pomtv:=tvVozy.selected.data;
  if pomtv <> nil then
   nme:=(pomtv as TTreeNode).Text;
   obrid:=strtoint(copy(tvVozy.selected.text,6,10));
  end
 else
  nme:=tvVozy.selected.text;

  if VuzHeight(nme,obrid)>0 then begin
   imgNahled.Picture.Assign(VuzImg(nme,obrid,false));
   imgNahled.Proportional:=true;
   imgNahled.visible:=true;
  end else begin
   imgNahled.visible:=false;
  end;


 vozy.ReadSectionValues(nme,lbParametry.Items);
 if lbParametry.Items.Count>0 then begin
 lblZarazeni.Caption:=IfThen(
   vozy.ReadString(nme,'typ','vuz')='hnaci',
   'Hnací vozidla - ','Vozy - ')+vozy.ReadString(nme,'podtrida','obecné');

 end;
 ObnovVlak;

end;

procedure TfrmRazeni.btnOtocClick(Sender: TObject);
var tmp:TListItem;i:integer;
begin
 if lvVlak.Items.Count>1 then
  for i:=0 to (lvVlak.Items.Count-1) div 2 do
  begin
   tmp:=TListItem.Create(lvVlak.Items);
   tmp.Assign(lvVlak.Items[i]);
   lvVlak.Items[i].Assign(lvVlak.Items[lvVlak.Items.Count-1-i]);
   lvVlak.Items[lvVlak.Items.Count-1-i].assign(tmp);
  end;
 ObnovVlak;
 Prepis;
end;

procedure NaplnHledac(nod:TTreeNode;co:string);
var pomtv:TTreeNode;nme:string;
begin
 while nod<>nil do begin

   if nod.Data<>nil then begin
    pomtv:=(nod.data);
    nme:=pomtv.Text+' '+nod.text;
   end else
    nme:=nod.text;

  if AnsiContainsText('-'+nme,'-'+co) and ((nod.getfirstchild=nil) OR (nod.getFirstChild.Data<>nil)) then begin
    frmRazeni.lbHledac.Items.Objects[frmRazeni.lbHledac.Items.Add(nme)]:=nod;
  end;
  NaplnHledac(nod.getFirstChild,co);
  nod:=nod.getNextSibling;
 end;
end;


procedure TfrmRazeni.edHledejChange(Sender: TObject);
var pn:TTreeNode;
begin
 if (edHledej.Text<>'') then begin
  lbHledac.Items.BeginUpdate;
  lbHledac.Clear;
  lbHledac.Sorted:=false;
  NaplnHledac(tvVozy.Items.GetFirstNode,edHledej.Text);
  lbHledac.Sorted:=true;
  lbHledac.Items.EndUpdate;
  if lbHledac.Items.Count>0 then begin
   lbHledac.Visible:=true;
   edHledej.Color:=clWindow;
   if lbHledac.Items.Count=1 then lbHledac.ItemIndex:=0;
  end else begin
   beep;
   edHledej.Color:=clRed;
   lbHledac.Visible:=false;   
  end;
 end else begin
  lbHledac.Visible:=false;
  edHledej.Color:=clWindow;
 end;
end;

procedure TfrmRazeni.lbHledacClick(Sender: TObject);
begin
 if lbHledac.ItemIndex<0 then exit;
 tvVozy.Selected:= lbHledac.Items.Objects[lbHledac.itemindex] as TTreeNode;;
 tvVozyClick(sender);
end;

procedure TfrmRazeni.lbHledacDblClick(Sender: TObject);
begin
 btnAdd.Click;
end;

procedure TfrmRazeni.edHledejEnter(Sender: TObject);
begin
 btnAdd.Default:=true;
end;

procedure TfrmRazeni.edHledejExit(Sender: TObject);
begin
 btnAdd.Default:=false;
end;

procedure TfrmRazeni.cbSpravaChange(Sender: TObject);
begin
 NactiStrom(cbSprava.ItemIndex);
end;

procedure TfrmRazeni.imgVlakMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var i:integer;
begin
 //najdi, na ktery vuz se kliklo, zmen mu preklopeni a obnov
 for i:=0 to lvVlak.Items.Count-1 do
  if x<integer(lvVlak.items[i].Data) then begin
   //preklop vuz I
   if (lvVlak.Items[i].SubItems.Count<3) or (lvVlak.Items[i].SubItems[3]<>'X') then
    lvVlak.Items[i].SubItems[3]:='X' else
    lvVlak.Items[i].SubItems[3]:=' '; 
   break;
  end;
 ObnovVlak;
end;

procedure TfrmRazeni.edHledejKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (Key=VK_DOWN) and lbHledac.Visible and (lbHledac.ItemIndex < lbHledac.Items.Count-1) then begin
  lbHledac.ItemIndex:=lbHledac.ItemIndex+1;
  key:=0;
 end;
 if (Key=VK_UP) and lbHledac.Visible and (lbHledac.ItemIndex>0) then begin
  lbHledac.ItemIndex:=lbHledac.ItemIndex-1;
  key:=0;
 end;
 lbHledacClick(sender);
end;

procedure TfrmRazeni.btnCpyClick(Sender: TObject);
var nli:TListItem;
begin
 if lvVlak.ItemFocused<>nil then begin
        nli:=lvVlak.Items.Add;
        nli.Caption:=lvVlak.ItemFocused.Caption;
        nli.Data:=lvVlak.ItemFocused.Data;
        nli.SubItems.Add(lvVlak.ItemFocused.SubItems[0]);
        nli.SubItems.Add(lvVlak.ItemFocused.SubItems[1]);
        //cislo obrazku
        nli.SubItems.Add(lvVlak.ItemFocused.SubItems[2]);
        //prevraceni
        nli.SubItems.Add(lvVlak.ItemFocused.SubItems[3]);

        Prepis;
        ObnovVlak;
 end;
end;

procedure TfrmRazeni.cbVjSunutyClick(Sender: TObject);
begin
 frmMain.cbVjSunuty.Checked:=cbVjSunuty.Checked;
end;

end.
