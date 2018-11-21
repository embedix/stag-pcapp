unit gvd;

interface
uses classes,math,contnrs,controls,sysutils,dialogs,strutils,
dateutils,IcXMLParser,datamodu, IcCodePages,inifiles,sekcegvd,sekcespr;

var  doc:TIcXMLDocument;
     elem,pGVD,pStation,pPolicka:TIcXMLElement;

type TIOTextRec=record
            celynazev:string;
            smerprij:string;
            smerodj:string;
           end;
type TIOList = class(TObjectList)
            procedure LoadFromFile(fname:string);
            procedure SaveToXML(elem:TIcXMLElement);
            procedure LoadFromXML(elem:TIcXMLElement);
            function GetIOList:TStringList;
            function GetIOList2:TStringList;
            function GetPrijSmerList:TStringList;
            function GetOdjSmerList:TStringList;
            function GetIOTexts(zkr:string):TIOTextRec;
           end;

type TIO = class
            zkratka:string;
            celynazev:string;
            smerprij:string;
            smerodj:string;
           end;

type TZastavka = record
              stanice:string[10];
              kolej:string[10];
              kolejpovinna:boolean;
              odjezd:TDateTime;
            end;

type TSpoj = class
              cislo:integer;
              typ:string;
              jednotka:boolean;
              zastavuje:boolean;
              vznika:boolean;
              smerprijezdu:string[10];
              odjezdsem:TDateTime;
              zastavky:array of TZastavka;
              konci:boolean;
              smerodjezdu:string[10];
              oznamenismeruodjezdu,oznamenismeruprijezdu:string;
              odjezdpryc:TDateTime;
              novecislo:integer;
              naposun:boolean;
              vystup:boolean;
              kdyjede:string;
              razeni:string;
              poznamka:string;
              jmeno:string;
              vjsunuty:boolean;
              function CelaTrasa:string;
              function OdkudKam(gvd:TObject;popistypu:string):string;
            end;

type TStringListB = class(TStringList)
              procedure SaveToXML(elem:TIcXMLElement);
              procedure LoadFromXML(elem:TIcXMLElement);
            end;

type TGVD = class(TObjectList)
             iolist:TIOList;
             stanice:TStringListB;
             GVDSection:string;
             GVDSecPopis:string;
             constructor Create(io:TIOList);
             destructor Destroy;  override;
             function JeVlak(cislo:integer):boolean;
             procedure DeleteSpoj(cislo:integer);
             function GetVlak(cislo:integer):TSpoj;
             procedure LoadFromFile(fname:string);
             function ZastavkyXML(id:integer):TIcXMLElement;
             procedure LoadFromXML(fname:string;vynutzmenu:boolean);overload;
             procedure LoadFromXML(fname:string);overload;
             procedure SaveToFile(fname:string;menitsekce:boolean=false);
             procedure PridejVlak(popis:string);
             procedure PridejVlakXML(elem:TIcXMLElement);
             function GetTextVlaku(vlak:TSpoj):TStringList;
            end;

function FindChild(root:TIcXMLElement;name:string):TIcXMLELement;
function HasChildName(root:TIcXMLElement;name:string):boolean;
function RazeniXML(s:string):TIcXMLElement;

var   vozy:TMemINIFile;

const XMLsuffix='xml';

implementation
uses main, Forms;

function FindChild(root:TIcXMLElement;name:string):TIcXMLELement;
var temp:TIcXMLElement;
begin
  result:=nil;
  temp:=root.GetFirstChild;
  while temp<>nil do begin
   if temp.GetName=name then result:=temp;
   temp:=temp.NextSibling;
  end;

  if result=nil then begin
   result:=doc.CreateElement(name);
   root.AppendChild(result);
  end;
end;

function HasChildName(root:TIcXMLElement;name:string):boolean;
var temp:TIcXMLElement;
begin
  result:=false;
  temp:=root.GetFirstChild;
  while temp<>nil do begin
   if temp.GetName=name then result:=true;
   temp:=temp.NextSibling;
  end;
end;

procedure TStringListB.SaveToXML(elem:TIcXMLElement);
var tmp,elem2:TIcXMLElement;i:integer;
begin
 elem2:=FindChild(elem,'stanice');
 while elem2.HasChild do elem2.RemoveChild(elem2.GetFirstChild);
 for i:=0 to self.Count-1 do begin
  tmp:=doc.CreateElement('nadrazi');
  tmp.SetAttribute('zkratka',names[i]);
  tmp.SetAttribute('celejmeno',values[names[i]]);
  elem2.AppendChild(tmp);
 end;
end;

procedure LoadXMLDocument(fname:string);
var stream:TMemoryStream;
var buf:array[0..2] of char;

begin
 Screen.Cursor:=crHourGlass;
 stream:=TMemoryStream.Create;
 if fileexists(fname) then stream.LoadFromFile(fname);
 stream.seek(0,soFromBeginning);
 stream.Read(buf,3);
 if buf[0]<>'<' then begin
  stream.seek(0,soFromBeginning);
  buf:= '   ';
  stream.Write(buf,3);
 end;
 if (not FileExists(fname)) or (not DataMod.XML.Parse(stream,doc)) then exit;
 stream.Free;
 Screen.Cursor:=crDefault;
