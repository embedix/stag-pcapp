object frmIO: TfrmIO
  Left = 322
  Top = 294
  BorderStyle = bsDialog
  Caption = 'Nastaven'#237' oblasti'
  ClientHeight = 283
  ClientWidth = 545
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
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
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 158
    Height = 13
    Caption = 'Seznam vstup'#367' a v'#253'stup'#367' oblasti:'
  end
  object Bevel1: TBevel
    Left = 176
    Top = 24
    Width = 361
    Height = 156
  end
  object Label2: TLabel
    Left = 184
    Top = 32
    Width = 79
    Height = 13
    Caption = 'Nastaven'#237' bodu:'
  end
  object lbIO: TListBox
    Left = 8
    Top = 24
    Width = 161
    Height = 217
    ItemHeight = 13
    TabOrder = 0
    OnClick = lbIOClick
  end
  object memInfo: TMemo
    Left = 176
    Top = 184
    Width = 361
    Height = 49
    BorderStyle = bsNone
    Color = clScrollBar
    Lines.Strings = (
      
        'Seznam je na'#269'ten z datov'#233'ho souboru koleji'#353't'#283', vytvo'#345'en'#233'ho v Bui' +
        'lderu.'
      
        'P'#345'id'#225'n'#237' nebo odebr'#225'n'#237' bod'#367' prove'#271'te v Builderu (spus'#357'te jej nap'#345 +
        #237'klad '
      'volbou Oblast / Editovat koleji'#353't'#283' oblasti.)')
    ReadOnly = True
    TabOrder = 1
  end
  object eSoused: TLabeledEdit
    Left = 184
    Top = 72
    Width = 345
    Height = 21
    EditLabel.Width = 222
    EditLabel.Height = 13
    EditLabel.Caption = 'Cel'#253' n'#225'zev soused'#237'c'#237' stanice (nap'#345'. '#352'lapanice)'
    LabelPosition = lpAbove
    LabelSpacing = 3
    TabOrder = 2
    OnChange = eSousedChange
  end
  object eSmerOdj: TLabeledEdit
    Left = 184
    Top = 112
    Width = 345
    Height = 21
    EditLabel.Width = 322
    EditLabel.Height = 13
    EditLabel.Caption = 
      'Obvykl'#253' sm'#283'r odj'#237#382'd'#283'j'#237'c'#237'ch vlak'#367' (nap'#345'. '#352'lapanice, Bu'#269'ovice, Kyj' +
      'ov)'
    LabelPosition = lpAbove
    LabelSpacing = 3
    TabOrder = 3
    OnChange = eSousedChange
  end
  object eSmerPrij: TLabeledEdit
    Left = 184
    Top = 152
    Width = 345
    Height = 21
    EditLabel.Width = 303
    EditLabel.Height = 13
    EditLabel.Caption = 
      'Obvykl'#253' sm'#283'r p'#345'ij'#237#382'd'#283'j'#237'c'#237'ch vlak'#367' (nap'#345'. Brno Slatina, Brno hl.n' +
      '.) '
    LabelPosition = lpAbove
    LabelSpacing = 3
    TabOrder = 4
    OnChange = eSousedChange
  end
  object Button1: TButton
    Left = 456
    Top = 248
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'OK'
    ModalResult = 1
    TabOrder = 5
  end
  object bsPolyglotTranslator1: TbsPolyglotTranslator
    Manager = frmMain.LangManager
    Left = 488
    Top = 40
  end
end
