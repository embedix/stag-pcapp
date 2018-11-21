object frmNakladni: TfrmNakladni
  Left = 163
  Top = 90
  BorderStyle = bsDialog
  Caption = 'Nastaven'#237' n'#225'hodn'#233' n'#225'kladn'#237' dopravy'
  ClientHeight = 637
  ClientWidth = 494
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnHide = FormHide
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 176
    Top = 8
    Width = 313
    Height = 385
    Shape = bsFrame
  end
  object Label1: TLabel
    Left = 9
    Top = 613
    Width = 228
    Height = 13
    Caption = 'Frekvence n'#225'hodn'#253'ch vlak'#367' p'#345'i startu simulace:'
  end
  object Label3: TLabel
    Left = 8
    Top = 8
    Width = 77
    Height = 13
    Caption = 'Jm'#233'no IO bodu:'
  end
  object Label4: TLabel
    Left = 183
    Top = 2
    Width = 108
    Height = 13
    Caption = '  Parametry IO bodu:  '
  end
  object Label5: TLabel
    Left = 184
    Top = 61
    Width = 209
    Height = 13
    Caption = 'N'#225'sobitel po'#269'tu vlak'#367' z/do zvolen'#233'ho bodu:'
  end
  object Label6: TLabel
    Left = 312
    Top = 184
    Width = 109
    Height = 13
    Caption = 'Nastaven'#233' n'#225'h. vlaky:'
  end
  object Label7: TLabel
    Left = 184
    Top = 104
    Width = 53
    Height = 13
    Caption = 'Sm'#283'ry j'#237'zd:'
  end
  object Label8: TLabel
    Left = 184
    Top = 337
    Width = 117
    Height = 13
    Caption = 'N'#225'sobitel po'#269'tu vlak'#367' do'
  end
  object Label9: TLabel
    Left = 184
    Top = 352
    Width = 85
    Height = 13
    Caption = 'zvolen'#233'ho sm'#283'ru:'
  end
  object Label2: TLabel
    Left = 312
    Top = 104
    Width = 50
    Height = 13
    Caption = 'Typ vlaku:'
  end
  object Label10: TLabel
    Left = 312
    Top = 144
    Width = 50
    Height = 13
    Caption = 'Souprava:'
  end
  object seInitFreq: TSpinEdit
    Left = 240
    Top = 608
    Width = 41
    Height = 22
    MaxValue = 10
    MinValue = 0
    TabOrder = 0
    Value = 0
    OnChange = seInitFreqChange
  end
  object lbIOPoints: TListBox
    Left = 8
    Top = 24
    Width = 161
    Height = 369
    Style = lbOwnerDrawFixed
    ItemHeight = 17
    TabOrder = 1
    OnClick = lbIOPointsClick
    OnDrawItem = lbIOPointsDrawItem
  end
  object edJmeno: TLabeledEdit
    Left = 184
    Top = 35
    Width = 289
    Height = 21
    BevelKind = bkTile
    BorderStyle = bsNone
    Color = clBtnFace
    EditLabel.Width = 62
    EditLabel.Height = 13
    EditLabel.Caption = 'Jm'#233'no bodu:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    LabelPosition = lpAbove
    LabelSpacing = 3
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object seMult: TSpinEdit
    Left = 184
    Top = 77
    Width = 289
    Height = 22
    MaxValue = 15
    MinValue = 0
    TabOrder = 3
    Value = 1
  end
  object lbSmery: TCheckListBox
    Left = 184
    Top = 120
    Width = 121
    Height = 217
    ItemHeight = 16
    Style = lbOwnerDrawFixed
    TabOrder = 4
    OnClick = lbSmeryClick
    OnDrawItem = lbIOPointsDrawItem
  end
  object seMult2: TSpinEdit
    Left = 184
    Top = 368
    Width = 121
    Height = 22
    MaxValue = 20
    MinValue = 1
    TabOrder = 5
    Value = 1
    OnChange = seMult2Click
    OnClick = seMult2Click
  end
  object btnSaveCh: TButton
    Left = 392
    Top = 360
    Width = 83
    Height = 25
    Caption = 'Ulo'#382' zm'#283'ny'
    TabOrder = 6
    OnClick = btnSaveChClick
  end
  object Button1: TButton
    Left = 416
    Top = 608
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Zav'#345#237't'
    Default = True
    ModalResult = 1
    TabOrder = 7
    OnClick = Button1Click
  end
  object GroupBox1: TGroupBox
    Left = 6
    Top = 395
    Width = 483
    Height = 206
    Caption = ' Definovan'#233' soupravy pro n'#225'hodn'#233' n'#225'kl. vlaky '
    TabOrder = 8
    DesignSize = (
      483
      206)
    object Button2: TButton
      Left = 280
      Top = 208
      Width = 89
      Height = 25
      Caption = 'Upravit '#345'azen'#237
      TabOrder = 0
      OnClick = Button2Click
    end
    object lbSoupravy: TListBox
      Left = 8
      Top = 16
      Width = 377
      Height = 121
      Style = lbOwnerDrawFixed
      ItemHeight = 13
      TabOrder = 1
      OnClick = lbSoupravyClick
      OnDrawItem = lbSoupravyDrawItem
    end
    object cbNRazeni: TComboBox
      Left = 8
      Top = 142
      Width = 377
      Height = 38
      Style = csOwnerDrawVariable
      Anchors = [akLeft, akRight, akBottom]
      Color = clTeal
      Ctl3D = True
      DropDownCount = 4
      ItemHeight = 32
      ParentCtl3D = False
      TabOrder = 2
      OnDrawItem = cbNRazeniDrawItem
      OnMeasureItem = cbNRazeniMeasureItem
    end
    object Button3: TButton
      Left = 392
      Top = 144
      Width = 75
      Height = 25
      Caption = 'Upravit'
      Enabled = False
      TabOrder = 3
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 392
      Top = 48
      Width = 75
      Height = 25
      Caption = 'Smazat'
      TabOrder = 4
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 392
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Nov'#225
      TabOrder = 5
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 392
      Top = 80
      Width = 75
      Height = 17
      Caption = 'Na'#269#237'st seznam'
      TabOrder = 6
      OnClick = Button6Click
    end
    object Button7: TButton
      Left = 392
      Top = 104
      Width = 75
      Height = 17
      Caption = 'Ulo'#382'it seznam'
      TabOrder = 7
      OnClick = Button7Click
    end
  end
  object lbTypyVlaku: TComboBox
    Left = 312
    Top = 120
    Width = 161
    Height = 22
    Style = csOwnerDrawVariable
    ItemHeight = 16
    TabOrder = 9
    OnDrawItem = lbTypyVlakuDrawItem
    OnMeasureItem = lbTypyVlakuMeasureItem
  end
  object cbSoupravy: TComboBox
    Left = 312
    Top = 160
    Width = 89
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 10
  end
  object lbVlaky: TListBox
    Left = 312
    Top = 200
    Width = 161
    Height = 105
    Style = lbOwnerDrawVariable
    ItemHeight = 16
    TabOrder = 11
    OnDrawItem = lbTypyVlakuDrawItem
    OnMeasureItem = lbTypyVlakuMeasureItem
  end
  object Button8: TButton
    Left = 408
    Top = 158
    Width = 65
    Height = 25
    Caption = 'P'#345'idat'
    TabOrder = 12
    OnClick = Button8Click
  end
  object btnDelNV: TButton
    Left = 400
    Top = 312
    Width = 75
    Height = 25
    Caption = 'Smazat'
    TabOrder = 13
    OnClick = btnDelNVClick
  end
  object bsPolyglotTranslator1: TbsPolyglotTranslator
    Manager = frmMain.LangManager
    Left = 72
    Top = 344
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'nndlist'
    Filter = 'Seznam souprav NND (*.nndlist)|*.nndlist|V'#353'echny soubory|*.*'
    FilterIndex = 0
    Left = 336
    Top = 376
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'nndlist'
    Filter = 'Seznam souprav NND (*.nndlist)|*.nndlist|V'#353'echny soubory|*.*'
    FilterIndex = 0
    Left = 368
    Top = 384
  end
end
