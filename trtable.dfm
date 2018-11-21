object frmTrTable: TfrmTrTable
  Left = 248
  Top = 162
  Width = 696
  Height = 480
  Caption = 'Tabulka vlak'#367
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    688
    453)
  PixelsPerInch = 96
  TextHeight = 13
  object grid: TjanGrid
    Left = 0
    Top = 33
    Width = 688
    Height = 379
    Align = alClient
    ColCount = 12
    Ctl3D = True
    DefaultColWidth = 98
    DefaultRowHeight = 20
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goColMoving, goEditing, goTabs, goAlwaysShowEditor]
    ParentCtl3D = False
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    A1Style = False
    KeyMappingsEnabled = True
    KeyMappings.RowInsert = 8237
    KeyMappings.RowDelete = 8238
    KeyMappings.ColumnInsert = 24621
    KeyMappings.ColumnDelete = 24622
    KeyMappings.PrintPreview = 16464
    KeyMappings.QueryDialog = 16465
    KeyMappings.FormuleDialog = 114
    KeyMappings.CellNamesDialog = 16462
    KeyMappings.SetHeader = 16456
    NumbersalRight = False
    BandsShow = True
    BandsColor = 16644814
    BandsInterval = 2
    HighlightURL = False
    AdvanceDirection = down
    NumberFormat = '%.2f'
    AutoCalculate = False
    ShowValues = False
    ColumnHeaders.Strings = (
      ' '
      'Typ'
      #268#237'slo vl.'
      'Odkud jede'
      'Kam jede'
      'Vstupn'#237' bod'
      'Zast'#225'vky'
      'Odj. ze zast'#225'vek'
      'N'#225'stupi'#353't'#283
      'V'#253'stupn'#237' bod'
      'Odj. z oblasti'
      'Vj. do oblasti')
    StartIndex = 0
    EndIndex = 0
    SortIndex = 0
    SortType = tstCharacter
    CaseSensitiv = False
    SortDirection = Ascending
    HowToSort = stRow
    ShowMessageOnError = True
    PrintOptions.Orientation = poPortrait
    PrintOptions.PageTitle = 'Seznam vlak'#367
    PrintOptions.PageTitleMargin = 0
    PrintOptions.PageFooter = 'date|time|page'
    PrintOptions.HeaderSize = 10
    PrintOptions.FooterSize = 7
    PrintOptions.DateFormat = 'd-mmm-yyyy'
    PrintOptions.TimeFormat = 'h:nn am/pm'
    PrintOptions.Copies = 0
    PrintOptions.FromRow = 0
    PrintOptions.ToRow = 0
    PrintOptions.PreviewPage = 0
    PrintOptions.BorderStyle = bsNone
    PrintOptions.Leftpadding = 0
    PrintOptions.MarginBottom = 0
    PrintOptions.MarginLeft = 0
    PrintOptions.MarginTop = 0
    PrintOptions.MarginRight = 0
    AutoSizemargin = 0
    WordWrap = False
    FormuleMode = False
    ColWidths = (
      31
      37
      61
      92
      94
      72
      98
      98
      98
      75
      98
      98)
    RowHeights = (
      20
      20
      20
      20
      20)
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 33
    Align = alTop
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 321
      Height = 13
      Caption = 'Funkce je EXPERIMENT'#193'LN'#205'. P'#345'ed pou'#382'it'#237'm pros'#237'm z'#225'lohujte data!'
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 412
    Width = 688
    Height = 41
    Align = alBottom
    TabOrder = 2
    object btnOpenCSV: TButton
      Left = 8
      Top = 8
      Width = 97
      Height = 25
      Caption = 'Otev'#345#237't CSV...'
      TabOrder = 0
      OnClick = btnOpenCSVClick
    end
    object btnSaveAsCSV: TButton
      Left = 112
      Top = 8
      Width = 97
      Height = 25
      Caption = 'Ulo'#382'it jako CSV...'
      TabOrder = 1
      OnClick = btnSaveAsCSVClick
    end
    object Button2: TButton
      Left = 600
      Top = 8
      Width = 81
      Height = 25
      Caption = 'Storno / Zav'#345#237't'
      TabOrder = 2
      OnClick = ExitProc
    end
    object btnPln: TButton
      Left = 216
      Top = 8
      Width = 129
      Height = 25
      Caption = 'Napl'#328' tabulku grafikonem'
      TabOrder = 3
      OnClick = btnPlnClick
    end
    object Button3: TButton
      Left = 352
      Top = 8
      Width = 129
      Height = 25
      Caption = 'Vlo'#382' vlaky do grafikonu'
      TabOrder = 4
      OnClick = Button3Click
    end
    object cbPrepis: TCheckBox
      Left = 487
      Top = 12
      Width = 106
      Height = 17
      Caption = 'P'#345'epi'#353' ji'#382' zadan'#233
      TabOrder = 5
    end
  end
  object Button1: TButton
    Left = 600
    Top = 8
    Width = 75
    Height = 17
    Caption = 'Sma'#382' '#345#225'dek'
    TabOrder = 3
    OnClick = delCol
  end
  object Button4: TButton
    Left = 512
    Top = 8
    Width = 75
    Height = 17
    Caption = 'Vlo'#382' '#345#225'dek'
    TabOrder = 4
    OnClick = Button4Click
  end
  object lbLog: TListBox
    Left = 40
    Top = 80
    Width = 609
    Height = 289
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 5
    Visible = False
  end
  object Button5: TButton
    Left = 584
    Top = 88
    Width = 27
    Height = 25
    Caption = 'X'
    TabOrder = 6
    Visible = False
    OnClick = Button5Click
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'csv'
    Filter = 'CSV soubory|*.csv|V'#353'echny soubory|*.*'
    FilterIndex = 0
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Title = 'V'#253'b'#283'r souboru CSV s daty pro tabulku vlak'#367
    Left = 632
    Top = 200
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'csv'
    Filter = 'CSV soubory|*.csv|V'#353'echny soubory|*.*'
    FilterIndex = 0
    Options = [ofHideReadOnly, ofShareAware, ofNoReadOnlyReturn, ofEnableSizing]
    Title = 'V'#253'b'#283'r souboru CSV s daty pro tabulku vlak'#367
    Left = 648
    Top = 256
  end
end
