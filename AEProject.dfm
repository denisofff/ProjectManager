inherited AEProjectForm: TAEProjectForm
  Caption = #1055#1088#1086#1077#1082#1090
  ClientHeight = 589
  ClientWidth = 962
  ExplicitWidth = 978
  ExplicitHeight = 627
  PixelsPerInch = 96
  TextHeight = 16
  inherited ApplycxButton: TcxButton
    Left = 624
    Top = 536
    ExplicitLeft = 624
    ExplicitTop = 536
  end
  inherited CancelcxButton: TcxButton
    Left = 791
    Top = 536
    ExplicitLeft = 791
    ExplicitTop = 536
  end
  object MainPanel: TPanel [2]
    Left = 0
    Top = 0
    Width = 962
    Height = 530
    Align = alTop
    Anchors = [akLeft, akTop, akRight, akBottom]
    BevelOuter = bvNone
    TabOrder = 2
    object LeftPanel: TPanel
      Left = 0
      Top = 0
      Width = 523
      Height = 530
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      DesignSize = (
        523
        530)
      object cxLabel1: TcxLabel
        Left = 16
        Top = 16
        Caption = #1053#1072#1079#1074#1072#1085#1080#1077
        ParentFont = False
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clWindowText
        Style.Font.Height = -13
        Style.Font.Name = 'Tahoma'
        Style.Font.Style = [fsBold]
        Style.IsFontAssigned = True
      end
      object NamecxDBTextEdit: TcxDBTextEdit
        Left = 160
        Top = 15
        Anchors = [akLeft, akTop, akRight]
        DataBinding.DataField = 'NAME'
        DataBinding.DataSource = AEUniDataSource
        TabOrder = 1
        Width = 357
      end
      object NotecxDBMemo: TcxDBMemo
        Left = 160
        Top = 56
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataBinding.DataField = 'NOTE'
        DataBinding.DataSource = AEUniDataSource
        Properties.ScrollBars = ssVertical
        TabOrder = 2
        Height = 465
        Width = 357
      end
      object cxLabel2: TcxLabel
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
    end
    object cxSplitter1: TcxSplitter
      Left = 523
      Top = 0
      Width = 8
      Height = 530
    end
    object RightPanel: TPanel
      Left = 531
      Top = 0
      Width = 431
      Height = 530
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object SecurityDBGridEh: TDBGridEh
        Left = 0
        Top = 0
        Width = 431
        Height = 530
        Align = alClient
        ColumnDefValues.Title.ToolTips = True
        ColumnDefValues.ToolTips = True
        DataSource = SecurityUniDataSource
        DrawMemoText = True
        DynProps = <>
        EditActions = [geaCopyEh]
        FooterRowCount = 1
        FooterParams.Color = clYellow
        FooterParams.Font.Charset = DEFAULT_CHARSET
        FooterParams.Font.Color = clWindowText
        FooterParams.Font.Height = -16
        FooterParams.Font.Name = 'Tahoma'
        FooterParams.Font.Style = [fsBold]
        FooterParams.ParentFont = False
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDblClickOptimizeColWidth, dghDialogFind, dghColumnResize, dghColumnMove, dghAutoFitRowHeight, dghExtendVertLines]
        ParentShowHint = False
        SearchPanel.Enabled = True
        SearchPanel.FilterOnTyping = True
        ShowHint = True
        SumList.Active = True
        TabOrder = 0
        TitleParams.MultiTitle = True
        OnCellMouseClick = SecurityDBGridEhCellMouseClick
        Columns = <
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'ID'
            Footers = <>
            ReadOnly = True
            Visible = False
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'SHORT'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082
            Width = 123
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'DEP_NAME'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1054#1090#1076#1077#1083
            Width = 57
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'HEAD'
            Footers = <>
            ReadOnly = True
            Visible = False
            Width = 100
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'R_CHECKED'
            Footers = <>
            Title.Caption = #1055#1088#1072#1074#1072' '#1076#1086#1089#1090#1091#1087#1072'|'#1058#1086#1083#1100#1082#1086' '#1095#1090#1077#1085#1080#1077
            Width = 51
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'W_CHECKED'
            Footers = <>
            Title.Caption = #1055#1088#1072#1074#1072' '#1076#1086#1089#1090#1091#1087#1072'|'#1056#1072#1073#1086#1090#1072' '#1089' '#1087#1088#1086#1077#1082#1090#1086#1084
            Width = 62
          end
          item
            DynProps = <>
            EditButtons = <>
            FieldName = 'M_CHECKED'
            Footers = <>
            Title.Caption = #1055#1088#1072#1074#1072' '#1076#1086#1089#1090#1091#1087#1072'|'#1056#1091#1082#1086#1074#1086#1076#1080#1090#1077#1083#1100' '#1087#1088#1086#1077#1082#1090#1072
            Width = 86
          end>
        object RowDetailData: TRowDetailPanelControlEh
        end
      end
    end
  end
  inherited AEUniQuery: TUniQuery
    SQL.Strings = (
      'EXEC Project.PROJECT_GET :ID')
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        Value = nil
      end>
  end
  inherited AEPropStorageEh: TPropStorageEh
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      'MainPanel.LeftPanel.<P>.Width'
      'MainPanel.RightPanel.SecurityDBGridEh.<P>.Columns.ColumnsIndex'
      
        'MainPanel.RightPanel.SecurityDBGridEh.<P>.Columns.<ForAllItems>.' +
        'Width')
  end
  object SecurityUniQuery: TUniQuery
    Connection = MainForm.MainUniConnection
    SQL.Strings = (
      'EXEC Project.PROJECT_SECURITY_SELECT :ID')
    CachedUpdates = True
    Options.RequiredFields = False
    Left = 561
    Top = 96
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'ID'
        Value = nil
      end>
  end
  object SecurityUniDataSource: TUniDataSource
    DataSet = SecurityUniQuery
    Left = 593
    Top = 96
  end
end
