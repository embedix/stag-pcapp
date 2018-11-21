unit starting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TfrmInit = class(TForm)
    Image1: TImage;
    Shape1: TShape;
    lblStag: TLabel;
    lblInfo: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInit: TfrmInit;

implementation
uses main;

{$R *.dfm}

procedure TfrmInit.FormCreate(Sender: TObject);
begin
 lblStag.Caption:='STAG '+Verze;
 lblInfo.Caption:='Inicializace...';
end;

end.
