unit SelectParams;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxContainer,
  cxEdit, Vcl.ComCtrls, dxCore, cxDateUtils, cxCurrencyEdit, cxDropDownEdit, cxCalendar, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, cxMaskEdit, cxMemo, cxTextEdit, cxCheckBox, cxLabel, System.Actions, Vcl.ActnList, Vcl.Menus,
  Vcl.StdCtrls, cxButtons, Data.DB, cxSpinEdit, cxTimeEdit, cxCheckComboBox,

  Common;

type
  TSelectParamsForm = class(TForm)
    ParamsActionList: TActionList;
    ApplyAction: TAction;
    CancelAction: TAction;
    ApplycxButton: TcxButton;
    CancelcxButton: TcxButton;
    EnterAction: TAction;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CancelActionExecute(Sender: TObject);
    procedure ApplyActionExecute(Sender: TObject);
    procedure EnterActionExecute(Sender: TObject);
  private
    { Private declarations }
    procedure CreateControls;
    procedure GetVariableControls;
  public
    { Public declarations }
    Variables: TSelectVariableList;
    Values: TVariantObjectList;
  end;

implementation

{$R *.dfm}

uses
  Main;

{ TSelectParamsForm }

procedure TSelectParamsForm.ApplyActionExecute(Sender: TObject);
begin
  GetVariableControls;

  ModalResult := mrOk;
end;

