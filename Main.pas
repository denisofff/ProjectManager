unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxStatusBar,
  Vcl.ExtCtrls, cxSplitter, DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, dxBarBuiltInMenu, cxPC,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, UniProvider, SQLServerUniProvider, Data.DB, DBAccess, Uni, MemDS,
  MemTableDataEh, MemTableEh, DataDriverEh, System.Actions, Vcl.ActnList, Vcl.ImgList, PropFilerEh, PropStorageEh,
  Vcl.Menus,

  AddEdit, Common, Vcl.StdCtrls, cxButtons, cxCheckBox, cxContainer, cxEdit, cxLabel, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCheckComboBox;

type
  TMainForm = class(TForm)
    dxStatusBar1: TdxStatusBar;
    TopPanel: TPanel;
    BottomPanel: TPanel;
    MainPanel: TPanel;
    LeftPanel: TPanel;
    CenterPanel: TPanel;
    cxSplitter1: TcxSplitter;
    ProjectDBGridEh: TDBGridEh;
    TaskPanel: TPanel;
    cxSplitter2: TcxSplitter;
    TaskcxPageControl: TcxPageControl;
    TaskTopPanel: TPanel;
    WorkcxTabSheet: TcxTabSheet;
    MemocxTabSheet: TcxTabSheet;
    ConfirmcxTabSheet: TcxTabSheet;
    TaskDBGridEh: TDBGridEh;
    WorkDBGridEh: TDBGridEh;
    NoteDBGridEh: TDBGridEh;
    ConfirmDBGridEh: TDBGridEh;
    MainUniConnection: TUniConnection;
    SQLServerUniProvider1: TSQLServerUniProvider;
    StatusUniQuery: TUniQuery;
    StatusUniDataSource: TUniDataSource;
    ProjectUniQuery: TUniQuery;
    ProjectSQLDataDriverEh: TSQLDataDriverEh;
    ProjectMemTableEh: TMemTableEh;
    ProjectUniDataSource: TUniDataSource;
    MaincxImageList: TcxImageList;
    DialogcxImageList: TcxImageList;
    MainActionList: TActionList;
    ProjectRefreshAction: TAction;
    ProjectInsertAction: TAction;
    ProjectUpdateAction: TAction;
    ProjectDeleteAction: TAction;
    ProjectCloseAction: TAction;
    ProjectOpenAction: TAction;
    TaskRefreshAction: TAction;
    TaskInsertAction: TAction;
    TaskUpdateAction: TAction;
    TaskDeleteAction: TAction;
    TaskStatusAction: TAction;
    TaskExecuteAction: TAction;
    TaskDeliveryAction: TAction;
    TaskWorkRefreshAction: TAction;
    TaskWorkInsertAction: TAction;
    TaskWorkDeleteAction: TAction;
    TaskWorkUpdateAction: TAction;
    TaskNoteRefreshAction: TAction;
    TaskNoteInsertAction: TAction;
    TaskNoteUpdateAction: TAction;
    TaskNoteDeleteAction: TAction;
    TaskUniQuery: TUniQuery;
    TaskSQLDataDriverEh: TSQLDataDriverEh;
    TaskMemTableEh: TMemTableEh;
    TaskUniDataSource: TUniDataSource;
    FontUpAction: TAction;
    FontDownAction: TAction;
    MainPropStorageEh: TPropStorageEh;
    MainRegPropStorageManEh: TRegPropStorageManEh;
    ProjectTimer: TTimer;
    TaskTimer: TTimer;
    ProjectPopupMenu: TPopupMenu;
    TaskPopupMenu: TPopupMenu;
    TempUniQuery: TUniQuery;
    ProjectInsertAction1: TMenuItem;
    N1: TMenuItem;
    ProjectUpdateAction1: TMenuItem;
    N2: TMenuItem;
    ProjectDeleteAction1: TMenuItem;
    N3: TMenuItem;
    ProjectCloseAction1: TMenuItem;
    ProjectOpenAction1: TMenuItem;
    ProjectRefreshAction1: TMenuItem;
    InitTimer: TTimer;
    PersonalUniQuery: TUniQuery;
    PersonalUniDataSource: TUniDataSource;
    PersonalRefreshAction: TAction;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    TaskDetailTimer: TTimer;
    StatusRefreshAction: TAction;
    TaskNoteUniQuery: TUniQuery;
    TaskNoteSQLDataDriverEh: TSQLDataDriverEh;
    TaskNoteMemTableEh: TMemTableEh;
    TaskNoteUniDataSource: TUniDataSource;
    TaskNotePopupMenu: TPopupMenu;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    TaskWorkUniQuery: TUniQuery;
    TaskWorkSQLDataDriverEh: TSQLDataDriverEh;
    TaskWorkMemTableEh: TMemTableEh;
    TaskWorkUniDataSource: TUniDataSource;
    TaskWorkPopupMenu: TPopupMenu;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    TaskStatuscxCheckComboBox: TcxCheckComboBox;
    cxLabel1: TcxLabel;
    procedure FontUpActionExecute(Sender: TObject);
    procedure FontDownActionExecute(Sender: TObject);
    procedure ProjectTimerTimer(Sender: TObject);
    procedure ProjectUniDataSourceDataChange(Sender: TObject; Field: TField);
    procedure TaskTimerTimer(Sender: TObject);
    procedure TaskUniDataSourceDataChange(Sender: TObject; Field: TField);
    procedure ProjectRefreshActionExecute(Sender: TObject);
    procedure ProjectInsertActionExecute(Sender: TObject);
    procedure ProjectUpdateActionExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure InitTimerTimer(Sender: TObject);
    procedure TaskRefreshActionExecute(Sender: TObject);
    procedure PersonalRefreshActionExecute(Sender: TObject);
    procedure TaskInsertActionExecute(Sender: TObject);
    procedure TaskUpdateActionExecute(Sender: TObject);
    procedure TaskDetailTimerTimer(Sender: TObject);
    procedure StatusRefreshActionExecute(Sender: TObject);
    procedure TaskNoteRefreshActionExecute(Sender: TObject);
    procedure TaskWorkRefreshActionExecute(Sender: TObject);
    procedure TaskNoteInsertActionExecute(Sender: TObject);
    procedure TaskNoteUpdateActionExecute(Sender: TObject);
    procedure TaskWorkInsertActionExecute(Sender: TObject);
    procedure TaskWorkUpdateActionExecute(Sender: TObject);
    procedure ProjectDeleteActionExecute(Sender: TObject);
    procedure TaskDeleteActionExecute(Sender: TObject);
    procedure TaskNoteDeleteActionExecute(Sender: TObject);
    procedure TaskWorkDeleteActionExecute(Sender: TObject);
    procedure ProjectCloseActionExecute(Sender: TObject);
    procedure ProjectOpenActionExecute(Sender: TObject);
    procedure ProjectDBGridEhGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
    procedure TaskDeliveryActionExecute(Sender: TObject);
    procedure TaskExecuteActionExecute(Sender: TObject);
    procedure TaskStatusActionExecute(Sender: TObject);
    procedure ProjectDBGridEhDblClick(Sender: TObject);
    procedure TaskDBGridEhDblClick(Sender: TObject);
    procedure WorkDBGridEhDblClick(Sender: TObject);
    procedure NoteDBGridEhDblClick(Sender: TObject);
    procedure TaskStatuscxCheckComboBoxPropertiesChange(Sender: TObject);
    procedure TopPanelClick(Sender: TObject);
    procedure TaskDBGridEhGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
      State: TGridDrawState);
  private
    { Private declarations }
    procedure Init;
    procedure FontSizeChanged;
  public
    { Public declarations }
    Personal: Variant;
    DBName: string;
    ServerName: string;

    function Connect(Cnt: Integer = 0): Boolean;

    function MsgDialog(DialogCaption, MainCaption, AddCaption: string; MessageType: TMessageType;
      Buttons: TDialogMessageButtons; DefaultButton: TDialogMessageButton): TModalResult;
    procedure MsgError(Msg: string; Add: string = '');
    procedure MsgWarning(Msg: string; Add: string = '');
    procedure MsgInformation(Msg: string; Add: string = '');
    function MsgQuestionYes(Msg: string; Add: string = ''): TModalResult;
    function MsgQuestionNo(Msg: string; Add: string = ''): TModalResult;

    function RefInsert(AEFormClass: TAddEditFormClass; var ID: Variant; Params: Variant;
      RefreshAction: TAction): Boolean;
    function RefUpdate(AEFormClass: TAddEditFormClass; var ID: Variant; Params: Variant;
      RefreshAction: TAction): Boolean;

    function VariablesSelect(var Values: TVariantObjectList; FormCaption: string; DataTypes: array of TFieldType;
      Captions: array of string; DefValues: array of Variant; DataSets: array of TDataSet; Keys: array of string;
      Lists: array of string; Enables: array of Boolean): Boolean;
  end;

