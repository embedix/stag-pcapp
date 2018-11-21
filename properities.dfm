object frmProperities: TfrmProperities
  Left = 278
  Top = 200
  BorderStyle = bsDialog
  Caption = 'Nastaven'#237' editoru J'#344
  ClientHeight = 457
  ClientWidth = 375
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 104
    Height = 13
    Caption = 'Zobrazen'#237' typ'#367' vlak'#367':'
  end
  object Label2: TLabel
    Left = 208
    Top = 8
    Width = 77
    Height = 13
    Caption = 'Barva zobrazen'#237
  end
  object Label3: TLabel
    Left = 208
    Top = 152
    Width = 160
    Height = 13
    Caption = #268'as, odkdy je mo'#382'n'#233' p'#345'i'#345'adit '#269#237'slo'
  end
  object Label4: TLabel
    Left = 208
    Top = 168
    Width = 163
    Height = 13
    Caption = 'vlaku, kt. m'#225' vzniknout, souprav'#283
  end
  object Label5: TLabel
    Left = 208
    Top = 184
    Width = 158
    Height = 13
    Caption = 'bude p'#345'i automatick'#233'm nastaven'#237
  end
  object Label6: TLabel
    Left = 208
    Top = 200
    Width = 167
    Height = 13
    Caption = '(tl. auto nebo funkce Nastav auto-'
  end
  object Label7: TLabel
    Left = 208
    Top = 216
    Width = 104
    Height = 13
    Caption = 'maticky '#269'as vzniku) o '
  end
  object Label8: TLabel
    Left = 288
    Top = 240
    Width = 77
    Height = 13
    Caption = 'minut d'#345#237've, ne'#382
  end
  object Label9: TLabel
    Left = 208
    Top = 256
    Width = 162
    Height = 13
    Caption = 'je prvn'#237' odjezd tohoto vlaku v J'#344'.'
  end
  object Bevel1: TBevel
    Left = 8
    Top = 320
    Width = 369
    Height = 9
    Shape = bsTopLine
  end
  object Label10: TLabel
    Left = 8
    Top = 328
    Width = 160
    Height = 13
    Caption = 'Nastaven'#237' chov'#225'n'#237' XML interface:'
  end
  object Bevel2: TBevel
    Left = 6
    Top = 384
    Width = 369
    Height = 9
    Shape = bsTopLine
  end
  object Label11: TLabel
    Left = 8
    Top = 392
    Width = 100
    Height = 13
    Caption = 'U'#382'ivatelsk'#233' rozhran'#237':'
  end
  object btnOK: TButton
    Left = 296
    Top = 424
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Zav'#345#237't'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object lbTyp: TListBox
    Left = 8
    Top = 24
    Width = 193
    Height = 289
    Style = lbOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 1
    OnClick = lbTypClick
    OnDrawItem = lbTypDrawItem
  end
  object ColorBox: TColorBox
    Left = 208
    Top = 24
    Width = 161
    Height = 22
    Style = [cbStandardColors, cbExtendedColors, cbCustomColor, cbPrettyNames]
    DropDownCount = 10
    ItemHeight = 16
    TabOrder = 2
  end
  object cbTucne: TCheckBox
    Left = 208
    Top = 56
    Width = 97
    Height = 17
    Caption = 'Zobrazit tu'#269'n'#283
    TabOrder = 3
  end
  object btnSave: TButton
    Left = 296
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Ulo'#382
    TabOrder = 4
    OnClick = btnSaveClick
  end
  object cbZDoTucne: TCheckBox
    Left = 208
    Top = 120
    Width = 137
    Height = 17
    Caption = 'Sloupce z, do tu'#269'n'#283
    TabOrder = 5
    OnClick = cbZDoTucneClick
  end
  object seCasVz: TSpinEdit
    Left = 208
    Top = 232
    Width = 73
    Height = 22
    MaxValue = 60
    MinValue = 1
    TabOrder = 6
    Value = 20
    OnChange = seCasVzChange
  end
  object cbCreateBackups: TCheckBox
    Left = 16
    Top = 344
    Width = 345
    Height = 17
    Caption = 'P'#345'i ukl'#225'd'#225'n'#237' vytv'#225#345'et automaticky z'#225'lohu (.xml.bak)'
    TabOrder = 7
    OnClick = cbCreateBackupsClick
  end
  object cbSaveToGVD: TCheckBox
    Left = 16
    Top = 360
    Width = 233
    Height = 17
    Caption = 'Ukl'#225'dat i ve star'#233'm form'#225'tu (.gvd)'
    TabOrder = 8
    OnClick = cbSaveToGVDClick
  end
  object cbNiceMenu: TCheckBox
    Left = 16
    Top = 408
    Width = 233
    Height = 17
    Caption = 'Hez'#269#237' menu (snad...) '
    TabOrder = 9
    OnClick = cbNiceMenuClick
  end
  object cbBuzerace: TCheckBox
    Left = 16
    Top = 424
    Width = 265
    Height = 17
    Caption = 'Otravovovat, pokud nejsou vypln'#283'ny v/v body atd.'
    TabOrder = 10
    OnClick = cbBuzeraceClick
  end
  object bsPolyglotTranslator: TbsPolyglotTranslator
    Left = 240
    Top = 80
  end
end
