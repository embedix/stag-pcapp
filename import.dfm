object frmImport: TfrmImport
  Left = 201
  Top = 151
  BorderStyle = bsDialog
  Caption = 'Import vlak'#367' ze seznamu odjezd'#367' a p'#345#237'jezd'#367' IDOSu'
  ClientHeight = 450
  ClientWidth = 639
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
    Top = 24
    Width = 299
    Height = 13
    Caption = '1) krok: vygenerujte IDOSem seznamy odjezd'#367' ve sm'#283'ru ka'#382'd'#233
  end
  object Label2: TLabel
    Left = 16
    Top = 40
    Width = 198
    Height = 13
    Caption = 'sm'#283'rov'#233' stanice a na'#269't'#283'te je do programu'
  end
  object Label4: TLabel
    Left = 8
    Top = 56
    Width = 53
    Height = 13
    Caption = 'Ze stanice:'
  end
  object Label5: TLabel
    Left = 168
    Top = 56
    Width = 142
    Height = 13
    Caption = 'Obvykl'#233' '#269'.koleje v t'#233'to stanici'
  end
  object Label3: TLabel
    Left = 168
    Top = 104
    Width = 137
    Height = 13
    Caption = 'Obvykl'#253' '#269'as j'#237'zdy od odjezdu'
  end
  object Label6: TLabel
    Left = 168
    Top = 120
    Width = 145
    Height = 13
    Caption = 'do opu'#353't'#283'n'#237' simulovan'#233' oblasti'
  end
  object Label7: TLabel
    Left = 168
    Top = 136
    Width = 34
    Height = 13
    Caption = '(minut):'
  end
  object Label8: TLabel
    Left = 8
    Top = 216
    Width = 299
    Height = 13
    Caption = '2) krok: vygenerujte IDOSem seznamy p'#345#237'jezd'#367' ze sm'#283'ru ka'#382'd'#233
  end
  object Label9: TLabel
    Left = 16
    Top = 232
    Width = 198
    Height = 13
    Caption = 'sm'#283'rov'#233' stanice a na'#269't'#283'te je do programu'
  end
  object Label10: TLabel
    Left = 168
    Top = 280
    Width = 123
    Height = 13
    Caption = 'simulovan'#233' oblasti (minut):'
  end
  object Label11: TLabel
    Left = 168
    Top = 264
    Width = 134
    Height = 13
    Caption = 'do vjezdu do prvn'#237' stanice v'
  end
  object Label12: TLabel
    Left = 168
    Top = 248
    Width = 138
    Height = 13
    Caption = 'Obvykl'#253' '#269'as j'#237'zdy od p'#345#237'jezdu'
  end
  object Label13: TLabel
    Left = 8
    Top = 288
    Width = 54
    Height = 13
    Caption = 'Do stanice:'
  end
  object Label14: TLabel
    Left = 8
    Top = 336
    Width = 309
    Height = 13
    Caption = '3) krok: vygenerujte IDOSem seznamy p'#345#237'jezd'#367' do ka'#382'd'#233' stanice,'
  end
  object Label15: TLabel
    Left = 8
    Top = 352
    Width = 277
    Height = 13
    Caption = 'kde kon'#269#237' i vlaky, kter'#233' ji'#382' projely n'#283'jakou stanic'#237' v koleji'#353'ti'
  end
  object Label16: TLabel
    Left = 8
    Top = 248
    Width = 53
    Height = 13
    Caption = 'Ze stanice:'
  end
  object Label17: TLabel
    Left = 8
    Top = 368
    Width = 53
    Height = 13
    Caption = 'Ze stanice:'
  end
  object Label18: TLabel
    Left = 8
    Top = 408
    Width = 54
    Height = 13
    Caption = 'Do stanice:'
  end
  object Label19: TLabel
    Left = 168
    Top = 376
    Width = 136
    Height = 13
    Caption = 'Nastav obvyklou kolej v poli '
  end
  object Label20: TLabel
    Left = 168
    Top = 392
    Width = 63
    Height = 13
    Caption = 'vlevo naho'#345'e'
  end
  object Label21: TLabel
    Left = 8
    Top = 8
    Width = 598
    Height = 13
    Alignment = taCenter
    Caption = 
      'POZOR - toto je jen EXPERIMENT'#193'LN'#205' PODPORA, ZAZ'#193'LOHUJTE SI GVD P' +
      #344'ED POU'#381'IT'#205'M IMPORTU!'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label22: TLabel
    Left = 320
    Top = 24
    Width = 135
    Height = 13
    Caption = 'Informace o '#269'innosti modulu:'
  end
  object btnZpracOdj: TButton
    Left = 232
    Top = 184
    Width = 75
    Height = 25
    Caption = 'Zpracuj .txt'
    TabOrder = 0
    OnClick = btnZpracOdjClick
  end
  object cbSmery: TComboBox
    Left = 8
    Top = 184
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
  end
  object cbZeStanice: TComboBox
    Left = 8
    Top = 72
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 2
  end
  object edKolej: TEdit
    Left = 168
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 3
    Text = '1'
  end
  object rgKam: TRadioGroup
    Left = 8
    Top = 104
    Width = 145
    Height = 65
    Caption = ' Do stanice '
    ItemIndex = 1
    Items.Strings = (
      'v koleji'#353'ti'
      'do sousedn'#237' stanice')
    TabOrder = 4
    OnClick = rgKamClick
  end
  object seCasJizdy: TSpinEdit
    Left = 168
    Top = 152
    Width = 121
    Height = 22
    MaxValue = 30
    MinValue = 2
    TabOrder = 5
    Value = 3
  end
  object btnZpracPrij: TButton
    Left = 232
    Top = 304
    Width = 75
    Height = 25
    Caption = 'Zpracuj .txt'
    TabOrder = 6
    OnClick = btnZpracPrijClick
  end
  object cbZeSmeru: TComboBox
    Left = 8
    Top = 264
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 7
  end
  object seCasPrijezdu: TSpinEdit
    Left = 168
    Top = 304
    Width = 49
    Height = 22
    MaxValue = 30
    MinValue = 2
    TabOrder = 8
    Value = 3
  end
  object cbPrijede: TComboBox
    Left = 8
    Top = 304
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 9
  end
  object cb3Ze: TComboBox
    Left = 8
    Top = 384
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 10
  end
  object cb3Do: TComboBox
    Left = 8
    Top = 424
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 11
  end
  object btnKoncici: TButton
    Left = 232
    Top = 416
    Width = 75
    Height = 25
    Caption = 'Zpracuj .txt'
    TabOrder = 12
    OnClick = btnKonciciClick
  end
  object Button1: TButton
    Left = 560
    Top = 416
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Konec'
    ModalResult = 1
    TabOrder = 13
  end
  object memConsole: TMemo
    Left = 320
    Top = 40
    Width = 313
    Height = 369
    Lines.Strings = (
      'N'#225'pov'#283'da je v souboru Editor_readme.txt, p'#345#237'padn'#283' ji m'#367#382'ete '
      'otev'#345#237't p'#345'es menu N'#225'pov'#283'da.')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 14
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'txt'
    Filter = 'txt soubory|*.txt'
    Left = 264
    Top = 224
  end
end
