object SelectParamsForm: TSelectParamsForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'SelectParamsForm'
  ClientHeight = 213
  ClientWidth = 645
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  DesignSize = (
    645
    213)
  PixelsPerInch = 96
  TextHeight = 16
  object ApplycxButton: TcxButton
    Left = 302
    Top = 156
    Width = 161
    Height = 41
    Action = ApplyAction
    Anchors = [akTop, akRight]
    TabOrder = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object CancelcxButton: TcxButton
    Left = 469
    Top = 156
    Width = 161
    Height = 41
    Action = CancelAction
    Anchors = [akTop, akRight]
    TabOrder = 1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ParamsActionList: TActionList
    Images = MainForm.MaincxImageList
    Left = 176
    Top = 32
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
end
