inherited AETaskForm: TAETaskForm
  BorderIcons = [biSystemMenu]
  Caption = #1047#1072#1076#1072#1095#1072
  ClientWidth = 765
  ExplicitWidth = 781
  PixelsPerInch = 96
  TextHeight = 16
  inherited ApplycxButton: TcxButton
    Left = 427
    ExplicitLeft = 427
  end
  inherited CancelcxButton: TcxButton
    Left = 594
    ExplicitLeft = 594
  end
  object cxLabel1: TcxLabel [2]
    Left = 16
    Top = 16
    Caption = #1044#1072#1090#1072
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
  end
  object cxLabel2: TcxLabel [3]
    Left = 16
    Top = 50
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
  end
  object cxLabel3: TcxLabel [4]
    Left = 16
    Top = 88
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
  end
  object cxLabel4: TcxLabel [5]
    Left = 344
    Top = 16
    Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
  end
  object DatecxDBDateEdit: TcxDBDateEdit [6]
    Left = 168
    Top = 15
    DataBinding.DataField = 'DATE'
    DataBinding.DataSource = AEUniDataSource
    TabOrder = 6
    Width = 170
  end
  object ExecutorcxDBLookupComboBox: TcxDBLookupComboBox [7]
    Left = 496
    Top = 15
    Anchors = [akLeft, akTop, akRight]
    DataBinding.DataField = 'ID_EXECUTOR'
    DataBinding.DataSource = AEUniDataSource
    Properties.DropDownListStyle = lsFixedList
    Properties.DropDownRows = 20
    Properties.KeyFieldNames = 'ID'
    Properties.ListColumns = <
      item
        FieldName = 'SHORT'
      end>
    Properties.ListOptions.ShowHeader = False
    Properties.ListSource = MainForm.PersonalUniDataSource
    TabOrder = 7
    Width = 259
  end
  object NamecxDBTextEdit: TcxDBTextEdit [8]
    Left = 168
    Top = 49
    Anchors = [akLeft, akTop, akRight]
    DataBinding.DataField = 'NAME'
    DataBinding.DataSource = AEUniDataSource
    TabOrder = 8
    Width = 587
  end
  object NotecxDBMemo: TcxDBMemo [9]
    Left = 168
    Top = 87
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataBinding.DataField = 'NOTE'
    DataBinding.DataSource = AEUniDataSource
    Properties.ScrollBars = ssVertical
    TabOrder = 9
    Height = 266
    Width = 587
  end
  inherited AEUniQuery: TUniQuery
    SQL.Strings = (
      'EXEC Project.TASK_GET :ID')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        Value = nil
      end>
  end
end