var
  MainForm: TMainForm;

implementation

uses
  AEProject, AETask, AETaskMemo, AETaskWork, DialogMessage, SelectParams,

  ActiveX, OtlParallel;

{$R *.dfm}

function TMainForm.Connect(Cnt: Integer): Boolean;
var
  I: Integer;
begin
  CoInitialize(nil);

  I := 0;

  while not MainUniConnection.Connected do
  begin
    try
      MainUniConnection.Connect;
    except
      on E: Exception do
      begin

      end;
    end;

    I := I + 1;

    if Cnt <> 0 then
      if I > Cnt then
        Exit;
  end;
end;

procedure TMainForm.FontDownActionExecute(Sender: TObject);
begin
  if Self.Font.Size <= 8 then
    Self.Font.Size := 8
  else
    Self.Font.Size := Self.Font.Size - 1;

  FontDownAction.Enabled := (Self.Font.Size > 8);
  FontUpAction.Enabled := (Self.Font.Size < 16);

  FontSizeChanged;
end;

procedure TMainForm.FontSizeChanged;
var
  I: Integer;
begin
  for I := 0 to ComponentCount - 1 do
    if Components[I] is TcxLabel then
      TcxLabel(Components[I]).Style.Font.Size := Self.Font.Size;
end;

procedure TMainForm.FontUpActionExecute(Sender: TObject);
begin
  if Self.Font.Size >= 16 then
    Self.Font.Size := 16
  else
    Self.Font.Size := Self.Font.Size + 1;

  FontDownAction.Enabled := (Self.Font.Size > 8);
  FontUpAction.Enabled := (Self.Font.Size < 16);

  FontSizeChanged;
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  Init;
end;

