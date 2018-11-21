object frmRazeni: TfrmRazeni
  Left = 185
  Top = 216
  BorderStyle = bsDialog
  Caption = #344'azen'#237' vlaku'
  ClientHeight = 445
  ClientWidth = 742
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl: TPageControl
    Left = 0
    Top = 0
    Width = 742
    Height = 445
    ActivePage = tsRazeni
    Align = alClient
    TabIndex = 1
    TabOrder = 0
    object tsStare: TTabSheet
      Caption = 'Zadat jen d'#233'lku vlaku'
      object rgTyp: TRadioGroup
        Left = 8
        Top = 8
        Width = 313
        Height = 81
        Caption = ' Typ '#345'azen'#237' vlaku '
        Items.Strings = (
          'N'#225'hodn'#225' d'#233'lka vlaku'
          'Zadan'#225' d'#233'lka vlaku')
        TabOrder = 0
      end
      object edLength: TEdit
        Left = 192
        Top = 56
        Width = 89
        Height = 21
        MaxLength = 5
        TabOrder = 1
        Text = '150'
        OnExit = edLengthExit
      end
      object Edit2: TEdit
        Left = 288
        Top = 64
        Width = 17
        Height = 17
        BorderStyle = bsNone
        Color = clBtnFace
        TabOrder = 2
        Text = 'm'
      end
    end
    object tsRazeni: TTabSheet
      Caption = #344'azen'#237' po vozech'
      ImageIndex = 1
      OnShow = tsRazeniShow
      object Label2: TLabel
        Left = 200
        Top = 8
        Width = 95
        Height = 13
        Caption = 'Seznam voz'#367' vlaku:'
      end
      object lblPocetVozu: TLabel
        Left = 200
        Top = 304
        Width = 69
        Height = 13
        Caption = 'Celkem 0 voz'#367
      end
      object Label3: TLabel
        Left = 8
        Top = 0
        Width = 76
        Height = 13
        Caption = 'Dostupn'#233' vozy:'
      end
      object lblChyba: TLabel
        Left = 8
        Top = 386
        Width = 186
        Height = 13
        Caption = 'Chyba: vlak nem'#225' hnac'#237' vozidlo!'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblHmotnost: TLabel
        Left = 344
        Top = 304
        Width = 25
        Height = 13
        Caption = '0 tun'
      end
      object lblInfo: TLabel
        Left = 8
        Top = 400
        Width = 30
        Height = 13
        Caption = 'lblInfo'
      end
      object imgNahled: TImage
        Left = 120
        Top = 288
        Width = 73
        Height = 25
        Center = True
        Proportional = True
        Transparent = True
      end
      object Label8: TLabel
        Left = 448
        Top = 386
        Width = 98
        Height = 13
        Caption = 'V'#367'z oto'#269'te kliknut'#237'm.'
      end
      object ScrollBox: TScrollBox
        Left = 8
        Top = 321
        Width = 721
        Height = 64
        HorzScrollBar.Smooth = True
        VertScrollBar.Smooth = True
        BevelKind = bkSoft
        BorderStyle = bsNone
        Color = clWhite
        ParentColor = False
        TabOrder = 0
        object imgVlak: TPaintBox
          Left = 0
          Top = 0
          Width = 105
          Height = 60
          OnMouseDown = imgVlakMouseDown
          OnPaint = imgVlakEPaint
        end
      end
      object gbVlastVozu: TGroupBox
        Left = 424
        Top = 8
        Width = 313
        Height = 257
        Caption = ' Vlastnosti vozu '
        TabOrder = 1
        object Label4: TLabel
          Left = 8
          Top = 16
          Width = 45
          Height = 13
          Caption = 'Za'#345'azen'#237':'
        end
        object lblZarazeni: TLabel
          Left = 80
          Top = 16
          Width = 12
          Height = 13
          Caption = '---'
        end
        object Label5: TLabel
          Left = 8
          Top = 32
          Width = 80
          Height = 13
          Caption = 'Parametry vozu:'
        end
        object Label6: TLabel
          Left = 8
          Top = 176
          Width = 52
          Height = 13
          Caption = 'Nastaven'#237':'
        end
        object Label7: TLabel
          Left = 192
          Top = 160
          Width = 102
          Height = 13
          Caption = 'Sm'#283'r p'#345'epravy zbo'#382#237':'
        end
        object Label1: TLabel
          Left = 8
          Top = 212
          Width = 56
          Height = 13
          Caption = 'Popis zbo'#382#237':'
        end
        object lbParametry: TListBox
          Left = 8
          Top = 48
          Width = 297
          Height = 110
          Style = lbOwnerDrawFixed
          ItemHeight = 13
          TabOrder = 0
          OnDrawItem = lbParametryDrawItem
        end
        object cbLozeny: TCheckBox
          Left = 8
          Top = 192
          Width = 97
          Height = 17
          Caption = 'V'#367'z je lo'#382'en'#253
          Enabled = False
          TabOrder = 1
          OnClick = cbLozenyClick
        end
        object cbSmer: TCheckListBox
          Left = 192
          Top = 176
          Width = 113
          Height = 73
          OnClickCheck = cbSmerClickCheck
          Enabled = False
          ItemHeight = 13
          Sorted = True
          TabOrder = 2
        end
        object edZbozi: TEdit
          Left = 8
          Top = 228
          Width = 177
          Height = 21
          TabOrder = 3
          OnChange = cbLozenyClick
        end
        object pnlNoDirection: TPanel
          Left = 6
          Top = 160
          Width = 299
          Height = 91
          Caption = 'N'#225'hodn'#233' vlaky nemaj'#237' sm'#283'r zbo'#382#237' ve vozech'
          TabOrder = 4
          Visible = False
        end
      end
      object btnAdd: TButton
        Left = 104
        Top = 256
        Width = 89
        Height = 25
        Caption = 'P'#345'idat v'#367'z'
        TabOrder = 2
        OnClick = btnAddClick
      end
      object btnDelete: TButton
        Left = 424
        Top = 274
        Width = 75
        Height = 25
        Caption = 'Odebrat v'#367'z'
        TabOrder = 3
        OnClick = btnDeleteClick
      end
      object tvVozy: TTreeView
        Left = 8
        Top = 48
        Width = 185
        Height = 169
        HideSelection = False
        HotTrack = True
        Indent = 19
        ReadOnly = True
        SortType = stText
        TabOrder = 4
        OnClick = tvVozyClick
        OnDblClick = btnAddClick
        OnEnter = edHledejEnter
        OnExit = edHledejExit
      end
      object btnDeleteAll: TButton
        Left = 512
        Top = 274
        Width = 121
        Height = 25
        Caption = 'Odebrat v'#353'echny vozy'
        TabOrder = 5
        OnClick = btnDeleteAllClick
      end
      object btnLoad: TButton
        Left = 8
        Top = 288
        Width = 49
        Height = 25
        Caption = 'Na'#269'ti...'
        TabOrder = 6
        OnClick = btnLoadClick
      end
      object btnSave: TButton
        Left = 64
        Top = 288
        Width = 49
        Height = 25
        Caption = 'Ulo'#382'...'
        TabOrder = 7
        OnClick = btnSaveClick
      end
      object lvVlak: TListView
        Left = 200
        Top = 24
        Width = 220
        Height = 249
        Columns = <
          item
            Caption = 'Typ'
            MinWidth = 15
          end
          item
            AutoSize = True
            Caption = 'Parametry'
            MinWidth = 15
          end
          item
            Caption = 'Popis'
            MinWidth = 15
          end
          item
            Caption = 'Obr.'
            MinWidth = 10
            Width = 20
          end
          item
            MinWidth = 10
            Width = 20
          end>
        DragMode = dmAutomatic
        HideSelection = False
        MultiSelect = True
        RowSelect = True
        TabOrder = 8
        ViewStyle = vsReport
        OnClick = lvVlakClick
        OnEditing = lvVlakEditing
        OnDragDrop = lvVlakDragDrop
        OnDragOver = lvVlakDragOver
        OnKeyDown = lvVlakKeyDown
      end
      object cbJednot: TCheckBox
        Left = 424
        Top = 304
        Width = 233
        Height = 17
        Caption = 'Vlak tvo'#345#237' ucelenou jednotku'
        TabOrder = 9
        OnClick = cbJednotClick
      end
      object btnOtoc: TButton
        Left = 648
        Top = 274
        Width = 65
        Height = 25
        Caption = 'Oto'#269' vlak'
        TabOrder = 10
        OnClick = btnOtocClick
      end
      object edHledej: TEdit
        Left = 8
        Top = 256
        Width = 89
        Height = 21
        TabOrder = 11
        OnChange = edHledejChange
        OnEnter = edHledejEnter
        OnExit = edHledejExit
        OnKeyDown = edHledejKeyDown
      end
      object lbHledac: TListBox
        Left = 8
        Top = 48
        Width = 185
        Height = 201
        Color = 14155735
        ItemHeight = 13
        TabOrder = 12
        Visible = False
        OnClick = lbHledacClick
        OnDblClick = lbHledacDblClick
        OnEnter = edHledejEnter
        OnExit = edHledejExit
      end
      object cbSprava: TComboBox
        Left = 8
        Top = 16
        Width = 185
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 13
        OnChange = cbSpravaChange
      end
      object btnCpy: TButton
        Left = 352
        Top = 280
        Width = 65
        Height = 17
        Caption = 'Kop'#237'ruj'
        Enabled = False
        TabOrder = 14
        OnClick = btnCpyClick
      end
      object cbVjSunuty: TCheckBox
        Left = 600
        Top = 304
        Width = 97
        Height = 17
        Caption = 'Vj'#237#382'd'#237' sunut'#253
        TabOrder = 15
        OnClick = cbVjSunutyClick
      end
    end
  end
  object Button1: TButton
    Left = 572
    Top = 410
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 658
    Top = 410
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Storno'
    ModalResult = 2
    TabOrder = 2
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'trn'
    Filter = 'Soupravy (*.trn)|*.trn|V'#353'echny soubory (*.*)|*.*'
    Title = 'Ulo'#382' soupravu..'
    Left = 320
    Top = 208
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'trn'
    Filter = 'Soupravy (*.trn)|*.trn|V'#353'echny soubory (*.*)|*.*'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Title = 'Na'#269'ti soupravu..'
    Left = 280
    Top = 208
  end
  object bsPolyglotTranslator: TbsPolyglotTranslator
    Manager = frmMain.LangManager
    Left = 200
    Top = 368
  end
end
