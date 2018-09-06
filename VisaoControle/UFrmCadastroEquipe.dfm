inherited FrmCadastroEquipe: TFrmCadastroEquipe
  Caption = 'Cadastro de Equipe'
  ClientHeight = 356
  ClientWidth = 619
  ExplicitWidth = 635
  ExplicitHeight = 394
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlCabecalho: TPanel
    Width = 619
    ExplicitWidth = 116
  end
  inherited gbLocalizar: TGroupBox
    Width = 619
    ExplicitWidth = 116
    inherited edCodigo: TIntegerEdit
      Color = clWindow
    end
  end
  inherited pnlBotoes: TPanel
    Top = 315
    Width = 619
    ExplicitTop = -41
    ExplicitWidth = 116
    inherited btnLimpar: TBitBtn
      Left = 384
      ExplicitLeft = -119
    end
    inherited btnExcluir: TBitBtn
      Left = 267
      ExplicitLeft = -236
    end
    inherited btnGravar: TBitBtn
      Left = 150
      ExplicitLeft = -353
    end
    inherited btnSair: TBitBtn
      Left = 501
      ExplicitLeft = -2
    end
  end
  object gbInformacoes: TGroupBox [3]
    Left = 0
    Top = 86
    Width = 619
    Height = 229
    Align = alClient
    Caption = ' Informa'#231#245'es '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    ExplicitWidth = 116
    ExplicitHeight = 252
    object lbPais: TLabel
      Left = 122
      Top = 49
      Width = 19
      Height = 13
      Alignment = taRightJustify
      Caption = 'Pa'#237's'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbNome: TLabel
      Left = 114
      Top = 24
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nome'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbFabricantePneu: TLabel
      Left = 48
      Top = 74
      Width = 93
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fabricante de Pneu'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lbFabricanteMotor: TLabel
      Left = 44
      Top = 98
      Width = 97
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fabricante do Motor'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object stNomePais: TStaticText
      Left = 301
      Top = 46
      Width = 214
      Height = 19
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'stNomePais'
      Color = clHotLight
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 3
      Transparent = False
    end
    object btnLocalizarPais: TButton
      Left = 266
      Top = 46
      Width = 30
      Height = 19
      Cursor = crHandPoint
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      TabStop = False
      OnClick = btnLocalizarPaisClick
    end
    object edCodigoPais: TIntegerEdit
      Left = 146
      Top = 46
      Width = 117
      Height = 19
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnExit = edCodigoPaisExit
      OnKeyDown = edCodigoPaisKeyDown
      IntegerNumber = 0
    end
    object edNome: TEdit
      Left = 146
      Top = 21
      Width = 369
      Height = 19
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 60
      ParentFont = False
      TabOrder = 0
      OnExit = edNomeExit
    end
    object edCodigoFabricantePneu: TIntegerEdit
      Left = 146
      Top = 71
      Width = 117
      Height = 19
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnExit = edCodigoFabricantePneuExit
      OnKeyDown = edCodigoFabricantePneuKeyDown
      IntegerNumber = 0
    end
    object btnLocalizarFabricantePneu: TButton
      Left = 266
      Top = 71
      Width = 30
      Height = 19
      Cursor = crHandPoint
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      TabStop = False
      OnClick = btnLocalizarFabricantePneuClick
    end
    object stNomeFabricantePneu: TStaticText
      Left = 301
      Top = 71
      Width = 214
      Height = 19
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'stNomeFabricantePneu'
      Color = clHotLight
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 6
      Transparent = False
    end
    object edCodigoFabricanteMotor: TIntegerEdit
      Left = 146
      Top = 96
      Width = 117
      Height = 19
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 7
      OnExit = edCodigoFabricanteMotorExit
      OnKeyDown = edCodigoFabricanteMotorKeyDown
      IntegerNumber = 0
    end
    object btnLocalizarFabricanteMotor: TButton
      Left = 266
      Top = 96
      Width = 30
      Height = 19
      Cursor = crHandPoint
      Caption = '...'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      TabStop = False
      OnClick = btnLocalizarFabricanteMotorClick
    end
    object stNomeFabricanteMotor: TStaticText
      Left = 301
      Top = 96
      Width = 214
      Height = 19
      AutoSize = False
      BorderStyle = sbsSingle
      Caption = 'stNomeFabricanteMotor'
      Color = clHotLight
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 9
      Transparent = False
    end
  end
end
