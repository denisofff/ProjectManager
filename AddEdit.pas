unit AddEdit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, System.Actions,
  Vcl.ActnList, Vcl.StdCtrls, cxButtons,

  Common, Data.DB, DBAccess, Uni, MemDS, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, cxControls,
  cxContainer, cxEdit, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxTextEdit, cxMemo,
  cxDBEdit, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, PropFilerEh, PropStorageEh;

type
  TAddEditForm = class(TForm)
    ApplycxButton: TcxButton;
    AddEditActionList: TActionList;
    ApplyAction: TAction;
    CancelAction: TAction;
    CancelcxButton: TcxButton;
    AEUniQuery: TUniQuery;
    AEUniDataSource: TUniDataSource;
    TempUniQuery: TUniQuery;
    AEPropStorageEh: TPropStorageEh;
    EnterAction: TAction;
    EscapeAction: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure CancelActionExecute(Sender: TObject);
    procedure ApplyActionExecute(Sender: TObject);
    procedure EnterActionExecute(Sender: TObject);
    procedure EscapeActionExecute(Sender: TObject);
  private
    { Private declarations }
    DataSaved: Boolean;
  protected
    procedure ActivateFirstControl; virtual;

    procedure BaseCreate; virtual;
    procedure BaseDestroy; virtual;
    procedure BaseShow; virtual;

    procedure BaseKeyDown(var Key: Word; Shift: TShiftState); virtual;

    procedure CaptionSet; virtual;

    function CloseAllow: Boolean; virtual;

    function DataModified: Boolean; virtual;

    procedure DefaultSet; virtual;

    function ErrorCheck: Boolean; virtual;

    procedure ParamsPrepare; virtual;

    procedure RefreshData; virtual;

    function SaveData(Silent: Boolean): Boolean; virtual;
    procedure SaveParametersPrepare; virtual;
    procedure SaveQueryDefault; virtual;
    procedure SaveQueryPrepare; virtual;
  public
    { Public declarations }
    ID: Variant;
    OpenMode: TOpenMode;
    Params: Variant;
  end;

  TAddEditFormClass = class of TAddEditForm;

implementation

{$R *.dfm}

uses
  Main, cxLabel;

{ TAddEditForm }

procedure TAddEditForm.ActivateFirstControl;
begin

end;

procedure TAddEditForm.ApplyActionExecute(Sender: TObject);
begin
  if SaveData(False) then
  begin
    if fsModal in FormState then
      ModalResult := mrOk;
  end;
end;

procedure TAddEditForm.BaseCreate;
begin
  AEPropStorageEh.Section := Self.ClassName;

  ID := Null;
  DataSaved := False;
  // FirstSave := False;
  // TotalLoad := False;
  OpenMode := omNone;
end;

procedure TAddEditForm.BaseDestroy;
begin

end;

procedure TAddEditForm.BaseKeyDown(var Key: Word; Shift: TShiftState);
var
  AC: TComponent;
begin
  AC := ControlActiveCorrect(ActiveControl);

  if (Key = VK_RETURN) and (ssCtrl in Shift) then
  begin
    ApplyAction.Execute;
  end
  else if Key = VK_RETURN then
  begin
    if (AC is TDBGridEh) or (AC is TcxDBMemo) then
    begin
      // ничего не делаем
    end
    else if (AC is TcxDBLookupComboBox) and TcxDBLookupComboBox(AC).DroppedDown then
    begin
      TcxDBLookupComboBox(AC).DroppedDown := False;
    end
    else
      Self.SelectNext(Self.ActiveControl, True, True);
  end
  else if Key = VK_ESCAPE then
  begin
    if (AC is TcxDBLookupComboBox) and TcxDBLookupComboBox(AC).DroppedDown then
      TcxDBLookupComboBox(AC).DroppedDown := False
    else
      CancelAction.Execute;
  end;

  inherited;
end;

procedure TAddEditForm.BaseShow;
var
  I: Integer;
begin
  Self.Font.Size := MainForm.Font.Size;

  for I := 0 to ComponentCount - 1 do
    if Components[I] is TcxLabel then
      TcxLabel(Components[I]).Style.Font.Size := MainForm.Font.Size;

  if OpenMode = omNone then
  begin
    MainForm.MsgError('Неверный признак открытия диалога ввода данных. ' + 'Обратитесь к разработчику. ' +
      'Невозможно добавление или редактирование');
    Exit;
  end;

  ApplyAction.Enabled := (OpenMode <> omReadOnly);

  CaptionSet;

  ParamsPrepare;

  RefreshData;

  ActivateFirstControl;

  if AEUniQuery.Active then
    AEUniQuery.Edit;

  if OpenMode = omInsert then
  begin
    if not AEUniQuery.Active then
      Exit;

    DefaultSet;

    // SaveControlData;
  end;
