unit Common;

interface

uses
  Classes, Variants, DB, Uni, cxCheckComboBox;

type
  // типы кнопок для диалоговых окон
  TDialogMessageButton = (dmbYes, dmbNo, dmbOk, dmbCancel);
  TDialogMessageButtons = set of TDialogMessageButton;

  // тип сообщения
  TMessageType = (mtError, mtWarning, mtInfo, mtQuestion, mtNone);

  // режим открытия формы добавления-редактирования
  TOpenMode = (omInsert, omInsertTemplate, omUpdate, omReadOnly, omNone);

  TSelectVariable = class(TObject)
  private
    FDataType: TFieldType;
    FDefaultValue: Variant;
    FRefDataSet: TDataSet;
    FCaption: string;
    FComponentName: string;
    FEnable: Boolean;
    FRefKey: string;
    FRefList: string;
    FVariableName: string;
  public
    constructor Create(DatType: TFieldType; DefValue: Variant; DataSet: TDataSet; K, Lst, Cpt, VarName: string;
      Enble: Boolean);

    property DataType: TFieldType read FDataType write FDataType;
    property DefaultValue: Variant read FDefaultValue write FDefaultValue;
    property RefDataSet: TDataSet read FRefDataSet write FRefDataSet;
    property Caption: string read FCaption write FCaption;
    property ComponentName: string read FComponentName write FComponentName;
    property Enable: Boolean read FEnable write FEnable;
    property RefKey: string read FRefKey write FRefKey;
    property RefList: string read FRefList write FRefList;
    property VariableName: string read FVariableName write FVariableName;
  end;

  TSelectVariableList = class(TObject)
  private
    FList: TList;
    function GetItem(I: Integer): TSelectVariable;
    function GetCount: Integer;
  public
    constructor Create;
    destructor Destroy; override;

    procedure Add(DataType: TFieldType; DefValue: Variant; RefDataSet: TDataSet; Key, List, Caption, VarName: string;
      Enable: Boolean);

    property Items[Index: Integer]: TSelectVariable read GetItem;
    property Count: Integer read GetCount;
  end;

  TVariantObject = class(TObject)
    ID: Variant;
  end;

  TVariantObjectList = class(TObject)
  private
    FList: TList;
    FStringList: TStringList;

    FUniqueStore: Boolean;

    procedure InnerAdd(Value: Variant);

    function GetItem(I: Integer): Variant;
    procedure SetItem(I: Integer; Value: Variant);
    function GetCount: Integer;

    function GetUniqueStore: Boolean;
    procedure SetUniqueStore(Value: Boolean);
  public
    constructor Create;
    destructor Destroy; override;

    procedure Add(Value: Variant; IgnoreDup: Boolean = False);
    procedure Delete(Value: Variant);

    procedure Clear;

    function Exists(Value: Variant): Boolean;

    procedure LoadFromQuery(Query: TUniQuery);
    procedure LoadFromXML(XML: string);
    function XMLList: Variant;

    property Count: Integer read GetCount;
    property Items[Index: Integer]: Variant read GetItem write SetItem;
    property UniqueStore: Boolean read GetUniqueStore write SetUniqueStore;
  end;

const
  DT_SHORT = 'dd.mm.yyyy';
  DT_CANONICAL = 'yyyy-mm-dd hh:nn:ss.zzz';
  DT_FULL = 'dd.mm.yyyy hh:nn:ss';
  DT_FILE_DATETIME = 'yyyy_mm_dd_hh_nn_ss_zzz';
  DT_FILE_DATE = 'yyyy_mm_dd';
  DT_FILE_TIME = 'hh_nn_ss';
  DT_FILE_LOG_DATETIME = 'yyyy_mm_dd_hh_nn_ss';

procedure CheckComboBoxLoad(CB: TcxCheckComboBox; DS: TDataSet; Key, List, Shrt, Enbl, Chck: string;
  CheckValue: Variant); overload;
function CheckComboBoxXML(CB: TcxCheckComboBox): Variant;

function ControlActiveCorrect(Cmp: TComponent): TComponent;

function DateOf(Value: Variant): Variant;

function IsNull(VarValue: Variant; s: string): string; overload;
function IsNull(VarValue: Variant; I: Integer): Integer; overload;
function IsNull(VarValue: Variant; b: Boolean): Boolean; overload;

implementation

uses
  cxTextEdit, cxMemo, cxLookAndFeelPainters, System.DateUtils, XML.XMLDoc, XML.XMLIntf;

procedure CheckComboBoxLoad(CB: TcxCheckComboBox; DS: TDataSet; Key, List, Shrt, Enbl, Chck: string;
  CheckValue: Variant);
