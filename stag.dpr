program stag;

uses
  Forms,
  main in 'main.pas' {frmMain},
  gvd in 'gvd.pas',
  io in 'io.pas' {frmIO},
  stanice in 'stanice.pas' {frmStanice},
  properities in 'properities.pas' {frmProperities},
  import in 'import.pas' {frmImport},
  razeni in 'razeni.pas' {frmRazeni},
  TrainImages in 'TrainImages.pas',
  LangSel in 'LangSel.pas' {frmLanguage},
  grafikon in 'grafikon.pas' {frmGVD},
  datamodu in 'datamodu.pas' {DataMod: TDataModule},
  StaGN in 'StaGN.pas' {frmNakladni},
  datumpoz in 'datumpoz.pas' {frmDatPoz},
  imp_raz in 'imp_raz.pas' {frmRazImp},
  sekcegvd in 'sekcegvd.pas' {frmSekce},
  sekcespr in 'sekcespr.pas' {frmSpravasekci},
  starting in 'starting.pas' {frmInit},
  update in 'update.pas' {frmUpdate},
  trtable in 'trtable.pas' {frmTrTable},
  kontrola in 'kontrola.pas' {frmKontrola};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Editor JØ';
  Screen.Cursor:=-11;
  frmInit:=TfrmInit.Create(nil);
  with frmInit do begin
   Show;
   update;
   Application.CreateForm(TfrmMain, frmMain);
  lblInfo.Caption:='XML system';
   update;
   Application.CreateForm(TDataMod, DataMod);
   lblInfo.Caption:='Spoustim...';
   update;
  end;
  Screen.Cursor:=0;  
  Application.Run;
end.