procedure TSelectParamsForm.CancelActionExecute(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TSelectParamsForm.CreateControls;
var
  i: integer;
  TotalTop: integer;
  MaxLabelWigth, MaxWidth: integer;

  c: TComponent;
  Edit: TcxTextEdit;
  Memo: TcxMemo;
  DateTimeEdit: TcxDateEdit;
  TimeEdit: TcxTimeEdit;
  NumberEdit: TcxCurrencyEdit;
  CheckBox: TcxCheckBox;
  LookupComboBox: TcxLookupComboBox;
  CheckComboBox: TcxCheckComboBox;
  Lbl: TcxLabel;
  DS: TDataSource;
begin
  TotalTop := 8;
  MaxLabelWigth := 0;
  MaxWidth := 0;
  for i := 0 to Variables.Count - 1 do
  begin
    if not(Variables.Items[i].DataType = ftBoolean) then
    begin
      Lbl := TcxLabel.Create(Self);
      Lbl.Parent := Self;

      Lbl.Style.Font.Style := [fsBold];
      Lbl.Style.Font.Size := MainForm.Font.Size;

      Lbl.Left := 16;
      Lbl.Top := TotalTop;
      Lbl.Caption := Variables.Items[i].Caption;

      if Lbl.Width > MaxLabelWigth then
        MaxLabelWigth := Lbl.Width;
    end;

    case Variables.Items[i].DataType of
      ftString:
        begin
          Edit := TcxTextEdit.Create(Self);
          Edit.Parent := Self;

          Edit.Name := 'VC' + IntToStr(i);
          Variables.Items[i].ComponentName := Edit.Name;

          Edit.Top := TotalTop;
          Edit.Width := 333;

          Edit.Enabled := Variables.Items[i].Enable;
          Edit.Text := IsNull(Variables.Items[i].DefaultValue, '');

          Values.Add(Edit.EditValue);
          Values.Add(Edit.Text);

          TotalTop := TotalTop + Edit.Height + 5;

          if Edit.Width > MaxWidth then
            MaxWidth := Edit.Width;
        end;
      ftMemo:
        begin
          Memo := TcxMemo.Create(Self);
          Memo.Parent := Self;

          Memo.Name := 'VC' + IntToStr(i);
          Variables.Items[i].ComponentName := Memo.Name;

          Memo.Top := TotalTop;
          Memo.Width := 333;
          Memo.Properties.ScrollBars := ssVertical;

          Memo.Enabled := Variables.Items[i].Enable;
          Memo.Text := IsNull(Variables.Items[i].DefaultValue, '');

          Values.Add(Memo.EditValue);
          Values.Add(Memo.Text);

          TotalTop := TotalTop + Memo.Height + 5;

          if Memo.Width > MaxWidth then
            MaxWidth := Memo.Width;
        end;
      ftDate:
        begin
          DateTimeEdit := TcxDateEdit.Create(Self);
          DateTimeEdit.Parent := Self;

          DateTimeEdit.Name := 'VC' + IntToStr(i);
          Variables.Items[i].ComponentName := DateTimeEdit.Name;

          DateTimeEdit.Top := TotalTop;
          DateTimeEdit.Width := 150;
          DateTimeEdit.Properties.Kind := ckDate;

          DateTimeEdit.Enabled := Variables.Items[i].Enable;
          DateTimeEdit.EditValue := Variables.Items[i].DefaultValue;

          Values.Add(DateTimeEdit.EditValue);
          Values.Add(DateTimeEdit.Text);

          TotalTop := TotalTop + DateTimeEdit.Height + 5;

          if DateTimeEdit.Width > MaxWidth then
            MaxWidth := DateTimeEdit.Width;
        end;
      ftDateTime:
        begin
          DateTimeEdit := TcxDateEdit.Create(Self);
          DateTimeEdit.Parent := Self;

          DateTimeEdit.Name := 'VC' + IntToStr(i);
          Variables.Items[i].ComponentName := DateTimeEdit.Name;

          DateTimeEdit.Top := TotalTop;
          DateTimeEdit.Width := 150;
          DateTimeEdit.Properties.Kind := ckDateTime;

          DateTimeEdit.Enabled := Variables.Items[i].Enable;
          DateTimeEdit.EditValue := Variables.Items[i].DefaultValue;

          Values.Add(DateTimeEdit.EditValue);
          Values.Add(DateTimeEdit.Text);

          TotalTop := TotalTop + DateTimeEdit.Height + 5;

          if DateTimeEdit.Width > MaxWidth then
            MaxWidth := DateTimeEdit.Width;
        end;
      ftTime:
        begin
          TimeEdit := TcxTimeEdit.Create(Self);
          TimeEdit.Parent := Self;

          TimeEdit.Name := 'VC' + IntToStr(i);
          Variables.Items[i].ComponentName := TimeEdit.Name;

          TimeEdit.Top := TotalTop;
          TimeEdit.Width := 100;

          TimeEdit.Enabled := Variables.Items[i].Enable;
          TimeEdit.EditValue := Variables.Items[i].DefaultValue;

          Values.Add(TimeEdit.EditValue);
          Values.Add(TimeEdit.Text);

          TotalTop := TotalTop + TimeEdit.Height + 5;

          if TimeEdit.Width > MaxWidth then
            MaxWidth := TimeEdit.Width;
        end;
      ftBoolean:
        begin
          CheckBox := TcxCheckBox.Create(Self);
          CheckBox.Parent := Self;

          CheckBox.Name := 'VC' + IntToStr(i);
          Variables.Items[i].ComponentName := CheckBox.Name;

          CheckBox.Top := TotalTop;
          CheckBox.Left := 8;
          CheckBox.Style.Font.Style := [fsBold];

          CheckBox.Caption := Variables.Items[i].Caption;

          CheckBox.Enabled := Variables.Items[i].Enable;
          CheckBox.Checked := IsNull(Variables.Items[i].DefaultValue, False);

          Values.Add(CheckBox.Checked);
          Values.Add(BoolToStr(CheckBox.Checked));

          TotalTop := TotalTop + CheckBox.Height + 5;

          if CheckBox.Width > MaxWidth then
            MaxWidth := CheckBox.Width;
        end;
      ftInteger:
        begin
          NumberEdit := TcxCurrencyEdit.Create(Self);

          NumberEdit.Parent := Self;

          NumberEdit.Name := 'VC' + IntToStr(i);
          Variables.Items[i].ComponentName := NumberEdit.Name;

          NumberEdit.Top := TotalTop;
          NumberEdit.Width := 250;

          NumberEdit.Properties.DecimalPlaces := 0;
          NumberEdit.Properties.DisplayFormat := '';

          NumberEdit.Enabled := Variables.Items[i].Enable;
          NumberEdit.EditValue := Variables.Items[i].DefaultValue;

          Values.Add(NumberEdit.EditValue);
          Values.Add(NumberEdit.Text);

          TotalTop := TotalTop + NumberEdit.Height + 5;

          if NumberEdit.Width > MaxWidth then
            MaxWidth := NumberEdit.Width;
        end;
      ftCurrency:
        begin
          NumberEdit := TcxCurrencyEdit.Create(Self);

          NumberEdit.Parent := Self;

          NumberEdit.Name := 'VC' + IntToStr(i);
          Variables.Items[i].ComponentName := NumberEdit.Name;

          NumberEdit.Top := TotalTop;
          NumberEdit.Width := 250;

          NumberEdit.Properties.DecimalPlaces := 2;
          NumberEdit.Properties.DisplayFormat := ',0.00ð''.'';-,0.00ð''.''';

          NumberEdit.Enabled := Variables.Items[i].Enable;
          NumberEdit.EditValue := Variables.Items[i].DefaultValue;

          Values.Add(NumberEdit.EditValue);
          Values.Add(NumberEdit.Text);

          TotalTop := TotalTop + NumberEdit.Height + 5;

          if NumberEdit.Width > MaxWidth then
            MaxWidth := NumberEdit.Width;
        end;
      ftFloat:
        begin
          NumberEdit := TcxCurrencyEdit.Create(Self);

          NumberEdit.Parent := Self;

          NumberEdit.Name := 'VC' + IntToStr(i);
          Variables.Items[i].ComponentName := NumberEdit.Name;

          NumberEdit.Top := TotalTop;
          NumberEdit.Width := 250;

          NumberEdit.Properties.DecimalPlaces := 4;
          NumberEdit.Properties.DisplayFormat := ',0.0000''.'';-,0.0000''.''';

          NumberEdit.Enabled := Variables.Items[i].Enable;
          NumberEdit.EditValue := Variables.Items[i].DefaultValue;

          Values.Add(NumberEdit.EditValue);
          Values.Add(NumberEdit.Text);

          TotalTop := TotalTop + NumberEdit.Height + 5;

          if NumberEdit.Width > MaxWidth then
            MaxWidth := NumberEdit.Width;
        end;
      ftGuid:
        begin
          LookupComboBox := TcxLookupComboBox.Create(Self);
          LookupComboBox.Parent := Self;

          LookupComboBox.Name := 'VC' + IntToStr(i);
          Variables.Items[i].ComponentName := LookupComboBox.Name;

          LookupComboBox.Top := TotalTop;
          LookupComboBox.Width := 333;

          DS := TDataSource.Create(Self);
          DS.DataSet := Variables.Items[i].RefDataSet;

          LookupComboBox.Properties.ListSource := DS;
          LookupComboBox.Properties.KeyFieldNames := Variables.Items[i].RefKey;
          LookupComboBox.Properties.ListFieldNames := Variables.Items[i].RefList;

          LookupComboBox.Properties.DropDownListStyle := lsFixedList;
          LookupComboBox.Properties.ListOptions.ShowHeader := False;

          LookupComboBox.Enabled := Variables.Items[i].Enable;
          LookupComboBox.EditValue := Variables.Items[i].DefaultValue;

          Values.Add(LookupComboBox.EditValue);
          Values.Add(LookupComboBox.Text);

          TotalTop := TotalTop + LookupComboBox.Height + 5;

          if LookupComboBox.Width > MaxWidth then
            MaxWidth := LookupComboBox.Width;
        end;
    end;
  end;

  for i := 0 to Variables.Count - 1 do
  begin
    c := FindComponent('VC' + IntToStr(i));

    if c <> nil then
      if not(c is TcxCheckBox) then
        TWinControl(FindComponent('VC' + IntToStr(i))).Left := 8 + MaxLabelWigth + 16;
  end;

  ApplycxButton.Top := TotalTop + 16;
  CancelcxButton.Top := TotalTop + 16;

  Self.Height := ApplycxButton.Top + ApplycxButton.Height + 16 * 2;
  Self.Width := 8 + MaxLabelWigth + 16 + MaxWidth + 16 + 8;
end;

procedure TSelectParamsForm.EnterActionExecute(Sender: TObject);
var
  AC: TComponent;
begin
  AC := ControlActiveCorrect(ActiveControl);

  if (AC is TcxMemo) then
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

procedure TSelectParamsForm.FormCreate(Sender: TObject);
begin
  Values := TVariantObjectList.Create;
  Values.UniqueStore := False;
end;

procedure TSelectParamsForm.FormDestroy(Sender: TObject);
begin
  Values.Free;
end;

procedure TSelectParamsForm.FormShow(Sender: TObject);
begin
  Self.Font.Size := MainForm.Font.Size;

  CreateControls;
end;

procedure TSelectParamsForm.GetVariableControls;
var
  i, CurVar: integer;

begin
  inherited;
  CurVar := 0;
  for i := 0 to Variables.Count - 1 do
  begin
    case Variables.Items[i].DataType of
      ftString:
        begin
          Values.Items[CurVar] := TcxTextEdit(FindComponent(Variables.Items[i].ComponentName)).EditValue;
          Inc(CurVar);
          Values.Items[CurVar] := TcxTextEdit(FindComponent(Variables.Items[i].ComponentName)).Text;
        end;
      ftMemo:
        begin
          Values.Items[CurVar] := TcxMemo(FindComponent(Variables.Items[i].ComponentName)).EditValue;
          Inc(CurVar);
          Values.Items[CurVar] := TcxMemo(FindComponent(Variables.Items[i].ComponentName)).Text;
        end;
      ftDate:
        begin
          Values.Items[CurVar] := TcxDateEdit(FindComponent(Variables.Items[i].ComponentName)).EditValue;
          Inc(CurVar);
          Values.Items[CurVar] := TcxDateEdit(FindComponent(Variables.Items[i].ComponentName)).Text;
        end;
      ftDateTime:
        begin
          Values.Items[CurVar] := TcxDateEdit(FindComponent(Variables.Items[i].ComponentName)).EditValue;
          Inc(CurVar);
          Values.Items[CurVar] := TcxDateEdit(FindComponent(Variables.Items[i].ComponentName)).Text;
        end;
      ftBoolean:
        begin
          Values.Items[CurVar] := TcxCheckBox(FindComponent(Variables.Items[i].ComponentName)).Checked;
          Inc(CurVar);
          Values.Items[CurVar] := BoolToStr(TcxCheckBox(FindComponent(Variables.Items[i].ComponentName)).Checked);
        end;
      ftInteger:
        begin
          TcxCurrencyEdit(FindComponent(Variables.Items[i].ComponentName)).PostEditValue;
          Values.Items[CurVar] := TcxCurrencyEdit(FindComponent(Variables.Items[i].ComponentName)).EditValue;
          Inc(CurVar);
          Values.Items[CurVar] := TcxCurrencyEdit(FindComponent(Variables.Items[i].ComponentName)).Text;
        end;
      ftFloat:
        begin
          Values.Items[CurVar] := TcxCurrencyEdit(FindComponent(Variables.Items[i].ComponentName)).EditValue;
          Inc(CurVar);
          Values.Items[CurVar] := TcxCurrencyEdit(FindComponent(Variables.Items[i].ComponentName)).Text;
        end;
      ftCurrency:
        begin
          Values.Items[CurVar] := TcxCurrencyEdit(FindComponent(Variables.Items[i].ComponentName)).EditValue;
          Inc(CurVar);
          Values.Items[CurVar] := TcxCurrencyEdit(FindComponent(Variables.Items[i].ComponentName)).Text;
        end;
      ftGuid:
        begin
          Values.Items[CurVar] := TcxLookupComboBox(FindComponent(Variables.Items[i].ComponentName)).EditValue;
          Inc(CurVar);
          Values.Items[CurVar] := TcxLookupComboBox(FindComponent(Variables.Items[i].ComponentName)).Text;
        end;
      ftTime:
        begin
          Values.Items[CurVar] := TcxTimeEdit(FindComponent(Variables.Items[i].ComponentName)).EditValue;
          Inc(CurVar);
          Values.Items[CurVar] := TcxTimeEdit(FindComponent(Variables.Items[i].ComponentName)).Text;
        end;
    end;

    CurVar := CurVar + 1;
  end;
end;

end.
