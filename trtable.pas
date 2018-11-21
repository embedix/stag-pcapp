unit trtable;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, janGrid, StdCtrls, strutils;

type
  TfrmTrTable = class(TForm)
    grid: TjanGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    btnOpenCSV: TButton;
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    btnSaveAsCSV: TButton;
    Button2: TButton;
    btnPln: TButton;
    Button3: TButton;
    Label1: TLabel;
    cbPrepis: TCheckBox;
    Button1: TButton;
    Button4: TButton;
    lbLog: TListBox;
    Button5: TButton;
    procedure btnOpenCSVClick(Sender: TObject);
    procedure btnSaveAsCSVClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ExitProc(Sender: TObject);
    procedure btnPlnClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure delCol(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTrTable: TfrmTrTable;

implementation
uses gvd, main, math;

{$R *.dfm}

procedure TfrmTrTable.btnOpenCSVClick(Sender: TObject);
begin
 if opendialog.execute then begin
  grid.LoadFromCSV(OpenDialog.filename);
  savedialog.filename:=OpenDialog.filename;
 end; 

end;

procedure TfrmTrTable.btnSaveAsCSVClick(Sender: TObject);
begin
 if SaveDialog.Execute then grid.SaveToCSV(savedialog.FileName);
end;

procedure TfrmTrTable.FormCreate(Sender: TObject);
var i:integer;
begin
// for i:=0 to grid.ColCount-1 do grid.Cells[i,0]:='';
end;

procedure TfrmTrTable.ExitProc(Sender: TObject);
begin
 ModalResult:=mrCancel;
end;

procedure TfrmTrTable.btnPlnClick(Sender: TObject);
var spoj:TSpoj;i,j:integer;
begin
 Screen.Cursor:=crHourGlass;
 grid.RowCount:=max(3,JR.Count+1);

 for i:=0 to JR.Count-1 do begin
  spoj:=JR[i] as TSpoj;
  grid.Cells[1,i+1]:=spoj.typ;
  grid.Cells[2,i+1]:=inttostr(spoj.cislo);
  grid.Cells[3,i+1]:=spoj.oznamenismeruprijezdu;
  grid.Cells[4,i+1]:=spoj.oznamenismeruodjezdu;

  if spoj.vznika then begin
    grid.Cells[5,i+1]:='VZNIK';
  end else grid.Cells[5,i+1]:=spoj.smerprijezdu;

  //zastavky
  for j:=0 to length(spoj.zastavky)-1 do begin
        with spoj.zastavky[j] do begin
          grid.Cells[6,i+1]:=grid.Cells[6,i+1]+';'+stanice;
          grid.Cells[7,i+1]:=grid.Cells[7,i+1]+';'+TimeToStr(odjezd);
          grid.Cells[8,i+1]:=grid.Cells[8,i+1]+';'+kolej+ifthen(kolejpovinna,'*','');
        end;
  end;
  grid.Cells[6,i+1]:=copy(grid.Cells[6,i+1],2,500);
  grid.Cells[7,i+1]:=copy(grid.Cells[7,i+1],2,500);
  grid.Cells[8,i+1]:=copy(grid.Cells[8,i+1],2,500);


  if spoj.konci then begin
    grid.Cells[9,i+1]:='KONEC';
    if spoj.novecislo>0 then grid.Cells[9,i+1]:='KONEC/'+inttostr(spoj.novecislo);
  end else grid.Cells[9,i+1]:=spoj.smerodjezdu;

  grid.Cells[10,i+1]:=timetostr(spoj.odjezdpryc);
  grid.Cells[11,i+1]:=timetostr(spoj.odjezdsem);

 end;
 Screen.Cursor:=crArrow; 
end;

procedure TfrmTrTable.Button3Click(Sender: TObject);
var i,j:integer;
    sgl:string;
    spoj:TSpoj;sl:TStringList;
begin
 //projedeme radek po radku
 Screen.Cursor:=crHourGlass;
 lbLog.Clear;
 for i:=1 to grid.RowCount-1 do begin
         sgl:='Radek '+inttostr(i)+': ';
         try
                if trim(grid.Cells[2,i])='' then sgl:=sgl+'nezadano cislo vlaku, ignoruji radek.' else
                if (nil=JR.GetVlak(strtoint(grid.Cells[2,i]))) or cbPrepis.checked then begin
                  //zapiseme...

                  //vytvoreni
                  spoj:=JR.GetVlak(strtoint(grid.Cells[2,i]));
                  if spoj=nil then spoj:=TSpoj.Create;

                  spoj.cislo:=strtoint(grid.Cells[2,i]);
                  if grid.Cells[1,i]<>'' then
                          spoj.typ:=grid.Cells[1,i];
                  if grid.Cells[3,i]<>'' then
                          spoj.oznamenismeruprijezdu:=grid.Cells[3,i];
                  if grid.Cells[4,i]<>'' then
                          spoj.oznamenismeruodjezdu:=grid.Cells[4,i];

                  if grid.Cells[5,i]<>'' then begin
                        if AnsiCompareText(grid.Cells[5,i],'VZNIK')=0 then begin
                                spoj.vznika:=true;
                                spoj.smerprijezdu:='';
                        end else begin
                                spoj.vznika:=false;
                                spoj.smerprijezdu:=grid.Cells[5,i];
                        end;
                  end;


                  if grid.Cells[6,i]<>'' then begin
                        //nacti seznam zastavek
                        //zastavky jsou oddelene stredniky
                        sl:=TStringList.Create;
                        sl.Delimiter:=';';
                        sl.DelimitedText:=grid.Cells[6,i];

                        SetLength(spoj.zastavky,sl.count);

                        for j:=0 to sl.count-1 do begin
                                spoj.zastavky[j].stanice:=sl[j];
                        end;

                        sl.DelimitedText:=grid.Cells[7,i];
                        for j:=0 to sl.count-1 do begin
                                spoj.zastavky[j].odjezd:=strtotime(sl[j]);
                        end;

                        sl.DelimitedText:=grid.Cells[8,i];
                        for j:=0 to sl.count-1 do begin
                                spoj.zastavky[j].kolejpovinna:= sl[j][length(sl[j])]='*';
                                if spoj.zastavky[j].kolejpovinna then sl[j]:=copy(sl[j],1,length(sl[j])-1);
                                spoj.zastavky[j].kolej:=trim(sl[j]);
                        end;


                        sl.Free;

                  end;

                  if grid.Cells[9,i]<>'' then begin
                        if AnsiCompareText(copy(grid.Cells[9,i],1,5),'KONEC')=0 then begin
                                spoj.konci:=true;
                                spoj.smerodjezdu:='';
                                spoj.novecislo:=strtoint('0'+copy(grid.Cells[9,i],7,8));
                        end else begin
                                spoj.konci:=false;
                                spoj.smerodjezdu:=grid.Cells[9,i];
                        end;
                  end;

                  //dame do GVD
                  if nil = JR.GetVlak(strtoint(grid.Cells[2,i])) then
                   JR.Add(spoj);
                  sgl:=sgl+'OK.';


                end else sgl:=sgl+'vlak existuje, neprepisuji.';
         except
                on E:ERangeError do begin
                        sgl:=sgl+'chyba formatu (nekde ma byt cislo a je text?)';
                end;
                on E:Exception do begin
                        sgl:=sgl+'chyba '+E.Message;
                end;
         end;
         lbLog.Items.Add(sgl);
 end;
 button5.Visible:=true;
 lbLog.Show;
 Screen.Cursor:=crArrow;
end;

procedure TfrmTrTable.Button4Click(Sender: TObject);
begin
 grid.AppendRow;
end;

procedure TfrmTrTable.delCol(Sender: TObject);
begin
 grid.Rows[grid.Selection.Top].Clear;
 grid.Rows[grid.Selection.Top].AddStrings(grid.Rows[grid.RowCount-1]);
 grid.RowDelete;
end;

procedure TfrmTrTable.Button5Click(Sender: TObject);
begin
 button5.Hide;
 lbLog.Hide;
end;

end.
