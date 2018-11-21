unit update;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, ComCtrls, IdThreadMgrPool, IdThreadMgr,
  IdThreadMgrDefault, IdAntiFreezeBase, IdAntiFreeze, ExtCtrls, Spin;

type
  TfrmUpdate = class(TForm)
    IdHTTP: TIdHTTP;
    btnUpdate: TButton;
    Label1: TLabel;
    Label2: TLabel;
    memInfo: TMemo;
    pb: TProgressBar;
    Label3: TLabel;
    lblStav: TLabel;
    btnStop: TButton;
    IdAntiFreeze1: TIdAntiFreeze;
    Label4: TLabel;
    lblVIniVer: TLabel;
    btnDownload: TButton;
    Label5: TLabel;
    Label6: TLabel;
    pb2: TProgressBar;
    Button1: TButton;
    edServer: TLabeledEdit;
    edUser: TLabeledEdit;
    edPwd: TLabeledEdit;
    sePort: TSpinEdit;
    Label7: TLabel;
    cbAutent: TCheckBox;
    Button2: TButton;
    procedure btnUpdateClick(Sender: TObject);
    procedure IdHTTPConnected(Sender: TObject);
    procedure IdHTTPDisconnected(Sender: TObject);
    procedure IdHTTPRedirect(Sender: TObject; var dest: String;
      var NumRedirect: Integer; var Handled: Boolean);
    procedure IdHTTPStatus(axSender: TObject; const axStatus: TIdStatus;
      const asStatusText: String);
    procedure IdHTTPWork(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCount: Integer);
    procedure IdHTTPWorkBegin(Sender: TObject; AWorkMode: TWorkMode;
      const AWorkCountMax: Integer);
    procedure IdHTTPWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
    procedure btnStopClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnDownloadClick(Sender: TObject);
    procedure cbAutentClick(Sender: TObject);
    procedure edServerChange(Sender: TObject);
    procedure edUserChange(Sender: TObject);
    procedure edPwdChange(Sender: TObject);
    procedure sePortChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUpdate: TfrmUpdate;
  term:boolean;

implementation

uses main, TrainImages, gvd, Razeni, inifiles, pngimage;

{$R *.dfm}

procedure TfrmUpdate.btnUpdateClick(Sender: TObject);
var sl:TStringList;
begin
 try
  btnStop.Enabled:=true;
  term:=false;
  btnStop.enabled :=true;
  sl:=TStringList.Create;
  sl.text:=idHTTP.Get(StagINI.ReadString('update','base','http://stag.mantis.cz/vini/')+'getversion.php');
  memInfo.lines.Text:=sl.Text;
  memInfo.Lines.Delete(0);
  if ((vozy.ReadInteger('default','_verze',100)<strtoint(sl[0]))) then
   MessageDlg('Na serveru je novÏjöÌ verze definice voz˘. M˘ûete ji st·hnout kliknutÌm na tlaËÌtko St·hnout definice voz˘.',mtInformation,[mbOK],0)
  else
   MessageDlg('M·te aktu·lnÌ verzi definice voz˘.',mtInformation,[mbOK],0);
  btnDownload.Enabled:=true;
 except
  on E:Exception do if btnStop.enabled then showmessage('Chyba/Error: '+E.Message);
 end;
 sl.Free;
 btnStop.Enabled:=false;
 btnUpdate.Enabled:=false; 
end;

procedure TfrmUpdate.IdHTTPConnected(Sender: TObject);
begin
 memInfo.lines.add('Connected');
 btnStop.enabled:=true;
end;

procedure TfrmUpdate.IdHTTPDisconnected(Sender: TObject);
begin
 memInfo.lines.add('Disconnected');
 btnStop.enabled:=false;
end;

procedure TfrmUpdate.IdHTTPRedirect(Sender: TObject; var dest: String;
  var NumRedirect: Integer; var Handled: Boolean);
begin
 memInfo.lines.add('Redirected: '+dest);
 handled:=false;
end;

procedure TfrmUpdate.IdHTTPStatus(axSender: TObject;
  const axStatus: TIdStatus; const asStatusText: String);
begin
// memInfo.lines.add('Status '+asStatusText);
end;

procedure TfrmUpdate.IdHTTPWork(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCount: Integer);
begin
 if aWorkCount mod 512 = 0 then begin
  pb.Position:=(AWorkCount div 512);
  lblStav.caption:=inttostr((pb.position +512) div 1024)+'/'+inttostr((pb.Max+512) div 1024)+' KB';
  lblStav.Update;
  Application.ProcessMessages;
 end;
end;

procedure TfrmUpdate.IdHTTPWorkBegin(Sender: TObject; AWorkMode: TWorkMode;
  const AWorkCountMax: Integer);
begin
 pb.Max:=AWorkCountMax div 512;
 lblStav.caption:='Start p¯enosu...';
 lblStav.Update;
 Application.ProcessMessages;
end;

procedure TfrmUpdate.IdHTTPWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
begin
 lblStav.caption:='OK.';
 pb.Position:=pb.Max;
 lblStav.Update;
 Application.ProcessMessages;
end;

procedure TfrmUpdate.btnStopClick(Sender: TObject);
begin
 try
  idhttp.Disconnect;
  term:=true;
 except
  on E:Exception do ;
 end;
 btnStop.enabled:=false;
 modalresult:=mrcancel;
