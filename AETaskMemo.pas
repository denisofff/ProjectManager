unit AETaskMemo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AddEdit, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus,
  PropFilerEh, PropStorageEh, Data.DB, DBAccess, Uni, MemDS, System.Actions, Vcl.ActnList, Vcl.StdCtrls, cxButtons,
  cxControls, cxContainer, cxEdit, cxMemo, cxDBEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxTextEdit, cxMaskEdit, cxCalendar, cxLabel;

type
  TAETaskMemoForm = class(TAddEditForm)
    cxLabel1: TcxLabel;
    cxLabel3: TcxLabel;
    DatecxDBDateEdit: TcxDBDateEdit;
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
    Task: Variant;
  end;

implementation

{$R *.dfm}

uses
  Main, Common;

{ TAETaskMemoForm }

function TAETaskMemoForm.ErrorCheck: Boolean;
begin
  Result := (DatecxDBDateEdit.EditValue <> null) and (NotecxDBMemo.Text <> '');

  if not Result then
    MainForm.MsgError('Не все поля заполнены!');
end;

procedure TAETaskMemoForm.ParamsPrepare;
begin
  inherited;

  Task := Params;
end;

procedure TAETaskMemoForm.RefreshData;
begin
  inherited;

  if OpenMode = omInsert then
  begin
    DatecxDBDateEdit.EditValue := DateOf(Now);
    DatecxDBDateEdit.PostEditValue;
  end;
end;

procedure TAETaskMemoForm.SaveParametersPrepare;
begin
  inherited;

  TempUniQuery.ParamByName('PERSONAL').Value := MainForm.Personal;
  TempUniQuery.ParamByName('ID').Value := ID;
  TempUniQuery.ParamByName('TASK').Value := Task;
  TempUniQuery.ParamByName('DATE').Value := DatecxDBDateEdit.EditValue;
  TempUniQuery.ParamByName('NOTE').Value := NotecxDBMemo.Text;
end;

procedure TAETaskMemoForm.SaveQueryPrepare;
begin
  inherited;

  TempUniQuery.SQL.Text := 'EXEC Project.TASK_MEMO_SAVE :ID OUTPUT, :TASK, :DATE, :NOTE, :PERSONAL';
  TempUniQuery.ParamByName('ID').ParamType := ptInputOutput;
  TempUniQuery.ParamByName('NOTE').ParamType := ptInput;
end;

end.
