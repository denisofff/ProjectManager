object AddEditForm: TAddEditForm
  Left = 0
  Top = 0
  Caption = 'AddEditForm'
  ClientHeight = 421
  ClientWidth = 630
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    630
    421)
  PixelsPerInch = 96
  TextHeight = 16
  object ApplycxButton: TcxButton
    Left = 292
    Top = 368
    Width = 161
    Height = 41
    Action = ApplyAction
    Anchors = [akRight, akBottom]
    TabOrder = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object CancelcxButton: TcxButton
    Left = 459
    Top = 368
    Width = 161
    Height = 41
    Action = CancelAction
    Anchors = [akRight, akBottom]
    TabOrder = 1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object AddEditActionList: TActionList
    Images = MainForm.MaincxImageList
    Left = 56
    Top = 24
    object ApplyAction: TAction
      Caption = #1055#1088#1080#1085#1103#1090#1100
      ImageIndex = 0
      ShortCut = 16397
      OnExecute = ApplyActionExecute
    end
    object CancelAction: TAction
      Caption = #1054#1090#1084#1077#1085#1072
      ImageIndex = 1
      OnExecute = CancelActionExecute
    end
    object EnterAction: TAction
      Caption = 'EnterAction'
      ShortCut = 13
      OnExecute = EnterActionExecute
    end
  end
  object AEUniQuery: TUniQuery
    Connection = MainForm.MainUniConnection
    CachedUpdates = True
    Options.RequiredFields = False
    Left = 360
    Top = 24
  end
  object AEUniDataSource: TUniDataSource
    DataSet = AEUniQuery
    Left = 392
    Top = 24
  end
  object TempUniQuery: TUniQuery
    Connection = MainForm.MainUniConnection
    Left = 360
    Top = 72
  end
  object AEPropStorageEh: TPropStorageEh
    StorageManager = MainForm.MainRegPropStorageManEh
    StoredProps.Strings = (
      '<P>.Height'
      '<P>.Left'
      '<P>.PixelsPerInch'
      '<P>.Top'
      '<P>.Width'
      '<P>.WindowState')
    Left = 280
    Top = 32
  end
end