end;


procedure TStringListB.LoadFromXML(elem:TIcXMLElement);
var tmp,elem2:TIcXMLElement;//i:integer;
begin
 Clear;
 elem2:=FindChild(elem,'stanice');
 tmp:=elem2.GetFirstChild;
 while (tmp<>nil) do begin
  if tmp.GetName='nadrazi' then add(tmp.GetAttribute('zkratka')+'='+tmp.GetAttribute('celejmeno'));
  tmp:=tmp.NextSibling;
 end;
end;


function TSpoj.OdkudKam;
var i:integer;
begin
 LongTimeFormat:='hh:nn';
 result:=trim(popistypu)+' èíslo '+inttostr(cislo)+' ';
 if not vznika then
  result:=result+'ze smìru '+oznamenismeruprijezdu+' ';
 //zastavky
 if length(zastavky)>0 then
                    result:=result+'pøes ';
 for i:=0 to length(zastavky)-1 do
  result:=result+ (gvd as TGVD).stanice.values[zastavky[i].stanice]+IfThen(i<length(zastavky)-1,
  IfThen(i<length(zastavky)-2,', ',' a ')
  ,'');
 //smer odjezdu
 if konci then result:=result+', kde konèí. '
  else
  result:=result+'. Vlak dále pokraèuje ve smìru '+oznamenismeruodjezdu;
end;


function TSpoj.CelaTrasa;
var i:integer;
begin
 LongTimeFormat:='hh:nn';
 if vznika then
  result:='*'
 else result:=smerprijezdu;
 result:=result+' ('+timetostr(odjezdsem)+') ';
 //zastavky
 if zastavuje then if length(zastavky)>0 then
                    result:=result+'staví v zastávkách +' else
                    result:=result+'staví v zastávkách ' else
                   if length(zastavky)>0 then result:=result+'zast. ';
 for i:=0 to length(zastavky)-1 do
  result:=result+zastavky[i].stanice+IfThen(i<length(zastavky)-1,'/',' ');
 //smer odjezdu
 if konci then result:=result+'konèí '+
  ifthen(length(zastavky)>0,timetostr(zastavky[length(zastavky)-1].odjezd),'chyba')
  else
  result:=result+'->'+smerodjezdu+' ('+timetostr(odjezdpryc)+')';
end;

procedure TIOList.SaveToXML(elem:TIcXMLElement);
var tmp:TIcXMLElement;i,f:integer;
begin
 //projdi VSECHNA policka a u tech s tvarem = "4" a existujicim typem
 //a textem odpovidajicim IOListu pridej atributy
 tmp:=elem.GetFirstChild;
 while tmp<>nil do begin
  if (trim(tmp.GetAttribute('tvar'))='4') and
   (trim(tmp.GetAttribute('typ'))<>'') then begin
   f:=-1;
   for i:=0 to Count-1 do
    if ansiuppercase((Items[i] as TIO).zkratka) =
      ansiuppercase(tmp.GetAttribute('text')) then f:=i;
   if f>=0 then with (Items[f] as TIO) do begin
    tmp.SetAttribute('celejmeno',celynazev);
    tmp.SetAttribute('smerprij',smerprij);
    tmp.SetAttribute('smerodj',smerodj);
   end;
  end;
  tmp:=tmp.NextSibling;
 end;
end;


procedure TIOList.LoadFromXML(elem:TIcXMLElement);
var tmp:TIcXMLElement;i,f:integer;io:TIO;
begin
 //projdi VSECHNA policka a u tech s tvarem = "4" a existujicim typem
 //a textem odpovidajicim IOListu pridej atributy
 Clear;
 tmp:=elem.GetFirstChild;
 while tmp<>nil do begin
  if (trim(tmp.GetAttribute('tvar'))='4') and
   (trim(tmp.GetAttribute('typ'))<>'') then begin
   f:=-1;
   for i:=0 to Count-1 do
    if ansiuppercase((Items[i] as TIO).zkratka) =
      ansiuppercase(tmp.GetAttribute('text')) then f:=i;
   if f=-1 then begin
    //vytvorime novy TIO
    io:=TIO.Create;
    io.zkratka:=tmp.GetAttribute('text');
    io.celynazev:=tmp.GetAttribute('celejmeno');
    io.smerprij:=tmp.GetAttribute('smerprij');
    io.smerodj:=tmp.GetAttribute('smerodj');
    Add(io);
   end;
  end;
  tmp:=tmp.NextSibling;
 end;
end;



constructor TGVD.Create;
begin
 iolist:=io;
 stanice:=TStringListB.Create;
 inherited Create;
end;

destructor TGVD.Destroy;
begin
 stanice.free;
 inherited Destroy;
end;

function TGVD.JeVlak;
var i:integer;
begin
 result:=false;
 for i:=0 to self.Count-1 do
  if (Self.Items[i] as TSpoj).cislo=cislo then result:=true;
end;

