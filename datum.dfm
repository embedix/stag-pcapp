object frmDatum: TfrmDatum
  Left = 247
  Top = 363
  BorderStyle = bsDialog
  Caption = 'Nastaven'#237' datumov'#233' pozn'#225'mky'
  ClientHeight = 319
  ClientWidth = 541
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
    Left = 344
    Top = 184
    Width = 116
    Height = 13
    Caption = 'V'#253'sledn'#253' text pozn'#225'mky:'
  end
  object Label2: TLabel
    Left = 8
    Top = 8
    Width = 35
    Height = 13
    Caption = 'Jede v:'
  end
  object Label3: TLabel
    Left = 176
    Top = 8
    Width = 46
    Height = 13
    Caption = 'Nejede v:'
  end
  object Label4: TLabel
    Left = 8
    Top = 240
    Width = 134
    Height = 13
    Caption = 'Dal'#353#237' data odd'#283'len'#225' '#269#225'rkou:'
  end
  object Label5: TLabel
    Left = 176
    Top = 240
    Width = 134
    Height = 13
    Caption = 'Dal'#353#237' data odd'#283'len'#225' '#269#225'rkou:'
  end
  object Label6: TLabel
    Left = 344
    Top = 8
    Width = 43
    Height = 13
    Caption = 'Kalend'#225#345
  end
  object btnCancel: TButton
    Left = 456
    Top = 288
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Storno'
    TabOrder = 0
  end
  object btnOK: TButton
    Left = 376
    Top = 288
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 1
  end
  object mText: TMemo
    Left = 344
    Top = 200
    Width = 185
    Height = 77
    TabOrder = 2
  end
  object lbJede: TCheckListBox
    Left = 8
    Top = 24
    Width = 161
    Height = 209
    ItemHeight = 13
    Items.Strings = (
      '---'#269#225'sti t'#253'dne---'
      'Pracovn'#237' dny'
      'Sv'#225'tky a ned'#283'le'
      '---dny---'
      'Pond'#283'l'#237
      #218'ter'#253
      'St'#345'eda'
      #268'tvrtek'
      'P'#225'tek')
    TabOrder = 3
  end
  object lbNejede: TCheckListBox
    Left = 176
    Top = 24
    Width = 161
    Height = 209
    ItemHeight = 13
    Items.Strings = (
      '---'#269#225'sti t'#253'dne---'
      'Pracovn'#237' dny'
      'Sv'#225'tky a ned'#283'le'
      '---dny---'
      'Pond'#283'l'#237
      #218'ter'#253
      'St'#345'eda'
      #268'tvrtek'
      'P'#225'tek'
      '---ru'#269'n'#237' volba---'
      '24.XII.'
      '31.XII.'
      '1.I.')
    TabOrder = 4
  end
  object edJede: TEdit
    Left = 8
    Top = 256
    Width = 161
    Height = 21
    TabOrder = 5
  end
  object edNejede: TEdit
    Left = 176
    Top = 256
    Width = 161
    Height = 21
    TabOrder = 6
  end
  object btnUse: TButton
    Left = 264
    Top = 288
    Width = 75
    Height = 25
    Caption = 'Pou'#382#237't'
    TabOrder = 7
    OnClick = btnUseClick
  end
  object Calendar: TMonthCalendar
    Left = 344
    Top = 24
    Width = 191
    Height = 154
    Date = 38039.8827533565
    TabOrder = 8
  end
end
