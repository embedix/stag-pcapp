unit datum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst, ComCtrls;

type
  TfrmDatum = class(TForm)
    btnCancel: TButton;
    btnOK: TButton;
    mText: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lbJede: TCheckListBox;
    lbNejede: TCheckListBox;
    Label4: TLabel;
    edJede: TEdit;
    Label5: TLabel;
    edNejede: TEdit;
    btnUse: TButton;
    Calendar: TMonthCalendar;
    Label6: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnUseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDatum: TfrmDatum;

implementation

{$R *.dfm}

procedure TfrmDatum.FormCreate(Sender: TObject);
begin
 lbJede.Header[0]:=true;
 lbJede.Header[3]:=true;
 lbNeJede.Header[0]:=true;
 lbNeJede.Header[3]:=true;
 lbNeJede.Header[9]:=true;
end;

procedure TfrmDatum.btnUseClick(Sender: TObject);
begin
// Calendar.
end;

end.