function TGVD.GetVlak;
var i:integer;
begin
 result:=nil;
 for i:=0 to self.Count-1 do
  if (Self.Items[i] as TSpoj).cislo=cislo then result:=self.items[i] as TSpoj;
end;

procedure TGVD.DeleteSpoj;
var i:integer;
begin
 for i:=0 to self.Count-1 do
  if (Self.Items[i] as TSpoj).cislo=cislo then begin
   self.delete(i);
   exit;
  end;
end;

procedure TGVD.PridejVlak;
var spoj:TSpoj;
    data,zastavky,zdata:TStringList;
    j:integer;
begin
 if trim(popis)='' then exit; //prazdne radky
 if popis[1]=';' then exit; //komentare
 data:=TStringList.Create;
 data.Text:=popis;
 //data jsou v jednotlivych polozkach StringListu
 spoj:=TSpoj.Create;
 spoj.cislo:=strtoint(data.values['Cislo']);
 spoj.typ:=trim(data.values['Typ']);
 spoj.jmeno:=trim(data.values['Jmeno']);
 spoj.jednotka:=data.values['Jednotka']='1';
 spoj.zastavuje:=data.values['Zastavuje']='1';
 spoj.vznika:=data.values['Vznika']='V';
 spoj.smerprijezdu:=trim(data.values['Smerprijezdu']);
 spoj.odjezdsem:=StrToTime(data.values['Casprijezdu']);
 spoj.oznamenismeruprijezdu:=data.values['Oznamenismeruprijezdu'];
 spoj.razeni:=ifthen(data.IndexOfName('razeni')>=0,data.Values['razeni'],'delka=random');
 spoj.poznamka:='';
 //nacitani zastavek
 if data.values['Zastavky']<>'' then begin
  zastavky:=TStringList.Create;
  zastavky.Delimiter:='@';
  zastavky.DelimitedText:=data.values['Zastavky'];
  zdata:=TStringList.Create;
  zdata.Delimiter:='#';
  SetLength(spoj.zastavky,zastavky.count);
  for j:=0 to zastavky.count-1 do begin
   zdata.DelimitedText:=zastavky[j];
   spoj.zastavky[j].stanice:=zdata[0];
   spoj.zastavky[j].kolej:=zdata[1];
   spoj.zastavky[j].kolejpovinna:=false;
   spoj.zastavky[j].odjezd:=StrToTime(zdata[2]);
  end;
  zastavky.Free;
  zdata.Free;
 end else SetLength(spoj.zastavky,0);
 //pokracovani...
  spoj.konci:=data.values['Konci']='K';
  if spoj.konci then begin
   spoj.smerodjezdu:='';
   spoj.novecislo:=strtoint(data.values['Smer']);
  end else begin
   spoj.smerodjezdu:=trim(data.values['Smer']);
   spoj.novecislo:=0;
  end;
  spoj.odjezdpryc:=StrToTime(data.values['Casodjezdu']);
  spoj.naposun:=data.values['Naposun']='1';
  spoj.vystup:=data.values['CekatNaVystup']='1';
  spoj.oznamenismeruodjezdu:=data.values['Oznamenismeruodjezdu'];
  spoj.kdyjede:=data.values['KdyJede'];
 Add(spoj);
 data.Free;
end;



procedure TGVD.PridejVlakXML;
var spoj:TSpoj;
    sl:TStringList;
    typvozu:string;
    zastavky,zdata:TStringList;
    tmp:TIcXMLElement;
    i,j:integer;
