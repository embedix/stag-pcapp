object frmSekce: TfrmSekce
  Left = 398
  Top = 385
  BorderStyle = bsDialog
  Caption = 'V'#253'b'#283'r sekce grafikonu'
  ClientHeight = 110
  ClientWidth = 336
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 186
    Height = 13
    Caption = 'Soubor stanice obsahuje tyto grafikony:'
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 310
    Height = 13
    Caption = 
      'Zvolte grafikon, kter'#253' chcete upravovat, a potvr'#271'te tla'#269#237'tkem OK' +
      '.'
  end
  object cbGrafikony: TComboBox
    Left = 8
    Top = 24
    Width = 321
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
  end
  object Button1: TButton
    Left = 256
    Top = 80
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object bsPolyglotTranslator1: TbsPolyglotTranslator
    Manager = frmMain.LangManager
    Left = 40
    Top = 80
  end
end
