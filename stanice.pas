unit stanice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, ValEdit, bsPolyglotUn;

type
  TfrmStanice = class(TForm)
    vleStanice: TValueListEditor;
    btnOK: TButton;
    btnStorno: TButton;
    Label1: TLabel;
    bsPolyglotTranslator1: TbsPolyglotTranslator;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmStanice: TfrmStanice;

implementation
uses main;
{$R *.dfm}

end.