begin
 //data jsou v jednotlivych polozkach StringListu
 sl:=TStringList.Create;
 sl.Delimiter:=',';
 sl.QuoteChar:='"';
 spoj:=TSpoj.Create;
 spoj.cislo:=strtoint(elem.GetAttribute('cislo'));
 spoj.typ:=trim(elem.GetAttribute('typ'));
 spoj.jmeno:=elem.GetAttribute('jmeno');
 spoj.jednotka:=elem.GetAttribute('jednotka')='1';
 spoj.vjsunuty:=elem.GetAttribute('vjsunuty')='1'; 
 spoj.zastavuje:=elem.GetAttribute('zastavuje')='1';
 spoj.vznika:=elem.GetAttribute('vznika')='V';
 spoj.smerprijezdu:=trim(elem.GetAttribute('smerprijezdu'));
 spoj.odjezdsem:=StrToTime(elem.GetAttribute('casprijezdu'));
 spoj.oznamenismeruprijezdu:=elem.GetAttribute('oznamenismeruprijezdu');
 spoj.poznamka:=elem.GetAttribute('poznamka');
 //nacitani razeni: pokud jsou data v novem XML formatu, nacitej tato
 if HasChildName(elem,'razeni') then begin
  //najdeme nod
  spoj.razeni:='';
  tmp:=FindChild(elem,'razeni');
  if tmp.GetAttribute('delka')='random' then spoj.razeni:='delka=random' else begin
   sl.Clear;
   sl.add('delka='+tmp.GetAttribute('delka'));
   sl.add('hmotnost='+tmp.GetAttribute('hmotnost'));
   sl.add('vykon='+tmp.GetAttribute('vykon'));
   sl.add('maxv='+tmp.GetAttribute('maxv'));
   tmp:=tmp.GetFirstChild;
   while (tmp<>nil) do begin
    typvozu:=tmp.GetAttribute('typ');
    //test na nutnou upravu nazvu cizich vozu
    typvozu:=StagINI.ReadString('VozyTrn',typvozu,typvozu);
    sl.Add(typvozu+'='+tmp.GetAttribute('smer')+'*'+tmp.GetAttribute('pozn')+'*'+ifthen(tmp.GetAttribute('obrid')<>'',tmp.GetAttribute('obrid'),'0')+'*'+ifthen(tmp.GetAttribute('prevr')='1','X',''));
    tmp:=tmp.NextSibling;
   end;
   spoj.razeni:=sl.DelimitedText;
  end;
 end else spoj.razeni:=ifthen(elem.GetAttribute('razeni')<>'',elem.GetAttribute('razeni'),'delka=random');
 //nacitani zastavek
 if HasChildName(elem,'zastavky') then begin
  SetLength(spoj.zastavky,0);
  tmp:=FindChild(elem,'zastavky');
  tmp:=tmp.GetFirstChild;
  i:=0;
  while (tmp<>nil) do begin
   SetLength(spoj.zastavky,length(spoj.zastavky)+1);
   spoj.zastavky[i].stanice:=tmp.GetAttribute('st');
   spoj.zastavky[i].kolej:=tmp.GetAttribute('kol');
   spoj.zastavky[i].odjezd:=strtotime(tmp.GetAttribute('cas'));
   spoj.zastavky[i].kolejpovinna:= trim(tmp.GetAttribute('kpov'))='1';
   inc(i);
   tmp:=tmp.NextSibling;
  end;
 end else if elem.GetAttribute('zastavky')<>'' then begin
  zastavky:=TStringList.Create;
  zastavky.Delimiter:='@';
  zastavky.DelimitedText:=elem.GetAttribute('zastavky');
  zdata:=TStringList.Create;
  zdata.Delimiter:='#';
  SetLength(spoj.zastavky,zastavky.count);
  for j:=0 to zastavky.count-1 do begin
   zdata.DelimitedText:=zastavky[j];
   spoj.zastavky[j].stanice:=zdata[0];
   spoj.zastavky[j].kolej:=zdata[1];
   spoj.zastavky[j].odjezd:=StrToTime(zdata[2]);
  end;
  zastavky.Free;
  zdata.Free;
 end else SetLength(spoj.zastavky,0);
 //pokracovani...
  spoj.konci:=elem.GetAttribute('konci')='K';
  if spoj.konci then begin
   spoj.smerodjezdu:='';
   spoj.novecislo:=strtoint(elem.GetAttribute('smer'));
  end else begin
   spoj.smerodjezdu:=trim(elem.GetAttribute('smer'));
   spoj.novecislo:=0;
  end;
  spoj.odjezdpryc:=StrToTime(elem.GetAttribute('casodjezdu'));
  spoj.naposun:=elem.GetAttribute('naposun')='1';
  spoj.vystup:=elem.GetAttribute('cekatnavystup')='1';
  spoj.oznamenismeruodjezdu:=elem.GetAttribute('oznamenismeruodjezdu');
  spoj.kdyjede:=elem.GetAttribute('kdyjede');
 Add(spoj);
 sl.Free;
end;


procedure TGVD.LoadFromXML(fname:string);
begin
 LoadFromXML(fname,false);
end;

procedure TGVD.LoadFromXML(fname:string;vynutzmenu:boolean);
var tmp,pTrains:TIcXMLElement;
var frmSekce:Tfrmsekce;
begin
 //budeme nacitat spoje ze souboru XML
 //parsujeme XML
 LoadXMLDocument(fname);
 self.Clear;
 elem:=doc.GetDocumentElement;
 //nacteme zakladni elementy
 //UPRAVA ve v. 1.16 - VICE SEKCI GRAFIKONU
 tmp:=elem.GetFirstChild;
 pGVD:={nil}findchild(elem,'gvd');
 //budeme plnit seznam...
 frmSekce:=TfrmSekce.Create(frmMain);
 with frmSekce do begin
  cbGrafikony.Clear;
  while tmp<>nil do begin
   if tmp.GetName='gvd' then begin
    if tmp.GetAttribute('section')='' then begin
     tmp.SetAttribute('section','GVD');
     tmp.SetAttribute('sect_desc','Novy grafikon / New timetable');
    end;
    cbGrafikony.Items.Objects[cbGrafikony.Items.Add(tmp.getname+' - '+tmp.GetAttribute('section')+': '+tmp.GetAttribute('sect_desc'))]:=
     tmp;
   end;
   tmp:=tmp.NextSibling; 
  end;
  cbGrafikony.ItemIndex:=0;
  if (cbGrafikony.Items.Count>1) or vynutzmenu then ShowModal;
  pGVD:=cbGrafikony.items.objects[max(0,cbGrafikony.itemindex)] as TIcXMLElement;
  GVDSection:=pGVD.GetAttribute('section');
  GVDSecPopis:=pGVD.GetAttribute('sect_desc');
  frmMain.StatusBar.Panels.Items[2].Text:=GVDSection;
 end;
 frmSekce.Free;
 



 pStation:=FindChild(elem,'station');
 pPolicka:=FindChild(elem,'policka');
 pTrains:=FindChild(pGVD,'trains');
 //nacteme vsechny vlaky
 tmp:=pTrains.GetFirstChild;
 while (tmp<>nil) do begin
  PridejVlakXML(tmp);
  tmp:=tmp.NextSibling;
 end;
 //naceteme IOList
 IOList.Clear;
 IOList.LoadFromXML(pPolicka);
 //a nacteme stanice
 stanice.LoadFromXML(pStation);
