unit datumpoz;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, CheckLst, ExtCtrls, bsPolyglotUn;

type
  TfrmDatPoz = class(TForm)
    lbList: TListBox;
    Label1: TLabel;
    btnClear: TButton;
    btnNew: TButton;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    lbJede: TCheckListBox;
    lbNejede: TCheckListBox;
    edJede: TEdit;
    edNejede: TEdit;
    Calendar: TMonthCalendar;
    Label2: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Bevel1: TBevel;
    btnSaveChgs: TButton;
    bsPolyglotTranslator1: TbsPolyglotTranslator;
    procedure FormCreate(Sender: TObject);
    procedure lbListClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnSaveChgsClick(Sender: TObject);
    procedure btnNewClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure lbListDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure lbJedeDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; StateE: TOwnerDrawState);
  private
    { Private declarations }
    procedure ClearIt;
    procedure redrawlist;
  public
    { Public declarations }
  end;

function DatPozToText(name:string):string;

var
  frmDatPoz: TfrmDatPoz;

implementation
uses datamodu,main,gvd,IcXMLParser;

var akt:TIcXMLElement;

{$R *.dfm}

function AddComma(s:string):string;
begin
 if trim(s)<>'' then result:=s+', ' else result:=s;
end;


function DatPozToText(name:string):string;
var jede,nejede:string;  temp:TIcXMLElement;
begin
 name:=trim(name);
 if name='' then result:='jede dennì' else begin
  //hledame poznamku v xml datech
  if doc=nil then result:='není naèten/uložen soubor' else begin
    temp:= FindChild(pGVD,'dates');
    temp:= temp.GetFirstChild;
     while (temp<>nil) and (temp.GetAttribute('name')<>name) do
      temp:=temp.NextSibling;
    if temp=nil then result:='' else begin
     //vypiseme text poznamky
     temp:=temp.GetFirstChild;jede:='';nejede:='';
     while temp<>nil do begin
      if temp.TagName='run' then
       //zpracujeme RUN
       if temp.GetAttribute('till')<>'' then
        jede:=AddComma(jede)+temp.GetAttribute('at')+'-'+
        temp.GetAttribute('till')
       else
        jede:=AddComma(jede)+temp.GetAttribute('at');

       if temp.TagName='stop' then
       //zpracujeme STOP
       if temp.GetAttribute('till')<>'' then
        NeJede:=AddComma(NeJede)+temp.GetAttribute('at')+'-'+
        temp.GetAttribute('till')
       else
        NeJede:=AddComma(nejede)+temp.GetAttribute('at');
      temp:=temp.NextSibling;
     end;
     if (jede<>'') or (nejede<>'') then begin
      if jede<>'' then result:='jede v '+jede else result:='';
      if nejede<>'' then result:=addcomma(result)+'nejede '+nejede;
     end else result:='jede dennì';
    end;
  end;
end;
end;


procedure TfrmDatpoz.redrawlist;
var temp:TIcXMLElement;
begin
 //nacti seznam poznamek z XML
 temp:= FindChild(pGVD,'dates');
 temp:= temp.GetFirstChild;
 lbList.Clear;
 while (temp<>nil) do begin
  lbList.Items.Add(temp.GetAttribute('name')+'='+DatPozToText(temp.GetAttribute('name')));
  temp:=temp.NextSibling;
 end;
 lbList.Sorted:=true;
end;

procedure TfrmDatPoz.FormCreate(Sender: TObject);
begin
 RedrawList;
 StagINI.ReadSectionValues('jede',lbJede.Items);
 StagINI.ReadSectionValues('nejede',lbNeJede.Items);
end;

procedure TfrmDatPoz.ClearIt;
var i:integer;
begin
 edJede.text:='';
 edNejede.text:='';
 for i:=0 to lbJede.Items.count-1 do lbJede.checked[i]:=false;
 for i:=0 to lbneJede.Items.count-1 do lbneJede.checked[i]:=false; 
end;

function OznacVal(lb:TCheckListBox;value:string):boolean;
var i:integer;
begin
 result:=false;
 for i:=0 to lb.Items.Count-1 do if value=copy(lb.Items[i],pos('=',lb.Items[i])+1,100) then begin
  result:=true;
  lb.Checked[i]:=true;
 end;
