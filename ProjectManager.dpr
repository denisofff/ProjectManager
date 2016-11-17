program ProjectManager;

uses
  Vcl.Forms,
  System.IniFiles,
  System.SysUtils,
  Main in 'Main.pas' {MainForm},
  Common in 'Common.pas',
  AddEdit in 'AddEdit.pas' {AddEditForm},
  AEProject in 'AEProject.pas' {AEProjectForm},
  AETask in 'AETask.pas' {AETaskForm},
  AETaskMemo in 'AETaskMemo.pas' {AETaskMemoForm},
  AETaskWork in 'AETaskWork.pas' {AETaskWorkForm},
  DialogMessage in 'DialogMessage.pas' {DialogMessageForm},
  SelectParams in 'SelectParams.pas' {SelectParamsForm};

{$R *.res}

var
  ini: TMemIniFile;

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  ini := TMemIniFile.Create(ExtractFilePath(Application.ExeName) + 'planner.ini');

  try
    MainForm.ServerName := ini.ReadString('Login', 'Server', 'PC275-SQL\GAMMA');
    MainForm.DBName := ini.ReadString('Login', 'DB', 'Planner');
  finally
    ini.Free;
  end;

  Application.Run;

end.
