unit Uprin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls, JSON, IdMessage, IdText, IdSMTP,
  IdExplicitTLSClientServerBase,IdAttachmentFile, XMLDoc, inifiles ;

type
  TForm1 = class(TForm)
    FDMemTable1: TFDMemTable;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    FDMemTable1nome: TStringField;
    FDMemTable1identidade: TStringField;
    FDMemTable1CPF: TStringField;
    FDMemTable1telefone: TStringField;
    FDMemTable1email: TStringField;
    FDMemTable1endereco: TStringField;
    Label1: TLabel;
    edNome: TDBEdit;
    Label2: TLabel;
    edIdentidade: TDBEdit;
    Label3: TLabel;
    edCPF: TDBEdit;
    Label4: TLabel;
    edTelefone: TDBEdit;
    Label5: TLabel;
    edEmail: TDBEdit;
    Label6: TLabel;
    edIdEndereco: TDBEdit;
    FDMemTable1CEP: TStringField;
    Label7: TLabel;
    edCEP: TDBEdit;
    FDMemTable1logradouro: TStringField;
    FDMemTable1numero: TIntegerField;
    FDMemTable1complemento: TStringField;
    FDMemTable1bairro: TStringField;
    Label8: TLabel;
    edLogradouro: TDBEdit;
    Label9: TLabel;
    edNumero: TDBEdit;
    Label10: TLabel;
    edComplemento: TDBEdit;
    Label11: TLabel;
    edBairro: TDBEdit;
    DBNavigator1: TDBNavigator;
    FDMemTable1cidade: TStringField;
    Label12: TLabel;
    edCidade: TDBEdit;
    FDMemTable1estado: TStringField;
    Label13: TLabel;
    edEstado: TDBEdit;
    FDMemTable1pais: TStringField;
    Label14: TLabel;
    edPais: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure edCEPExit(Sender: TObject);
    procedure FDMemTable1AfterPost(DataSet: TDataSet);
    procedure FDMemTable1BeforePost(DataSet: TDataSet);
    procedure DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
  private
    { Private declarations }
    function buscaCEP(CEP : string) : string;
    function lerCEP(conteudo, campo : string) : String;
    function enviaEmail : Boolean;
    procedure montaXML;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

function TForm1.buscaCEP(CEP : string) : string;
  var
    vHTTP : TIdHTTP;
    vOpenSSL : TIdSSLIOHandlerSocketOpenSSL;
    lResponse : String;
begin

  vHTTP := TIdHTTP.Create(nil);
  vOpenSSL:= TIdSSLIOHandlerSocketOpenSSL.Create(nil);

  vHTTP.IOHandler := vOpenSSL;

  vOpenSSL.SSLOptions.SSLVersions := [sslvTLSv1, sslvTLSv1_1, sslvTLSv1_2];
  vOpenSSL.SSLOptions.Mode := sslmUnassigned;

  lResponse := vHTTP.GET('https://viacep.com.br/ws/'+CEP+'/json/');

  result := lResponse;
end;

function TForm1.enviaEmail: Boolean;
var
  sFrom, sFromName, sHost, sUserName, sPassword,
  sAssunto, sDestino, sAnexo : String;
  iPort                : Integer;

  ACorpo               : TStrings;

  ArquivoINI           : TIniFile;

  idMsg                : TIdMessage;
  IdText               : TIdText;
  idSMTP               : TIdSMTP;
  IdSSLIOHandlerSocket : TIdSSLIOHandlerSocketOpenSSL;
begin
  try
    try
      ArquivoINI := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'config.ini');

      sFrom      := ArquivoINI.ReadString('CONFIG', 'From', sFrom);
      sFromName  := ArquivoINI.ReadString('CONFIG', 'FromName', sFrom);
      sHost      := ArquivoINI.ReadString('CONFIG', 'Host', sHost);
      iPort      := ArquivoINI.ReadInteger('CONFIG', 'Port', iPort);
      sUserName  := ArquivoINI.ReadString('CONFIG', 'UserName', sUserName);
      sPassword  := ArquivoINI.ReadString('CONFIG', 'Password', sPassword);

      sAssunto   := ArquivoINI.ReadString('SEND', 'Subject', sAssunto);
      sDestino   := ArquivoINI.ReadString('SEND', 'To', sDestino);
      sAnexo     := ArquivoINI.ReadString('SEND', 'Attachment', sAnexo);

      IdSSLIOHandlerSocket                   := TIdSSLIOHandlerSocketOpenSSL.Create(Self);
      IdSSLIOHandlerSocket.SSLOptions.Method := sslvSSLv23;
      IdSSLIOHandlerSocket.SSLOptions.Mode  := sslmClient;

      idMsg                            := TIdMessage.Create(Self);
      idMsg.CharSet                    := 'utf-8';
      idMsg.Encoding                   := meMIME;
      idMsg.From.Name                  := sFromName;
      idMsg.From.Address               := sFrom;
      idMsg.Priority                   := mpNormal;
      idMsg.Subject                    := sAssunto;

      idMsg.Recipients.Add;
      idMsg.Recipients.EMailAddresses := sDestino;

      IdSMTP                           := TIdSMTP.Create(Self);
      IdSMTP.IOHandler                 := IdSSLIOHandlerSocket;
      IdSMTP.UseTLS                    := utUseImplicitTLS;
      IdSMTP.AuthType                  := satDefault;
      IdSMTP.Host                      := sHost;
      IdSMTP.AuthType                  := satDefault;
      IdSMTP.Port                      := iPort;
      IdSMTP.Username                  := sUserName;
      IdSMTP.Password                  := sPassword;

      IdSMTP.Connect;
      IdSMTP.Authenticate;

      if sAnexo <> EmptyStr then
        if FileExists(sAnexo) then
          TIdAttachmentFile.Create(idMsg.MessageParts, sAnexo);

      if IdSMTP.Connected then
      begin
        try
          IdSMTP.Send(idMsg);
        except on E:Exception do
          begin
            ShowMessage('Erro ao tentar enviar: ' + E.Message);
          end;
        end;
      end;

      if IdSMTP.Connected then
        IdSMTP.Disconnect;

      Result := True;
    finally

      UnLoadOpenSSLLibrary;

      FreeAndNil(idMsg);
      FreeAndNil(IdSSLIOHandlerSocket);
      FreeAndNil(idSMTP);
    end;
  except on e:Exception do
    begin
      Result := False;
    end;
  end;

