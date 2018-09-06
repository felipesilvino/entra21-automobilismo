unit URegraCRUDPais;

interface

uses
    URegraCRUD
  , UEntidade
  , UPais
  ;

type
  TRegraCRUDPais = class(TRegraCRUD)
  protected
    procedure ValidaAtualizacao(const coENTIDADE: TENTIDADE); override;
    procedure ValidaInsercao(const coENTIDADE: TENTIDADE); override;

  public
    constructor Create; override;

    procedure ValidaNome(const csNome: String);
    procedure ValidaNomeDuplicidade(const csNome: String;
                                    const ciIdPais: Integer);
  end;

implementation

uses
    SysUtils
  , UMensagens
  , UUtilitarios
  , URepositorioPais
  , URepositorioDB
  ;

{ TRegraCRUDPais }

constructor TRegraCRUDPais.Create;
begin
  inherited;
  FRepositorioDB := TRepositorioDB<TENTIDADE>(TRepositorioPais.Create);
end;

procedure TRegraCRUDPais.ValidaAtualizacao(const coENTIDADE: TENTIDADE);
begin
  inherited;
  ValidaNome(TPAIS(coENTIDADE).NOME);
  ValidaNomeDuplicidade(TPAIS(coENTIDADE).NOME, TPAIS(coENTIDADE).ID);
end;

procedure TRegraCRUDPais.ValidaInsercao(const coENTIDADE: TENTIDADE);
begin
  inherited;
  ValidaNome(TPAIS(coENTIDADE).NOME);
  ValidaNomeDuplicidade(TPAIS(coENTIDADE).NOME, TPAIS(coENTIDADE).ID);
end;

procedure TRegraCRUDPais.ValidaNome(const csNome: String);
begin
  if Trim(csNome) = EmptyStr then
  begin
    raise EValidacaoNegocio.Create(STR_PAIS_NOME_NAO_INFORMADO);
  end;
end;

procedure TRegraCRUDPais.ValidaNomeDuplicidade(const csNome: String;
                                               const ciIdPais: Integer);
var
  loPAIS: TPAIS;
begin
  for loPAIS in TRepositorioPais(FRepositorioDB).RetornaTodos do
  begin
    if  (Trim(loPAIS.NOME) = Trim(csNome))
    and (loPAIS.ID        <> ciIdPais    ) then
    begin
      raise EValidacaoNegocio.Create(STR_PAIS_NOME_JA_EXISTE);
    end;
  end;
end;

end.
