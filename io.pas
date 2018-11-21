unit io;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ValEdit, StdCtrls, ExtCtrls, bsPolyglotUn;

type
  TfrmIO = class(TForm)
    Label1: TLabel;
    lbIO: TListBox;
    memInfo: TMemo;
    Bevel1: TBevel;
    Label2: TLabel;
    eSoused: TLabeledEdit;
    eSmerOdj: TLabeledEdit;
    eSmerPrij: TLabeledEdit;
    Button1: TButton;
    bsPolyglotTranslator1: TbsPolyglotTranslator;
    procedure lbIOClick(Sender: TObject);
    procedure eSousedChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIO: TfrmIO;

implementation
uses gvd,main;

{$R *.dfm}

procedure TfrmIO.lbIOClick(Sender: TObject);
begin
 eSmerOdj.Enabled:=lbIO.ItemIndex>=0;
 eSmerPrij.Enabled:=lbIO.ItemIndex>=0;
 eSoused.Enabled:=lbIO.ItemIndex>=0;
 if lbIO.ItemIndex>=0 then begin
  with (lbIO.items.Objects[lbIO.ItemIndex] as TIO) do begin
   eSoused.text:=celynazev;
   eSmerOdj.text:=smerodj;
   eSmerPrij.text:=smerprij;
  end;
 end else begin
  eSoused.text:='';
  eSmerPrij.text:='';
  eSmerOdj.text:='';
 end;
end;

procedure TfrmIO.eSousedChange(Sender: TObject);
begin
 //ulozime zpet do objektu TIO, jen kdyz maji focus
 if eSoused.Focused or eSmerOdj.Focused or eSmerPrij.Focused then
  if lbIO.ItemIndex>=0 then begin
   with (lbIO.items.Objects[lbIO.ItemIndex] as TIO) do begin
    celynazev:=eSoused.text;
    smerodj:=eSmerOdj.text;
    smerprij:=eSmerPrij.text;
   end;
  end;

end;

procedure TfrmIO.FormShow(Sender: TObject);
begin
 if lbIO.Items.Count>0 then begin
  lbIO.ItemIndex:=0;
  lbIOClick(sender);
 end; 
end;

end.
