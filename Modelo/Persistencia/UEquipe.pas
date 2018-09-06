unit UEquipe;

interface

uses
    UEntidade
  , UPais
  , UFabricante
  ;

type
  TEQUIPE = class(TENTIDADE)
  private
    FNome            : String;
    FFABRICANTE_PNEU : TFABRICANTE;
    FFABRICANTE_MOTOR: TFABRICANTE;
    FPAIS            : TPAIS;

  public
    constructor Create; override;
    destructor Destroy; override;

    property NOME            : String      read FNome             write FNome;
    property FABRICANTE_PNEU : TFABRICANTE read FFABRICANTE_PNEU  write FFABRICANTE_PNEU;
    property FABRICANTE_MOTOR: TFABRICANTE read FFABRICANTE_MOTOR write FFABRICANTE_MOTOR;
    property PAIS            : TPAIS       read FPAIS             write FPAIS;
  end;

const
  TBL_EQUIPE                     = 'EQUIPE';
  FLD_EQUIPE_NOME                = 'NOME';
  FLD_EQUIPE_ID_FABRICANTE_PNEU  = 'ID_FABRICANTE_PNEU';
  FLD_EQUIPE_ID_FABRICANTE_MOTOR = 'ID_FABRICANTE_MOTOR';
  FLD_EQUIPE_ID_PAIS             = 'ID_PAIS';

  VW_EQUIPE      = 'VW_EQUIPE';
  VW_EQUIPE_ID   = 'Id.';
  VW_EQUIPE_NOME = 'Nome';

implementation

uses
    SysUtils
  ;

{ TEQUIPE }

constructor TEQUIPE.Create;
begin
  FPAIS             := TPAIS.Create;
  FFABRICANTE_PNEU  := TFABRICANTE.Create;
  FFABRICANTE_MOTOR := TFABRICANTE.Create
end;

destructor TEQUIPE.Destroy;
begin
  if Assigned(FPAIS) then
  begin
    FreeAndNil(FPAIS);
  end;

  if Assigned(FFABRICANTE_PNEU) then
  begin
    FreeAndNil(FFABRICANTE_PNEU);
  end;

  if Assigned(FFABRICANTE_MOTOR) then
  begin
    FreeAndNil(FFABRICANTE_MOTOR);
  end;

  inherited;
end;

end.