procedure TMainForm.Init;
begin
  // RussianLocaleSet;

  MainUniConnection.Server := ServerName;
  MainUniConnection.Database := DBName;

  FontSizeChanged;

  Async(
    procedure
    begin
      Connect;
    end).Await(
    procedure
    begin
      InitTimer.Enabled := True;
    end);
end;

procedure TMainForm.InitTimerTimer(Sender: TObject);
begin
  InitTimer.Enabled := False;

  TempUniQuery.Close;
  TempUniQuery.SQL.Text := 'EXEC dbo.PERSONAL_LOGIN';
  TempUniQuery.Open;

  Personal := TempUniQuery.FieldByName('ID').AsVariant;

  if Personal = null then
  begin
    Application.MessageBox('Пользователю не разрешено работать с программой', 'Ошибка', MB_ICONERROR);

    Application.Terminate;
    Exit;
  end;

  StatusRefreshAction.Execute;

  CheckComboBoxLoad(TaskStatuscxCheckComboBox, StatusUniQuery, 'ID', 'NAME', 'NAME', '', 'IS_DEFAULT', True);

  TaskTimer.Enabled := False;

  ProjectTimer.Enabled := True;

end;

function TMainForm.MsgDialog(DialogCaption, MainCaption, AddCaption: string; MessageType: TMessageType;
Buttons: TDialogMessageButtons; DefaultButton: TDialogMessageButton): TModalResult;
var
  DForm: TDialogMessageForm;
begin
  DForm := TDialogMessageForm.Create(Self);

  if DialogCaption = '' then
    DialogCaption := Application.Title;

  try
    DForm.DialogCaption := DialogCaption;
    DForm.MainCaption := MainCaption;
    DForm.AddCaption := AddCaption;
    DForm.MessageType := MessageType;
    DForm.Buttons := Buttons;
    DForm.DefaultButton := DefaultButton;

    Result := DForm.ShowModal;
  finally
    DForm.Free;
  end;
end;

