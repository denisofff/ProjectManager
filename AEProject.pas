unit AEProject;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, AddEdit, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus,
  PropFilerEh, PropStorageEh, Data.DB, DBAccess, Uni, MemDS, System.Actions, Vcl.ActnList, Vcl.StdCtrls, cxButtons,
  Vcl.ExtCtrls, cxControls, cxSplitter, cxContainer, cxEdit, cxLabel, cxMemo, cxDBEdit, cxTextEdit, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh;

type
  TAEProjectForm = class(TAddEditForm)
    MainPanel: TPanel;
    LeftPanel: TPanel;
    cxSplitter1: TcxSplitter;
    RightPanel: TPanel;
    cxLabel1: TcxLabel;
    NamecxDBTextEdit: TcxDBTextEdit;
    NotecxDBMemo: TcxDBMemo;
    cxLabel2: TcxLabel;
    SecurityDBGridEh: TDBGridEh;
    SecurityUniQuery: TUniQuery;
    SecurityUniDataSource: TUniDataSource;
    procedure SecurityDBGridEhCellMouseClick(Grid: TCustomGridEh; Cell: TGridCoord; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer; var Processed: Boolean);
  private
    { Private declarations }
    function PersonalList(ListType: string): Variant;
  protected
    function ErrorCheck: Boolean; override;

    procedure RefreshData; override;

    procedure SaveQueryPrepare; override;
    procedure SaveParametersPrepare; override;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  Main, Common;

{ TAEProjectForm }

function TAEProjectForm.ErrorCheck: Boolean;
begin
  Result := NamecxDBTextEdit.Text <> '';

  if not Result then
    MainForm.MsgError('Не указано название проекта');
end;

function TAEProjectForm.PersonalList(ListType: string): Variant;
var
  Key: string;
begin
  Result := Null;

  if ListType = 'READ' then
    Key := 'R_CHECKED'
  else if ListType = 'WRITE' then
    Key := 'W_CHECKED'
  else if ListType = 'MANAGER' then
    Key := 'M_CHECKED'
  else
    Exit;

  SecurityUniQuery.DisableControls;

  try
    SecurityUniQuery.Filtered := False;
    SecurityUniQuery.First;

    Result := '';

    while not SecurityUniQuery.Eof do
    begin
      if (SecurityUniQuery.FieldByName(Key).AsBoolean) then
        Result := Result + '<item id="' + SecurityUniQuery.FieldByName('ID').AsString + '" />';

      SecurityUniQuery.Next;
    end;

  finally
    SecurityUniQuery.EnableControls;
  end;

  if Result = '' then
    Result := Null
  else
    Result := '<root>' + Result + '</root>';
end;

procedure TAEProjectForm.RefreshData;
var
  I: Integer;
begin
  inherited;

  SecurityUniQuery.Close;
  SecurityUniQuery.ParamByName('ID').Value := ID;
  SecurityUniQuery.Open;

  for I := 0 to SecurityUniQuery.FieldCount - 1 do
    SecurityUniQuery.Fields[I].ReadOnly := False;

  if OpenMode = omInsert then
  begin
    if SecurityUniQuery.Locate('ID', MainForm.Personal, []) then
    begin
      SecurityUniQuery.Edit;
      SecurityUniQuery.FieldByName('M_CHECKED').AsBoolean := True;
      SecurityUniQuery.Post;
    end;
  end;
end;

procedure TAEProjectForm.SaveParametersPrepare;
begin
  inherited;

  TempUniQuery.ParamByName('PERSONAL').Value := MainForm.Personal;
  TempUniQuery.ParamByName('ID').Value := ID;
  TempUniQuery.ParamByName('NAME').Value := NamecxDBTextEdit.Text;
  TempUniQuery.ParamByName('NOTE').Value := NotecxDBMemo.Text;
  TempUniQuery.ParamByName('RLIST').Value := PersonalList('READ');
  TempUniQuery.ParamByName('WLIST').Value := PersonalList('WRITE');
  TempUniQuery.ParamByName('MLIST').Value := PersonalList('MANAGER');
end;

procedure TAEProjectForm.SaveQueryPrepare;
begin
  inherited;

  TempUniQuery.SQL.Text := 'EXEC Project.PROJECT_SAVE :PERSONAL, :ID OUTPUT, :NAME, :NOTE, :RLIST, :WLIST, :MLIST';
  TempUniQuery.ParamByName('ID').ParamType := ptInputOutput;
  TempUniQuery.ParamByName('NOTE').ParamType := ptInput;
  TempUniQuery.ParamByName('RLIST').ParamType := ptInput;
  TempUniQuery.ParamByName('WLIST').ParamType := ptInput;
  TempUniQuery.ParamByName('MLIST').ParamType := ptInput;
end;

procedure TAEProjectForm.SecurityDBGridEhCellMouseClick(Grid: TCustomGridEh; Cell: TGridCoord; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer; var Processed: Boolean);
begin
  inherited;

  if SecurityUniQuery.State = dsEdit then
    SecurityUniQuery.Post;
end;

end.