end;


procedure TfrmDatPoz.lbListClick(Sender: TObject);
var temp:TIcXMLElement;
begin
 if not lbList.ItemIndex in [0..(lbList.Items.count-1)] then exit;
 //nacti seznam poznamek z XML
 temp:= FindChild(pGVD,'dates');
 temp:= temp.GetFirstChild;

 while (temp<>nil) and (temp.GetAttribute('name')<>lbList.Items.Names[lbList.ItemIndex]) do begin
  temp:=temp.NextSibling;
 end;
 if temp=nil then exit;
 //nacti xml data
 akt:=temp;
 ClearIt;
 //projdi XML data a zpracuj STOP a RUN elementy
 temp:=temp.GetFirstChild;
 while temp<>nil do begin
  if temp.TagName='run' then begin
   //zpracujeme RUN
   if temp.GetAttribute('till')<>'' then
    edJede.Text:=AddComma(edJede.Text)+temp.GetAttribute('at')+'-'+
     temp.GetAttribute('till')
   else if not OznacVal(lbJede,temp.GetAttribute('at')) then
    edJede.Text:=AddComma(edJede.Text)+temp.GetAttribute('at');
  end;
  if temp.TagName='stop' then begin
   //zpracujeme STOP
   if temp.GetAttribute('till')<>'' then
    edNeJede.Text:=AddComma(edNeJede.Text)+temp.GetAttribute('at')+'-'+
     temp.GetAttribute('till')
   else if not OznacVal(lbNeJede,temp.GetAttribute('at')) then
    edNeJede.Text:=AddComma(edNeJede.Text)+temp.GetAttribute('at');
  end;
  temp:=temp.NextSibling;
 end;
 btnSaveChgs.Enabled:=true;


end;

procedure TfrmDatPoz.Button3Click(Sender: TObject);
begin
 ModalResult:=mrOK;
end;

procedure TfrmDatPoz.Button1Click(Sender: TObject);
begin
 if trunc(Calendar.Date)<>trunc(Calendar.EndDate) then
  edJede.text:=AddComma(edJede.Text)+FormatDateTime('d.m.',Calendar.Date)+'-'+
   FormatDateTime('d.m.',Calendar.EndDate)
 else edJede.text:=AddComma(edJede.Text)+FormatDateTime('d.m.',Calendar.Date);
end;

procedure TfrmDatPoz.Button2Click(Sender: TObject);
begin
 if trunc(Calendar.Date)<>trunc(Calendar.EndDate) then
  edNeJede.text:=AddComma(edNeJede.Text)+FormatDateTime('d.m.',Calendar.Date)+'-'+
   FormatDateTime('d.m.',Calendar.EndDate)
 else edNeJede.text:=AddComma(edNeJede.Text)+FormatDateTime('d.m.',Calendar.Date);

end;

procedure TfrmDatPoz.btnSaveChgsClick(Sender: TObject);
var i:integer;child:TIcXMLElement;sg:string;
begin
 if akt=nil then exit;
 while akt.HasChild do akt.RemoveChild(akt.GetFirstChild);
 for i:=0 to lbJede.items.Count-1 do if lbJede.Checked[i] then begin
  child:=doc.CreateElement('run');
  child.SetAttribute('at',copy(lbjede.Items[i],pos('=',lbjede.Items[i])+1,100));
  akt.AppendChild(child);
 end;
 for i:=0 to lbNeJede.items.Count-1 do if lbNeJede.Checked[i] then begin
  child:=doc.CreateElement('stop');
  child.SetAttribute('at',copy(lbnejede.Items[i],pos('=',lbnejede.Items[i])+1,100));
  akt.AppendChild(child);
 end;
 edJede.Text:=trim(edJede.Text);
 if edJede.Text<>'' then begin
  edJede.Text:=edJede.Text+',';
  while pos(',',edJede.Text)>0 do begin
   child:=doc.CreateElement('run');
   sg:=copy(edJede.Text,1,pos(',',edJede.Text)-1);
   if pos('-',sg)>0 then begin
    child.SetAttribute('till',copy(sg,pos('-',sg)+1,100));
    sg:=copy(sg,1,pos('-',sg)-1);
   end;
   child.SetAttribute('at',sg);
   akt.AppendChild(child);
   edJede.text:=copy(edjede.Text,pos(',',edJede.Text)+1,200);
  end;
 end;

 ednejede.Text:=trim(ednejede.Text);
 if ednejede.Text<>'' then begin
  ednejede.Text:=ednejede.Text+',';
  while pos(',',ednejede.Text)>0 do begin
   child:=doc.CreateElement('stop');
   sg:=copy(ednejede.Text,1,pos(',',ednejede.Text)-1);
   if pos('-',sg)>0 then begin
    child.SetAttribute('till',copy(sg,pos('-',sg)+1,100));
    sg:=copy(sg,1,pos('-',sg)-1);
   end;
   child.SetAttribute('at',sg);
   akt.AppendChild(child);
   edneJede.text:=copy(ednejede.Text,pos(',',edneJede.Text)+1,200);
  end;
 end;
 akt:=nil;
 ClearIt;
 redrawlist;
 lbList.ItemIndex:=-1;
 btnSaveChgs.Enabled:=false;