procedure TMainForm.MsgError(Msg, Add: string);
begin
  MsgDialog('', Msg, Add, mtError, [dmbOk], dmbOk);
end;

procedure TMainForm.MsgInformation(Msg, Add: string);
begin
  MsgDialog('', Msg, Add, mtInfo, [dmbOk], dmbOk);
end;

function TMainForm.MsgQuestionNo(Msg, Add: string): TModalResult;
begin
  Result := MsgDialog('', Msg, Add, mtQuestion, [dmbYes, dmbNo], dmbNo);
end;

function TMainForm.MsgQuestionYes(Msg, Add: string): TModalResult;
begin
  Result := MsgDialog('', Msg, Add, mtQuestion, [dmbYes, dmbNo], dmbYes);
end;

procedure TMainForm.MsgWarning(Msg, Add: string);
begin
  MsgDialog('', Msg, Add, mtWarning, [dmbOk], dmbOk);
end;

procedure TMainForm.NoteDBGridEhDblClick(Sender: TObject);
begin
  TaskNoteUpdateAction.Execute;
end;

procedure TMainForm.PersonalRefreshActionExecute(Sender: TObject);
begin
  PersonalUniQuery.Close;
  PersonalUniQuery.Open;
end;

procedure TMainForm.ProjectCloseActionExecute(Sender: TObject);
begin
  if ProjectMemTableEh.IsEmpty then
    Exit;

  if ProjectMemTableEh.FieldByName('IS_CLOSED').AsBoolean then
    Exit;

  if MsgQuestionYes('Вы действительно хотите закрыть проект?') = mrYes then
  begin
    TempUniQuery.Close;
    TempUniQuery.SQL.Text := 'EXEC Project.PROJECT_STATUS :PERSONAL, :ID, :STATE';
    TempUniQuery.ParamByName('PERSONAL').Value := Personal;
    TempUniQuery.ParamByName('ID').Value := ProjectMemTableEh.FieldByName('ID').AsVariant;
    TempUniQuery.ParamByName('STATE').Value := True;
    TempUniQuery.Execute;

    ProjectRefreshAction.Execute;
  end;
end;

procedure TMainForm.ProjectDBGridEhDblClick(Sender: TObject);
begin
  ProjectUpdateAction.Execute;
end;

procedure TMainForm.ProjectDBGridEhGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont;
var Background: TColor; State: TGridDrawState);
begin
  if TDBGridEh(Sender).DataSource.DataSet.Active then
    if TDBGridEh(Sender).DataSource.DataSet.FieldByName('IS_CLOSED').AsBoolean then
      AFont.Style := AFont.Style + [fsStrikeOut]
    else
      AFont.Style := AFont.Style - [fsStrikeOut];
end;

procedure TMainForm.ProjectDeleteActionExecute(Sender: TObject);
begin
  if ProjectMemTableEh.IsEmpty then
    Exit;

  if MsgQuestionYes('Вы хотите удалить выбранный проект?') = mrYes then
  begin
    TempUniQuery.Close;
    TempUniQuery.SQL.Text := 'EXEC Project.PROJECT_DELETE :PERSONAL, :ID';
    TempUniQuery.ParamByName('ID').Value := ProjectMemTableEh.FieldByName('ID').AsVariant;
    TempUniQuery.ParamByName('PERSONAL').Value := Personal;
    TempUniQuery.Execute;

    ProjectRefreshAction.Execute;
  end;
end;

procedure TMainForm.ProjectInsertActionExecute(Sender: TObject);
var
  ID: Variant;
begin
  ID := null;

  if RefInsert(TAEProjectForm, ID, null, ProjectRefreshAction) then
    ProjectMemTableEh.Locate('ID', ID, []);
end;

procedure TMainForm.ProjectOpenActionExecute(Sender: TObject);
begin
  if ProjectMemTableEh.IsEmpty then
    Exit;

  if not ProjectMemTableEh.FieldByName('IS_CLOSED').AsBoolean then
    Exit;

  if MsgQuestionYes('Вы действительно хотите открыть проект?') = mrYes then
  begin
    TempUniQuery.Close;
    TempUniQuery.SQL.Text := 'EXEC Project.PROJECT_STATUS :PERSONAL, :ID, :STATE';
    TempUniQuery.ParamByName('PERSONAL').Value := Personal;
    TempUniQuery.ParamByName('ID').Value := ProjectMemTableEh.FieldByName('ID').AsVariant;
    TempUniQuery.ParamByName('STATE').Value := False;
    TempUniQuery.Execute;

    ProjectRefreshAction.Execute;
  end;
