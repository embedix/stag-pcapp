unit kontrola;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst, ExtCtrls;

type
  TfrmKontrola = class(TForm)
    Shape1: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lbPolozky: TMemo;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    btnSouhlas: TButton;
    Label7: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnSouhlasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmKontrola: TfrmKontrola;

implementation
uses main;

{$R *.dfm}

procedure TfrmKontrola.FormShow(Sender: TObject);
begin
 lbPolozky.lines.AddStrings(frmMain.lbConsole.Lines);
end;

procedure TfrmKontrola.btnSouhlasClick(Sender: TObject);
begin
 close;
end;

end.
