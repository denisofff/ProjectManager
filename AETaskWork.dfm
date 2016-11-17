inherited AETaskWorkForm: TAETaskWorkForm
  BorderIcons = [biSystemMenu]
  Caption = #1056#1072#1073#1086#1090#1072' '#1087#1086' '#1079#1072#1076#1072#1095#1077
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
  object cxLabel3: TcxLabel [3]
    Left = 16
    Top = 57
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077
    ParentFont = False
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Tahoma'
    Style.Font.Style = [fsBold]
    Style.IsFontAssigned = True
  end
  object DatecxDBDateEdit: TcxDBDateEdit [4]
    Left = 168
    Top = 15
    DataBinding.DataField = 'DATE'
    DataBinding.DataSource = AEUniDataSource
    TabOrder = 4
    Width = 170
  end
  object NotecxDBMemo: TcxDBMemo [5]
    Left = 168
    Top = 56
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataBinding.DataField = 'NOTE'
    DataBinding.DataSource = AEUniDataSource
    Properties.ScrollBars = ssVertical
    TabOrder = 5
    Height = 297
    Width = 587
  end
  inherited AEUniQuery: TUniQuery
    SQL.Strings = (
      'EXEC Project.TASK_WORK_GET :ID')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        Value = nil
      end>
  end
end
