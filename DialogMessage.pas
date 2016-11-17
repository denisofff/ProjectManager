unit DialogMessage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, Vcl.Menus, Vcl.StdCtrls, cxButtons, cxCheckBox, cxImage, cxLabel, dxBevel,

  Common;

type
  TDialogMessageForm = class(TForm)
    MaincxLabel: TcxLabel;
    DialogcxImage: TcxImage;
    AddcxLabel: TcxLabel;
    YescxButton: TcxButton;
    NocxButton: TcxButton;
    OkcxButton: TcxButton;
    CancelcxButton: TcxButton;
    DialogdxBevel: TdxBevel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    DialogCaption: string;
    MainCaption: string;
    AddCaption: string;
    CheckCaption: string;
    MessageType: TMessageType;
    Buttons: TDialogMessageButtons;
    DefaultButton: TDialogMessageButton;
  end;

implementation

{$R *.dfm}

uses
  Main;

procedure TDialogMessageForm.FormShow(Sender: TObject);
var
  ImageIndex, I: Integer;
  TempTop, TempLeft: Integer;
begin
  Self.Font.Size := MainForm.Font.Size;

  for I := 0 to ComponentCount - 1 do
    if Components[I] is TcxLabel then
      TcxLabel(Components[I]).Style.Font.Size := MainForm.Font.Size;

  if DialogCaption <> '' then
    Self.Caption := DialogCaption
  else
    Self.Caption := MainForm.Caption;

  MaincxLabel.Caption := MainCaption;
  AddcxLabel.Caption := AddCaption;

  if AddCaption = '' then
    AddcxLabel.Visible := False;

  YescxButton.Visible := dmbYes in Buttons;
  NocxButton.Visible := dmbNo in Buttons;
  OkcxButton.Visible := dmbOk in Buttons;
  CancelcxButton.Visible := dmbCancel in Buttons;

  case MessageType of
    mtError:
      ImageIndex := 0;
    mtWarning:
      ImageIndex := 1;
    mtInfo:
      ImageIndex := 3;
    mtQuestion:
      ImageIndex := 2;
    mtNone:
      ImageIndex := -1;
  else
    ImageIndex := -1;
  end;

  if ImageIndex = -1 then
    DialogcxImage.Visible := False
  else
  begin
    MainForm.DialogcxImageList.GetIcon(ImageIndex, DialogcxImage.Picture.Icon);
    DialogcxImage.Repaint;
  end;

  TempTop := MaincxLabel.Top + MaincxLabel.Height + 16;

  if AddcxLabel.Visible then
  begin
    AddcxLabel.Top := TempTop;
    TempTop := TempTop + AddcxLabel.Height + 16;
  end;

  DialogdxBevel.Top := TempTop + 10;
  TempTop := TempTop + 26;

  YescxButton.Top := TempTop;
  NocxButton.Top := TempTop;
  OkcxButton.Top := TempTop;
  CancelcxButton.Top := TempTop;

  Self.Height := TempTop + OkcxButton.Height + 32;

  TempLeft := YescxButton.Left;

  if CancelcxButton.Visible then
  begin
    CancelcxButton.Left := TempLeft;
    TempLeft := TempLeft - CancelcxButton.Width - 8;
  end;

  if NocxButton.Visible then
  begin
    NocxButton.Left := TempLeft;
    TempLeft := TempLeft - NocxButton.Width - 8;
  end;

  if YescxButton.Visible then
  begin
    YescxButton.Left := TempLeft;
    TempLeft := TempLeft - YescxButton.Width - 8;
  end;

  if OkcxButton.Visible then
    OkcxButton.Left := TempLeft;

  if (DefaultButton = dmbYes) and (YescxButton.Visible) then
    Self.ActiveControl := YescxButton;

  if (DefaultButton = dmbNo) and (NocxButton.Visible) then
    Self.ActiveControl := NocxButton;

  if (DefaultButton = dmbCancel) and (CancelcxButton.Visible) then
    Self.ActiveControl := CancelcxButton;

  if (DefaultButton = dmbOk) and (OkcxButton.Visible) then
    Self.ActiveControl := OkcxButton;
end;

end.
