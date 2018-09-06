unit URegraCRUDFabricante;

interface

uses
    URegraCRUD
  , UEntidade
  , UFabricante
  ;

type
  TRegraCRUDFabricante = class(TRegraCRUD)
  private
    procedure ValidaNome(const csNome: String);

  protected
    procedure ValidaAtualizacao(const coENTIDADE: TENTIDADE); override;
    procedure ValidaInsercao(const coENTIDADE: TENTIDADE); override;

  public
    constructor Create; override;

  end;

implementation

uses
    SysUtils
  , UMensagens
  , UUtilitarios
  , URepositorioFabricante
  , URepositorioDB
  ;

{ TRegraCRUDFabricante }

constructor TRegraCRUDFabricante.Create;
begin
  inherited;
  FRepositorioDB := TRepositorioDB<TENTIDADE>(TRepositorioFabricante.Create);
end;

procedure TRegraCRUDFabricante.ValidaAtualizacao(const coENTIDADE: TENTIDADE);
begin
  inherited;
  ValidaNome(TFABRICANTE(coENTIDADE).NOME);
end;

procedure TRegraCRUDFabricante.ValidaInsercao(const coENTIDADE: TENTIDADE);
begin
  inherited;
  ValidaNome(TFABRICANTE(coENTIDADE).NOME);
end;

procedure TRegraCRUDFabricante.ValidaNome(const csNome: String);
begin
  if Trim(csNome) = EmptyStr then
  begin
    raise EValidacaoNegocio.Create(STR_FABRICANTE_NOME_NAO_INFORMADO);
  end;
end;

end.