var
  C: TcxCheckComboBoxItem;
  t: TVariantObject;
begin
  CB.Properties.Items.Clear;

  try
    DS.DisableControls;

    DS.First;

    while not DS.Eof do
    begin
      if (Key <> '') and DS.FieldByName(Key).IsNull then
      begin
        DS.Next;
        Continue;
      end;

      C := CB.Properties.Items.Add;

      C.Description := DS.FieldByName(List).AsString;
      C.ShortDescription := DS.FieldByName(Shrt).AsString;
      if Enbl <> '' then
        C.Enabled := (DS.FieldByName(Enbl).AsInteger = 0)
      else
        C.Enabled := True;

      if Key <> '' then
      begin
        t := TVariantObject.Create;
        t.ID := DS.FieldByName(Key).AsVariant;

        C.Tag := Integer(t);
      end;

      if (Chck <> '') and (CheckValue <> null) then
      begin
        if DS.FieldByName(Chck).AsVariant = CheckValue then
          CB.SetItemState(CB.Properties.Items.Count - 1, cbsChecked);
      end;

      DS.Next;
    end;
  finally
    DS.EnableControls;
  end;
end;

function CheckComboBoxXML(CB: TcxCheckComboBox): Variant;
var
  I: Integer;
begin
  Result := '';
  for I := 0 to CB.Properties.Items.Count - 1 do
    if CB.GetItemState(I) = cbsChecked then
      Result := Result + '<item id="' + VarToStr(TVariantObject(CB.Properties.Items[I].Tag).ID) + '" />';

  if Result = '' then
    Result := null
  else
    Result := '<root>' + Result + '</root>';
end;

function ControlActiveCorrect(Cmp: TComponent): TComponent;
begin
  if Cmp is TcxCustomInnerTextEdit then
    Result := TcxCustomInnerTextEdit(Cmp).Parent
  else if Cmp is TcxCustomInnerMemo then
    Result := TcxCustomInnerMemo(Cmp).Parent
  else
    Result := Cmp;
end;

function DateOf(Value: Variant): Variant;
begin
  if Value = null then
    Result := null
  else
    Result := System.DateUtils.DateOf(Value);
end;

function IsNull(VarValue: Variant; s: string): string; overload;
begin
  if VarValue = null then
    Result := s
  else
    Result := VarValue;
end;

function IsNull(VarValue: Variant; I: Integer): Integer; overload;
begin
  if VarValue = null then
    Result := I
  else
    Result := VarValue;
end;

function IsNull(VarValue: Variant; b: Boolean): Boolean; overload;
begin
  if VarValue = null then
    Result := b
  else
    Result := VarValue;
end;

{ TSelectVariable }

constructor TSelectVariable.Create(DatType: TFieldType; DefValue: Variant; DataSet: TDataSet;
  K, Lst, Cpt, VarName: string; Enble: Boolean);
begin
  inherited Create;

  DataType := DatType;
  DefaultValue := DefValue;
  RefDataSet := DataSet;
  RefKey := K;
  RefList := Lst;
  Caption := Cpt;
  Enable := Enble;
end;

{ TSelectVariableList }

procedure TSelectVariableList.Add(DataType: TFieldType; DefValue: Variant; RefDataSet: TDataSet;
  Key, List, Caption, VarName: string; Enable: Boolean);
var
  t: TSelectVariable;
begin
  t := TSelectVariable.Create(DataType, DefValue, RefDataSet, Key, List, Caption, VarName, Enable);
  FList.Add(t);
end;

constructor TSelectVariableList.Create;
begin
  FList := TList.Create;
end;

destructor TSelectVariableList.Destroy;
var
  I: Integer;
begin
  for I := 0 to FList.Count - 1 do
    TSelectVariable(FList.Items[I]).Free;

  FList.Free;

  inherited;
end;

function TSelectVariableList.GetCount: Integer;
begin
  Result := FList.Count;
end;

function TSelectVariableList.GetItem(I: Integer): TSelectVariable;
begin
  Result := TSelectVariable(FList.Items[I]);
end;

{ TVariantObjectList }

procedure TVariantObjectList.Add(Value: Variant; IgnoreDup: Boolean);
begin
  if (IgnoreDup) and Exists(Value) then
    Exit;

  InnerAdd(Value);
end;

procedure TVariantObjectList.Clear;
var
  I: Integer;
begin
  if FUniqueStore then
  begin
    for I := 0 to FStringList.Count - 1 do
      TVariantObject(FStringList.Objects[I]).Free;
    FStringList.Clear;
  end
  else
  begin
    for I := FList.Count - 1 downto 0 do
    begin
      TVariantObject(FList.Items[I]).Free;
      FList.Delete(I);
    end;
  end;