end;

procedure TfrmDatPoz.btnNewClick(Sender: TObject);
var child:TIcXMLElement;    nam:string;
begin
 Randomize;
 nam:=inttostr(random(10000));
 if InputQuery('STAG '+Verze,'Zadejte jméno nové datumové poznámky (zkratku nebo èíslo)',nam) and (trim(nam)<>'') then
 begin
  child:=doc.CreateElement('date');
  child.SetAttribute('name',nam);
  FindChild(pGVD,'dates').AppendChild(child);
  akt:=child;
  btnSaveChgs.Enabled:=true;
  clearit;
 end;
 redrawlist;
end;

procedure TfrmDatPoz.btnClearClick(Sender: TObject);
var temp,par:TIcXMLElement;
begin
 if lbList.ItemIndex>=0 then begin
    //nacti seznam poznamek z XML
 temp:= FindChild(pGVD,'dates');
 par:=temp;
 temp:= temp.GetFirstChild;

 while (temp<>nil) and (temp.GetAttribute('name')<>lbList.Items.Names[lbList.ItemIndex]) do
  temp:=temp.NextSibling;
 if temp=nil then exit;
 //smazeme Temp
 par.RemoveChild(temp);
 redrawlist;
end;
end;
procedure TfrmDatPoz.lbListDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
 with control as TListBox do begin
  canvas.font.size:=8;
  Canvas.font.Color:=clBlue;
  Canvas.Pen.Style:=pssolid;
  Canvas.Pen.color:=clWhite;
  if odSelected in state then begin
   Canvas.font.Color:=clWhite;
   Canvas.Brush.Color:=clActiveCaption;
  end else begin
   Canvas.Brush.Color:=clWhite;
  end;
  Canvas.Rectangle(rect);
  Canvas.font.Style:=[fsBold];
  Canvas.Textout(rect.Left+5,rect.Top+1,Items.Names[index]);
  Canvas.font.Style:=[];
  Canvas.font.color:=clGray;
  canvas.font.size:=7;
  Canvas.TextOut(rect.Left+35,rect.Top+2,
   copy(items[index],pos('=',items[index])+1,200));
 end;
end;

procedure TfrmDatPoz.lbJedeDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; StateE: TOwnerDrawState);
begin
 with control as TCheckListBox do begin
  canvas.font.size:=8;
  Canvas.font.Color:=clBlack;
  Canvas.Pen.Style:=pssolid;
  Canvas.Pen.color:=clWhite;
  if (odSelected in StateE) then begin
   Canvas.font.Color:=clWhite;
   Canvas.Brush.Color:=clActiveCaption;
  end else begin
   Canvas.Brush.Color:=clWhite;
  end;
  Canvas.Rectangle(rect);
  if items.Names[index][1]='-' then checked[index]:=false;
  Canvas.font.Style:=[];
  Canvas.Textout(rect.Left+5,rect.Top,Items.Names[index]);
 end;
end;

end.
