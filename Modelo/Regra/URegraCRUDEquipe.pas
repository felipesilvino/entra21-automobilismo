unit URegraCRUDEquipe;

interface

uses
    URegraCRUD
  , UEntidade
  , UEquipe
  , UFabricante
  , UPais
  , URegraCRUDPais
  , URegraCRUDFabricante
  ;

type
  TRegraCRUDEquipe = class(TRegraCRUD)
  private
    FRegraCRUDPais      : TRegraCRUDPais;
    FRegraCRUDFabricante: TRegraCRUDFabricante;

  protected
    procedure ValidaAtualizacao(const coENTIDADE: TENTIDADE); override;
    procedure ValidaInsercao(const coENTIDADE: TENTIDADE); override;

  public
    procedure ValidaNome(const csNome: String);
    procedure ValidaNomeDuplicidade(const csNome: String; const ciIdEquipe: Integer);
    procedure ValidaPais(const ciIdPais: Integer);
    procedure ValidaFabricantePneu(const ciIdFabricante: Integer);
    procedure ValidaFabricanteMotor(const ciIdFabricante: Integer);
    procedure Valida(const coEQUIPE: TEQUIPE);

    function RetornaFabricante(const ciIdFabricante: Integer): TFABRICANTE;
    function RetornaPais(const ciIdPais: Integer): TPAIS;

    constructor Create; override;
    destructor Destroy; override;
  end;

implementation

uses
    SysUtils
  , UMensagens
  , UUtilitarios
  , URepositorioEquipe
  , URepositorioDB
  , DateUtils
  ;

{ TRegraCRUDEquipe }

constructor TRegraCRUDEquipe.Create;
begin
  inherited;

  FRepositorioDB       := TRepositorioDB<TENTIDADE>(TRepositorioEquipe.Create);
  FRegraCRUDPais       := TRegraCRUDPais.Create;
  FRegraCRUDFabricante := TRegraCRUDFabricante.Create;
end;

destructor TRegraCRUDEquipe.Destroy;
begin
  FreeAndNil(FRegraCRUDPais);
  FreeAndNil(FRegraCRUDFabricante);

  inherited;
end;

function TRegraCRUDEquipe.RetornaFabricante(const ciIdFabricante: Integer): TFABRICANTE;
begin
  Result := TFABRICANTE(FRegraCRUDFabricante.Retorna(ciIdFabricante));
end;

function TRegraCRUDEquipe.RetornaPais(const ciIdPais: Integer): TPAIS;
begin
  Result := TPAIS(FRegraCRUDPais.Retorna(ciIdPais));
end;

procedure TRegraCRUDEquipe.ValidaAtualizacao(const coENTIDADE: TENTIDADE);
begin
  inherited;
  Valida(TEQUIPE(coENTIDADE));
end;

procedure TRegraCRUDEquipe.ValidaInsercao(const coENTIDADE: TENTIDADE);
begin
  inherited;
  Valida(TEQUIPE(coENTIDADE));
end;

procedure TRegraCRUDEquipe.Valida(const coEQUIPE: TEQUIPE);
begin
  ValidaNome(coEQUIPE.NOME);
  ValidaNomeDuplicidade(coEQUIPE.NOME, coEQUIPE.ID);
  ValidaPais(coEQUIPE.PAIS.ID);
  ValidaFabricantePneu(coEQUIPE.FABRICANTE_PNEU.ID);
  ValidaFabricanteMotor(coEQUIPE.FABRICANTE_MOTOR.ID);
end;

procedure TRegraCRUDEquipe.ValidaPais(const ciIdPais: Integer);
begin
  FRegraCRUDPais.ValidaExistencia(ciIdPais);
end;

procedure TRegraCRUDEquipe.ValidaFabricanteMotor(const ciIdFabricante: Integer);
begin
  FRegraCRUDFabricante.ValidaExistencia(ciIdFabricante);
end;

procedure TRegraCRUDEquipe.ValidaFabricantePneu(const ciIdFabricante: Integer);
begin
  FRegraCRUDFabricante.ValidaExistencia(ciIdFabricante);
end;

procedure TRegraCRUDEquipe.ValidaNome(const csNome: String);
begin
  if Trim(csNome) = EmptyStr then
  begin
    raise EValidacaoNegocio.Create(STR_EQUIPE_NOME_NAO_INFORMADO);
  end;
end;

procedure TRegraCRUDEquipe.ValidaNomeDuplicidade(const csNome: String;
                                                 const ciIdEquipe: Integer);
var
  loEQUIPE: TEQUIPE;
begin
  for loEQUIPE in TRepositorioEquipe(FRepositorioDB).RetornaTodos do
  begin
    if  (Trim(loEQUIPE.NOME) = Trim(csNome))
    and (loEQUIPE.ID        <> ciIdEquipe  ) then
    begin
      raise EValidacaoNegocio.Create(STR_EQUIPE_NOME_JA_EXISTE);
    end;
  end;
end;

end.
