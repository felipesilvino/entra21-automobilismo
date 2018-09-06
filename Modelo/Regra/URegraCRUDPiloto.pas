unit URegraCRUDPiloto;

interface

uses
    URegraCRUD
  , UEntidade
  , UPiloto
  , URegraCRUDPais
  , UPais
  ;

type
  TRegraCRUDPiloto = class(TRegraCRUD)
  private
    FRegraCRUDPais: TRegraCRUDPais;

  protected
    procedure ValidaAtualizacao(const coENTIDADE: TENTIDADE); override;
    procedure ValidaInsercao(const coENTIDADE: TENTIDADE); override;

  public
    constructor Create; override;
    destructor Destroy; override;

    procedure ValidaNome(const csNome: String);
    procedure ValidaDataNascimento(const coDataNascimento: TDate);
    procedure ValidaPais(const ciIdPais: Integer);

    function RetornaPais(const ciIdPais: Integer): TPAIS;
  end;

implementation

uses
    SysUtils
  , UMensagens
  , UUtilitarios
  , URepositorioPiloto
  , URepositorioDB
  , DateUtils
  ;

{ TRegraCRUDPiloto }

constructor TRegraCRUDPiloto.Create;
begin
  inherited;
  FRepositorioDB := TRepositorioDB<TENTIDADE>(TRepositorioPiloto.Create);
  FRegraCRUDPais := TRegraCRUDPais.Create;
end;

destructor TRegraCRUDPiloto.Destroy;
begin
  FreeAndNil(FRegraCRUDPais);
  inherited;
end;

procedure TRegraCRUDPiloto.ValidaAtualizacao(const coENTIDADE: TENTIDADE);
begin
  inherited;
  ValidaNome(TPILOTO(coENTIDADE).NOME);
  ValidaDataNascimento(TPILOTO(coENTIDADE).DATA_NASCIMENTO);
  ValidaPais(TPILOTO(coENTIDADE).PAIS.ID);
end;

procedure TRegraCRUDPiloto.ValidaInsercao(const coENTIDADE: TENTIDADE);
begin
  inherited;
  ValidaNome(TPILOTO(coENTIDADE).NOME);
  ValidaDataNascimento(TPILOTO(coENTIDADE).DATA_NASCIMENTO);
  ValidaPais(TPILOTO(coENTIDADE).PAIS.ID);
end;

procedure TRegraCRUDPiloto.ValidaDataNascimento(const coDataNascimento: TDate);
begin
  if YearsBetween(Now, coDataNascimento) < 18 then
  begin
    raise EValidacaoNegocio.Create(STR_PILOTO_MENOR_DE_IDADE);
  end;
end;

procedure TRegraCRUDPiloto.ValidaNome(const csNome: String);
begin
  if Trim(csNome) = EmptyStr then
  begin
    raise EValidacaoNegocio.Create(STR_PILOTO_NOME_NAO_INFORMADO);
  end;
end;

{ M�todos delagado a TRegraCRUDPais }

function TRegraCRUDPiloto.RetornaPais(const ciIdPais: Integer): TPAIS;
begin
  Result := TPAIS(FRegraCRUDPais.Retorna(ciIdPais))
end;

procedure TRegraCRUDPiloto.ValidaPais(const ciIdPais: Integer);
begin
  FRegraCRUDPais.ValidaExistencia(ciIdPais);
end;

end.
