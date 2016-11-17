object DialogMessageForm: TDialogMessageForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'DialogMessageForm'
  ClientHeight = 145
  ClientWidth = 492
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  DesignSize = (
    492
    145)
  PixelsPerInch = 96
  TextHeight = 16
  object DialogdxBevel: TdxBevel
    Left = 8
    Top = 93
    Width = 476
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = dxbsLineTop
  end
  object MaincxLabel: TcxLabel
    Left = 72
    Top = 16
    Caption = 'MaincxLabel'
    Constraints.MaxWidth = 400
    Constraints.MinWidth = 400
    Properties.WordWrap = True
    Width = 400
  end
  object DialogcxImage: TcxImage
    Left = 8
    Top = 8
    AutoSize = True
    Properties.GraphicClassName = 'TIcon'
    Properties.GraphicTransparency = gtTransparent
    Properties.ShowFocusRect = False
    Style.BorderStyle = ebsNone
    Style.Edges = [bLeft, bTop, bRight, bBottom]
    Style.TransparentBorder = True
    TabOrder = 2
    Transparent = True
    Height = 49
    Width = 49
  end
  object AddcxLabel: TcxLabel
    Left = 72
    Top = 50
    Caption = 'AddcxLabel'
    Constraints.MaxWidth = 400
    Constraints.MinWidth = 400
    Properties.WordWrap = True
    Width = 400
  end
  object YescxButton: TcxButton
    Left = 404
    Top = 108
    Width = 80
    Height = 25
    Caption = #1044#1072
    ModalResult = 6
    TabOrder = 3
  end
  object NocxButton: TcxButton
    Left = 312
    Top = 108
    Width = 80
    Height = 25
    Caption = #1053#1077#1090
    ModalResult = 7
    TabOrder = 4
  end
  object OkcxButton: TcxButton
    Left = 231
    Top = 108
    Width = 80
    Height = 25
    Caption = #1054#1082
    ModalResult = 1
    TabOrder = 5
  end
  object CancelcxButton: TcxButton
    Left = 145
    Top = 108
    Width = 80
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    ModalResult = 2
    TabOrder = 6
  end
end
