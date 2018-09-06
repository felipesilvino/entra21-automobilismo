unit UFrmCadastroEquipe;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFrmCRUD, Menus, Buttons, StdCtrls, PwCtrls, ExtCtrls
  , UUtilitarios
  , UEquipe
  , URegraCRUDEquipe
  ;

type
  TFrmCadastroEquipe = class(TFrmCRUD)
    gbInformacoes: TGroupBox;
    stNomePais: TStaticText;
    btnLocalizarPais: TButton;
    edCodigoPais: TIntegerEdit;
    lbPais: TLabel;
    lbNome: TLabel;
    edNome: TEdit;
    lbFabricantePneu: TLabel;
    edCodigoFabricantePneu: TIntegerEdit;
    btnLocalizarFabricantePneu: TButton;
    stNomeFabricantePneu: TStaticText;
    lbFabricanteMotor: TLabel;
    edCodigoFabricanteMotor: TIntegerEdit;
    btnLocalizarFabricanteMotor: TButton;
    stNomeFabricanteMotor: TStaticText;
    procedure edCodigoPaisExit(Sender: TObject);
    procedure edCodigoPaisKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnLocalizarPaisClick(Sender: TObject);
    procedure btnLocalizarFabricantePneuClick(Sender: TObject);
    procedure btnLocalizarFabricanteMotorClick(Sender: TObject);
    procedure edCodigoFabricantePneuKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edCodigoFabricanteMotorKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edCodigoFabricanteMotorExit(Sender: TObject);
    procedure edCodigoFabricantePneuExit(Sender: TObject);
    procedure edNomeExit(Sender: TObject);
  private
    FEQUIPE: TEQUIPE;
    FRegraCRUDEquipe: TRegraCRUDEquipe;

    procedure LocalizaFabricante(const coCodigoFabricante: TIntegerEdit);

  protected
    procedure Inicializa; override;
    procedure PreencheEntidade; override;
    procedure PreencheFormulario; override;
    procedure PosicionaCursorPrimeiroCampo; override;
    procedure HabilitaCampos(const ceTipoOperacaoUsuario: TTipoOperacaoUsuario); override;
  end;

var
  FrmCadastroEquipe: TFrmCadastroEquipe;

implementation

uses
    UOpcaoPesquisa
  , UMensagens
  , UDialogo
  , UEntidade
  , UPais
  , UFabricante
  , UFrmPesquisa
  ;

{$R *.dfm}

{ TFrmCadastroEquipe }

procedure TFrmCadastroEquipe.btnLocalizarFabricanteMotorClick(Sender: TObject);
begin
  LocalizaFabricante(edCodigoFabricanteMotor);
end;

procedure TFrmCadastroEquipe.btnLocalizarFabricantePneuClick(Sender: TObject);
begin
  LocalizaFabricante(edCodigoFabricantePneu);
end;

procedure TFrmCadastroEquipe.btnLocalizarPaisClick(Sender: TObject);
begin
  edCodigoPais.IntegerNumber := TfrmPesquisa.MostrarPesquisa(TOpcaoPesquisa.Create
    .DefineVisao(TBL_PAIS)
    .DefineNomeCampoRetorno(FLD_ENTIDADE_ID)
    .AdicionaFiltro(FLD_PAIS_NOME)
    .DefineNomePesquisa(STR_PAIS));

  edCodigoPais.OnExit(Self);
end;

procedure TFrmCadastroEquipe.edCodigoFabricanteMotorExit(Sender: TObject);
begin
  stNomeFabricanteMotor.Caption := EmptyStr;
  FEQUIPE.FABRICANTE_MOTOR.ID   := 0;

  if edCodigoFabricanteMotor.IntegerNumber <> 0 then
  begin
    try
      FRegraCRUDEquipe.ValidaFabricanteMotor(edCodigoFabricanteMotor.IntegerNumber);
      FEQUIPE.FABRICANTE_MOTOR := FRegraCRUDEquipe.RetornaFabricante(edCodigoFabricanteMotor.IntegerNumber);

      stNomeFabricanteMotor.Caption := FEQUIPE.FABRICANTE_MOTOR.NOME;
    except
      on E: Exception do
      begin
        TDialogo.Excecao(E);
        edCodigoFabricanteMotor.SetFocus;
      end;
    end;
  end;
end;

procedure TFrmCadastroEquipe.edCodigoFabricanteMotorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F7 then
  begin
    btnLocalizarFabricanteMotor.Click;
  end;
end;