end;


procedure TGVD.LoadFromFile;
var gvf:TMemIniFile;
    vlaky,sekce:TStringList;
    i,j:integer;
begin
 //budeme nacitat spoje ze souboru GVD
 if not FileExists(fname) then exit;
 gvf:=TMemIniFile.Create(fname);
 vlaky:=TStringList.Create;
 sekce:=TStringList.create;
 gvf.ReadSections(sekce);
 //pro kazdou sekci...
 for j:=0 to sekce.Count-1 do if copy(sekce[j],1,5)='Train' then
 begin
   gvf.ReadSectionValues(sekce[j],vlaky);
   PridejVlak(vlaky.Text);
 end;
 gvf.ReadSectionValues('Stanice',stanice);
 //ted jeste zkusime doplnit informace v IOListu o
 //cele nazvy stanic a texty pro infosystem
 //ulozene v .gvd
 for i:=0 to iolist.Count-1 do with iolist.Items[i] as TIO do begin
  celynazev:=gvf.ReadString('IO_nazvy',zkratka,celynazev);
  smerodj:=gvf.ReadString('IO_odjezdy',zkratka,smerodj);
  smerprij:=gvf.ReadString('IO_prijezdy',zkratka,smerprij)
 end;
 vlaky.free;
 sekce.free;
 gvf.Free;
end;

function TGVD.GetTextVlaku;
var data:TStringList;
    sg:string;i:integer;
begin
 data:=TStringList.Create;
 data.Delimiter:=';';
 data.Add('Cislo='+inttostr(vlak.cislo));
 data.Add('Typ='+vlak.typ);
 data.Add('Jmeno='+vlak.jmeno);
 data.Add('Jednotka='+IfThen(vlak.jednotka,'1','0'));
 data.Add('vjsunuty='+IfThen(vlak.vjsunuty,'1','0')); 
 data.Add('Zastavuje='+IfThen(vlak.zastavuje,'1','0'));
 data.Add('Vznika='+IfThen(vlak.vznika,'V','P'));
 if vlak.vznika then
  data.Add('Smerprijezdu=')
 else
  data.Add('Smerprijezdu='+vlak.smerprijezdu);
 data.Add('Casprijezdu='+TimeToStr(vlak.odjezdsem));
 if vlak.vznika then
  data.Add('Oznamenismeruprijezdu=')
 else
  data.Add('Oznamenismeruprijezdu='+vlak.oznamenismeruprijezdu);
 //zastavky
 sg:='';
 if length(vlak.zastavky)>0 then begin
  for i:=0 to length(vlak.zastavky)-1 do begin
   sg:=sg+vlak.zastavky[i].stanice+'#'+vlak.zastavky[i].kolej+
      '#'+TimeToStr(vlak.zastavky[i].odjezd);
   if i<length(vlak.zastavky)-1 then sg:=sg+'@';
  end;
 end;
 data.Add('Zastavky='+sg);
 data.Add('Konci='+IfThen(vlak.konci,'K','O'));
 data.Add('Smer='+ifthen(vlak.konci,inttostr(vlak.novecislo),vlak.smerodjezdu));
 data.Add('Casodjezdu='+TimeToStr(vlak.odjezdpryc));
 data.Add('Naposun='+IfThen(vlak.naposun,'1','0'));
 data.Add('KonciPosunem='+IfThen(vlak.konci and (vlak.novecislo<11),'1','0'));
 data.Add('CekatNaVystup='+IfThen(vlak.vystup,'1','0'));
 if not vlak.konci then
  data.Add('Oznamenismeruodjezdu='+vlak.oznamenismeruodjezdu)
 else
  data.Add('Oznamenismeruodjezdu='+'');
 data.Add('KdyJede='+vlak.kdyjede);
 if vlak.razeni='' then vlak.razeni:='delka=random';
 data.Add('Razeni='+vlak.razeni);
 data.Add('poznamka='+vlak.poznamka);
 result:=data;
end;

function TGVD.ZastavkyXML(id:integer):TIcXMLElement;
var i:integer;tmp:TIcXMLElement;
    vl:TSpoj;