end;

constructor TVariantObjectList.Create;
begin
  FList := TList.Create;
  FStringList := TStringList.Create;
  FUniqueStore := False;
  FStringList.Sorted := True;
end;

procedure TVariantObjectList.Delete(Value: Variant);
var
  I: Integer;
begin
  if FUniqueStore then
  begin
    TVariantObject(FStringList.Objects[FStringList.IndexOf(VarToStr(Value))]).Free;
    FStringList.Delete(FStringList.IndexOf(VarToStr(Value)));
  end
  else
  begin
    for I := 0 to FList.Count - 1 do
      if TVariantObject(FList.Items[I]).ID = Value then
      begin
        TVariantObject(FList.Items[I]).Free;
        FList.Delete(I);
        Break;
      end;
  end;
end;

destructor TVariantObjectList.Destroy;
var
  I: Integer;
begin
  for I := 0 to FList.Count - 1 do
    TVariantObject(FList.Items[I]).Free;

  for I := 0 to FStringList.Count - 1 do
    TVariantObject(FStringList.Objects[I]).Free;

  FList.Free;
  FStringList.Free;

  inherited;
end;

function TVariantObjectList.Exists(Value: Variant): Boolean;
var
  I: Integer;
begin
  Result := False;

  if FUniqueStore then
  begin
    Result := FStringList.IndexOf(VarToStr(Value)) <> -1;
  end
  else
  begin
    for I := 0 to FList.Count - 1 do
      if TVariantObject(FList.Items[I]).ID = Value then
      begin
        Result := True;
        Break;
      end;
  end;
end;

function TVariantObjectList.GetCount: Integer;
begin
  if FUniqueStore then
    Result := FStringList.Count
  else
    Result := FList.Count;
end;

function TVariantObjectList.GetItem(I: Integer): Variant;
begin
  if FUniqueStore then
    Result := TVariantObject(FStringList.Objects[I]).ID
  else
    Result := TVariantObject(FList.Items[I]).ID;
end;

function TVariantObjectList.GetUniqueStore: Boolean;
begin
  Result := FUniqueStore;
end;

procedure TVariantObjectList.InnerAdd(Value: Variant);
var
  t: TVariantObject;
begin
  t := TVariantObject.Create;
  t.ID := Value;

  if FUniqueStore then
    FStringList.AddObject(VarToStr(Value), t)
  else
    FList.Add(t);
end;

procedure TVariantObjectList.LoadFromQuery(Query: TUniQuery);
var
  ID: Variant;
begin
  if Query.IsEmpty then
    Exit;

  ID := Query.FieldByName('ID').AsVariant;

  Clear;

  Query.DisableControls;

  try
    Query.First;

    while not Query.Eof do
    begin
      InnerAdd(Query.FieldByName('ID').AsVariant);

      Query.Next;
    end;
  finally
    Query.Locate('ID', ID, []);
    Query.EnableControls;
  end;
end;

procedure TVariantObjectList.LoadFromXML(XML: string);
var
  D: IXMLDocument;
  Root, Node: IXMLNode;
  I: Integer;
  ID: string;
begin
  if XML = '' then
    Exit;

  D := LoadXMLData(XML);
  D.Active := True;

  Root := D.DocumentElement;

  for I := 0 to Root.ChildNodes.Count - 1 do
  begin
    Node := Root.ChildNodes[I];

    if Node.NodeName = 'item' then
    begin
      ID := Node.Attributes['id'];

      Add(ID);
    end;
  end;
end;

procedure TVariantObjectList.SetItem(I: Integer; Value: Variant);
begin
  if FUniqueStore then
    TVariantObject(FStringList.Objects[I]).ID := Value
  else
    TVariantObject(FList.Items[I]).ID := Value;
end;

procedure TVariantObjectList.SetUniqueStore(Value: Boolean);
begin
  FUniqueStore := Value;
end;

function TVariantObjectList.XMLList: Variant;
var
  I: Integer;
begin
  if FUniqueStore then
  begin
    if FStringList.Count = 0 then
      Result := null
    else
    begin
      Result := '<root>';

      for I := 0 to FStringList.Count - 1 do
        Result := Result + '<item id="' + VarToStr(TVariantObject(FStringList.Objects[I]).ID) + '" />';

      Result := Result + '</root>';
    end;
  end
  else
  begin
    if FList.Count = 0 then
      Result := null
    else
    begin
      Result := '<root>';

      for I := 0 to FList.Count - 1 do
        Result := Result + '<item id="' + VarToStr(TVariantObject(FList.Items[I]).ID) + '" />';

      Result := Result + '</root>';
    end;
  end;
end;

end.
