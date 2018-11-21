unit LangSel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmLanguage = class(TForm)
    Label1: TLabel;
    cbLanguage: TComboBox;
    btnExit: TButton;
    procedure FormCreate(Sender: TObject);
    procedure cbLanguageChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLanguage: TfrmLanguage;

implementation
uses main, bsPolyglotUn;
{$R *.dfm}

procedure TfrmLanguage.FormCreate(Sender: TObject);
var i:integer;
begin
 for i:=0 to frmMain.LangManager.LangCount-1 do
  cbLanguage.Items.add(frmMain.LangManager.Langs[i]);
 cbLanguage.Text:=frmMain.LangManager.CurrentLang;
 if cbLanguage.Text='' then cbLanguage.Text:='Czech';
end;

procedure TfrmLanguage.cbLanguageChange(Sender: TObject);
begin
 frmMain.LangManager.CurrentLang:=cbLanguage.Text;
 StagINI.WriteString('Stag','Language',cbLanguage.Text);
end;

end.