begin
 result:=doc.CreateElement('zastavky');
 vl:=getvlak(id);
 for i:=0 to length(vl.zastavky)-1 do begin
  tmp:=doc.CreateElement('stavi');
  with vl.zastavky[i] do begin
   tmp.SetAttribute('st',stanice);
   tmp.SetAttribute('kol',kolej);
   tmp.SetAttribute('cas',timetostr(odjezd));
   tmp.SetAttribute('kpov',ifthen(kolejpovinna,'1','0'));
  end;
  result.AppendChild(tmp);
 end;
end;

function RazeniXML(s:string):TIcXMLElement;
var sl1,sl2:Tstringlist;i:integer;tmp:TIcXMLElement;
begin
 result:=doc.CreateElement('razeni');
 sl1:=TStringList.Create;
 sl2:=TStringList.Create;
 sl1.Delimiter:=',';
 sl2.Delimiter:='*';
 sl1.QuoteChar:='"';
 sl1.DelimitedText:=s;
 for i:=0 to sl1.count-1 do begin
  if i<=3 then result.SetAttribute(sl1.Names[i],copy(sl1.Strings[i],pos('=',sl1.Strings[i])+1,100)) else begin
   tmp:=doc.CreateElement('vuz');
   tmp.SetAttribute('typ',sl1.Names[i]);
   //doplnujici atributy
   sl2.DelimitedText:=copy(sl1.Strings[i],pos('=',sl1.Strings[i])+1,500)+'******'; //ochrana pred
   if sl2[0]<>'' then tmp.SetAttribute('smer',sl2[0]);
   if sl2[1]<>'' then tmp.SetAttribute('pozn',sl2[1]);
   if (sl2[2]<>'0') and (sl2[2]<>'') then tmp.SetAttribute('obrid',sl2[2]);
   if sl2[3]='X' then tmp.SetAttribute('prevr','1');
   result.AppendChild(tmp);
  end;
 end;
 sl1.Free;
 sl2.Free;
end;

procedure GenerujXMLVozy(pGVD:TIcXMLElement);
var pVozy,tmp,walker,tmpv:TIcXMLElement;i,j:integer;jsou:array of string;sl,par:TStringList;
 procedure PridejTyp(typ:string);
 var i:integer;
 begin
  SetLength(jsou,length(jsou)+1);
  jsou[length(jsou)-1]:=typ;
  tmp:=doc.CreateElement('vuz');
  tmp.SetAttribute('id',typ);

  vozy.ReadSectionValues(typ,par);
  for i:=0 to par.Count-1 do if trim(par.names[i])<>'' then tmp.SetAttribute(par.Names[i],par.Values[par.Names[i]]);
  pVozy.AppendChild(tmp);
 end;
 function JeTyp(typ:string):boolean;
 var i:integer;
 begin
  result:=false;
  for i:=0 to length(jsou)-1 do if typ=jsou[i] then begin
   result:=true;
   break;
  end;
 end;
begin
 pVozy:=FindChild(pGVD,'vozy');
 while pVozy.HasChild do pVozy.RemoveChild(pVozy.GetFirstChild);
 //projdi vsechny vlaky a hledej pouzite vozy
 par:=TStringList.Create;
 sl:=TStringList.Create;
 with sl do begin
  Delimiter:=',';
  QuoteChar:='"';
 end;
 //projdi pravidelne vlaky
 for i:=0 to JR.Count-1 do begin
  sl.DelimitedText:=(JR.Items[i] as TSpoj) .razeni;
  for j:=4 to sl.count-1 do begin
   if (not jetyp(sl.Names[j])) then pridejtyp(sl.names[j]);
  end;
  if i mod 50=0 then  begin
   with frmMain.StatusBar.panels[0] do text:=text+'.';
   frmMain.StatusBar.Refresh;
  end;
 end;
 //projdi nahodne vlaky
 walker:=FindChild(pGVD,'nahsoupravy');
 if walker.HasChild then begin
  walker:=walker.GetFirstChild;
  while walker<>nil do begin
   //rozparsuj NAHVLAK
   tmpv:=FindChild(walker,'razeni');
   tmpv:=tmpv.GetFirstChild;
   while tmpv<>nil do begin
    if tmpv.GetName='vuz' then if trim(tmpv.GetAttribute('typ'))<>'' then
     if (not jetyp(tmpv.GetAttribute('typ'))) then pridejtyp(tmpv.GetAttribute('typ'));
    tmpv:=tmpv.NextSibling;
   end;
   walker:=walker.NextSibling;
  end;
 end;
 sl.free;par.free;
end;


procedure TGVD.SaveToFile;
var gvf:TMemIniFile;
    vlaky,temp:TStringList;
    xmlfname:string;
    tmp:TIcXMLElement;
    pTrains:TIcXMLElement;
    frmSpravaSekci:TfrmSpravasekci;
    i,j:integer;
//    ts:TObject;
    ok:boolean;
