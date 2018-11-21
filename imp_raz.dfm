object frmRazImp: TfrmRazImp
  Left = 426
  Top = 399
  BorderStyle = bsDialog
  Caption = 'Exportuj '#345'azen'#237' vlak'#367
  ClientHeight = 247
  ClientWidth = 277
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 265
    Height = 201
  end
  object Label1: TLabel
    Left = 12
    Top = 15
    Width = 258
    Height = 13
    Caption = 'Funkce exportuje '#345'azen'#237' vlak'#367' do XML dat jin'#233' stanice'
  end
  object btnClose: TButton
    Left = 192
    Top = 216
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Zav'#345#237't'
    TabOrder = 0
    OnClick = btnCloseClick
  end
  object Button2: TButton
    Left = 128
    Top = 56
    Width = 139
    Height = 25
    Caption = 'Zvol stanici a prove'#271
    TabOrder = 1
    OnClick = Button2Click
  end
  object cbPrepis: TCheckBox
    Left = 16
    Top = 32
    Width = 249
    Height = 17
    Caption = 'P'#345'epi'#353' '#345'azen'#237' i t'#283'ch vlak'#367', kde je ji'#382' '#345'az. zad'#225'no'
    TabOrder = 2
  end
  object konzole: TMemo
    Left = 16
    Top = 88
    Width = 249
    Height = 113
    Lines.Strings = (
      'P'#345'ed pou'#382'it'#237'm t'#233'to funkce z'#225'lohujte c'#237'lovou stanici!')
    TabOrder = 3
  end
  object OpenXMLDialog: TOpenDialog
    DefaultExt = 'xml'
    Filter = 'Oblast Stani'#269#225#345'e - nov'#253' form'#225't (*.xml)|*.xml'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 24
    Top = 48
  end
  object bsPolyglotTranslator1: TbsPolyglotTranslator
    Manager = frmMain.LangManager
    Left = 72
    Top = 56
  end
end