end;

procedure TMainForm.ProjectRefreshActionExecute(Sender: TObject);
var
  ID: Variant;
begin
  if ProjectMemTableEh.Active then
    ID := ProjectMemTableEh.FieldByName('ID').AsVariant
  else
    ID := null;

  ProjectMemTableEh.Close;
  ProjectUniQuery.Close;

  ProjectUniQuery.ParamByName('PERSONAL').Value := Personal;

  ProjectUniQuery.Open;
  ProjectMemTableEh.Open;

  if ID <> null then
    ProjectMemTableEh.Locate('ID', ID, []);
end;

procedure TMainForm.ProjectTimerTimer(Sender: TObject);
begin
  ProjectTimer.Enabled := False;

  ProjectRefreshAction.Execute;
end;

procedure TMainForm.ProjectUniDataSourceDataChange(Sender: TObject; Field: TField);
begin
  TaskTimer.Enabled := False;
  TaskTimer.Enabled := True;
end;

procedure TMainForm.ProjectUpdateActionExecute(Sender: TObject);
var
  ID: Variant;
begin
  if ProjectMemTableEh.IsEmpty then
    Exit;

  ID := ProjectMemTableEh.FieldByName('ID').AsVariant;

  if RefUpdate(TAEProjectForm, ID, null, ProjectRefreshAction) then
    ProjectMemTableEh.Locate('ID', ID, []);
end;

function TMainForm.RefInsert(AEFormClass: TAddEditFormClass; var ID: Variant; Params: Variant;
RefreshAction: TAction): Boolean;
var
  AEForm: TAddEditForm;
begin
  inherited;

  Result := False;

  AEForm := AEFormClass.Create(nil);

  try
    AEForm.OpenMode := omInsert;
    AEForm.Params := Params;

    if AEForm.ShowModal = mrOk then
    begin
      Result := True;
      ID := AEForm.ID;
      if RefreshAction <> nil then
        RefreshAction.Execute;
    end;
  finally
    AEForm.Free;
  end;
end;

function TMainForm.RefUpdate(AEFormClass: TAddEditFormClass; var ID: Variant; Params: Variant;
RefreshAction: TAction): Boolean;
var
  AEForm: TAddEditForm;
begin
  inherited;

  Result := False;

  AEForm := AEFormClass.Create(nil);

  try
    AEForm.OpenMode := omUpdate;
    AEForm.ID := ID;
    AEForm.Params := Params;

    if AEForm.ShowModal = mrOk then
    begin
      Result := True;
      if RefreshAction <> nil then
        RefreshAction.Execute;
    end;
  finally
    AEForm.Free;
  end;
end;

procedure TMainForm.StatusRefreshActionExecute(Sender: TObject);
begin
  StatusUniQuery.Close;
  StatusUniQuery.Open;
end;

procedure TMainForm.TaskDBGridEhDblClick(Sender: TObject);
begin
  TaskUpdateAction.Execute;
end;

procedure TMainForm.TaskDBGridEhGetCellParams(Sender: TObject; Column: TColumnEh; AFont: TFont; var Background: TColor;
State: TGridDrawState);
begin
  Background := TDBGridEh(Sender).DataSource.DataSet.FindField('COLOR').AsInteger;
end;

procedure TMainForm.TaskDeleteActionExecute(Sender: TObject);
begin
  if TaskMemTableEh.IsEmpty then
    Exit;

  if MsgQuestionYes('Вы хотите удалить выбранную задачу?') = mrYes then
  begin
    TempUniQuery.Close;
    TempUniQuery.SQL.Text := 'EXEC Project.TASK_DELETE :PERSONAL, :ID';
    TempUniQuery.ParamByName('ID').Value := TaskMemTableEh.FieldByName('ID').AsVariant;
    TempUniQuery.ParamByName('PERSONAL').Value := Personal;
    TempUniQuery.Execute;

    TaskRefreshAction.Execute;
  end;
