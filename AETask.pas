unit AETask;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AddEdit, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus,
  PropFilerEh, PropStorageEh, Data.DB, DBAccess, Uni, MemDS, System.Actions, Vcl.ActnList, Vcl.StdCtrls, cxButtons,
  cxControls, cxContainer, cxEdit, cxMemo, cxDBEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxTextEdit, cxMaskEdit, cxCalendar, cxLabel;

type
  TAETaskForm = class(TAddEditForm)
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    DatecxDBDateEdit: TcxDBDateEdit;
    ExecutorcxDBLookupComboBox: TcxDBLookupComboBox;
    NamecxDBTextEdit: TcxDBTextEdit;
    NotecxDBMemo: TcxDBMemo;
  private
    { Private declarations }
  protected
    function ErrorCheck: Boolean; override;

    procedure ParamsPrepare; override;

    procedure RefreshData; override;

    procedure SaveQueryPrepare; override;
    procedure SaveParametersPrepare; override;

  public
    { Public declarations }
    Project: Variant;
  end;

implementation

{$R *.dfm}

uses
  Main, Common;

{ TAETaskForm }

function TAETaskForm.ErrorCheck: Boolean;
begin
  Result := (DatecxDBDateEdit.EditValue <> null) and (NamecxDBTextEdit.Text <> '');

  if not Result then
    MainForm.MsgError('Не все поля заполнены!');
end;

procedure TAETaskForm.ParamsPrepare;
begin
  inherited;

  Project := Params;
end;

procedure TAETaskForm.RefreshData;
begin
  MainForm.PersonalRefreshAction.Execute;

  inherited;

  if OpenMode = omInsert then
  begin
    DatecxDBDateEdit.EditValue := DateOf(Now);
    DatecxDBDateEdit.PostEditValue;
  end;
end;

procedure TAETaskForm.SaveParametersPrepare;
begin
  inherited;

  TempUniQuery.ParamByName('PERSONAL').Value := MainForm.Personal;
  TempUniQuery.ParamByName('ID').Value := ID;
  TempUniQuery.ParamByName('PROJECT').Value := Project;
  TempUniQuery.ParamByName('DATE').Value := DatecxDBDateEdit.EditValue;
  TempUniQuery.ParamByName('NAME').Value := NamecxDBTextEdit.Text;
  TempUniQuery.ParamByName('NOTE').Value := NotecxDBMemo.Text;
  TempUniQuery.ParamByName('EXECUTOR').Value := ExecutorcxDBLookupComboBox.EditValue;
end;

procedure TAETaskForm.SaveQueryPrepare;
begin
  inherited;

  TempUniQuery.SQL.Text := 'EXEC Project.TASK_SAVE :PERSONAL, :ID OUTPUT, :PROJECT, :DATE, :NAME, :NOTE, :EXECUTOR';
  TempUniQuery.ParamByName('ID').ParamType := ptInputOutput;
  TempUniQuery.ParamByName('NOTE').ParamType := ptInput;
end;

end.
