unit StaGN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IcXMLParser, Spin, ExtCtrls, CheckLst, bsPolyglotUn,
  strutils, trainimages, math;

type
  TfrmNakladni = class(TForm)
    seInitFreq: TSpinEdit;
    Label1: TLabel;
    Label3: TLabel;
    lbIOPoints: TListBox;
    Label4: TLabel;
    edJmeno: TLabeledEdit;
    seMult: TSpinEdit;
    Label5: TLabel;
    Label6: TLabel;
    lbSmery: TCheckListBox;
    Label7: TLabel;
    seMult2: TSpinEdit;
    Label8: TLabel;
    Label9: TLabel;
    btnSaveCh: TButton;
    Bevel1: TBevel;
    Button1: TButton;
    bsPolyglotTranslator1: TbsPolyglotTranslator;
    GroupBox1: TGroupBox;
    Button2: TButton;
    lbSoupravy: TListBox;
    cbNRazeni: TComboBox;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    lbTypyVlaku: TComboBox;
    Label2: TLabel;
    cbSoupravy: TComboBox;
    Label10: TLabel;
    lbVlaky: TListBox;
    Button8: TButton;
    btnDelNV: TButton;
    procedure btnOpenClick(Sender: TObject);
    procedure seInitFreqChange(Sender: TObject);
    procedure lbIOPointsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lbSmeryClick(Sender: TObject);
    procedure seMult2Click(Sender: TObject);
    procedure btnSaveChClick(Sender: TObject);
    procedure lbIOPointsDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure lbTypyVlakuDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure lbTypyVlakuMeasureItem(Control: TWinControl; Index: Integer;
      var Height: Integer);
    procedure lbSmeryClickCheck(Sender: TObject);
    procedure lbTypyVlakuClickCheck(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure lbSoupravyClick(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure cbNRazeniDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure cbNRazeniMeasureItem(Control: TWinControl; Index: Integer;
      var Height: Integer);
    procedure Button1Click(Sender: TObject);
    procedure lbSoupravyDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure Button8Click(Sender: TObject);
    procedure btnDelNVClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormHide(Sender: TObject);
  private
    { Private declarations }
    procedure updateSCB;    
  public
    { Public declarations }
    procedure LoadData;
  end;

var
  frmNakladni: TfrmNakladni;
  filename:string;

implementation
uses main,gvd, razeni;
{$R *.dfm}


procedure tfrmnakladni.updateSCB;
var i:integer;
begin

  cbSoupravy.clear;
  cbSoupravy.items.add('náhodná/random');
  for i:=0 to lbSoupravy.items.count-1 do cbSoupravy.items.add(lbSoupravy.items.names[i]);

end;


procedure TfrmNakladni.LoadData;
var temp:TIcXMLElement;
begin
  //a nacteme data do seInitFreq
  temp:=FindChild(pGVD,'goodstrain');
  if temp.GetAttribute('init_frequency')='' then temp.SetAttribute('init_frequency','5');
  seInitFreq.Value:=strtoint(temp.GetAttribute('init_frequency'));
end;



procedure TfrmNakladni.btnOpenClick(Sender: TObject);
begin

   //ziskame jeste nejaka zakladni data
   //...treba jmeno stanice
//   lblStationName.Caption:='STANICE: '+(pStation.getelementsbytagname('name').getfirst as TIcXMLElement).getfirstchardata.data;

   //nastavime dialog
   LoadData;
end;

procedure TfrmNakladni.seInitFreqChange(Sender: TObject);
begin
  FindChild(pGVD,'goodstrain').SetAttribute('init_frequency',inttostr(seInitFreq.Value));
  change:=true;
end;

procedure TfrmNakladni.lbIOPointsClick(Sender: TObject);
var temp:TIcXMLNode;
    i,p:integer;
begin
 if (lbIOPoints.itemindex<0) or (lbIOPoints.items.Objects[lbIOPoints.itemindex]=nil) then exit;
 with lbIOPoints.items.Objects[lbIOPoints.itemindex] as TIcXMLElement do begin
  //jmeno bodu
  edJmeno.Text:='   '+GetAttribute('celejmeno');
  //nasobek
  if GetAttribute('mult')<>'' then
   seMult.value:=strtoint(GetAttribute('mult')) else
   seMult.value:=1;
 end;
 //seznam typu

 lbVlaky.Clear;
 temp:=(lbIOPoints.items.Objects[lbIOPoints.itemindex] as TIcXMLElement).GetElementsByTagName('type').GetFirst;
 while temp<>nil do begin
  lbVlaky.Items.Add((trim((temp as TIcXMLElement).getfirstchardata.Data)+'='+(temp as TIcXMLElement).GetAttribute('id')));
  temp:=temp.Next;
 end;

 for i:=0 to  lbSmery.Items.Count-1 do lbSmery.Checked[i]:=false;
 temp:=(lbIOPoints.items.Objects[lbIOPoints.itemindex] as TIcXMLElement).GetElementsByTagName('to').GetFirst;
 while temp<>nil do begin
  p:=lbSmery.Items.IndexOfName(trim((temp as TIcXMLElement).getfirstchardata.Data));
  if p>=0 then begin
   lbSmery.Checked[p]:=true;
   lbSmery.Items[p]:=trim((temp as TIcXMLElement).getfirstchardata.Data);
   if (temp as TIcXMLElement).GetAttribute('mult')='' then
     lbSmery.Items[p]:=lbSmery.Items[p]+'=1'
    else
     lbSmery.Items[p]:=lbSmery.Items[p]+'='+(temp as TIcXMLElement).GetAttribute('mult');
  end
   else showmessage('Neznamy smer vlaku: '+trim((temp as TIcXMLElement).getfirstchardata.Data));
  temp:=temp.Next;
 end;
end;

procedure TfrmNakladni.FormCreate(Sender: TObject);
var i:integer;walker,tmp:TIcXMLElement;text:string;sl:TStringList;
begin
 bsPolyglotTranslator1.Translate;
 //nacteme typy vlaku
 StagINI.ReadSectionValues('Typ_vlaku',lbTypyVlaku.Items);
 //nastavime dialog podle prostredi programu
 lbIOPoints.Clear;

 lbIOPoints.Items.AddStrings(IOList.GetIOList2);
 lbSmery.Clear;

 walker:=pPolicka.GetFirstChild;

 for i:=0 to  lbIOPoints.Items.Count-1 do begin
  lbSmery.Items.Add(lbIOPoints.Items.Names[i]+'=1');
  lbIOPoints.Items.Objects[i]:=nil;
 end;
 while walker<>nil do begin
  if (trim(walker.GetAttribute('tvar'))='4') and
  (trim(walker.GetAttribute('typ'))<>'') then begin
   //mame i/o bod, zkusime ho najit v lbIOPoints
   text:=trim(walker.GetAttribute('text'));
   if (lbIOPoints.Items.IndexOfName(text) >= 0) and
    (lbIOPoints.Items.Objects[lbIOPoints.Items.IndexOfName(text)]=nil) then
    lbIOPoints.Items.Objects[lbIOPoints.Items.IndexOfName(text)]:=walker;
  end;
  walker:=walker.NextSibling;
 end;
 //nacteme default pocet vlaku
 LoadData;

 //nacteme nahodne soupravy
 walker:=findchild(pGVD,'nahsoupravy');
 walker:=walker.GetFirstChild;
 sl:=TStringList.Create;
 sl.Delimiter:=',';
 sl.QuoteChar:='"';
 lbSoupravy.Clear;
 while walker<>nil do begin
   if HasChildName(walker,'razeni') then begin
    //najdeme nod
    sl.Clear;
    tmp:=FindChild(walker,'razeni');
    if tmp.GetAttribute('delka')='random' then sl.add('delka=random') else begin
     sl.add('delka='+tmp.GetAttribute('delka'));
     sl.add('hmotnost='+tmp.GetAttribute('hmotnost'));
     sl.add('vykon='+tmp.GetAttribute('vykon'));
     sl.add('maxv='+tmp.GetAttribute('maxv'));
     tmp:=tmp.GetFirstChild;
     while (tmp<>nil) do begin
      sl.Add(tmp.GetAttribute('typ')+'='+tmp.GetAttribute('smer'));
      tmp:=tmp.NextSibling;
     end;
   end;
   lbSoupravy.items.add(walker.GetAttribute('id')+'='+sl.DelimitedText);
  end;
  walker:=walker.NextSibling;
 end;
 sl.free;
 updateSCB;


 if lbIOPoints.Items.count>0 then begin lbIOPoints.ItemIndex:=0; lbIOPointsClick(sender); end;
end;

procedure TfrmNakladni.lbSmeryClick(Sender: TObject);
begin
 if lbSmery.ItemIndex>=0 then
  //nacti cast stringu za =
  seMult2.Value:=strtoint(copy(lbSmery.Items[lbSmery.ItemIndex],1+pos('=',lbSmery.Items[lbSmery.ItemIndex]),5));
end;

procedure TfrmNakladni.seMult2Click(Sender: TObject);
begin
 //zmenu hned uloz do dat
 if lbSmery.ItemIndex>=0 then
  lbSmery.items[lbSmery.ItemIndex]:=  lbSmery.items.Names[lbSmery.ItemIndex]+'='+inttostr(seMult2.Value);
end;

procedure TfrmNakladni.btnSaveChClick(Sender: TObject);
var temp,child:TIcXMLElement;
    i:integer;
begin
 change:=true;
 if lbIOPoints.ItemIndex>=0 then begin
  temp:=lbIOPoints.items.objects[lbIOPoints.ItemIndex] as TIcXMLElement;
  //jenom kontrola, ze jsme to nasli
  if temp<>nil then begin

   //nastavime mult
   temp.SetAttribute('mult',inttostr(seMult.value));

   //smazeme vsechny child nody (typy vlaku a smery jizd)
   while temp.HasChild do temp.RemoveChild(temp.GetFirstChild);

   //pridame typy vlaku
   for i:=0 to lbVlaky.Count-1 do  begin
     child:=doc.CreateElement('type');
     child.SetCharData(doc.CreateTextNode(lbVlaky.items.names[i]));
     child.SetAttribute('id',copy(lbVlaky.items[i],pos('=',lbVlaky.items[i])+1,4096));
     temp.AppendChild(child);
   end;

   //pridame smery
   for i:=0 to lbSmery.Count-1 do if lbSmery.Checked[i] then begin
    child:=doc.CreateElement('to');
    child.SetCharData(doc.CreateTextNode(lbSmery.items.Names[i]));
    child.SetAttribute('mult',lbSmery.Items.Values[lbSmery.items.Names[i]]);
    temp.AppendChild(child);
   end;

  end;
 end else showmessage('Neni zvolen i/o bod');
end;

procedure TfrmNakladni.lbIOPointsDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
 with control as TCustomListBox do begin
  canvas.font.size:=8;
  Canvas.font.Color:=clBlack;
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
  Canvas.Textout(rect.Left+5,rect.Top+1,items.Names[index]);
  Canvas.font.Style:=[];
  Canvas.font.color:=clGray;
  if odSelected in state then 
   Canvas.font.Color:=clWhite;
  canvas.font.size:=7;
  Canvas.TextOut(rect.Left+50,rect.Top+1,
   copy(Items[index],length(items.names[index])+2,100));
 end;
end;

procedure TfrmNakladni.lbTypyVlakuDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var id:string;canvas:TCanvas;
begin
  if Control is TCOmboBox then   canvas:=(control as TComboBox).canvas;
  if Control is TListBox then   canvas:=(control as TListBox).canvas;

  canvas.font.size:=8;
  if Control is TCOmboBox then id:=(control as TComboBox).items.Names[index];
  if Control is TListBox then id:=(control as TListBox).items.Names[index];
  Canvas.font.Color:=StagINI.ReadInteger('Barvy_vlaku',id,0);

  Canvas.Pen.Style:=pssolid;
  Canvas.Pen.color:=clWhite;
  if odSelected in state then begin
   Canvas.font.Color:=clWhite;
   Canvas.Brush.Color:=clActiveCaption;
  end else begin
   Canvas.Brush.Color:=clWhite;
  end;
  Canvas.Rectangle(rect);
  if StagINI.ReadBool('Tucne_vlaky',id,false) then
   Canvas.font.Style:=[fsBold]
  else
  Canvas.font.Style:=[];
  Canvas.Textout(rect.Left+5,rect.Top+1,id);
  Canvas.font.Style:=[];
  Canvas.font.color:=clGray;
  canvas.font.size:=7;
  if Control is TComboBox then
  Canvas.TextOut(rect.Left+45,rect.Top+2,
   StagINI.ReadString('Typ_vlaku',id,'')) else
  Canvas.TextOut(rect.Left+45,rect.Top+2,
   copy((control as TListBox).Items[index],pos('=',(control as TListBox).Items[index])+1,50));
end;

procedure TfrmNakladni.lbTypyVlakuMeasureItem(Control: TWinControl;
  Index: Integer; var Height: Integer);
begin
 height:=16;
end;

procedure TfrmNakladni.lbSmeryClickCheck(Sender: TObject);
begin
 btnSaveChClick(sender);
end;

procedure TfrmNakladni.lbTypyVlakuClickCheck(Sender: TObject);
begin
 btnSaveChClick(sender);
end;

procedure TfrmNakladni.Button2Click(Sender: TObject);
begin
 frmRazeni.showmodal;
end;

procedure TfrmNakladni.Button3Click(Sender: TObject);
var olditems:TSTringList;
begin
 change:=true;
 olditems:=TStringList.Create;
 olditems.Assign(frmMain.cbRazeni.Items);
 frmRazeni.cbJednot.Enabled:=false;
 frmMain.cbRazeni.Items.Assign(cbNRazeni.Items);
 frmRazeni.showmodal;
 frmRazeni.cbJednot.Enabled:=true;
 cbNRazeni.Items.Assign(frmMain.cbRazeni.Items);
 frmMain.cbRazeni.Items.Assign(olditems);
 lbSoupravy.Items[lbSoupravy.ItemIndex]:=copy(lbSoupravy.Items[lbSoupravy.ItemIndex],1,pos('=',lbSoupravy.Items[lbSoupravy.ItemIndex]))+cbNRazeni.Items.commatext;
 olditems.Free;
 updateSCB;
end;


procedure TfrmNakladni.lbSoupravyClick(Sender: TObject);
begin
 if lbSoupravy.ItemIndex>=0 then begin
  cbNRazeni.Items.CommaText:=copy(lbSoupravy.Items[lbSoupravy.ItemIndex],pos('=',lbSoupravy.Items[lbSoupravy.ItemIndex])+1,4096);
  cbNRazeni.ItemIndex:=0;
 end;
 cbNRazeni.Enabled:=lbSoupravy.ItemIndex>=0;
 button3.Enabled:=lbSoupravy.ItemIndex>=0; 
end;

procedure TfrmNakladni.Button6Click(Sender: TObject);
begin
 if OpenDialog1.Execute then begin
  lbSoupravy.Items.LoadFromFile(opendialog1.FileName);
  savedialog1.FileName:=opendialog1.FileName;
 updateSCB;
  
 end;
end;

procedure TfrmNakladni.Button7Click(Sender: TObject);
begin
 if SaveDialog1.Execute then
  lbSoupravy.Items.SaveToFile(SaveDialog1.FileName);

end;

procedure TfrmNakladni.Button4Click(Sender: TObject);
begin
 if lbSoupravy.ItemIndex>=0 then begin
  lbSoupravy.Items.Delete(lbSoupravy.ItemIndex);
  if lbSoupravy.items.Count>0 then lbSoupravy.ItemIndex:=0;
 updateSCB;
  
 end;
end;

procedure TfrmNakladni.Button5Click(Sender: TObject);
begin
 lbSoupravy.ItemIndex:=lbSoupravy.Items.Add(InputBox('STAG','Zadejte název nové soupravy','soupr_'+inttostr(lbSoupravy.Items.Count+1))+'=  ');
 Button3.Click;
 updateSCB;

end;

procedure TfrmNakladni.cbNRazeniDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var i:integer;
begin

 for i:=4 to cbNRazeni.Items.Count-1 do begin

 with (Control as TComboBox).Canvas do begin
  font.size:=8;
  font.Color:=clBlack;
  Pen.Style:=pssolid;
  Pen.color:=clTeal;
  if odSelected in state then begin
    font.Color:=clWhite;
    Brush.Color:=clActiveCaption;
  end else begin
    Brush.Color:=clWhite;
  end;
  if (odComboBoxEdit in state) or (index=0) then begin
   brush.color:=clCream;
   font.Color:=clBlack;
   font.Style:=[];
   brush.Style:=bsSolid;
   Rectangle(rect);
   Textout(rect.Left+125,rect.Top+16,_pwr+(Control as TComboBox).items.Values['vykon']+' kW');
   Textout(rect.Left+5,rect.Top+1,_maxv+(Control as TComboBox).items.Values['maxv']+' km/h');
   Textout(rect.Left+5,rect.Top+16,_trlen+IfThen(AnsiUpperCase((Control as TComboBox).items.Values['delka'])='RANDOM','náhodná',(Control as TComboBox).items.Values['delka']+' m'));
   Textout(rect.Left+125,rect.Top+1,_weight+(Control as TComboBox).items.Values['hmotnost']+' t');
   if ((Control as TComboBox).items.Count>=5) and (odComboboxedit in state) then if VuzImgText((Control as TComboBox).items[4])<>nil then
    StretchDraw(classes.Rect(rect.left+240,rect.Top+1,rect.left+240+round(VuzWidthText((Control as TComboBox).items[4])*24/VuzHeightText((Control as TComboBox).items[4])),rect.top+25),VuzImgText((Control as TComboBox).items[4]));
  end else begin
   brush.color:=clTeal;
   font.Color:=clWhite;
   font.Style:=[fsBold];
   brush.Style:=bsSolid;
   TextOut(rect.Right-TextWidth((Control as TComboBox).items.names[index])-35,rect.top+1,(Control as TComboBox).items.names[index]);
   if VuzImgText((Control as TComboBox).items[index])<>nil then
    Draw(rect.left+10,rect.Top+1,VuzImgText((Control as TComboBox).items[index]));
  end;
 end;
end;
end;

procedure TfrmNakladni.cbNRazeniMeasureItem(Control: TWinControl;
  Index: Integer; var Height: Integer);
begin
 if index<0 then height:=30 else
  if (index=0) then height:=30 else
  if index in [1..3] then height:=0 else height:=max(15,VuzHeightText(((control as TComboBox).items[index]))+5);

end;

procedure TfrmNakladni.Button1Click(Sender: TObject);
var nahsou,souprava:TIcXMLElement;i:integer;
begin
 //uklada do XML dat soupravy
 nahsou:=FindChild(pGVD,'nahsoupravy');
 //smazat vsechny ulozene soupravy
 while nahsou.HasChild do nahsou.RemoveChild(nahsou.GetFirstChild);
 //pridavame soupravy
 for i:=0 to lbSoupravy.Items.Count-1 do begin
  souprava:=doc.CreateElement('nahvlak');
  souprava.SetAttribute('id',lbSoupravy.Items.Names[i]);
  souprava.AppendChild(RazeniXML(
  copy(lbSoupravy.Items[i],pos('=',lbSoupravy.Items[i])+1,4096)
  ));
  nahsou.AppendChild(souprava);
 end;
 change:=true;
end;

procedure TfrmNakladni.lbSoupravyDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var sv:string;i:integer;sl:TStringList;  
begin
 sl:=TStringList.create;
 sl.Delimiter:=',';
 sl.QuoteChar:='"';

 with (Control as TListBox).Canvas do begin
  font.size:=8;
  font.Color:=clBlack;
  pen.Style:=psSolid;
  pen.Color:=clWhite;
  if odSelected in state then begin
    font.Color:=clWhite;
    Brush.Color:=clActiveCaption;
  end else begin
    Brush.Color:=clWhite;
  end;
  Rectangle(rect);
  font.Style:=[fsBold];
  TextOut(rect.left+3,rect.top+1,(Control as TListBox).items.names[index]);
  font.Style:=[];
  sl.DelimitedText:=copy((Control as TListBox).items[index],pos('=',(Control as TListBox).items[index])+1,4095);
  for i:=4 to sl.count-1 do sv:=sv+sl.names[i]+'   ';
  TextOut(rect.left+65,rect.top+1,sv);
 end;

 sl.free;
end;

procedure TfrmNakladni.Button8Click(Sender: TObject);
begin
 if (lbTypyVlaku.Itemindex>=0) and (cbSoupravy.ItemIndex>=0) then
  lbVlaky.Items.Add(lbTypyVlaku.Items.Names[lbTypyVlaku.Itemindex]+'='+
  ifthen(cbSoupravy.ItemIndex=0,'',cbSoupravy.Text)
  );
end;

procedure TfrmNakladni.btnDelNVClick(Sender: TObject);
begin
 if lbVlaky.itemindex>=0 then lbVlaky.Items.Delete(lbVlaky.itemindex);
end;

procedure TfrmNakladni.FormShow(Sender: TObject);
begin
 if frmRazeni<>nil then
  frmRazeni.pnlNoDirection.Show;
end;

procedure TfrmNakladni.FormHide(Sender: TObject);
begin
 if frmRazeni<>nil then
  frmRazeni.pnlNoDirection.hide;
end;

end.
