object frmUpdate: TfrmUpdate
  Left = 299
  Top = 232
  BorderStyle = bsDialog
  Caption = 'Aktualizace definic voz'#367
  ClientHeight = 277
  ClientWidth = 413
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 345
    Height = 13
    Caption = 
      'Stiskn'#283'te tla'#269#237'tko Update pro sta'#382'en'#237' nejnov'#283'j'#353#237' definice voz'#367' z' +
      ' Internetu'
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 71
    Height = 13
    Caption = 'Aktu'#225'ln'#237' verze:'
  end
  object Label3: TLabel
    Left = 8
    Top = 240
    Width = 28
    Height = 13
    Caption = 'Stav: '
  end
  object lblStav: TLabel
    Left = 48
    Top = 240
    Width = 32
    Height = 13
    Caption = 'lblStav'
  end
  object Label4: TLabel
    Left = 192
    Top = 56
    Width = 178
    Height = 13
    Caption = '(verze definice na tomto PC:              )'
  end
  object lblVIniVer: TLabel
    Left = 336
    Top = 56
    Width = 3
    Height = 13
  end
  object Label5: TLabel
    Left = 8
    Top = 200
    Width = 388
    Height = 13
    Caption = 
      'POZOR: Sta'#382'en'#237'm definice voz'#367' z Internetu budou ztraceny v'#353'echny' +
      ' ru'#269'n'#237' '#250'pravy'
  end
  object Label6: TLabel
    Left = 8
    Top = 216
    Width = 340
    Height = 13
    Caption = 
      've vozy.ini! Tyto '#250'pravy nad'#225'le prov'#225'd'#283'jte pouze ve webov'#233'm rozh' +
      'ran'#237'!'
  end
  object Label7: TLabel
    Left = 424
    Top = 160
    Width = 22
    Height = 13
    Caption = 'Port:'
  end
  object btnUpdate: TButton
    Left = 8
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Update'
    TabOrder = 0
    OnClick = btnUpdateClick
  end
  object memInfo: TMemo
    Left = 8
    Top = 72
    Width = 401
    Height = 89
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object pb: TProgressBar
    Left = 8
    Top = 256
    Width = 313
    Height = 16
    Min = 0
    Max = 100
    Smooth = True
    TabOrder = 2
  end
  object btnStop: TButton
    Left = 96
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Stop'
    Enabled = False
    TabOrder = 3
    OnClick = btnStopClick
  end
  object btnDownload: TButton
    Left = 8
    Top = 168
    Width = 401
    Height = 25
    Caption = 'St'#225'hnout definice voz'#367
    Enabled = False
    TabOrder = 4
    OnClick = btnDownloadClick
  end
  object pb2: TProgressBar
    Left = 8
    Top = 264
    Width = 313
    Height = 9
    Min = 0
    Max = 100
    Smooth = True
    TabOrder = 5
    Visible = False
  end
  object Button1: TButton
    Left = 288
    Top = 24
    Width = 121
    Height = 25
    Caption = 'Nastaven'#237' proxy >>'
    TabOrder = 6
    OnClick = Button1Click
  end
  object edServer: TLabeledEdit
    Left = 424
    Top = 32
    Width = 121
    Height = 21
    EditLabel.Width = 33
    EditLabel.Height = 13
    EditLabel.Caption = 'Adresa'
    LabelPosition = lpAbove
    LabelSpacing = 3
    TabOrder = 7
    OnChange = edServerChange
  end
  object edUser: TLabeledEdit
    Left = 424
    Top = 96
    Width = 121
    Height = 21
    EditLabel.Width = 47
    EditLabel.Height = 13
    EditLabel.Caption = 'U'#382'. jm'#233'no'
    LabelPosition = lpAbove
    LabelSpacing = 3
    TabOrder = 8
    OnChange = edUserChange
  end
  object edPwd: TLabeledEdit
    Left = 424
    Top = 136
    Width = 121
    Height = 21
    EditLabel.Width = 27
    EditLabel.Height = 13
    EditLabel.Caption = 'Heslo'
    LabelPosition = lpAbove
    LabelSpacing = 3
    TabOrder = 9
    OnChange = edPwdChange
  end
  object sePort: TSpinEdit
    Left = 424
    Top = 176
    Width = 121
    Height = 22
    MaxValue = 32768
    MinValue = 0
    TabOrder = 10
    Value = 3128
    OnChange = sePortChange
  end
  object cbAutent: TCheckBox
    Left = 424
    Top = 61
    Width = 121
    Height = 17
    Caption = 'Basic Autentification'
    TabOrder = 11
    OnClick = cbAutentClick
  end
  object Button2: TButton
    Left = 336
    Top = 248
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Konec'
    TabOrder = 12
    OnClick = Button2Click
  end
  object IdHTTP: TIdHTTP
    OnStatus = IdHTTPStatus
    OnDisconnected = IdHTTPDisconnected
    OnWork = IdHTTPWork
    OnWorkBegin = IdHTTPWorkBegin
    OnWorkEnd = IdHTTPWorkEnd
    OnConnected = IdHTTPConnected
    HandleRedirects = True
    Request.Accept = 'text/html, */*'
    Request.ContentLength = 0
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ProxyPort = 0
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    Left = 288
    Top = 112
  end
  object IdAntiFreeze1: TIdAntiFreeze
    Left = 328
    Top = 112
  end
end
