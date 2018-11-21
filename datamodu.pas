unit datamodu;

interface

uses
  SysUtils, Classes, IcXMLParser, IcCodePages;

type
  TDataMod = class(TDataModule)
    XML: TIcXMLParser;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataMod: TDataMod;

implementation

{$R *.dfm}

end.
