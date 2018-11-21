object frmDatPoz: TfrmDatPoz
  Left = 195
  Top = 128
  BorderStyle = bsDialog
  Caption = 'Editor datumov'#253'ch pozn'#225'mek'
  ClientHeight = 359
  ClientWidth = 792
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 77
    Height = 13
    Caption = #268#237'slo pozn'#225'mky:'
  end
  object Label4: TLabel
    Left = 240
    Top = 8
    Width = 35
    Height = 13
    Caption = 'Jede v:'
  end
  object Label5: TLabel
    Left = 616
    Top = 8
    Width = 46
    Height = 13
    Caption = 'Nejede v:'
  end
  object Label6: TLabel
    Left = 240
    Top = 240
    Width = 134
    Height = 13
    Caption = 'Dal'#353#237' data odd'#283'len'#225' '#269#225'rkou:'
  end
  object Label7: TLabel
    Left = 640
    Top = 240
    Width = 134
    Height = 13
    Alignment = taRightJustify
    Caption = 'Dal'#353#237' data odd'#283'len'#225' '#269#225'rkou:'
  end
  object Label8: TLabel
    Left = 408
    Top = 8
    Width = 43
    Height = 13
    Caption = 'Kalend'#225#345
  end
  object Label2: TLabel
    Left = 240
    Top = 280
    Width = 391
    Height = 13
    Caption = 
      'Data m'#367#382'ete vlo'#382'it tak'#233' vybr'#225'n'#237'm z kalend'#225#345'e a stiskem tla'#269#237'tka ' +
      'Jede nebo Nejede'
  end
  object Bevel1: TBevel
    Left = 232
    Top = 312
    Width = 545
    Height = 9
    Shape = bsBottomLine
  end
  object lbList: TListBox
    Left = 8
    Top = 24
    Width = 217
    Height = 297
    Style = lbOwnerDrawFixed
    ItemHeight = 16
    ScrollWidth = 400
    TabOrder = 0
    OnClick = lbListClick
    OnDrawItem = lbListDrawItem
  end
  object btnClear: TButton
    Left = 8
    Top = 328
    Width = 57
    Height = 25
    Caption = 'Sma'#382
    TabOrder = 1
    OnClick = btnClearClick
  end
  object btnNew: TButton
    Left = 72
    Top = 328
    Width = 59
    Height = 25
    Caption = 'Nov'#225
    TabOrder = 2
    OnClick = btnNewClick
  end
  object lbJede: TCheckListBox
    Left = 240
    Top = 24
    Width = 153
    Height = 209
    ItemHeight = 13
    Items.Strings = (
      '---'#269#225'sti t'#253'dne---'
      'Pracovn'#237' dny'
      'Sv'#225'tky a ned'#283'le'
      '---dny---'
      'Pond'#283'l'#237
      #218'ter'#253
      'St'#345'eda'
      #268'tvrtek'
      'P'#225'tek')
    Style = lbOwnerDrawFixed
    TabOrder = 3
    OnDrawItem = lbJedeDrawItem
  end
  object lbNejede: TCheckListBox
    Left = 616
    Top = 24
    Width = 161
    Height = 209
    ItemHeight = 13
    Items.Strings = (
      '---'#269#225'sti t'#253'dne---'
      'Pracovn'#237' dny'
      'Sv'#225'tky a ned'#283'le'
      '---dny---'
      'Pond'#283'l'#237
      #218'ter'#253
      'St'#345'eda'
      #268'tvrtek'
      'P'#225'tek'
      '---ru'#269'n'#237' volba---'
      '24.XII.'
      '31.XII.'
      '1.I.')
    Style = lbOwnerDrawFixed
    TabOrder = 4
    OnDrawItem = lbJedeDrawItem
  end
  object edJede: TEdit
    Left = 240
    Top = 256
    Width = 257
    Height = 21
    TabOrder = 5
  end
  object edNejede: TEdit
    Left = 504
    Top = 256
    Width = 273
    Height = 21
    TabOrder = 6
  end
  object Calendar: TMonthCalendar
    Left = 408
    Top = 24
    Width = 185
    Height = 153
    AutoSize = True
    BiDiMode = bdRightToLeftNoAlign
    MultiSelect = True
    Date = 38039.5705438542
    EndDate = 38039
    MaxSelectRange = 200
    ParentBiDiMode = False
    TabOrder = 7
    WeekNumbers = True
  end
  object Button1: TButton
    Left = 408
    Top = 184
    Width = 89
    Height = 25
    Caption = 'Jede'
    TabOrder = 8
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 504
    Top = 184
    Width = 89
    Height = 25
    Caption = 'Nejede'
    TabOrder = 9
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 704
    Top = 328
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'OK'
    Default = True
    TabOrder = 10
    OnClick = Button3Click
  end
  object btnSaveChgs: TButton
    Left = 704
    Top = 288
    Width = 75
    Height = 25
    Caption = 'Ulo'#382' zm'#283'ny'
    Enabled = False
    TabOrder = 11
    OnClick = btnSaveChgsClick
  end
  object bsPolyglotTranslator1: TbsPolyglotTranslator
    Manager = frmMain.LangManager
    Left = 432
    Top = 216
  end
end
