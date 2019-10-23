object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Cadastro Altec'
  ClientHeight = 516
  ClientWidth = 620
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 40
    Width = 26
    Height = 13
    Caption = 'nome'
    FocusControl = edNome
  end
  object Label2: TLabel
    Left = 24
    Top = 80
    Width = 50
    Height = 13
    Caption = 'identidade'
    FocusControl = edIdentidade
  end
  object Label3: TLabel
    Left = 222
    Top = 80
    Width = 19
    Height = 13
    Caption = 'CPF'
    FocusControl = edCPF
  end
  object Label4: TLabel
    Left = 425
    Top = 79
    Width = 40
    Height = 13
    Caption = 'telefone'
    FocusControl = edTelefone
  end
  object Label5: TLabel
    Left = 24
    Top = 121
    Width = 24
    Height = 13
    Caption = 'email'
    FocusControl = edEmail
  end
  object Label6: TLabel
    Left = 24
    Top = 170
    Width = 123
    Height = 13
    Caption = 'identifica'#231#227'o do endereco'
    FocusControl = edIdEndereco
  end
  object Label7: TLabel
    Left = 488
    Top = 170
    Width = 19
    Height = 13
    Caption = 'CEP'
    FocusControl = edCEP
  end
  object Label8: TLabel
    Left = 24
    Top = 216
    Width = 52
    Height = 13
    Caption = 'logradouro'
    FocusControl = edLogradouro
  end
  object Label9: TLabel
    Left = 488
    Top = 213
    Width = 36
    Height = 13
    Caption = 'numero'
    FocusControl = edNumero
  end
  object Label10: TLabel
    Left = 24
    Top = 257
    Width = 63
    Height = 13
    Caption = 'complemento'
    FocusControl = edComplemento
  end
  object Label11: TLabel
    Left = 384
    Top = 259
    Width = 28
    Height = 13
    Caption = 'bairro'
    FocusControl = edBairro
  end
  object Label12: TLabel
    Left = 24
    Top = 304
    Width = 31
    Height = 13
    Caption = 'cidade'
    FocusControl = edCidade
  end
  object Label13: TLabel
    Left = 384
    Top = 304
    Width = 33
    Height = 13
    Caption = 'estado'
    FocusControl = edEstado
  end
  object Label14: TLabel
    Left = 23
    Top = 344
    Width = 19
    Height = 13
    Caption = 'pais'
    FocusControl = edPais
  end
  object DBGrid1: TDBGrid
    AlignWithMargins = True
    Left = 3
    Top = 393
    Width = 614
    Height = 120
    Align = alBottom
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 15
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'nome'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'identidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CPF'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'telefone'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'email'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'endereco'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CEP'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'logradouro'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'numero'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'complemento'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'bairro'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'estado'
        Visible = True
      end>
  end
  object edNome: TDBEdit
    Left = 24
    Top = 56
    Width = 570
    Height = 21
    DataField = 'nome'
    DataSource = DataSource1
    TabOrder = 0
  end
  object edIdentidade: TDBEdit
    Left = 24
    Top = 96
    Width = 170
    Height = 21
    DataField = 'identidade'
    DataSource = DataSource1
    TabOrder = 1
  end
  object edCPF: TDBEdit
    Left = 222
    Top = 96
    Width = 170
    Height = 21
    DataField = 'CPF'
    DataSource = DataSource1
    TabOrder = 2
  end
  object edTelefone: TDBEdit
    Left = 425
    Top = 96
    Width = 170
    Height = 21
    DataField = 'telefone'
    DataSource = DataSource1
    TabOrder = 3
  end
  object edEmail: TDBEdit
    Left = 24
    Top = 137
    Width = 570
    Height = 21
    DataField = 'email'
    DataSource = DataSource1
    TabOrder = 4
  end
  object edIdEndereco: TDBEdit
    Left = 24
    Top = 184
    Width = 442
    Height = 21
    DataField = 'endereco'
    DataSource = DataSource1
    TabOrder = 5
  end
  object edCEP: TDBEdit
    Left = 487
    Top = 184
    Width = 108
    Height = 21
    DataField = 'CEP'
    DataSource = DataSource1
    TabOrder = 6
    OnExit = edCEPExit
  end
  object edLogradouro: TDBEdit
    Left = 24
    Top = 232
    Width = 442
    Height = 21
    DataField = 'logradouro'
    DataSource = DataSource1
    TabOrder = 7
  end
  object edNumero: TDBEdit
    Left = 488
    Top = 232
    Width = 106
    Height = 21
    DataField = 'numero'
    DataSource = DataSource1
    TabOrder = 8
  end
  object edComplemento: TDBEdit
    Left = 24
    Top = 273
    Width = 337
    Height = 21
    DataField = 'complemento'
    DataSource = DataSource1
    TabOrder = 9
  end
  object edBairro: TDBEdit
    Left = 384
    Top = 273
    Width = 210
    Height = 21
    DataField = 'bairro'
    DataSource = DataSource1
    TabOrder = 10
  end
  object DBNavigator1: TDBNavigator
    Left = 0
    Top = 0
    Width = 620
    Height = 34
    DataSource = DataSource1
    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel]
    Align = alTop
    TabOrder = 11
    OnClick = DBNavigator1Click
  end
  object edCidade: TDBEdit
    Left = 24
    Top = 320
    Width = 337
    Height = 21
    DataField = 'cidade'
    DataSource = DataSource1
    TabOrder = 12
  end
  object edEstado: TDBEdit
    Left = 384
    Top = 320
    Width = 210
    Height = 21
    DataField = 'estado'
    DataSource = DataSource1
    TabOrder = 13
  end
  object edPais: TDBEdit
    Left = 23
    Top = 360
    Width = 338
    Height = 21
    DataField = 'pais'
    DataSource = DataSource1
    TabOrder = 14
  end
  object FDMemTable1: TFDMemTable
    BeforePost = FDMemTable1BeforePost
    AfterPost = FDMemTable1AfterPost
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 504
    Top = 456
    object FDMemTable1nome: TStringField
      FieldName = 'nome'
      Size = 50
    end
    object FDMemTable1identidade: TStringField
      DisplayWidth = 11
      FieldName = 'identidade'
      Size = 30
    end
    object FDMemTable1CPF: TStringField
      FieldName = 'CPF'
      EditMask = '000.000.000-00;0;_'
      Size = 11
    end
    object FDMemTable1telefone: TStringField
      FieldName = 'telefone'
      Size = 11
    end
    object FDMemTable1email: TStringField
      FieldName = 'email'
      Size = 30
    end
    object FDMemTable1endereco: TStringField
      FieldName = 'endereco'
      Size = 30
    end
    object FDMemTable1CEP: TStringField
      FieldName = 'CEP'
      EditMask = '00000-000;0;_'
      Size = 8
    end
    object FDMemTable1logradouro: TStringField
      FieldName = 'logradouro'
      Size = 30
    end
    object FDMemTable1numero: TIntegerField
      FieldName = 'numero'
    end
    object FDMemTable1complemento: TStringField
      FieldName = 'complemento'
      Size = 30
    end
    object FDMemTable1bairro: TStringField
      FieldName = 'bairro'
      Size = 30
    end
    object FDMemTable1cidade: TStringField
      FieldName = 'cidade'
      Size = 30
    end
    object FDMemTable1estado: TStringField
      FieldName = 'estado'
      Size = 30
    end
    object FDMemTable1pais: TStringField
      FieldName = 'pais'
      Size = 30
    end
  end
  object DataSource1: TDataSource
    AutoEdit = False
    DataSet = FDMemTable1
    Left = 592
    Top = 448
  end
end
