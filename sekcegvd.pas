unit sekcegvd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, bsPolyglotUn;

type
  TfrmSekce = class(TForm)
    cbGrafikony: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    bsPolyglotTranslator1: TbsPolyglotTranslator;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSekce: TfrmSekce;

implementation
uses main;
{$R *.dfm}

end.