begin
  Screen.Cursor:=crHourGlass;
 //seradit
 repeat
  ok:=true;
  for i:=1 to Count-1 do if (CompareTime((((self.items[i-1]) as TSpoj).odjezdsem),(((self.items[i]) as TSpoj).odjezdsem))>0) then begin
   self.Exchange(i-1,i);
   ok:=false;
  end;
 until ok;
 //ulozime DO XML

 //existuje dokument? Jestli ne, vytvorime jej dle sablony
 if not FileExists(ChangeFileExt(fname,'.'+xmlsuffix)) then begin
  showmessage('Ukladam jen ve starem formatu dat (neexistuje soubor '+
  (ChangeFileExt(fname,'.'+xmlsuffix))+')');
 end else begin
  xmlfname:=(ChangeFileExt(fname,'.'+xmlsuffix));
  //ukladej do XML
  if doc=nil then begin
   frmMain.StatusBar.panels[0].Text:='Parsuji XML';
   frmMain.StatusBar.Refresh;
   LoadXMLDocument(xmlfname);
   elem:=doc.GetDocumentElement;

   //UPRAVA VE VERZI 1.16 - pridani SEKCI GVD

   //najdi element GVD, pokud ma stejnou GVDSection, tak pokracuj, pokud nenajdes,
   //vytvor novou sekci
    pGVD:=nil;
    tmp:=elem.GetFirstChild;
    while tmp<>nil do begin
     if (tmp.GetName='gvd') and (AnsiCompareText(tmp.GetAttribute('section'),GVDSection)=0) then
      pGVD:=tmp;
     tmp:=tmp.NextSibling;
    end;
    //pripadne vytvorit
    if pGVD=nil then begin
     tmp:=doc.CreateElement('gvd');
     tmp.SetAttribute('section',GVDSection);
     tmp.SetAttribute('sect_desc',GVDSecPopis);
     elem.AppendChild(tmp);
    end;
   end else pGVD:=FindChild(elem,'gvd');
   pStation:=FindChild(elem,'station');
   pPolicka:=FindChild(elem,'policka');

   /// konec upravy pridani sekci

  frmMain.StatusBar.panels[0].Text:='Ukládám .';
  frmMain.StatusBar.Refresh;
//  doc.SetEncoding('UTF-8');
  datamod.XML.DefaultEncoding:=UTF_8;
  doc.SetEncoding('UTF-8');

  //postup ukladani dat:
  //(zmeny v nakladni doprave se provadi primo do XML dokumentu)
  // <gvd><trains> vlaky
  // <policka><policko typ=' '> i/o body primo do dat Stanicare vcetne nakl.dopr.
  // <station><nadrazi jmeno='' zkratka=''/>

  // seznam stanic
  stanice.SaveToXML(pStation);
  with frmMain.StatusBar.panels[0] do text:=text+'.';
  frmMain.StatusBar.Refresh;
  iolist.SaveToXML(pPolicka);
  with frmMain.StatusBar.panels[0] do text:=text+'.';
  frmMain.StatusBar.Refresh;
  //uloz vsechny vlaky
  //napred smaz to co tam uz je

  pTrains:=FindChild(pGVD,'trains');

  //mazani
  while pTrains.HasChild do pTrains.RemoveChild(pTrains.GetFirstChild);

  //zapis verze programu
  pGVD.SetAttribute('gvd_ver',Verze);
  pGVD.SetAttribute('gvd_editor','STAG');


  for i:=0 to Count-1 do begin
   //vytvor element <train>
   tmp:=doc.CreateElement('train');
   pTrains.AppendChild(tmp);
   temp:=GetTextVlaku(items[i] as TSpoj);
   for j:=0 to temp.count-1 do begin
    if (not StagINI.ReadBool('XML','OnlyStructured',true)) or ((temp.Names[j]<>'Razeni') and
     (temp.Names[j]<>'Zastavky')) then
    tmp.SetAttribute(ansilowercase(temp.Names[j]),temp.Values[temp.Names[j]]);
   end;
   //seznam zastavek
   tmp.AppendChild(ZastavkyXML((items[i] as TSpoj).cislo));
   //razeni vlaku
   tmp.AppendChild(RazeniXML(temp.Values['razeni']));


   if i mod 70=69 then  begin   with frmMain.StatusBar.panels[0] do text:=text+'.'; frmMain.StatusBar.Refresh; end;
   temp.Free;
  end;

  //znovu vytvor nod vozy
  GenerujXMLVozy(pGVD);

  //pridej nod goodstrain, pokud neexistuje
  tmp:=FindChild(pGVD,'goodstrain');
  if tmp.GetAttribute('init_frequency')='' then tmp.SetAttribute('init_frequency','5');
  Screen.Cursor:=crDefault;
  //Uprava 1.16: moznost v tomto okamziku spustit spravu sekci
  if menitsekce then begin
   frmSpravaSekci:=TfrmSpravasekci.Create(frmMain);
   frmSpravaSekci.ShowModal;
   frmSpravaSekci.Free;
   frmMain.Refresh;
  end;
  Screen.Cursor:=crHourGlass;

  //zapis data
  doc.Write(xmlfname);
  with frmMain.StatusBar.panels[0] do text:=text+'. OK Uloženo';
  //zapis zalohy
  if StagINI.ReadBool('STAG','CreateBackups',true) then begin
   with frmMain.StatusBar.panels[0] do text:=text+' Zálohuji...';
   frmMain.Refresh;
   doc.Write(xmlfname+'.bak');
   with frmMain.StatusBar.panels[0] do text:=text+'. OK Uloženo';
  end;
  Screen.Cursor:=crDefault;
  frmMain.StatusBar.Refresh;
 end;


 if not FileExists(ChangeFileExt(fname,'.'+xmlsuffix)) or
  StagINI.ReadBool('STAG','WriteOldFormatGVD',false)
 then begin
  //ulozime DO STAREHO FORMATU DAT
  gvf:=TMemIniFile.Create(fname);
  temp:=TStringList.Create;
  vlaky:=TStringList.Create;
  //smazat vsechny sekce s nazvem na Vlak
  gvf.ReadSections(temp);
  for i:=0 to temp.count-1 do
   if copy(temp[i],1,5)='Train' then gvf.EraseSection(temp[i]);
  //vytvorit sekce
  temp.Free;
  for i:=0 to Count-1 do begin
   temp:=GetTextVlaku(items[i] as TSpoj);
   for j:=0 to temp.count-1 do
    gvf.WriteString('Train_'+inttostr(i),temp.Names[j],temp.Values[temp.Names[j]]);
   temp.Free;
  end;
  //ulozime i seznam stanic
  gvf.EraseSection('Stanice');
  for i:=0 to stanice.Count-1 do
   gvf.WriteString('Stanice',stanice.Names[i],stanice.Values[stanice.Names[i]]);
  //a informace o nazvech i/o bodu
  gvf.EraseSection('IO_nazvy');
  gvf.EraseSection('IO_odjezdy');
  gvf.EraseSection('IO_prijezdy');
  for i:=0 to iolist.Count-1 do
   with iolist.items[i] as TIO do begin
   gvf.WriteString('IO_nazvy',zkratka,celynazev);
   gvf.WriteString('IO_odjezdy',zkratka,smerodj);
   gvf.WriteString('IO_prijezdy',zkratka,smerprij);
  end;
  gvf.UpdateFile;
  vlaky.Free;
  gvf.Free;
 end;
  Screen.Cursor:=crDefault; 