end;

procedure TMainForm.TaskDeliveryActionExecute(Sender: TObject);
var
  v: TVariantObjectList;
begin
  if TaskMemTableEh.IsEmpty then
    Exit;

  PersonalRefreshAction.Execute;

  v := TVariantObjectList.Create;
  v.UniqueStore := False;

  if VariablesSelect(v, 'Кому передать задачу', [ftGuid], ['Сотрудник'], [null], [PersonalUniQuery], ['ID'], ['SHORT'],
    [True]) then
  begin
    TempUniQuery.SQL.Text := 'EXEC Project.TASK_DELIVERY :PERSONAL, :ID, :EXECUTOR';
    TempUniQuery.ParamByName('PERSONAL').Value := Personal;
    TempUniQuery.ParamByName('ID').Value := TaskMemTableEh.FieldByName('ID').AsVariant;
    TempUniQuery.ParamByName('EXECUTOR').Value := v.Items[0];
    TempUniQuery.Execute;

    TaskRefreshAction.Execute;
  end;

  v.Free;
end;

procedure TMainForm.TaskDetailTimerTimer(Sender: TObject);
begin
  TaskDetailTimer.Enabled := False;

  TaskWorkRefreshAction.Execute;
  TaskNoteRefreshAction.Execute;
end;

procedure TMainForm.TaskExecuteActionExecute(Sender: TObject);
var
  v: TVariantObjectList;
begin
  if TaskMemTableEh.IsEmpty then
    Exit;

  PersonalRefreshAction.Execute;

  v := TVariantObjectList.Create;
  v.UniqueStore := False;

  if VariablesSelect(v, 'Выполнить задачу', [ftDate, ftGuid], ['Дата', 'Сотрудник'],
    [DateOf(Now), TaskMemTableEh.FieldByName('ID_EXECUTOR').AsVariant], [nil, PersonalUniQuery], ['', 'ID'],
    ['', 'SHORT'], [True, True]) then
  begin
    TempUniQuery.SQL.Text := 'EXEC Project.TASK_EXECUTE :PERSONAL, :ID, :EXECUTOR, :DATE';
    TempUniQuery.ParamByName('PERSONAL').Value := Personal;
    TempUniQuery.ParamByName('ID').Value := TaskMemTableEh.FieldByName('ID').AsVariant;
    TempUniQuery.ParamByName('EXECUTOR').Value := v.Items[2];
    TempUniQuery.ParamByName('DATE').Value := v.Items[0];
    TempUniQuery.Execute;

    TaskRefreshAction.Execute;
  end;

  v.Free;
end;

procedure TMainForm.TaskInsertActionExecute(Sender: TObject);
var
  ID: Variant;
begin
  if ProjectMemTableEh.IsEmpty then
    Exit;

  ID := null;

  if RefInsert(TAETaskForm, ID, ProjectMemTableEh.FieldByName('ID').AsVariant, TaskRefreshAction) then
    TaskMemTableEh.Locate('ID', ID, []);
end;

procedure TMainForm.TaskNoteDeleteActionExecute(Sender: TObject);
begin
  if TaskNoteMemTableEh.IsEmpty then
    Exit;

  if MsgQuestionYes('Вы хотите удалить выбранную заметку?') = mrYes then
  begin
    TempUniQuery.Close;
    TempUniQuery.SQL.Text := 'EXEC Project.TASK_MEMO_DELETE :ID';
    TempUniQuery.ParamByName('ID').Value := TaskNoteMemTableEh.FieldByName('ID').AsVariant;
    TempUniQuery.Execute;

    TaskNoteRefreshAction.Execute;
  end;
end;

procedure TMainForm.TaskNoteInsertActionExecute(Sender: TObject);
var
  ID: Variant;
begin
  if TaskMemTableEh.IsEmpty then
    Exit;

  ID := null;

  if RefInsert(TAETaskMemoForm, ID, TaskMemTableEh.FieldByName('ID').AsVariant, TaskNoteRefreshAction) then
    TaskNoteMemTableEh.Locate('ID', ID, []);
end;

procedure TMainForm.TaskNoteRefreshActionExecute(Sender: TObject);
var
  ID: Variant;