end;

procedure TForm1.edCEPExit(Sender: TObject);
  var
    vCEP : String;
begin
  if length(trim(FDMemTable1.FieldByName('CEP').AsString))=8 then
  begin

    vCEP := buscaCEP(FDMemTable1.FieldByName('CEP').AsString);

    if lerCEP(vCEP, 'erro')='true' then
    begin
      raise exception.Create('- CEP não encontrado');
    end
    else
    begin
      FDMemTable1.FieldByName('logradouro').AsString := lerCEP(vCEP, 'logradouro');
      FDMemTable1.FieldByName('complemento').AsString := lerCEP(vCEP, 'complemento');
      FDMemTable1.FieldByName('bairro').AsString := lerCEP(vCEP, 'bairro');
      FDMemTable1.FieldByName('cidade').AsString := lerCEP(vCEP, 'localidade');
      FDMemTable1.FieldByName('estado').AsString := lerCEP(vCEP, 'uf');
      FDMemTable1.FieldByName('pais').AsString := 'Brasil';
    end;
  end
  else
    raise exception.Create('- O CEP deve conter 8 dígitos.');

end;

procedure TForm1.DBNavigator1Click(Sender: TObject; Button: TNavigateBtn);
begin
  if Button in [nbEdit] then
    edNome.SetFocus;
end;

procedure TForm1.montaXML ;
  var
    XMLEnvio : TXMLDocument;
    i : integer;
begin
  XMLEnvio := TXMLDocument.Create(nil);
  XMLEnvio.Active := True;

  with XMLEnvio.AddChild('cliente') do
  begin
    for i:=0 to FDMemTable1.Fields.Count-1 do
    begin
      AddChild(FDMemTable1.Fields[i].DisplayName).NodeValue := FDMemTable1.Fields[i].AsString;
    end;
  end;

  XMLEnvio.SaveToFile('cliente.xml');
end;


function TForm1.lerCEP(conteudo, campo : string) : String;
  var
    JsonObject : TJSONObject ;
begin
  result := '';
  JsonObject := TJSONObject.ParseJSONValue( conteudo ) as TJSONObject;
  if JsonObject.GetValue(campo) <> nil then
    result := JsonObject.GetValue(campo).Value;
end;


procedure TForm1.FDMemTable1AfterPost(DataSet: TDataSet);
begin
  if DataSet.State in [DsBrowse] then
  begin
    enviaEmail;
  end;
end;

procedure TForm1.FDMemTable1BeforePost(DataSet: TDataSet);
begin
  montaXML;
end;

procedure TForm1.FormCreate(Sender: TObject);
  procedure inicializaBanco;
  begin
    with FDMemTable1.FieldDefs do
    begin
      with AddFieldDef do
      begin
        Name := 'id';
        DataType := ftInteger;
      end;

      with AddFieldDef do
      begin
        Name := 'nome';
        DataType := ftString;
        Size := 50;
      end;

      with AddFieldDef do
      begin
        Name := 'identidade';
        DataType := ftString;
        Size := 30;
      end;

      with AddFieldDef do
      begin
        Name := 'CPF';
        DataType := ftString;
        Size := 11;
      end;

      with AddFieldDef do
      begin
        Name := 'telefone';
        DataType := ftString;
        Size := 50;
      end;

      with AddFieldDef do
      begin
        Name := 'email';
        DataType := ftString;
        Size := 50;
      end;

      with AddFieldDef do
      begin
        Name := 'endereco';
        DataType := ftString;
        Size := 50;
      end;

      with AddFieldDef do
      begin
        Name := 'cep';
        DataType := ftString;
        Size := 13;
      end;

      with AddFieldDef do
      begin
        Name := 'logradouro';
        DataType := ftString;
        Size := 30;
      end;

      with AddFieldDef do
      begin
        Name := 'numero';
        DataType := ftInteger;
      end;

      with AddFieldDef do
      begin
        Name := 'complemento';
        DataType := ftString;
        Size := 30;
      end;


      with AddFieldDef do
      begin
        Name := 'bairro';
        DataType := ftString;
        Size := 30;
      end;

      with AddFieldDef do
      begin
        Name := 'cidade';
        DataType := ftString;
        Size := 30;
      end;

      with AddFieldDef do
      begin
        Name := 'estado';
        DataType := ftString;
        Size := 30;
      end;

      with AddFieldDef do
      begin
        Name := 'pais';
        DataType := ftString;
        Size := 30;
      end;
    end;

    FDMemTable1.Open;
  end;

begin
  inicializaBanco;
end;

end.