end;

procedure TAddEditForm.CancelActionExecute(Sender: TObject);
begin
  if fsModal in FormState then
    ModalResult := mrCancel
  else
    Close;
end;

procedure TAddEditForm.CaptionSet;
begin
  case OpenMode of
    omInsert, omInsertTemplate:
      begin
        Caption := Caption + ' - Добавление';
      end;
    omUpdate:
      Caption := Caption + ' - Изменение';
    omReadOnly:
      Caption := Caption + ' - Просмотр';
  end;
end;

function TAddEditForm.CloseAllow: Boolean;
begin
  Result := False;

  if DataModified then
  begin
    if MainForm.MsgQuestionYes('Данные были изменены. Сохранить изменения?') = mrYes then
    begin
      if SaveData(True) then
        Result := True
    end
    else
      Result := True;
  end
  else
    Result := True;
end;

function TAddEditForm.DataModified: Boolean;
begin
  Result := AEUniQuery.Modified;
end;

procedure TAddEditForm.DefaultSet;
begin

end;

procedure TAddEditForm.EnterActionExecute(Sender: TObject);
var
  AC: TComponent;
begin
  AC := ControlActiveCorrect(ActiveControl);

  if (AC is TDBGridEh) then
  begin
    // ничего не делаем
  end
  else if (AC is TcxDBMemo) or (AC is TcxMemo) then
  begin
    TWinControl(AC).Perform(WM_CHAR, VK_RETURN, 0);
  end

  else if (AC is TcxDBLookupComboBox) and TcxDBLookupComboBox(AC).DroppedDown then
  begin
    TcxDBLookupComboBox(AC).DroppedDown := False;
  end
  else if (AC is TcxLookupComboBox) and TcxLookupComboBox(AC).DroppedDown then
  begin
    TcxLookupComboBox(AC).DroppedDown := False;
  end
  else
    Self.SelectNext(Self.ActiveControl, True, True);
end;

function TAddEditForm.ErrorCheck: Boolean;
begin
  Result := True;
end;

procedure TAddEditForm.EscapeActionExecute(Sender: TObject);
var
  AC: TComponent;
begin
  AC := ControlActiveCorrect(ActiveControl);

  if (AC is TcxDBLookupComboBox) and TcxDBLookupComboBox(AC).DroppedDown then
  begin
    TcxDBLookupComboBox(AC).DroppedDown := False;
  end
  else if (AC is TcxLookupComboBox) and TcxLookupComboBox(AC).DroppedDown then
  begin
    TcxLookupComboBox(AC).DroppedDown := False;
  end
  else
    ModalResult:= mrCancel;
end;

procedure TAddEditForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  BaseDestroy;
end;

procedure TAddEditForm.FormCreate(Sender: TObject);
begin
  BaseCreate;
end;

procedure TAddEditForm.FormShow(Sender: TObject);
begin
  BaseShow;
end;

procedure TAddEditForm.ParamsPrepare;
begin

end;

procedure TAddEditForm.RefreshData;
var
  I: Integer;
begin
  if AEUniQuery.SQL.Text <> '' then
  begin
    AEUniQuery.Close;
    AEUniQuery.ParamByName('ID').Value := ID;
    AEUniQuery.Open;

    for I := 0 to AEUniQuery.FieldCount - 1 do
      AEUniQuery.Fields[I].ReadOnly := (OpenMode = omReadOnly);

    AEUniQuery.Edit;
  end;
end;

function TAddEditForm.SaveData(Silent: Boolean): Boolean;
begin
  Result := False;

  try
    ErrorCheck;

    if not ErrorCheck then
      Exit;

    SaveQueryPrepare;
    SaveQueryDefault;
    SaveParametersPrepare;

    if TempUniQuery.SQL.Text <> '' then
      TempUniQuery.Execute;

    Result := True;

    if OpenMode in [omInsert, omInsertTemplate] then
      ID := TempUniQuery.ParamByName('ID').Value;

    DataSaved := True;
  except
    on E: Exception do
    begin
      MainForm.MsgError(E.Message);
    end;
  end;
end;

procedure TAddEditForm.SaveParametersPrepare;
begin

end;

procedure TAddEditForm.SaveQueryDefault;
begin
  TempUniQuery.ParamByName('ID').ParamType := ptInputOutput;

  if OpenMode in [omInsert, omInsertTemplate] then
    TempUniQuery.ParamByName('ID').Value := Null
  else
    TempUniQuery.ParamByName('ID').Value := ID;
end;

procedure TAddEditForm.SaveQueryPrepare;
begin

end;

end.
