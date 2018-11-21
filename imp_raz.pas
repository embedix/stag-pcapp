unit imp_raz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, bsPolyglotUn;

type
  TfrmRazImp = class(TForm)
    btnClose: TButton;
    Button2: TButton;
    Bevel1: TBevel;
    Label1: TLabel;
    cbPrepis: TCheckBox;
    OpenXMLDialog: TOpenDialog;
    konzole: TMemo;
    bsPolyglotTranslator1: TbsPolyglotTranslator;
    procedure btnCloseClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRazImp: TfrmRazImp;

implementation
uses gvd,IcXMLParser, datamodu, main;
{$R *.dfm}

procedure TfrmRazImp.btnCloseClick(Sender: TObject);
begin
 modalresult:=mrOK;
end;

procedure TfrmRazImp.Button2Click(Sender: TObject);
var cildoc:TIcXMLDocument;pTrains,pGVD,elem,tmp,pRaz,firsttrain,walker:TIcXMLElement;cislo:string;
mam:boolean;
 procedure LoadXMLDocument(fname:string);
 var stream:TMemoryStream;
 var buf:array[0..2] of char;
 begin
 stream:=TMemoryStream.Create;
 if fileexists(fname) then stream.LoadFromFile(fname);
 stream.seek(0,soFromBeginning);
 stream.Read(buf,3);
 if buf[0]<>'<' then begin
  stream.seek(0,soFromBeginning);
  buf:= '   ';
  stream.Write(buf,3);
 end;
 if (not FileExists(fname)) or (not DataMod.XML.Parse(stream,cildoc)) then exit;
 stream.Free;
 end;
 procedure Cons(s:string);
 begin
   konzole.Lines.Add(s);
   Application.ProcessMessages;
 end;
begin
 //otevri stanici
 if OpenXMLDialog.Execute then begin
   try
    btnCLose.Enabled:=false;
    Cons('otevírám stanici... (strpení)');
    LoadXMLDocument(OpenXMLDialog.FileName);
    Cons('stanice otevøena, prohledávám vlaky...');
    firsttrain:=FindChild(gvd.pGVD,'trains').GetFirstChild;
    elem:=cildoc.GetDocumentElement;
    //nacteme zakladni elementy
    pGVD:=FindChild(elem,'gvd');
    pTrains:=FindChild(pGVD,'trains');
    //projdeme vlaky
    tmp:=pTrains.GetFirstChild;
    while (tmp<>nil) do begin
     pRaz:=FindChild(tmp,'razeni');
     cislo:=tmp.GetAttribute('cislo');
     if (pRaz.GetFirstChild=nil) or (cbPrepis.Checked) then begin
      cons(tmp.GetAttribute('typ')+' '+cislo+' -> vyhledávám øazení');
      //projdi vsechny vlaky v gvd.pTrains
      mam:=false;
      walker:=firsttrain;
      while (walker<>nil) and (not mam) do begin
       if walker.GetAttribute('cislo')=cislo then mam:=true else
       walker:=walker.NextSibling;
      end;
      if mam then begin
       //mame vlak
       cons(tmp.GetAttribute('typ')+' '+cislo+' -> nalezen');
       //ma razeni?
       if findchild(walker,'razeni').GetFirstChild<>nil then begin
        //ano, prevedeme.
        tmp.RemoveChild(findchild(tmp,'razeni')); //smazeme co tam je
        tmp.AppendChild(findchild(walker,'razeni').clonenode as TIcXMLElement);
        cons(tmp.GetAttribute('typ')+' '+cislo+' -> kopíruji');
       end else cons(tmp.GetAttribute('typ')+' '+cislo+' -> nemá øazení');
      end else begin
       cons(tmp.GetAttribute('typ')+' '+cislo+' -> není nalezen');
      end;
     end else cons(tmp.GetAttribute('typ')+' '+cislo+' má zadáno øazení.');
     tmp:=tmp.NextSibling;
    end;
    cons('ukládám stanici...');
    cildoc.Write(OpenXMLDialog.FileName);
    cons('ukládám zdrojovou stanici... (strpení)');
   finally
    btnCLose.Enabled:=true;
    cildoc.Free;
    main.frmMain.Uloitoblast1.Click;
    cons('Hotovo.');
    cons('Stanici, do které jste importovali øazení, nyní otevøete ve STAGu a uložte. Tím se do dat stanice uloží definice použitých vozù - jinak by nebyly vozy správnì zobrazovány ve Stanièáøi.');
   end;
 end;
end;

end.
