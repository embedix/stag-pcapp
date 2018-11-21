object frmLanguage: TfrmLanguage
  Left = 456
  Top = 348
  BorderStyle = bsDialog
  Caption = 'Language selection'
  ClientHeight = 78
  ClientWidth = 272
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
    Top = 16
    Width = 51
    Height = 13
    Caption = 'Language:'
  end
  object cbLanguage: TComboBox
    Left = 88
    Top = 16
    Width = 177
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnChange = cbLanguageChange
  end
  object btnExit: TButton
    Left = 192
    Top = 48
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Close'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
end
