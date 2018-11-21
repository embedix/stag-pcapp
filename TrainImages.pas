unit TrainImages;

interface
uses Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Buttons, ComCtrls, ExtCtrls, StdCtrls, inifiles;

function VuzImg(rada:string;obrid:integer;preklopeny:boolean):TBitmap;
function VuzImgText(radek:string):TBitmap;
function IsVuzImg(rada:string;obrid:integer):boolean;
function VuzHeight(rada:string;obrid:integer):integer;
function VuzWidth(rada:string;obrid:integer):integer;
function VuzWidthText(radek:string):integer;
function VuzHeightText(radek:string):integer;
procedure TrainImgLoad;
procedure TrainImgDestroy;

var images:integer;


implementation

uses main;
var TypList:TStringList;


function VuzWidthText;
var sl:TStringList;rada:string;
begin
 sl:=TStringList.create;
 sl.Text:=radek;
 rada:=sl.Names[0];
 sl.delimiter:='*';
 sl.DelimitedText:=sl.Values[rada];
 if sl.Count>3 then
  result:=VuzWidth(rada,strtoint('0'+sl[2]))
 else result:=VuzWidth(rada,0);
 sl.free;
end;


function VuzHeightText;
var sl:TStringList;rada:string;
begin
 sl:=TStringList.create;
 sl.Text:=radek;
 rada:=sl.Names[0];
 sl.delimiter:='*';
 sl.DelimitedText:=sl.Values[rada];
 if sl.Count>3 then
  result:=VuzHeight(rada,strtoint('0'+sl[2]))
 else result:=VuzHeight(rada,0);
 sl.free;
end;

function VuzImgText;
var sl:TStringList;rada:string;
begin
 sl:=TStringList.create;
 sl.Text:=radek;
 rada:=sl.Names[0];
 sl.delimiter:='*';
 sl.DelimitedText:=sl.Values[rada];
 if sl.Count>3 then
  result:=VuzImg(rada,strtoint('0'+sl[2]),sl[3]='X')
 else result:=VuzImg(rada,0,false);

 sl.free;

end;


procedure TrainImgLoad;
var //vozinfo:TMemIniFile;
//    i:integer;
    temp:TBitmap;
    sr:TSearchRec;
begin
 TypList:=TStringList.create;
 //existuje seznam vozu?
 if not FileExists(path+'vozy\vozy.ini') then begin
  showmessage('Nelze najít soubor '+path+'vozy\vozy.ini, kde je uložen seznam '+
  'a parametry vozù. Nemohu naèíst obrázky vozù.');
 end;
 //nacti dostupne vozy
 images:=0;
// vozinfo:=TMemIniFile.Create(path+'vozy\vozy.ini');
 //nacti seznam typu
 TypList:=TStringList.Create;

 //hledej jednotlive BMP, pokud existuji, podle jejich nazvu urci ke kteremu
 //vozu patri a zkus ho vyhledat v TypListu
 if FindFirst(path+'vozy\*.bmp', faAnyFile, sr) = 0 then
   begin
    repeat
      if (sr.Attr and faAnyFile) = sr.Attr then
      begin
       //mame jmeno souboru v sr.filename
       //zpracujeme
       //maska je vuz[_obrid]_typ.bmp
       temp:=TBitmap.create;
       //   temp.TransparentMode:=tmAuto;
       temp.Transparent:=false;
       temp.TransparentColor:=temp.Canvas.Pixels[0,0];
       temp.LoadFromFile(path+'vozy\'+sr.name);
       TypList.Add(copy(extractfilename(sr.name),5,length(extractfilename(sr.name))-8));
       TypList.Objects[
        typlist.count-1
       ]:=temp;
       inc(images);
      end;
    until FindNext(sr) <> 0;
    FindClose(sr);
   end;

end;

procedure TrainImgDestroy;
var i:integer;
begin
 if TypList=nil then exit;
 for i:=0 to typlist.Count-1 do
  if TypList.Objects[i]<>nil then (TypList.Objects[i] as TBitmap).Free;
 TypList.free;
end;


function VuzHeight;
begin
 if obrid>0 then rada:='_'+inttostr(obrid)+'_'+rada;
 if TypList.IndexOf(rada)>=0 then
  result:=(TypList.objects[TypList.IndexOf(rada)] as TBitmap).height
 else result:=0;
end;

function VuzWidth;
begin
 if obrid>0 then rada:='_'+inttostr(obrid)+'_'+rada;
 if TypList.IndexOf(rada)>=0 then
  result:=(TypList.objects[TypList.IndexOf(rada)] as TBitmap).width
 else result:=0;
end;


function VuzImg;
var bmp:TBitmap; x,y:integer;P: PByteArray;    pom:byte;
begin
 if obrid>0 then rada:='_'+inttostr(obrid)+'_'+rada;
 if preklopeny then begin
  //vytvorime preklopence, pokud neni
  if (TypList.IndexOf(rada)>=0) and (TypList.IndexOf('reverse_'+rada)<0) then begin
   bmp:=TBitmap.Create;
   bmp.Assign(TypList.objects[TypList.IndexOf(rada)] as TBitmap);
   bmp.PixelFormat:=pf8bit;

    for y := 0 to bmp.Height -1 do
    begin
      P := bmp.ScanLine[y];
      for x := 0 to (bmp.Width -1) div 2 do  begin
        pom:=p[x];
        P[x]:=P[bmp.Width-1-x];
        P[bmp.Width-1-x]:=pom;
      end;
    end;
   TypList.Objects[TypList.Add('reverse_'+rada)]:=bmp;
  end;
  rada:='reverse_'+rada;
 end;
 if TypList.IndexOf(rada)>=0 then
  result:=TypList.objects[TypList.IndexOf(rada)] as TBitmap
 else result:=nil;
end;

function IsVuzImg;
begin
 if obrid>0 then rada:='_'+inttostr(obrid)+'_'+rada;
 if TypList.IndexOf(rada)>=0 then
  result:=true
 else result:=false;
end;

end.
