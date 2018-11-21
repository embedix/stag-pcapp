unit sekcespr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IcXMLParser, ComCtrls, bsPolyglotUn, ExtCtrls;

type
  TfrmSpravasekci = class(TForm)
    btnClose: TButton;
    Label1: TLabel;
    edJmeno: TEdit;
    edPopis: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    btnNovaPrazdna: TButton;
    btnNovaKopii: TButton;
    btnSmazSekci: TButton;
    lvSekce: TListView;
    btnWriteChgs: TButton;
    bsPolyglotTranslator1: TbsPolyglotTranslator;
    Bevel1: TBevel;
    Bevel2: TBevel;
    procedure FormShow(Sender: TObject);
    procedure btnSmazSekciClick(Sender: TObject);
    procedure lvSekceClick(Sender: TObject);
    procedure btnWriteChgsClick(Sender: TObject);
    procedure btnNovaPrazdnaClick(Sender: TObject);
    procedure btnNovaKopiiClick(Sender: TObject);
  private
    { Private declarations }
    procedure NactiSeznamSekci;
  public
    { Public declarations }
  end;

var
  frmSpravasekci: TfrmSpravasekci;

implementation
uses gvd,main;

{$R *.dfm}

procedure TfrmSpravasekci.NactiSeznamSekci;
var tmp:TIcXMLElement;titem:TListItem;
begin
 tmp:=elem.GetFirstChild;
 lvSekce.items.Clear;
 while tmp<>nil do begin
  titem:=lvSekce.Items.Add;
  titem.Caption:=tmp.GetName;
  if tmp.GetName='gvd' then begin
   titem.SubItems.Add(tmp.GetAttribute('section'));
   titem.SubItems.Add(tmp.GetAttribute('sect_desc'));
  end else begin
   titem.SubItems.Add('-- system section --');
   titem.SubItems.Add('-- system section --');
  end;
  titem.SubItems.Objects[0]:=tmp;
  tmp:=tmp.NextSibling;
 end;
end;


procedure TfrmSpravasekci.FormShow(Sender: TObject);
begin
 screen.Cursor:=crHourGlass;
 NactiSeznamSekci;
 screen.Cursor:=crDefault;
end;

procedure TfrmSpravasekci.btnSmazSekciClick(Sender: TObject);
begin
 if lvSekce.Selected<>nil then
  with lvSekce.Selected.subitems.Objects[0] as TIcXMLElement do begin
   if GetName='gvd' then begin
    if mrYes=MessageDlg('Opravdu chcete smazat zvolenou sekci?',mtWarning,mbYesNoCancel,0) then
     elem.RemoveChild(lvSekce.Selected.subitems.Objects[0] as TIcXMLElement);
   end else showmessage('Tuto sekci nelze smazat.');
  end;
  NactiSeznamSekci;
end;

procedure TfrmSpravasekci.lvSekceClick(Sender: TObject);
begin
 if (lvSekce.Selected<>nil) and (lvSekce.selected.Caption='gvd') then begin
  edJmeno.Text:=lvSekce.Selected.SubItems[0];
  edPopis.Text:=lvSekce.Selected.SubItems[1];
  edJmeno.Enabled:=true;
  edPopis.Enabled:=true;
 end else begin
  edJmeno.Text:='';
  edPopis.Text:='';
  edJmeno.Enabled:=false;
  edPopis.Enabled:=false;
 end;
end;

procedure TfrmSpravasekci.btnWriteChgsClick(Sender: TObject);
begin
 if (lvSekce.Selected<>nil) and (lvSekce.selected.Caption='gvd') then begin
  with lvSekce.selected.SubItems.Objects[0] as TIcXMLElement do begin
   if trim(edJmeno.Text)='' then edJmeno.text:='no-name';
   SetAttribute('section',edJmeno.Text);
   SetAttribute('sect_desc',edPopis.Text);
  end;
 end;
 NactiSeznamSekci;
 lvSekceClick(sender);
end;

procedure TfrmSpravasekci.btnNovaPrazdnaClick(Sender: TObject);
var tmp:TIcXMLElement;
begin
 tmp:=TIcXMLElement.Create('gvd',doc);
 if trim(edJmeno.Text)='' then edJmeno.text:='no-name';
 tmp.SetAttribute('section',edJmeno.Text);
 tmp.SetAttribute('sect_desc',edPopis.Text);
 elem.AppendChild(tmp);
 NactiSeznamSekci;
end;

procedure TfrmSpravasekci.btnNovaKopiiClick(Sender: TObject);
var tmp:TIcXMLElement;
begin
 if (lvSekce.Selected<>nil) and (lvSekce.selected.Caption='gvd') then begin
  tmp:=TIcXMLElement.Create('gvd',doc);
  if trim(edJmeno.Text)='' then edJmeno.text:='no-name';
  tmp.SetAttribute('section',edJmeno.Text);
  tmp.SetAttribute('sect_desc',edPopis.Text);
  elem.AppendChild(tmp);
  tmp.InsertElementContent(lvSekce.selected.subitems.objects[0] as TIcXMLElement);
  NactiSeznamSekci;
 end; 
end;

end.
