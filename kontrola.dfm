object frmKontrola: TfrmKontrola
  Left = 282
  Top = 260
  BorderStyle = bsDialog
  Caption = 'Kontrola GVD'
  ClientHeight = 326
  ClientWidth = 315
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = -8
    Top = -24
    Width = 353
    Height = 73
  end
  object Label1: TLabel
    Left = 32
    Top = 24
    Width = 184
    Height = 13
    Caption = 'Kontrola grafikonu a nastaven'#237' stanice'
    Transparent = True
  end
  object Label2: TLabel
    Left = 16
    Top = 8
    Width = 158
    Height = 13
    Caption = 'Nalezeny chyby v grafikonu!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label3: TLabel
    Left = 8
    Top = 56
    Width = 182
    Height = 13
    Caption = 'V grafikonu byly nalezeny tyto chyby:'
    Transparent = True
  end
  object Label4: TLabel
    Left = 7
    Top = 231
    Width = 298
    Height = 13
    Caption = 'V'#283't'#353'ina chyb nebr'#225'n'#237' norm'#225'ln'#237'mu provozu, mohou ale zp'#367'sobit'
    Transparent = True
  end
  object Label5: TLabel
    Left = 7
    Top = 247
    Width = 139
    Height = 13
    Caption = 'abnorm'#225'ln'#237' chov'#225'n'#237' simulace.'
    Transparent = True
  end
  object Label6: TLabel
    Left = 39
    Top = 263
    Width = 227
    Height = 13
    Caption = 'D'#367'razn'#283' doporu'#269'ujeme chyby odstranit!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Label7: TLabel
    Left = 7
    Top = 279
    Width = 305
    Height = 13
    Caption = 'Kontrolu chyb m'#367#382'ete spustit kl'#225'vesou F7 nebo v menu Soubor.'
    Transparent = True
  end
  object lbPolozky: TMemo
    Left = 8
    Top = 72
    Width = 297
    Height = 153
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object btnSouhlas: TButton
    Left = 112
    Top = 296
    Width = 75
    Height = 25
    Caption = 'Souhlas'
    TabOrder = 1
    OnClick = btnSouhlasClick
  end
end