end;


function TIOList.GetIOTexts;
var IO:TIO;i:integer;
begin
 IO:=nil;
 for i:=0 to count-1 do if zkr=(items[i] as TIO).zkratka then
  IO:=(items[i] as TIO);
 if IO=nil then begin
  result.celynazev:='';
  result.smerprij:='';
  result.smerodj:='';
 end else begin
  result.celynazev:=IO.celynazev;
  result.smerprij:=IO.smerprij;
  result.smerodj:=IO.smerodj;
 end;
end;


procedure TIOList.LoadFromFile;
var t:TextFile;s:string;i,j:integer;ulozit:boolean;IO:TIO;
begin
  //smazeme seznam IO
  clear;
  //projdeme soubor
  assignfile(t,fname);
  try
   reset(t);
   readln(t);  readln(t);
   while not eof(t) do begin
    readln(t,s);
    //je to navestidlo?
    if s[3]='4' then begin
     //neni to obycejne navestidlo?
     i:=5;
     while not (s[i]=' ') do inc(i);
     inc(i);
     s:=copy(s,i,length(s));
     i:=1;
     while not (s[i]=' ') do inc(i);
     if strtoint(copy(s,1,i-1))>0 then begin
      //je to I/O navestidlo
      i:=1;
      for j:=1 to 4 do begin
       while not (s[i]=' ') do inc(i);
       inc(i);
      end;
      s:=trim(copy(s,i,100));
      //v S mame zkratku stanice
      //provizorni - pridani do seznamu
      ulozit:=true;
      for i:=0 to count-1 do if (items[i] as TIO).zkratka=s then ulozit:=false;
      if ulozit then begin
       IO:=TIO.Create;
       IO.zkratka:=s;
       IO.celynazev:=s;
       IO.smerprij:='';
       IO.smerodj:='';
       add(IO);
      end;
     end;
    end;
   end;
   closefile(t);
  except
   on E:Exception do begin
    showmessage('Nezdarilo se nacist soubor kolejiste ('+fname+'): '+E.message);
    clear;
    exit;
   end;
  end;
end;

function TIOList.GetIOList:TStringList;
var i:integer;
begin
 result:=TStringList.Create;
 for i:=0 to count-1 do result.Add((items[i] as TIO).zkratka+' ('+(items[i] as TIO).celynazev+')')
end;

function TIOList.GetIOList2:TStringList;
var i:integer;
begin
 result:=TStringList.Create;
 for i:=0 to count-1 do result.Add((items[i] as TIO).zkratka+'='+(items[i] as TIO).celynazev)
end;

function TIOList.GetOdjSmerList:TStringList;
var i:integer;
begin
 result:=TStringList.Create;
 for i:=0 to count-1 do result.Add((items[i] as TIO).smerodj)
end;

function TIOList.GetPrijSmerList:TStringList;
var i:integer;
begin
 result:=TStringList.Create;
 for i:=0 to count-1 do result.Add((items[i] as TIO).smerprij)
end;


end.