begin
  if TaskNoteMemTableEh.Active then
    ID := TaskNoteMemTableEh.FieldByName('ID').AsVariant
  else
    ID := null;

  TaskNoteMemTableEh.Close;
  TaskNoteUniQuery.Close;

  if TaskMemTableEh.IsEmpty then
    Exit;

  TaskNoteUniQuery.ParamByName('TASK').Value := TaskMemTableEh.FieldByName('ID').AsVariant;

  TaskNoteUniQuery.Open;
  TaskNoteMemTableEh.Open;

  if ID <> null then
    TaskNoteMemTableEh.Locate('ID', ID, []);
end;

procedure TMainForm.TaskNoteUpdateActionExecute(Sender: TObject);
var
  ID: Variant;
begin
  if TaskNoteMemTableEh.IsEmpty then
    Exit;

  ID := TaskNoteMemTableEh.FieldByName('ID').AsVariant;

  if RefUpdate(TAETaskMemoForm, ID, null, TaskNoteRefreshAction) then
    TaskNoteMemTableEh.Locate('ID', ID, []);
end;

procedure TMainForm.TaskRefreshActionExecute(Sender: TObject);
var
  ID: Variant;
begin
  if TaskMemTableEh.Active then
    ID := TaskMemTableEh.FieldByName('ID').AsVariant
  else
    ID := null;

  TaskMemTableEh.Close;
  TaskUniQuery.Close;

  if not ProjectMemTableEh.Active then
    Exit;

  TaskUniQuery.ParamByName('PERSONAL').Value := Personal;
  TaskUniQuery.ParamByName('PROJECT').Value := ProjectMemTableEh.FieldByName('ID').AsVariant;
  TaskUniQuery.ParamByName('STATUS').Value := CheckComboBoxXML(TaskStatuscxCheckComboBox);

  TaskUniQuery.Open;
  TaskMemTableEh.Open;

  if ID <> null then
    TaskMemTableEh.Locate('ID', ID, []);
end;

procedure TMainForm.TaskStatusActionExecute(Sender: TObject);
var
  v: TVariantObjectList;
begin
  if TaskMemTableEh.IsEmpty then
    Exit;

  StatusRefreshAction.Execute;

  v := TVariantObjectList.Create;
  v.UniqueStore := False;

  if VariablesSelect(v, 'Изменить статус задачи', [ftGuid], ['Статус'], [null], [StatusUniQuery], ['ID'], ['NAME'],
    [True]) then
  begin
    TempUniQuery.SQL.Text := 'EXEC Project.TASK_STATUS :PERSONAL, :ID, :STATUS';
    TempUniQuery.ParamByName('PERSONAL').Value := Personal;
    TempUniQuery.ParamByName('ID').Value := TaskMemTableEh.FieldByName('ID').AsVariant;
    TempUniQuery.ParamByName('STATUS').Value := v.Items[0];
    TempUniQuery.Execute;

    TaskRefreshAction.Execute;
  end;

  v.Free;
end;

procedure TMainForm.TaskStatuscxCheckComboBoxPropertiesChange(Sender: TObject);
begin
  TaskTimer.Enabled := False;
  TaskTimer.Enabled := True;
end;

procedure TMainForm.TaskTimerTimer(Sender: TObject);
begin
  TaskTimer.Enabled := False;

  TaskRefreshAction.Execute;
end;

procedure TMainForm.TaskUniDataSourceDataChange(Sender: TObject; Field: TField);
begin
  TaskDetailTimer.Enabled := False;
  TaskDetailTimer.Enabled := True;
end;

procedure TMainForm.TaskUpdateActionExecute(Sender: TObject);
var
  ID: Variant;
begin
  if TaskMemTableEh.IsEmpty then
    Exit;

  ID := TaskMemTableEh.FieldByName('ID').AsVariant;

  if RefUpdate(TAETaskForm, ID, null, TaskRefreshAction) then
    TaskMemTableEh.Locate('ID', ID, []);
end;

