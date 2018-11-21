object frmGVD: TfrmGVD
  Left = 197
  Top = 164
  Width = 696
  Height = 458
  Caption = 'Grafikon'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    688
    431)
  PixelsPerInch = 96
  TextHeight = 13
  object lblStav: TLabel
    Left = 368
    Top = 307
    Width = 3
    Height = 13
    Anchors = [akLeft, akBottom]
  end
  object ScrollBox: TScrollBox
    Left = 8
    Top = 8
    Width = 673
    Height = 239
    HorzScrollBar.Smooth = True
    VertScrollBar.Smooth = True
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelKind = bkSoft
    BorderStyle = bsNone
    DragKind = dkDock
    DragMode = dmAutomatic
    Color = clBtnFace
    ParentColor = False
    TabOrder = 0
    object img: TImage
      Left = 0
      Top = 0
      Width = 2400
      Height = 1500
      OnDblClick = btnDrawClick
    end
  end
  object btnKonec: TButton
    Left = 608
    Top = 395
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Cancel = True
    Caption = 'Zav'#345#237't'
    ModalResult = 2
    TabOrder = 1
    OnClick = btnKonecClick
  end
  object btnSave: TButton
    Left = 528
    Top = 395
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Ulo'#382'it'
    TabOrder = 2
    OnClick = btnSaveClick
  end
  object btnDraw: TButton
    Left = 368
    Top = 395
    Width = 75
    Height = 25
    Anchors = [akLeft, akBottom]
    Caption = 'Vykresli'
    TabOrder = 3
    OnClick = btnDrawClick
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 251
    Width = 153
    Height = 177
    Anchors = [akLeft, akBottom]
    Caption = ' Zvol tra'#357' z/do '
    TabOrder = 4
    object lbIOBody: TCheckListBox
      Left = 8
      Top = 16
      Width = 137
      Height = 153
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 168
    Top = 251
    Width = 185
    Height = 177
    Anchors = [akLeft, akBottom]
    Caption = ' Odjezdy z n'#225'stupi'#353#357' pro stanice '
    TabOrder = 5
    object lbStanice: TCheckListBox
      Left = 8
      Top = 16
      Width = 169
      Height = 129
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object Animate: TAnimate
    Left = 368
    Top = 259
    Width = 313
    Height = 102
    Active = False
    Anchors = [akLeft, akBottom]
    CommonAVI = aviFindFolder
    StopFrame = 29
  end
  object ProgressBar: TProgressBar
    Left = 368
    Top = 371
    Width = 313
    Height = 16
    Anchors = [akLeft, akBottom]
    Min = 0
    Max = 100
    TabOrder = 7
  end
  object cbViceMista: TCheckBox
    Left = 176
    Top = 400
    Width = 161
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'V'#237'ce m'#237'sta pro '#269#237'sla vlak'#367
    Checked = True
    State = cbChecked
    TabOrder = 8
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'jpg'
    Filter = 'Soubory JPG (*.jpg)|*.jpg'
    Title = 'Ulo'#382'it n'#225'kresn'#253' j'#237'zdn'#237' '#345#225'd'
    Left = 488
    Top = 272
  end
  object bsPolyglotTranslator: TbsPolyglotTranslator
    Left = 560
    Top = 280
  end
end
