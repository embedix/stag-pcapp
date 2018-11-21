object frmMain: TfrmMain
  Left = 202
  Top = 109
  Width = 757
  Height = 567
  Caption = 'STAG '
  Color = clBtnFace
  Constraints.MinHeight = 567
  Constraints.MinWidth = 750
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Icon.Data = {
    0000010001002020100001000400E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
    0000000000000000000000000000000000008888888888888885000000000000
    0008888080888808088550000000000000888880808888080885550000000000
    0000000000000000000000000000000000888880808888080888550000000000
    008F7F7F89800898F7F7F5000000000000877778888888888777750000000000
    009111999999999999111100000000000091BBB9999999999BBB110000000000
    0099999999999999999911000000000000999999999999999999110000000000
    0099999999999999999911000000000000999999996999999999110000000000
    0099999979999997999911000000000000996067666666667606110000000000
    0080607666666666670600000000000000806066666666666606000000000000
    008060666666666666060000000000000080E0EEEE6E6E666606000000000000
    0099666666666666666611000000000000099999999999999999100000000000
    000777777777777777778000000000000000777777FFF1777777000000000000
    0000007777777777780000000000000000000000077777800000000000000000
    0000000000088000000000000000000000000000000880000000000000000000
    0000000000088000000000000000000000000000008008000000000000000000
    000000000080080000000000000000000000000000000000000000000000FF9F
    F9FFFF0000FFFE00007FFC00003FFC00003FFC00003FFC00003FFC00003FFC00
    003FFC00003FFC00003FFC00003FFC00003FFC00003FFC00003FFC00003FFC00
    003FFC00003FFC00003FFC00003FFC00003FFE00007FFE00007FFF0000FFFFC0
    03FFFFF81FFFFFFE7FFFFFFE7FFFFFFE7FFFFFFDBFFFFFE5A7FFFFF81FFF}
  Menu = MainMenu
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter: TSplitter
    Left = 185
    Top = 0
    Width = 5
    Height = 521
    Cursor = crHSplit
    AutoSnap = False
    MinSize = 185
  end
  object pnlSpoj: TPanel
    Left = 190
    Top = 0
    Width = 559
    Height = 521
    Align = alClient
    Anchors = [akTop, akRight]
    BevelOuter = bvLowered
    Constraints.MinHeight = 500
    Constraints.MinWidth = 500
    TabOrder = 0
    DesignSize = (
      559
      521)
    object Label1: TLabel
      Left = 8
      Top = 8
      Width = 106
      Height = 13
      Caption = 'Nastaven'#237' vlaku '#269#237'slo: '
    end
    object lblCisloVlaku: TLabel
      Left = 184
      Top = 8
      Width = 75
      Height = 13
      Caption = 'Nen'#237' ur'#269'eno.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 8
      Top = 40
      Width = 50
      Height = 13
      Caption = '&Typ vlaku:'
      FocusControl = cbTypVlaku
    end
    object Label3: TLabel
      Left = 8
      Top = 184
      Width = 187
      Height = 13
      Caption = 'Pravideln'#233' zast'#225'vky vlaku ve stanic'#237'ch:'
    end
    object Label4: TLabel
      Left = 277
      Top = 192
      Width = 39
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Stanice:'
    end
    object Label5: TLabel
      Left = 277
      Top = 216
      Width = 79
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Pravideln'#225' kolej:'
    end
    object Label6: TLabel
      Left = 277
      Top = 240
      Width = 38
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Odjezd:'
    end
    object Label15: TLabel
      Left = 8
      Top = 459
      Width = 56
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Vl&ak jede v:'
      FocusControl = cbJedeV
    end
    object lblDPInfo: TLabel
      Left = 80
      Top = 459
      Width = 4
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = '-'
    end
    object Label18: TLabel
      Left = 8
      Top = 440
      Width = 10
      Height = 13
      Anchors = [akLeft, akRight, akBottom]
      Caption = 'Pozn'#225'mka:'
    end
    object Label19: TLabel
      Left = 278
      Top = 283
      Width = 165
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Shift + up/down - zm'#283'na zast'#225'vky'
    end
    object Label20: TLabel
      Left = 202
      Top = 478
      Width = 63
      Height = 13
      Anchors = [akRight, akBottom]
      Caption = 'Jm'#233'no vlaku:'
    end
    object btnPriradCislo: TButton
      Left = 272
      Top = 32
      Width = 75
      Height = 25
      Caption = 'P'#345'i'#345'adit &'#269#237'slo'
      TabOrder = 1
      OnClick = btnPriradCisloClick
    end
    object GroupBox1: TGroupBox
      Left = 352
      Top = 8
      Width = 131
      Height = 49
      Caption = ' Posun v'#353'ech '#269'as'#367' '
      TabOrder = 17
      object Label17: TLabel
        Left = 32
        Top = 24
        Width = 68
        Height = 13
        Caption = 'hodiny:minuty'
      end
    end
    object sbMinuty: TSpinButton
      Left = 456
      Top = 24
      Width = 20
      Height = 25
      DownGlyph.Data = {
        0E010000424D0E01000000000000360000002800000009000000060000000100
        200000000000D800000000000000000000000000000000000000008080000080
        8000008080000080800000808000008080000080800000808000008080000080
        8000008080000080800000808000000000000080800000808000008080000080
        8000008080000080800000808000000000000000000000000000008080000080
        8000008080000080800000808000000000000000000000000000000000000000
        0000008080000080800000808000000000000000000000000000000000000000
        0000000000000000000000808000008080000080800000808000008080000080
        800000808000008080000080800000808000}
      TabOrder = 26
      UpGlyph.Data = {
        0E010000424D0E01000000000000360000002800000009000000060000000100
        200000000000D800000000000000000000000000000000000000008080000080
        8000008080000080800000808000008080000080800000808000008080000080
        8000000000000000000000000000000000000000000000000000000000000080
        8000008080000080800000000000000000000000000000000000000000000080
        8000008080000080800000808000008080000000000000000000000000000080
        8000008080000080800000808000008080000080800000808000000000000080
        8000008080000080800000808000008080000080800000808000008080000080
        800000808000008080000080800000808000}
      OnDownClick = sbMinutyDownClick
      OnUpClick = sbMinutyUpClick
    end
    object sbHodiny: TSpinButton
      Left = 360
      Top = 24
      Width = 20
      Height = 25
      DownGlyph.Data = {
        0E010000424D0E01000000000000360000002800000009000000060000000100
        200000000000D800000000000000000000000000000000000000008080000080
        8000008080000080800000808000008080000080800000808000008080000080
        8000008080000080800000808000000000000080800000808000008080000080
        8000008080000080800000808000000000000000000000000000008080000080
        8000008080000080800000808000000000000000000000000000000000000000
        0000008080000080800000808000000000000000000000000000000000000000
        0000000000000000000000808000008080000080800000808000008080000080
        800000808000008080000080800000808000}
      TabOrder = 25
      UpGlyph.Data = {
        0E010000424D0E01000000000000360000002800000009000000060000000100
        200000000000D800000000000000000000000000000000000000008080000080
        8000008080000080800000808000008080000080800000808000008080000080
        8000000000000000000000000000000000000000000000000000000000000080
        8000008080000080800000000000000000000000000000000000000000000080
        8000008080000080800000808000008080000000000000000000000000000080
        8000008080000080800000808000008080000080800000808000000000000080
        8000008080000080800000808000008080000080800000808000008080000080
        800000808000008080000080800000808000}
      OnDownClick = sbHodinyDownClick
      OnUpClick = sbHodinyUpClick
    end
    object pnlInfo: TPanel
      Left = 1
      Top = 1
      Width = 557
      Height = 33
      Align = alTop
      Caption = 'pnlInfo'
      Color = clPurple
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 16
      Visible = False
    end
    object cbTypVlaku: TComboBox
      Left = 80
      Top = 32
      Width = 185
      Height = 21
      AutoDropDown = True
      Style = csOwnerDrawVariable
      ItemHeight = 15
      TabOrder = 0
      OnChange = cbTypVlakuChange
      OnDrawItem = cbTypVlakuDrawItem
      OnMeasureItem = cbTypVlakuMeasureItem
    end
    object cbJednotka: TCheckBox
      Left = 8
      Top = 64
      Width = 177
      Height = 17
      Caption = 'Motorov'#225'/elektrick'#225' &jednotka'
      TabOrder = 2
    end
    object btnVlozVlak: TButton
      Left = 373
      Top = 473
      Width = 169
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = '--- &Ulo'#382'it ---'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 24
      OnClick = btnVlozVlakClick
    end
    object pcVznik: TPageControl
      Left = 8
      Top = 88
      Width = 542
      Height = 89
      ActivePage = tsVznika
      Anchors = [akLeft, akTop, akRight]
      TabIndex = 1
      TabOrder = 5
      object tsPrijizdi: TTabSheet
        Caption = 'Vlak &p'#345'ij'#237#382'd'#237' ze sousedn'#237' stanice'
        DesignSize = (
          534
          61)
        object Label9: TLabel
          Left = 8
          Top = 8
          Width = 102
          Height = 13
          Caption = 'Vlak p'#345'ij'#237#382'd'#237' ze sm&'#283'ru:'
          FocusControl = cbPrijezdSmer
        end
        object Label10: TLabel
          Left = 264
          Top = 8
          Width = 144
          Height = 13
          Caption = '    &Vjezd do obvodu Stani'#269#225#345'e:'
          FocusControl = ePrijOdjSousedni
        end
        object Label16: TLabel
          Left = 8
          Top = 32
          Width = 83
          Height = 13
          Caption = '&Ozn'#225'men'#237' sm'#283'ru:'
          FocusControl = cbOznamSmerPrij
        end
        object cbPrijezdSmer: TComboBox
          Left = 112
          Top = 8
          Width = 145
          Height = 21
          AutoDropDown = True
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          OnChange = cbPrijezdSmerChange
        end
        object cbOznamSmerPrij: TComboBox
          Left = 112
          Top = 32
          Width = 374
          Height = 21
          AutoDropDown = True
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 13
          TabOrder = 1
        end
      end
      object tsVznika: TTabSheet
        Caption = 'Vlak v&znik'#225
        ImageIndex = 1
        DesignSize = (
          534
          61)
        object Label13: TLabel
          Left = 8
          Top = 0
          Width = 395
          Height = 13
          Caption = 
            #268#237'slo &vlaku bude nab'#237'zeno v menu p'#345'i zm'#283'n'#283' posunu na vlak od na' +
            'staven'#233'ho '#269'asu:'
          FocusControl = ePrijOdjSousedni
        end
        object btnAuto: TButton
          Left = 496
          Top = 8
          Width = 33
          Height = 17
          Anchors = [akTop, akRight]
          Caption = 'auto'
          TabOrder = 0
          OnClick = btnAutoClick
        end
        object mVznikZ: TMemo
          Left = 8
          Top = 16
          Width = 413
          Height = 42
          Anchors = [akLeft, akTop, akRight]
          BevelKind = bkFlat
          BorderStyle = bsNone
          Color = clScrollBar
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 1
        end
      end
    end
    object pcZanik: TPageControl
      Left = 8
      Top = 296
      Width = 542
      Height = 89
      ActivePage = tsOdjizdi
      Anchors = [akLeft, akRight, akBottom]
      TabIndex = 0
      TabOrder = 15
      object tsOdjizdi: TTabSheet
        Caption = 'Vlak &odj'#237#382'd'#237' do sousedn'#237' stanice'
        DesignSize = (
          534
          61)
        object Label7: TLabel
          Left = 8
          Top = 8
          Width = 94
          Height = 13
          Caption = 'Vlak jede ve &sm'#283'ru:'
          FocusControl = cbOdjSmer
        end
        object Label8: TLabel
          Left = 8
          Top = 32
          Width = 83
          Height = 13
          Caption = 'Oz&n'#225'men'#237' sm'#283'ru:'
          FocusControl = cbOznamSmerOdj
        end
        object Label14: TLabel
          Left = 268
          Top = 8
          Width = 155
          Height = 13
          Caption = #268'as odjezdu do mezistan.&'#250'seku:'
          FocusControl = eOdjCas
        end
        object cbOdjSmer: TComboBox
          Left = 112
          Top = 8
          Width = 145
          Height = 21
          AutoDropDown = True
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          OnChange = cbOdjSmerChange
        end
        object cbOznamSmerOdj: TComboBox
          Left = 112
          Top = 32
          Width = 367
          Height = 21
          AutoDropDown = True
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 13
          TabOrder = 2
        end
        object eOdjCas: TMaskEdit
          Left = 435
          Top = 7
          Width = 44
          Height = 21
          EditMask = '!90:00;1;_'
          MaxLength = 5
          TabOrder = 1
          Text = '00:00'
        end
        object btnProhodOznameni: TButton
          Left = 483
          Top = 32
          Width = 47
          Height = 20
          Anchors = [akRight, akBottom]
          Caption = 'Proho'#271
          TabOrder = 3
          OnClick = btnProhodOznameniClick
        end
      end
      object tsKonci: TTabSheet
        Caption = 'Vlak &kon'#269#237
        ImageIndex = 1
        DesignSize = (
          534
          61)
        object Label11: TLabel
          Left = 8
          Top = 0
          Width = 339
          Height = 13
          Caption = 
            'Vlak skon'#269#237' na posledn'#237' nastaven'#233' zast'#225'vce, '#269'as odjezdu je ignor' +
            'ov'#225'n.'
        end
        object Label12: TLabel
          Left = 8
          Top = 16
          Width = 80
          Height = 13
          Caption = '&Nov'#233' '#269#237'slo vlaku:'
          FocusControl = cbNoveCislo
        end
        object cbNaPosun: TCheckBox
          Left = 368
          Top = 8
          Width = 201
          Height = 17
          Caption = 'V kone'#269'n'#233' stanici od&poj lokomotivu'
          TabOrder = 1
        end
        object cbNoveCislo: TComboBox
          Left = 8
          Top = 32
          Width = 73
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          OnChange = cbNoveCisloChange
          Items.Strings = (
            '<jen zm'#283#328' na posun>')
        end
        object mNovyVl: TMemo
          Left = 216
          Top = 26
          Width = 313
          Height = 32
          Anchors = [akLeft, akTop, akRight]
          BevelKind = bkFlat
          BorderStyle = bsNone
          Color = clScrollBar
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 2
        end
        object btnNaPosun: TButton
          Left = 88
          Top = 32
          Width = 121
          Height = 21
          Caption = 'Zm'#283'nit na posun'
          TabOrder = 3
          OnClick = btnNaPosunClick
        end
      end
    end
    object lvZastavky: TListView
      Left = 8
      Top = 200
      Width = 254
      Height = 89
      Anchors = [akLeft, akTop, akRight, akBottom]
      Columns = <
        item
          Caption = 'Stanice'
        end
        item
          Caption = 'Kolej'
        end
        item
          AutoSize = True
          Caption = 'Odjezd'
        end
        item
          Caption = 'Povinn'#225' kolej'
          Width = 80
        end>
      ColumnClick = False
      HideSelection = False
      HotTrackStyles = [htUnderlineHot]
      RowSelect = True
      SortType = stData
      TabOrder = 7
      ViewStyle = vsReport
      OnClick = lvZastavkyClick
      OnCompare = lvZastavkyCompare
      OnEditing = lvZastavkyEditing
      OnKeyUp = lvZastavkyKeyUp
    end
    object eOdjezd: TMaskEdit
      Left = 357
      Top = 232
      Width = 113
      Height = 21
      Anchors = [akTop, akRight]
      EditMask = '!90:00;1;_'
      MaxLength = 5
      TabOrder = 10
      Text = '00:00'
      OnChange = cbStaniceChange
      OnKeyDown = cbStaniceKeyDown
    end
    object cbKolej: TComboBox
      Left = 357
      Top = 208
      Width = 49
      Height = 21
      AutoDropDown = True
      Anchors = [akTop, akRight]
      ItemHeight = 13
      TabOrder = 9
      OnChange = cbStaniceChange
      OnKeyDown = cbStaniceKeyDown
      Items.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5'
        '6'
        '7'
        '8'
        '9'
        '10'
        '11'
        '12'
        '13'
        '14'
        '15'
        '16'
        '17'
        '18'
        '19'
        '20'
        '21'
        '22'
        '23'
        '24'
        '25'
        '26'
        '27'
        '28'
        '29'
        '30')
    end
    object cbStanice: TComboBox
      Left = 357
      Top = 184
      Width = 113
      Height = 21
      AutoDropDown = True
      Anchors = [akTop, akRight]
      ItemHeight = 13
      TabOrder = 8
      OnChange = cbStaniceChange
      OnKeyDown = cbStaniceKeyDown
    end
    object btnZPridej: TButton
      Left = 277
      Top = 264
      Width = 65
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'P'#345'idej'
      TabOrder = 11
      OnClick = btnZPridejClick
    end
    object btnZSmaz: TButton
      Left = 349
      Top = 264
      Width = 65
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Sma'#382
      TabOrder = 13
      OnClick = btnZSmazClick
    end
    object btnZSmazVse: TButton
      Left = 421
      Top = 264
      Width = 57
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Sma'#382' v'#353'e'
      TabOrder = 14
      OnClick = btnZSmazVseClick
    end
    object cbJedeV: TComboBox
      Left = 7
      Top = 475
      Width = 58
      Height = 21
      AutoComplete = False
      AutoDropDown = True
      Anchors = [akLeft, akRight, akBottom]
      ItemHeight = 13
      TabOrder = 22
      OnChange = cbJedeVChange
      OnDrawItem = cbJedeVDrawItem
    end
    object cbZastavky: TCheckBox
      Left = 248
      Top = 64
      Width = 209
      Height = 17
      Caption = 'Vlak zastavuje v oso&bn'#237'ch zast'#225'vk'#225'ch'
      TabOrder = 3
      OnClick = cbZastavkyClick
    end
    object ePrijOdjSousedni: TMaskEdit
      Left = 456
      Top = 120
      Width = 42
      Height = 21
      Anchors = [akTop, akRight]
      EditMask = '!90:00;1;_'
      MaxLength = 5
      TabOrder = 6
      Text = '00:00'
      OnChange = ePrijOdjSousedniChange
    end
    object btnZUlozZmenu: TButton
      Left = 277
      Top = 184
      Width = 65
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Ulo'#382' zm'#283'nu'
      TabOrder = 12
      Visible = False
      OnClick = btnZUlozZmenuClick
    end
    object cbCestujici: TCheckBox
      Left = 248
      Top = 88
      Width = 273
      Height = 17
      Caption = 'V&lak '#269'ek'#225' v zast'#225'vk'#225'ch na v'#253'stup cestuj'#237'c'#237'ch'
      TabOrder = 4
    end
    object btnRazeni: TButton
      Left = 8
      Top = 392
      Width = 113
      Height = 25
      Anchors = [akLeft, akBottom]
      Caption = #344'azen'#237' vlaku (&D)'
      TabOrder = 18
      OnClick = btnRazeniClick
    end
    object StatusBar: TStatusBar
      Left = 1
      Top = 501
      Width = 557
      Height = 19
      AutoHint = True
      Panels = <
        item
          Text = 'P'#345'ipraven'
          Width = 420
        end
        item
          Alignment = taCenter
          Text = '0 vlak'#367
          Width = 100
        end
        item
          Alignment = taCenter
          Text = 'GVD'
          Width = 50
        end>
      SimplePanel = False
    end
    object cbRazeni: TComboBox
      Left = 128
      Top = 391
      Width = 389
      Height = 19
      Style = csOwnerDrawVariable
      Anchors = [akLeft, akRight, akBottom]
      Color = clTeal
      Ctl3D = True
      DropDownCount = 16
      ItemHeight = 13
      ParentCtl3D = False
      TabOrder = 19
      OnDrawItem = cbRazeniDrawItem
      OnMeasureItem = cbRazeniMeasureItem
    end
    object btnEdPoz: TButton
      Left = 76
      Top = 473
      Width = 65
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Editor'
      TabOrder = 21
      OnClick = btnEdPozClick
    end
    object btnDaily: TButton
      Left = 148
      Top = 473
      Width = 49
      Height = 25
      Anchors = [akRight, akBottom]
      Caption = 'Denn'#283
      TabOrder = 23
      OnClick = btnDailyClick
    end
    object edPoznamka: TEdit
      Left = 64
      Top = 437
      Width = 473
      Height = 21
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 20
    end
    object lbRazSez: TListBox
      Left = 488
      Top = 184
      Width = 61
      Height = 113
      AutoComplete = False
      Anchors = [akTop, akRight, akBottom]
      BevelInner = bvNone
      BevelOuter = bvNone
      Color = clBtnFace
      Ctl3D = False
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      ItemHeight = 14
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 28
    end
    object cbSvaz: TCheckBox
      Left = 352
      Top = 296
      Width = 97
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'Sva'#382' '#269'asy'
      TabOrder = 29
    end
    object cbPovinna: TCheckBox
      Left = 411
      Top = 209
      Width = 62
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'povinn'#225
      TabOrder = 30
      OnKeyDown = cbStaniceKeyDown
      OnMouseUp = cbPovinnaMouseUp
    end
    object edTrainName: TEdit
      Left = 267
      Top = 475
      Width = 102
      Height = 21
      Anchors = [akRight, akBottom]
      TabOrder = 31
    end
    object cbVjSunuty: TCheckBox
      Left = 452
      Top = 295
      Width = 15
      Height = 17
      Anchors = [akTop, akRight]
      Caption = 'cbVjSunuty'
      TabOrder = 32
      Visible = False
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 185
    Height = 521
    Align = alLeft
    BevelOuter = bvLowered
    Caption = 'Panel1'
    TabOrder = 1
    DesignSize = (
      185
      521)
    object btnSmazVlak: TSpeedButton
      Left = 112
      Top = 32
      Width = 65
      Height = 22
      Caption = 'Sma'#382' vlak'
      Flat = True
      OnClick = btnSmazVlakClick
    end
    object btnRazeniViceVlaku: TSpeedButton
      Left = 8
      Top = 32
      Width = 97
      Height = 22
      Caption = #344'azen'#237' v'#237'ce vlak'#367
      Flat = True
      OnClick = btnRazeniViceVlakuClick
    end
    object Splitter1: TSplitter
      Left = 1
      Top = 514
      Width = 183
      Height = 6
      Cursor = crSizeNS
      Align = alBottom
    end
    object lvSpoje: TListView
      Left = 1
      Top = 60
      Width = 183
      Height = 366
      Anchors = [akLeft, akTop, akRight, akBottom]
      Columns = <
        item
          Caption = #268#237'slo'
          Width = 65
        end
        item
          Caption = 'Z'
        end
        item
          Caption = 'Do'
          Width = 64
        end
        item
          Caption = 'Vznik'#225
        end
        item
          Caption = 'Kon'#269#237
        end>
      MultiSelect = True
      ReadOnly = True
      RowSelect = True
      ParentShowHint = False
      PopupMenu = PopupMenu1
      ShowHint = True
      SortType = stText
      TabOrder = 0
      ViewStyle = vsReport
      OnColumnClick = lvSpojeColumnClick
      OnCompare = lvSpojeCompare
      OnCustomDrawItem = lvSpojeCustomDrawItem
      OnCustomDrawSubItem = lvSpojeCustomDrawSubItem
      OnDblClick = lvSpojeDblClick
      OnInfoTip = lvSpojeInfoTip
      OnKeyPress = lvSpojeKeyPress
    end
    object lbConsole: TMemo
      Left = 1
      Top = 431
      Width = 183
      Height = 89
      Anchors = [akLeft, akRight, akBottom]
      Color = clWhite
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 1
      WantReturns = False
    end
    object ToolBar1: TToolBar
      Left = 1
      Top = 1
      Width = 183
      Height = 29
      ButtonWidth = 24
      Caption = 'ToolBar1'
      Flat = True
      Images = ImageList1
      TabOrder = 2
      object ToolButton9: TToolButton
        Left = 0
        Top = 0
        Width = 8
        Caption = 'ToolButton9'
        ImageIndex = 7
        Style = tbsSeparator
      end
      object btnOpen: TToolButton
        Left = 8
        Top = 0
        Hint = 'Na'#269#237'st oblast'
        Caption = 'btnOpen'
        ImageIndex = 0
        OnClick = Nastoblast1Click
      end
      object ToolButton2: TToolButton
        Left = 32
        Top = 0
        Hint = 'Ulo'#382'it oblast'
        Caption = 'ToolButton2'
        ImageIndex = 1
        OnClick = Uloitoblast1Click
      end
      object ToolButton3: TToolButton
        Left = 56
        Top = 0
        Hint = 'Kontrola spr'#225'vnosti j'#237'zdn'#237'ho '#345#225'du'
        Caption = 'ToolButton3'
        ImageIndex = 2
        OnClick = Kontrolasprvnosti1Click
      end
      object ToolButton4: TToolButton
        Left = 80
        Top = 0
        Hint = 'Export j'#237'zdn'#237'ho '#345#225'du do HTML'
        Caption = 'ToolButton4'
        ImageIndex = 3
        OnClick = Exportjzdnhodu1Click
      end
      object ToolButton5: TToolButton
        Left = 104
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 4
        Style = tbsSeparator
      end
      object ToolButton6: TToolButton
        Left = 112
        Top = 0
        Hint = 'Import z IDOSu'
        Caption = 'ToolButton6'
        ImageIndex = 4
        OnClick = btnImportClick
      end
      object ToolButton7: TToolButton
        Left = 136
        Top = 0
        Hint = 'Editovat koleji'#353't'#283' v Builderu'
        Caption = 'ToolButton7'
        ImageIndex = 5
        OnClick = EditovatoblastBuilder1Click
      end
    end
    object edHledac: TEdit
      Left = 24
      Top = 376
      Width = 121
      Height = 21
      Anchors = [akLeft, akRight, akBottom]
      BevelKind = bkFlat
      BorderStyle = bsNone
      ReadOnly = True
      TabOrder = 3
      Visible = False
    end
  end
  object MainMenu: TMainMenu
    Images = ImageList1
    Left = 616
    Top = 440
    object mOblast: TMenuItem
      AutoHotkeys = maAutomatic
      Caption = 'Soubo&r'
      OnClick = mOblastClick
      object Nastoblast1: TMenuItem
        AutoHotkeys = maAutomatic
        Caption = 'Na'#269#237'st oblast...'
        Hint = 'Na'#269'te koleji'#353't'#283' Stani'#269#225#345'e a jeho grafikon, existuje-li'
        ImageIndex = 0
        ShortCut = 16463
        OnClick = Nastoblast1Click
      end
      object Importovatoblastzgvd1: TMenuItem
        Caption = 'Importovat oblast z .gvd...'
        OnClick = Importovatoblastzgvd1Click
      end
      object mReload: TMenuItem
        AutoHotkeys = maAutomatic
        Caption = 'Edituj jinou sekci, reload...'
        Enabled = False
        Hint = 'Znovu na'#269'te koleji'#353't'#283' a grafikon - n'#225'vrat k p'#367'vodn'#237'mu stavu'
        OnClick = mReloadClick
      end
      object Zmnasekcgrafikonu1: TMenuItem
        Caption = 'Zm'#283'na sekc'#237' grafikonu...'
        OnClick = Zmnasekcgrafikonu1Click
      end
      object EditovatoblastBuilder1: TMenuItem
        AutoHotkeys = maAutomatic
        Caption = 'Editovat koleji'#353't'#283' oblasti (Builder)'
        Hint = 'Spust'#237' Builder a umo'#382'n'#237' editaci koleji'#353't'#283
        ImageIndex = 5
        OnClick = EditovatoblastBuilder1Click
      end
      object Uloitoblast1: TMenuItem
        AutoHotkeys = maAutomatic
        Caption = 'Ulo'#382'it oblast'
        Hint = 'Ulo'#382#237' GVD'
        ImageIndex = 1
        ShortCut = 16467
        OnClick = Uloitoblast1Click
      end
      object Uloitoblastjako1: TMenuItem
        AutoHotkeys = maAutomatic
        Caption = 'Ulo'#382'it oblast jako...'
        Hint = 
          'Zkop'#237'ruje GVD pod jin'#253'm jm'#233'nem. Je nutn'#233' ru'#269'n'#283' zkop'#237'rovat p'#345#237'slu' +
          #353'n'#253' .dat soubor '
        Visible = False
        OnClick = Uloitoblastjako1Click
      end
      object mObnovit: TMenuItem
        AutoHotkeys = maAutomatic
        Caption = 'Obnov seznam vlak'#367
        Hint = 'P'#345'ekresl'#237' seznam vlak'#367
        ShortCut = 116
        OnClick = mObnovitClick
      end
      object N10: TMenuItem
        Caption = '-'
      end
      object UpdateVOZYINIzInternetu1: TMenuItem
        Caption = 'Update VOZY.INI z Internetu'
        OnClick = UpdateVOZYINIzInternetu1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object mGrafikon: TMenuItem
        Caption = 'Vytvo'#345' n'#225'kresn'#253' j'#237'zdn'#237' '#345#225'd'
        ImageIndex = 10
        ShortCut = 16455
        OnClick = mGrafikonClick
      end
      object Kontrolasprvnosti1: TMenuItem
        AutoHotkeys = maAutomatic
        Caption = 'Kontrola spr'#225'vnosti'
        Hint = 'Zkontroluje syntaktickou spr'#225'vnost dat v GVD'
        ImageIndex = 2
        ShortCut = 118
        OnClick = Kontrolasprvnosti1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Importovatjzdnd1: TMenuItem
        Caption = 'Import j'#237'zdn'#237'ho '#345#225'du (IDOS)...'
        Hint = 'Importuje j'#237'zdn'#237' '#345#225'd z dat IDOSu'
        ImageIndex = 4
        ShortCut = 16457
        OnClick = btnImportClick
      end
      object abulkavlak1: TMenuItem
        Caption = 'Tabulka vlak'#367'...'
        ShortCut = 49236
        OnClick = abulkavlak1Click
      end
      object Exportjzdnhodu1: TMenuItem
        AutoHotkeys = maAutomatic
        Caption = 'Export j'#237'zdn'#237'ho '#345#225'du do HTML...'
        Hint = 'Exportuje J'#344' pro tisk nebo pro web do form'#225'tu HTML'
        ImageIndex = 3
        ShortCut = 16464
        OnClick = Exportjzdnhodu1Click
      end
      object mNadMRU: TMenuItem
        Caption = '-'
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Konec1: TMenuItem
        AutoHotkeys = maAutomatic
        Caption = 'Konec'
        Hint = 'Ukon'#269#237' Editor J'#344
        OnClick = Konec1Click
      end
    end
    object Nastavenoblasti1: TMenuItem
      AutoHotkeys = maAutomatic
      Caption = 'Nastav&en'#237
      object Vstupyavstupy1: TMenuItem
        AutoHotkeys = maAutomatic
        Caption = 'Vstupy a v'#253'stupy...'
        Hint = 
          'Nastavuje cel'#225' jm'#233'na a obvykl'#233' sm'#283'ry j'#237'zdy ze vstupn'#237'ch a v'#253'stup' +
          'n'#237'ch n'#225'v'#283'stidel'
        ImageIndex = 13
        ShortCut = 16499
        OnClick = Vstupyavstupy1Click
      end
      object Staniceazastvky1: TMenuItem
        AutoHotkeys = maAutomatic
        Caption = 'Stanice a zast'#225'vky...'
        Hint = 'Edituje seznam stanic v oblasti'
        ShortCut = 16500
        OnClick = Staniceazastvky1Click
      end
      object N7: TMenuItem
        Caption = '-'
      end
      object mNahodna: TMenuItem
        Caption = 'N'#225'hodn'#225' n'#225'kladn'#237' doprava...'
        ImageIndex = 14
        ShortCut = 16502
        OnClick = mNahodnaClick
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object Datumovpoznmky1: TMenuItem
        Caption = 'Datumov'#233' pozn'#225'mky...'
        ImageIndex = 12
        ShortCut = 16503
        OnClick = btnEdPozClick
      end
      object Automatickpiazendatumovchpoznmek1: TMenuItem
        Caption = 'Automatick'#233' p'#345'i'#345'azen'#237' datumov'#253'ch pozn'#225'mek...'
        OnClick = Automatickpiazendatumovchpoznmek1Click
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object Pepikolejitstanicejinm1: TMenuItem
        Caption = 'P'#345'epi'#353' koleji'#353't'#283' stanice jin'#253'm...'
        Visible = False
      end
      object Editacespojtabulkou1: TMenuItem
        Caption = 'Editace spoj'#367' tabulkou'
        Visible = False
        OnClick = Editacespojtabulkou1Click
      end
      object Koprujazenvlakdojinstanice1: TMenuItem
        Caption = 'Kop'#237'ruj '#345'azen'#237' vlak'#367' do jin'#233' stanice...'
        ImageIndex = 15
        OnClick = Koprujazenvlakdojinstanice1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object Nastaveneditoru1: TMenuItem
        Caption = 'Nastaven'#237' editoru...'
        Hint = 'Nastavuje parametry zobrazen'#237' a funkce Editoru'
        ImageIndex = 11
        OnClick = Nastaveneditoru1Click
      end
      object mLanguage: TMenuItem
        Caption = 'V'#253'b'#283'r jazyka / LANGUAGE...'
        OnClick = mLanguageClick
      end
    end
    object Oprogramu1: TMenuItem
      AutoHotkeys = maAutomatic
      Caption = 'N'#225'pov'#283'da'
      object Npovda1: TMenuItem
        Caption = 'N'#225'pov'#283'da'
        Hint = 'Zobraz'#237' n'#225'pov'#283'du'
        ImageIndex = 7
        ShortCut = 112
        OnClick = Npovda1Click
      end
      object Novinky1: TMenuItem
        Caption = 'Novinky'
        ImageIndex = 8
        OnClick = Novinky1Click
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object Oprogramu2: TMenuItem
        Caption = 'O programu'
        Hint = 'Informuje o verzi a autorovi programu'
        ImageIndex = 6
        OnClick = Oprogramu1Click
      end
    end
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'gvd'
    FileName = 'C:\TEMP\bstanicar\stag2\station.dat'
    Filter = 
      'Stanice Stani'#269#225#345'e (*.dat) - na'#269'te z'#225'rove'#328' i grafikon|*.dat|Grafi' +
      'kony Stani'#269#225#345'e (*.gvd)|*.gvd|V'#353'echny soubory|*.*'
    Options = [ofHideReadOnly, ofExtensionDifferent, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 584
    Top = 440
  end
  object SaveJRDialog: TSaveDialog
    DefaultExt = 'htm'
    Filter = 'HTML soubor v'#269'. '#345'azen'#237' (*.htm)|*.htm'
    Options = [ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Left = 648
    Top = 440
  end
  object ImageList1: TImageList
    Left = 488
    Top = 440
    Bitmap = {
      494C010110001300040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001002000000000000050
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00C6C6C600C6C6C600848484008484
      840000000000C6C6C600C6C6C600000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000840000008400000084000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF00C6C6C600C6C6C60084848400C6C6
      C60000000000C6C6C600C6C6C600000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000840000008400000084000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000FF00C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600000000000000000000840000008400000084000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000000000000000
      0000FFFFFF00C6C6C600C6C6C600FFFFFF00C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00C6C6C600C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C600000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000FF00C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF00FFFFFF00FFFFFF0000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00C6C6C6000000
      FF00FFFFFF000000FF00C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000000000000FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF00FFFFFF0000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00C6C6C600C6C6
      C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600000000000000000000848400008484000084840000000000000000000000
      0000C6C6C60000000000000000000000000000000000FFFFFF00C6C6C6000000
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C600000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000FFFFFF00FFFFFF000000FF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF000000FF00C6C6
      C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C600000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF000000FF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6
      C60000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600000000000000000000008400000084000000840000000000000000000000
      0000C6C6C60000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484000084840000848400008484000084840000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008484840084848400848484000000000084848400C6C6C600FFFFFF008484
      840000000000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000C6C6C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484000000000084848400C6C6C600C6C6C600FFFFFF00C6C6C600C6C6
      C60084848400000000000000000000000000C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084000000FFFF0000FF00
      0000FFFFFF00FFFFFF00C6C6C6000000000000000000C6C6C60000000000C6C6
      C60000000000C6C6C60000000000C6C6C60000000000C6C6C60000000000C6C6
      C60000000000C6C6C600000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000008484840084848400848484000000
      000084848400C6C6C60084848400C6C6C60000000000C6C6C600FFFFFF00C6C6
      C600C6C6C600848484000000000000000000C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0084000000FFFF0000FF0000000000
      0000FFFFFF00FFFFFF00C6C6C6000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000848484000000000084848400C6C6
      C60084848400C6C6C60000000000C6C6C600FFFFFF0000000000FFFFFF00C6C6
      C600C6C6C600C6C6C6008484840000000000C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFF0000FF00000000000000FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000000000000C6C6C60000000000C6C6
      C60000000000C6C6C60000000000C6C6C60000000000C6C6C60000000000C6C6
      C60000000000C6C6C600000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      00000000000000000000000000000000000084848400C6C6C60084848400C6C6
      C60000000000C6C6C600C6C6C60000000000848484008484840000000000FFFF
      FF00C6C6C600C6C6C600C6C6C60084848400C6C6C600FFFFFF00FFFFFF000000
      0000000000000000000084848400FFFFFF008484840000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      000000000000000000000000000000000000C6C6C600C6C6C60000000000C6C6
      C600C6C6C600FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00C6C6C6000000
      0000FFFFFF00C6C6C600C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00FFFFFF00FFFFFF00848400000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000000000000C6C6C60000000000C6C6
      C60000000000C6C6C60000000000C6C6C60000000000C6C6C60000000000C6C6
      C60000000000C6C6C600000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      00000000000000000000000000000000000084848400C6C6C600C6C6C600FFFF
      FF00848484000000000084848400FFFFFF000000000000000000FFFFFF00C6C6
      C600FFFFFF00FFFFFF00C6C6C600FFFFFF00C6C6C60084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084840000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600000000000000000000000000FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF0000000000FFFF
      FF0000000000FFFFFF0000000000FFFFFF00FFFFFF00C6C6C600FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000000000000C6C6C60000000000C6C6
      C60000000000C6C6C60000000000C6C6C60000000000C6C6C60000000000C6C6
      C60000000000C6C6C600000000000000000000000000FFFFFF00000000000000
      000000000000FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000FFFFFF000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFF
      FF0000000000FFFFFF008484840000000000C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600000000000000000000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008400000084000000000000000000000000000000FFFF
      FF00FFFFFF00C6C6C600FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFF
      FF0084848400000000000000000000000000C6C6C60084848400FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00C6C6C6000000000000000000C6C6C60000000000C6C6
      C60000000000C6C6C60000000000C6C6C60000000000C6C6C60000000000C6C6
      C60000000000C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000FFFFFF0000000000FFFFFF00FFFFFF0000000000FFFFFF00848484000000
      000000000000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C60000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000000000000000
      000000000000FFFFFF0000000000FFFFFF008484840000000000000000000000
      000000000000000000000000000000000000C6C6C60084000000840000008484
      8400848484008484840084000000840000008400000084000000C6C6C6000000
      0000C6C6C600C6C6C600000000000000000000000000C6C6C60000000000C6C6
      C60000000000C6C6C60000000000C6C6C60000000000C6C6C60000000000C6C6
      C60000000000C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C60084000000840000008400
      0000840000008400000084000000840000008400000084000000840000008400
      00008400000084000000840000000000000000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848400000000000084840000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000FFFF0000FFFF0000FFFF0000848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840084008484840084008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484000000000000C6C6C6008484840084848400848400000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C60000000000C6C6C600C6C6C60000000000C6C6C600C6C6C60000000000C6C6
      C600C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000008484840000FFFF0000FFFF0000FFFF0000848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008400840084848400FFFFFF00FFFFFF00C6C6C600840084000000
      0000000000000000000000000000000000000000000000000000000000008484
      000000000000C6C6C600C6C6C600C6C6C6008484840084848400848484008484
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C60000000000C6C6C600C6C6C60000000000C6C6C600C6C6C60000000000C6C6
      C600C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000848400008484000084840000848400000000000000
      0000000000000000000000000000000000000000000000000000000000008400
      840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600C6C6C6008400
      840000000000000000000000000000000000000000008484000000000000C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6008484840084848400848484008484
      8400848400000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000FFFF0000FFFF0000FFFF0000848400000000000000
      000000000000000000000000000000000000000000008400840084848400FFFF
      FF00FFFFFF00FFFFFF00C6C6C6008484840000000000C6C6C600C6C6C600C6C6
      C6008400840000000000000000000000000084840000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C6000000000000000000FFFF000084848400848484008484
      8400848484008484000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000000000000000
      0000000000000084840000FFFF0000FFFF0000FFFF0000848400008484000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00C6C6C6008484840000000000840084008400840000000000C6C6C600C6C6
      C600C6C6C60084008400000000000000000084840000C6C6C600C6C6C600C6C6
      C6000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000848484008484
      8400848484008484840084840000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000FFFF0000FFFF0000FFFF0000848400008484000000
      00000000000000000000000000000000000000000000FFFFFF00C6C6C6008484
      840000000000840084008400840084008400840084008400840000000000C6C6
      C600C6C6C600C6C6C600840084000000000084840000C6C6C600000000000000
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00008484
      840084848400848484008484840000000000FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF0000FFFF0000FFFF0000FFFF00008484000000
      0000000000000000000000000000000000000000000084848400000000008400
      8400840084008400840000FFFF00840084008400840084008400840084008400
      8400C6C6C600C6C6C600C6C6C600000000008484000000000000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFF0000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000008400840084008400840084008400
      8400840084008400840084008400008484008400840084008400840084008400
      840000000000C6C6C600C6C6C600000000000000000084840000FFFF0000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000FFFF00008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF0000FF
      FF0000FFFF0000000000000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000084008400840084008400
      840084008400840084008400840000FFFF0000FFFF0000FFFF00840084008400
      84008400840000000000C6C6C60000000000000000000000000084840000FFFF
      0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF000084000000C6C6C6008400
      0000FFFF0000FFFF000084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF0000FF
      FF0000FFFF0000848400000000000000000000FFFF0000FFFF0000FFFF0000FF
      FF00008484000000000000000000000000000000000000000000840084008400
      840084008400840084008400840000848400840084000084840000FFFF008400
      8400840084008400840000000000000000000000000000000000000000008484
      0000FFFF0000FFFF0000FFFF000084000000C6C6C600C6C6C600C6C6C600C6C6
      C60084000000FFFF0000FFFF0000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000FFFFFF0000FF
      FF0000FFFF0000FFFF00008484000000000000FFFF0000FFFF0000FFFF0000FF
      FF00008484000000000000000000000000000000000000000000000000008400
      840084008400840084008400840000FFFF00008484000084840000FFFF008400
      8400840084008400840084008400000000000000000000000000000000000000
      000084840000FFFF0000FFFF0000C6C6C600C6C6C600C6C6C600C6C6C6008400
      0000FFFF0000FFFF000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600C6C6C60000000000C6C6
      C600C6C6C60000000000000000000000000000000000000000000084840000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00008484000000000000000000000000000000000000000000000000000000
      00008400840084008400840084008400840000FFFF0000FFFF00840084008400
      8400840084008400840000000000000000000000000000000000000000000000
      00000000000084840000FFFF0000FFFF0000C6C6C60084000000FFFF0000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C60000000000000000000000000000000000000000000000000000000000FFFF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00C6C6
      C600C6C6C6000084840000000000000000000000000000000000000000000000
      0000000000008400840084008400840084008400840084008400840084008400
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084840000FFFF0000FFFF0000FFFF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600C6C6
      C600008484000000000000000000000000000000000000000000000000000000
      0000000000000000000084008400840084008400840084008400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848400000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000848400C6C6C600C6C6C600FFFFFF00FFFFFF00C6C6C6000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840084000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C6C6C600848484000000FF008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000008484000000000000000000FFFFFF000000FF000000FF00C6C6
      C600C6C6C6000000000084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400C6C6C600C6C6
      C600C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000FF000000FF00C6C6C6000000
      FF00C6C6C60000000000C6C6C600C6C6C600C6C6C60084848400848484008484
      84008484840084848400848484000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008484840084848400C6C6
      C600C6C6C600000000000000000000000000000000000000000000000000C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000FF00C6C6C600C6C6C6000000
      FF000000FF0000000000C6C6C600C6C6C6008484840084848400848484008484
      84008484840000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00848484008484
      8400C6C6C6000000000000000000000000000000000000000000C6C6C6000000
      00000000000000FFFF000000000000FFFF000000000000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000008484000000000000000000FFFFFF00C6C6C600C6C6C600C6C6
      C6000000FF0000000000C6C6C60084848400C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60084848400C6C6C600C6C6C60000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF008484
      8400848484000000000000000000000000000000000000000000C6C6C6000000
      000000FFFF000000000000FFFF000000000000FFFF000000000000FFFF000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000000000000000000000000000000000000000000000
      0000000000000000000084848400C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C60000000000FFFFFF00FFFFFF00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C6000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000C6C6C600C6C6
      C6000000000000FFFF000000000000FFFF000000000000FFFF000000000000FF
      FF00000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000008484000084840000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C60084848400FFFFFF00FFFFFF00FFFFFF00C6C6C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600000000000000000000FFFF000000000000FFFF000000000000FFFF000000
      000000FFFF000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000840000008484
      840084848400C6C6C600FFFFFF000000000000000000C6C6C600FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000C6C6C600C6C6
      C600FF000000FFFFFF00000000000000000000000000C6C6C600FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFFFF00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFF
      FF00000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000C6C6C6000000
      0000C6C6C60000000000FFFF000000000000C6C6C600FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C600C6C6C6000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600C6C6C600C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000000000000C6C6C6000000
      0000FFFFFF0000000000000000008400000084000000FFFFFF00FFFFFF00FFFF
      FF0000000000C6C6C600C6C6C6000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600FFFFFF00FFFFFF0000000000FFFFFF0084000000FFFF000084000000FFFF
      FF00C6C6C600C6C6C600C6C6C6000000000000000000FFFFFF00FFFFFF00C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF000000840000008400
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF0000000000000000008400
      0000FFFF000084000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FF00000084000000840000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFF83FFE01F01FFFFFF01FFE00
      E00FFFFFF01FFE00C007FF7FC007F0008003FF1F8003F0000001C007F01FF000
      0001FF8FF01F80000001FF3FF01F80000001DFFFC00780000001D9FF80038007
      0001C1FFF01F80070001C007F01F80078003D1FFF01F803FC007DDFFC007803F
      E00FDFFF8003803FF01FFFFFF01FFFFFFF3FFFFFFFFFFFFFFC1F00000001000F
      F00F00000001000FC00700000001000F000300000001000F000100000001000F
      000000000001000F000000000001000F000000000001008F8000000000011144
      C001000000010AB8E00700000001057CF01F00000001FAFCF87F00000001FDF8
      FDFF00000001FE04FFFF00000001FFFFFF7FFFFFFC7FFF7FFC3FFFFFF83FFC3F
      F01FC927F81FF01FC00F8003FC1FC00F00070000F83F000700030001F81F0003
      00010001F81F000100000001FC1F000000010927FE0F000100016FA7C3078001
      80016FE3C103C001C0000F67C003E000E001FE07C003F001F007FC07E003F807
      F81FFC0FF007FC1FFC7FFC1FF80FFE7FFFFFFFFFFFFFE001FFFFC00103FFC001
      FFFF803100018001C01F803100018001800F8031000080018AAF800100008001
      855780010000800182A780018000800185538FF18000800180038FF180008001
      800F8FF180018001801F8FF180018001C3FF8FF180018001FFFF8FF5F0078001
      FFFF8001F8238003FFFFFFFFFCF1800700000000000000000000000000000000
      000000000000}
  end
  object LangManager: TbsPolyglotManager
    LangsDir = 'lang\'
    CurrentLang = 'Czech'
    TranslateResourceStrings = True
    BeforeAllTranslate = LangManagerBeforeAllTranslate
    AfterAllTranslate = LangManagerAfterAllTranslate
    Left = 712
    Top = 440
  end
  object Translator: TbsPolyglotTranslator
    Manager = LangManager
    Left = 680
    Top = 440
  end
  object OpenXMLDialog: TOpenDialog
    DefaultExt = 'gvd'
    Filter = 
      'Oblast Stani'#269#225#345'e - nov'#253' form'#225't (*.xml)|*.xml|Stanice Stani'#269#225#345'e -' +
      ' star'#253' form'#225't (*.dat) - na'#269'te z'#225'rove'#328' i grafikon|*.dat|Grafikony' +
      ' Stani'#269#225#345'e - star'#253' form'#225't (*.gvd)|*.gvd|V'#353'echny soubory|*.*'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 552
    Top = 440
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'xml'
    Filter = 'XML soubory (*.xml)|*.xml|V'#353'echny soubory|*.*'
    Options = [ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Left = 520
    Top = 440
  end
  object PopupMenu1: TPopupMenu
    Images = ImageList1
    Left = 744
    Top = 440
    object MenuItem1: TMenuItem
      Caption = 'Edituj vlak'
      Default = True
      OnClick = Editujvlak1Click
    end
    object MenuItem2: TMenuItem
      Caption = 'Sma'#382' vlak(y)'
      OnClick = Smavlak1Click
    end
    object MenuItem3: TMenuItem
      Caption = 'Nastav '#345'azen'#237' vlak'#367
      ShortCut = 16466
      OnClick = NastavdlkuvlakuClick
    end
    object MenuItem4: TMenuItem
      Caption = 'Nastav automaticky '#269'as vzniku tam, kde je '#269'as vzniku 0:00'
      OnClick = Nastavautomatickyasvzniku1Click
    end
    object N9: TMenuItem
      Caption = '-'
    end
    object Seaditpodle1: TMenuItem
      Caption = 'Se'#345'adit podle'
      object slavlaku2: TMenuItem
        Caption = #268#237'sla vlaku'
        OnClick = RaditDle
      end
      object Smrupjezdu2: TMenuItem
        Tag = 1
        Caption = 'Sm'#283'ru p'#345#237'jezdu'
        OnClick = RaditDle
      end
      object Smruodjezdu2: TMenuItem
        Tag = 2
        Caption = 'Sm'#283'ru odjezdu'
        OnClick = RaditDle
      end
      object ypuvlaku2: TMenuItem
        Tag = 3
        Caption = 'Typu vlaku'
        OnClick = RaditDle
      end
      object asupjezdu2: TMenuItem
        Tag = 4
        Caption = #268'asu p'#345#237'jezdu'
        OnClick = RaditDle
      end
    end
  end
  object XPMenu: TXPMenu
    DimLevel = 30
    GrayLevel = 10
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMenuText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Color = clBtnFace
    DrawMenuBar = False
    IconBackColor = clBtnFace
    MenuBarColor = clBtnFace
    SelectColor = clHighlight
    SelectBorderColor = clHighlight
    SelectFontColor = clMenuText
    DisabledColor = clInactiveCaption
    SeparatorColor = clBtnFace
    CheckedColor = clHighlight
    IconWidth = 24
    DrawSelect = True
    UseSystemColors = True
    UseDimColor = False
    OverrideOwnerDraw = False
    Gradient = False
    FlatMenu = False
    AutoDetect = False
    Active = False
    Left = 456
    Top = 440
  end
  object tmrSearch: TTimer
    Enabled = False
    Interval = 1500
    OnTimer = tmrSearchTimer
    Left = 88
    Top = 32
  end
end