procedure TFrmCadastroEquipe.edCodigoFabricantePneuExit(Sender: TObject);
begin
  stNomeFabricantePneu.Caption := EmptyStr;
  FEQUIPE.FABRICANTE_PNEU.ID   := 0;

  if edCodigoFabricantePneu.IntegerNumber <> 0 then
  begin
    try
      FRegraCRUDEquipe.ValidaFabricantePneu(edCodigoFabricantePneu.IntegerNumber);
      FEQUIPE.FABRICANTE_PNEU := FRegraCRUDEquipe.RetornaFabricante(edCodigoFabricantePneu.IntegerNumber);

      stNomeFabricantePneu.Caption := FEQUIPE.FABRICANTE_PNEU.NOME;
    except
      on E: Exception do
      begin
        TDialogo.Excecao(E);
        edCodigoFabricantePneu.SetFocus;
      end;
    end;
  end;
end;

procedure TFrmCadastroEquipe.edCodigoFabricantePneuKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F7 then
  begin
    btnLocalizarFabricantePneu.Click;
  end;
end;

procedure TFrmCadastroEquipe.edCodigoPaisExit(Sender: TObject);
begin
  stNomePais.Caption := EmptyStr;
  FEQUIPE.PAIS.ID    := 0;

  if edCodigoPais.IntegerNumber <> 0 then
  begin
    try
      FRegraCRUDEquipe.ValidaPais(edCodigoPais.IntegerNumber);
      FEQUIPE.PAIS := FRegraCRUDEquipe.RetornaPais(edCodigoPais.IntegerNumber);

      stNomePais.Caption := FEQUIPE.PAIS.NOME;
    except
      on E: Exception do
      begin
        TDialogo.Excecao(E);
        edCodigoPais.SetFocus;
      end;
    end;
  end;
end;

procedure TFrmCadastroEquipe.edCodigoPaisKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F7 then
  begin
    btnLocalizarPais.Click;
  end;
end;

procedure TFrmCadastroEquipe.edNomeExit(Sender: TObject);
begin
  try
    FRegraCRUDEquipe.ValidaNomeDuplicidade(edNome.Text, edCodigo.IntegerNumber);
  except
    on E: Exception do
    begin
      TDialogo.Excecao(E);
      edNome.SetFocus;
    end;
  end;
end;

procedure TFrmCadastroEquipe.HabilitaCampos(const ceTipoOperacaoUsuario: TTipoOperacaoUsuario);
begin
  inherited;
  gbInformacoes.Enabled := FTipoOperacaoUsuario in [touInsercao, touAtualizacao];
end;

procedure TFrmCadastroEquipe.Inicializa;
begin
  inherited;

  DefineEntidade(@FEQUIPE, TEQUIPE);
  DefineRegraCRUD(@FRegraCRUDEquipe, TRegraCRUDEquipe);

  AdicionaOpcaoPesquisa(TOpcaoPesquisa.Create
    .DefineVisao(VW_EQUIPE)
    .DefineNomeCampoRetorno(VW_EQUIPE_ID)
    .AdicionaFiltro(VW_EQUIPE_NOME)
    .DefineNomePesquisa(STR_EQUIPE));
end;

procedure TFrmCadastroEquipe.LocalizaFabricante(const coCodigoFabricante: TIntegerEdit);
begin
  coCodigoFabricante.IntegerNumber := TfrmPesquisa.MostrarPesquisa(TOpcaoPesquisa.Create
    .DefineVisao(TBL_FABRICANTE)
    .DefineNomeCampoRetorno(FLD_ENTIDADE_ID)
    .AdicionaFiltro(FLD_FABRICANTE_NOME)
    .DefineNomePesquisa(STR_FABRICANTE));

  coCodigoFabricante.OnExit(Self);
end;

procedure TFrmCadastroEquipe.PosicionaCursorPrimeiroCampo;
begin
  inherited;
  edNome.SetFocus;
end;

procedure TFrmCadastroEquipe.PreencheEntidade;
begin
  inherited;
  FEQUIPE.NOME := edNome.Text;
end;

procedure TFrmCadastroEquipe.PreencheFormulario;
begin
  inherited;
  edNome.Text                           := FEQUIPE.NOME;
  edCodigoPais.IntegerNumber            := FEQUIPE.PAIS.ID;
  stNomePais.Caption                    := FEQUIPE.PAIS.NOME;
  edCodigoFabricantePneu.IntegerNumber  := FEQUIPE.FABRICANTE_PNEU.ID;
  stNomeFabricantePneu.Caption          := FEQUIPE.FABRICANTE_PNEU.NOME;
  edCodigoFabricanteMotor.IntegerNumber := FEQUIPE.FABRICANTE_MOTOR.ID;
  stNomeFabricanteMotor.Caption         := FEQUIPE.FABRICANTE_MOTOR.NOME;
end;

end.
