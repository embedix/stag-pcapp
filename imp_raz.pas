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
    Cons('otev�r�m stanici... (strpen�)');
    LoadXMLDocument(OpenXMLDialog.FileName);
    Cons('stanice otev�ena, prohled�v�m vlaky...');
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
      cons(tmp.GetAttribute('typ')+' '+cislo+' -> vyhled�v�m �azen�');
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
        cons(tmp.GetAttribute('typ')+' '+cislo+' -> kop�ruji');
       end else cons(tmp.GetAttribute('typ')+' '+cislo+' -> nem� �azen�');
      end else begin
       cons(tmp.GetAttribute('typ')+' '+cislo+' -> nen� nalezen');
      end;
     end else cons(tmp.GetAttribute('typ')+' '+cislo+' m� zad�no �azen�.');
     tmp:=tmp.NextSibling;
    end;
    cons('ukl�d�m stanici...');
    cildoc.Write(OpenXMLDialog.FileName);
    cons('ukl�d�m zdrojovou stanici... (strpen�)');
   finally
    btnCLose.Enabled:=true;
    cildoc.Free;
    main.frmMain.Uloitoblast1.Click;
    cons('Hotovo.');
    cons('Stanici, do kter� jste importovali �azen�, nyn� otev�ete ve STAGu a ulo�te. T�m se do dat stanice ulo�� definice pou�it�ch voz� - jinak by nebyly vozy spr�vn� zobrazov�ny ve Stani���i.');
   end;
 end;
end;

end.