end;

procedure TfrmUpdate.FormShow(Sender: TObject);
begin
 lblVIniVer.Caption:=vozy.ReadString('default','_verze','100');
end;

procedure TfrmUpdate.btnDownloadClick(Sender: TObject);
var sl,psl:TStringList;fs:TFileStream; i,j,obrid:integer;s,poms:string;
    ms:TMemoryStream;
    png:TPNGObject;bmp:TBitmap;
begin
 memInfo.Clear;
 btnStop.Enabled:=true;
 try
  term:=false;
  btnStop.enabled :=true;
  sl:=TStringList.Create;
  sl.text:=idHTTP.Get(StagINI.ReadString('update','base','http://stag.mantis.cz/vini/')+'getvini.php');
  memInfo.Lines.add('Definice stazena... - aktualizuji');
  memInfo.Update;
  sl.savetofile(path+'vozy\vozy.ini');
  vozy.Free;
  vozy:=TMemIniFile.Create(path+'vozy\vozy.ini');
//  memInfo.Lines.add('NESTAHUJI OBRAZKY VOZU - NEIMPLEMENTOVANO');

  memInfo.Lines.add('Stahuji novÈ obr·zky voz˘, jsou-li dostupnÈ...');
  memInfo.Update;
  //prohledej, zda mame vsechny obrazky k vozum, kde neni img=0
  psl:=TStringList.Create;
  vozy.ReadSections(psl);
  pb2.show;
  pb2.Max:=psl.Count-1;
  for i:=0 to psl.count-1 do if (psl[i]<>'default') {and
  not FileExists(path+'vozy\vuz_'+psl[i]+'.bmp')  }
  and (vozy.ReadBool(psl[i],'img',true)) and (not term)
   and
    (vozy.ReadString(psl[i],'img','-1')<>'-1')
   then
  begin
   poms:=psl[i];
   pb2.Position:=i;
   pb2.Update;
   obrid:=0;
   repeat
    memInfo.Lines.add('Stahuji obrazek pro vuz '+psl[i]+' (id '+vozy.ReadString(psl[i],'img','----')+')');
    memInfo.Update;
    ms:=TMemoryStream.Create;
    idHTTP.Get(StagINI.ReadString('update','base','http://stag.mantis.cz/vini/')+'getimg.php?obrid='+inttostr(obrid)+'&id='+vozy.ReadString(psl[i],'img','----'),ms);
    memInfo.Lines.Add(StagINI.ReadString('update','base','http://stag.mantis.cz/vini/')+'getimg.php?obrid='+inttostr(obrid)+'&id='+vozy.ReadString(psl[i],'img','----'));
    ms.SaveToFile(path+'vozy\temp.png');
    png:=TPNGObject.Create;
    png.LoadFromFile(path+'vozy\temp.png');
    bmp:=TBitmap.Create;
    bmp.assign(png);
    if obrid=0 then
     bmp.savetofile(path+'vozy\vuz_'+psl[i]+'.bmp')
    else
     bmp.savetofile(path+'vozy\vuz__'+inttostr(obrid)+'_'+psl[i]+'.bmp');
    bmp.free;
    png.Free;
    ms.free;
    inc(obrid);
   until obrid>vozy.ReadInteger(psl[i],'imgex',0)

  end;
  DeleteFile(path+'vozy\temp.png');

  psl.Free;


  frmRazeni.Free;
  TrainImgDestroy;

  TrainImgLoad;
  frmRazeni:=TfrmRazeni.Create(frmMain);
  memInfo.Lines.add('Update - hotovo');
  memInfo.Update;
  lblVIniVer.Caption:=vozy.ReadString('default','_verze','100');  
  MessageDlg('Definice voz˘ byla aktualizov·na.',mtInformation,[mbOK],0)
 except
  on E:Exception do if btnStop.enabled then showmessage('Chyba/Error: '+E.Message+'   ProsÌm, ukonËete a znovu spusùte STAG, abyste p¯edeöli moûnÈ ztr·tÏ dat.');
 end;
 sl.free;
 pb2.Hide;
 btnStop.Enabled:=false;
end;

procedure TfrmUpdate.cbAutentClick(Sender: TObject);
begin
// IdHTTP.ProxyParams.BasicAuthentication:=cbAutent.Checked;
end;

procedure TfrmUpdate.edServerChange(Sender: TObject);
begin
// IdHTTP.ProxyParams.ProxyServer:=edServer.Text;
end;

procedure TfrmUpdate.edUserChange(Sender: TObject);
begin
// IdHTTP.ProxyParams.ProxyUsername:=edUser.text;
end;

procedure TfrmUpdate.edPwdChange(Sender: TObject);
begin
// IdHTTP.ProxyParams.ProxyPassword:=edPwd.Text;
end;

procedure TfrmUpdate.sePortChange(Sender: TObject);
begin
//  IdHTTP.ProxyParams.ProxyPort:=sePort.Value;
end;

procedure TfrmUpdate.Button1Click(Sender: TObject);
begin
 width:=559;
end;

procedure TfrmUpdate.Button2Click(Sender: TObject);
begin
 modalresult:=mrCancel;
end;

end.