procedure TMainForm.TaskWorkDeleteActionExecute(Sender: TObject);
begin
  if TaskWorkMemTableEh.IsEmpty then
    Exit;

  if MsgQuestionYes('Вы хотите удалить выбранную запись?') = mrYes then
  begin
    TempUniQuery.Close;
    TempUniQuery.SQL.Text := 'EXEC Project.TASK_WORK_DELETE :ID';
    TempUniQuery.ParamByName('ID').Value := TaskWorkMemTableEh.FieldByName('ID').AsVariant;
    TempUniQuery.Execute;

    TaskWorkRefreshAction.Execute;
  end;
end;

procedure TMainForm.TaskWorkInsertActionExecute(Sender: TObject);
var
  ID: Variant;
begin
  if TaskMemTableEh.IsEmpty then
    Exit;

  ID := null;

  if RefInsert(TAETaskWorkForm, ID, TaskMemTableEh.FieldByName('ID').AsVariant, TaskWorkRefreshAction) then
    TaskWorkMemTableEh.Locate('ID', ID, []);
end;

procedure TMainForm.TaskWorkRefreshActionExecute(Sender: TObject);
var
  ID: Variant;
begin
  if TaskWorkMemTableEh.Active then
    ID := TaskWorkMemTableEh.FieldByName('ID').AsVariant
  else
    ID := null;

  TaskWorkMemTableEh.Close;
  TaskWorkUniQuery.Close;

  if TaskMemTableEh.IsEmpty then
    Exit;

  TaskWorkUniQuery.ParamByName('TASK').Value := TaskMemTableEh.FieldByName('ID').AsVariant;

  TaskWorkUniQuery.Open;
  TaskWorkMemTableEh.Open;

  if ID <> null then
    TaskWorkMemTableEh.Locate('ID', ID, []);
end;

procedure TMainForm.TaskWorkUpdateActionExecute(Sender: TObject);
var
  ID: Variant;
begin
  if TaskWorkMemTableEh.IsEmpty then
    Exit;

  ID := TaskWorkMemTableEh.FieldByName('ID').AsVariant;

  if RefUpdate(TAETaskWorkForm, ID, null, TaskWorkRefreshAction) then
    TaskWorkMemTableEh.Locate('ID', ID, []);
end;

procedure TMainForm.TopPanelClick(Sender: TObject);
var
  v: string;
begin
  v := IntToStr(clSilver);

  InputQuery('', '', v);
end;

function TMainForm.VariablesSelect(var Values: TVariantObjectList; FormCaption: string; DataTypes: array of TFieldType;
Captions: array of string; DefValues: array of Variant; DataSets: array of TDataSet; Keys, Lists: array of string;
Enables: array of Boolean): Boolean;
var
  sv: TSelectVariableList;
  I: Integer;
  DV: Variant;
  DS: TDataSet;
  K, l, Cpt, VR: string;
  Enbl: Boolean;
  SPForm: TSelectParamsForm;
begin
  Result := False;

  // MainForm.MsgInformation(IntToStr(High(DefValues)));

  Values := TVariantObjectList.Create;
  Values.UniqueStore := False;

  sv := TSelectVariableList.Create;
  try
    for I := Low(DataTypes) to High(DataTypes) do
    begin
      if High(DefValues) = -1 then
        DV := null
      else
        DV := DefValues[I];

      if High(DataSets) = -1 then
        DS := nil
      else
        DS := DataSets[I];

      if High(Keys) = -1 then
        K := ''
      else
        K := Keys[I];

      if High(Lists) = -1 then
        l := ''
      else
        l := Lists[I];

      if High(Captions) = -1 then
        Cpt := ''
      else
        Cpt := Captions[I];

      if High(Enables) = -1 then
        Enbl := True
      else
        Enbl := Enables[I];

      sv.Add(DataTypes[I], DV, DS, K, l, Cpt, VR, Enbl);
    end;

    SPForm := TSelectParamsForm.Create(nil);

    try
      SPForm.Caption := FormCaption;
      SPForm.Variables := sv;

      if SPForm.ShowModal = mrOk then
      begin
        Result := True;
        for I := 0 to SPForm.Values.Count - 1 do
        begin
          Values.Add(SPForm.Values.Items[I]);
        end;
      end;
    finally
      SPForm.Free;
    end;
  finally
    sv.Free;
  end;
end;

procedure TMainForm.WorkDBGridEhDblClick(Sender: TObject);
begin
  TaskWorkUpdateAction.Execute;
end;

end.
