unit properities;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, inifiles, ExtCtrls, Spin, bsPolyglotUn;

type
  TfrmProperities = class(TForm)
    btnOK: TButton;
    lbTyp: TListBox;
    Label1: TLabel;
    ColorBox: TColorBox;
    Label2: TLabel;
    cbTucne: TCheckBox;
    btnSave: TButton;
    cbZDoTucne: TCheckBox;
    seCasVz: TSpinEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    bsPolyglotTranslator: TbsPolyglotTranslator;
    Bevel1: TBevel;
    Label10: TLabel;
    cbCreateBackups: TCheckBox;
    cbSaveToGVD: TCheckBox;
    Bevel2: TBevel;
    Label11: TLabel;
    cbNiceMenu: TCheckBox;
    cbBuzerace: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure lbTypDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure lbTypClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure cbZDoTucneClick(Sender: TObject);
    procedure seCasVzChange(Sender: TObject);
    procedure cbCreateBackupsClick(Sender: TObject);
    procedure cbSaveToGVDClick(Sender: TObject);
    procedure cbNiceMenuClick(Sender: TObject);
    procedure cbBuzeraceClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ini:TMemIniFile;
    constructor CreateWINI(owner:TComponent;StagINI:TMemIniFile);
  end;

var
  frmProperities: TfrmProperities;

implementation
uses main;
{$R *.dfm}

constructor TfrmProperities.CreateWINI;
begin
 ini:=StagINI;
 inherited Create(owner);
end;

procedure TfrmProperities.FormCreate(Sender: TObject);
begin
 bsPolyglotTranslator.Translate;
 lbTyp.Clear;
 ini.readsection('Typ_vlaku',lbTyp.Items);
 cbZDoTucne.Checked:=ini.ReadBool('STAG','Z_Do_tucne',false);
 seCasVz.Value:=ini.ReadInteger('STAG','AutoCasVz',20);
 cbCreateBackups.Checked:=ini.ReadBool('STAG','CreateBackups',false);
 cbNiceMenu.Checked:=ini.ReadBool('STAG','NiceMenu',true);
 cbSaveToGVD.Checked:=ini.ReadBool('STAG','WriteOldFormatGVD',false);
 cbBuzerace.Checked:= ini.ReadBool('STAG','BuzeracniDialog',true);
end;

procedure TfrmProperities.lbTypDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
 with control as TListBox do begin
  canvas.font.size:=8;
  Canvas.font.Color:=INI.ReadInteger('Barvy_vlaku',Items[index],0);
  Canvas.Pen.Style:=pssolid;
  Canvas.Pen.color:=clWhite;
  if odSelected in state then begin
   Canvas.font.Color:=clWhite;
   Canvas.Brush.Color:=clActiveCaption;
  end else begin
   Canvas.Brush.Color:=clWhite;
  end;
  Canvas.Rectangle(rect);
  if ini.ReadBool('Tucne_vlaky',Items[index],false) then
   Canvas.font.Style:=[fsBold]
  else
  Canvas.font.Style:=[];
  Canvas.Textout(rect.Left+5,rect.Top+1,Items[index]);
  Canvas.font.Style:=[];
  Canvas.font.color:=clGray;
  canvas.font.size:=7;
  Canvas.TextOut(rect.Left+45,rect.Top+2,
   INI.ReadString('Typ_vlaku',Items[index],''));
 end;
end;

procedure TfrmProperities.lbTypClick(Sender: TObject);
var typ:string;
begin
 if lbTyp.ItemIndex<0 then exit;
 typ:=trim(lbTyp.Items[lbTyp.ItemIndex]);
 ColorBox.Selected:=clBlack; {nutny workaround jinak se neupdatuje}
 ColorBox.Selected:=ini.ReadInteger('Barvy_vlaku',typ,clBlack);
 cbTucne.Checked:=ini.ReadBool('Tucne_vlaky',typ,false);
end;

procedure TfrmProperities.btnSaveClick(Sender: TObject);
var typ:string;
begin
 if lbTyp.ItemIndex<0 then exit;
 typ:=trim(lbTyp.Items[lbTyp.ItemIndex]);
 ini.WriteBool('Tucne_vlaky',typ,cbTucne.Checked);
 ini.WriteInteger('Barvy_vlaku',typ,ColorBox.Selected);
 lbTyp.Repaint;
end;

procedure TfrmProperities.cbZDoTucneClick(Sender: TObject);
begin
 ini.WriteBool('STAG','Z_Do_tucne',cbZDoTucne.Checked);
end;

procedure TfrmProperities.seCasVzChange(Sender: TObject);
begin
 ini.WriteInteger('STAG','AutoCasVz',seCasVz.Value);
end;

procedure TfrmProperities.cbCreateBackupsClick(Sender: TObject);
begin
 ini.WriteBool('STAG','CreateBackups',cbCreateBackups.Checked);
end;

procedure TfrmProperities.cbSaveToGVDClick(Sender: TObject);
begin
 ini.WriteBool('STAG','WriteOldFormatGVD',cbSaveToGVD.Checked);
end;

procedure TfrmProperities.cbNiceMenuClick(Sender: TObject);
begin
 ini.WriteBool('STAG','NiceMenu',cbNiceMenu.Checked);
 frmMain.XPMenu.Active:=cbNiceMenu.Checked;
end;

procedure TfrmProperities.cbBuzeraceClick(Sender: TObject);
begin
 ini.WriteBool('STAG','BuzeracniDialog',cbBuzerace.Checked);
end;

end.
