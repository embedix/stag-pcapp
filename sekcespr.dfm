object frmSpravasekci: TfrmSpravasekci
  Left = 394
  Top = 423
  BorderStyle = bsDialog
  Caption = 'Spr'#225'vce sekc'#237' GVD'
  ClientHeight = 330
  ClientWidth = 497
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
    Left = 6
    Top = 4
    Width = 84
    Height = 13
    Caption = 'Sekce v souboru:'
  end
  object Label2: TLabel
    Left = 14
    Top = 196
    Width = 34
    Height = 13
    Caption = 'Jm'#233'no:'
  end
  object Label3: TLabel
    Left = 14
    Top = 228
    Width = 29
    Height = 13
    Caption = 'Popis:'
  end
  object Bevel1: TBevel
    Left = 6
    Top = 188
    Width = 241
    Height = 105
  end
  object Bevel2: TBevel
    Left = 254
    Top = 188
    Width = 241
    Height = 105
  end
  object btnClose: TButton
    Left = 414
    Top = 300
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Zav'#345#237't'
    ModalResult = 1
    TabOrder = 0
  end
  object edJmeno: TEdit
    Left = 62
    Top = 196
    Width = 169
    Height = 21
    TabOrder = 1
  end
  object edPopis: TEdit
    Left = 62
    Top = 228
    Width = 169
    Height = 21
    TabOrder = 2
  end
  object btnNovaPrazdna: TButton
    Left = 262
    Top = 196
    Width = 225
    Height = 25
    Caption = 'Vytvo'#345' novou pr'#225'zdnou sekci'
    TabOrder = 3
    OnClick = btnNovaPrazdnaClick
  end
  object btnNovaKopii: TButton
    Left = 262
    Top = 228
    Width = 225
    Height = 25
    Caption = 'Vytvo'#345' novou sekci kop'#237'rov'#225'n'#237'm z vybran'#233
    TabOrder = 4
    OnClick = btnNovaKopiiClick
  end
  object btnSmazSekci: TButton
    Left = 262
    Top = 260
    Width = 225
    Height = 25
    Caption = 'Sma'#382' vybranou sekci'
    TabOrder = 5
    OnClick = btnSmazSekciClick
  end
  object lvSekce: TListView
    Left = 6
    Top = 20
    Width = 489
    Height = 161
    Columns = <
      item
        Caption = 'Typ sekce'
        MinWidth = 50
        Width = 80
      end
      item
        Caption = 'Jm'#233'no sekce'
        MinWidth = 50
        Width = 120
      end
      item
        AutoSize = True
        Caption = 'Popis sekce'
        MinWidth = 50
      end>
    HideSelection = False
    HotTrack = True
    RowSelect = True
    TabOrder = 6
    ViewStyle = vsReport
    OnClick = lvSekceClick
  end
  object btnWriteChgs: TButton
    Left = 158
    Top = 260
    Width = 75
    Height = 25
    Caption = 'Zapsat'
    TabOrder = 7
    OnClick = btnWriteChgsClick
  end
  object bsPolyglotTranslator1: TbsPolyglotTranslator
    Manager = frmMain.LangManager
    Left = 78
    Top = 292
  end
end
