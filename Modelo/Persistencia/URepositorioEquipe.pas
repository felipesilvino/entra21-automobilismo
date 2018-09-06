unit URepositorioEquipe;

interface

uses
    URepositorioDB
  , UEquipe
  , SqlExpr
  , URepositorioFabricante
  , URepositorioPais
  ;

type
  TRepositorioEquipe = class(TRepositorioDB<TEQUIPE>)
  private
    FRepositorioFabricante: TRepositorioFabricante;
    FRepositorioPais: TRepositorioPais;

  protected
    //Atribui os dados do banco no objeto
    procedure AtribuiDBParaEntidade(const coEQUIPE: TEQUIPE); override;
    //Atribui os dados do objeto no banco
    procedure AtribuiEntidadeParaDB(const coEQUIPE: TEQUIPE;
                                    const coSQLQuery: TSQLQuery); override;
  public
    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses
    UEntidade
  , UMensagens
  , SysUtils
  , UPais
  , UFabricante
  ;

{ TRepositorioEquipe }

constructor TRepositorioEquipe.Create;
begin
  Inherited Create(TEQUIPE, TBL_EQUIPE, FLD_ENTIDADE_ID, STR_EQUIPE);
  FRepositorioFabricante := TRepositorioFabricante.Create;
  FRepositorioPais       := TRepositorioPais.Create;
end;

destructor TRepositorioEquipe.Destroy;
begin
  FreeAndNil(FRepositorioFabricante);
  FreeAndNil(FRepositorioPais);
  inherited;
end;

procedure TRepositorioEquipe.AtribuiDBParaEntidade(const coEQUIPE: TEQUIPE);
var
  IdPais: Integer;
  IdFabricantePneu: Integer;
  IdFabricanteMotor: Integer;
begin
  inherited;

  coEQUIPE.NOME             := FSQLSelect.FieldByName(FLD_EQUIPE_NOME).AsString;

  IdPais                    := FSQLSelect.FieldByName(FLD_EQUIPE_ID_PAIS).AsInteger;
  coEQUIPE.PAIS             := TPAIS(FRepositorioPais.Retorna(IdPais));

  IdFabricantePneu          := FSQLSelect.FieldByName(FLD_EQUIPE_ID_FABRICANTE_PNEU).AsInteger;
  coEQUIPE.FABRICANTE_PNEU  := TFABRICANTE(FRepositorioFabricante.Retorna(IdFabricantePneu));

  IdFabricanteMotor         := FSQLSelect.FieldByName(FLD_EQUIPE_ID_FABRICANTE_MOTOR).AsInteger;
  coEQUIPE.FABRICANTE_MOTOR := TFABRICANTE(FRepositorioFabricante.Retorna(IdFabricanteMotor));
end;

procedure TRepositorioEquipe.AtribuiEntidadeParaDB(const coEQUIPE: TEQUIPE;
                                                   const coSQLQuery: TSQLQuery);
begin
  inherited;

  coSQLQuery.ParamByName(FLD_EQUIPE_NOME).AsString
    := coEQUIPE.NOME;

  coSQLQuery.ParamByName(FLD_EQUIPE_ID_PAIS).AsInteger
    := coEQUIPE.PAIS.ID;

  coSQLQuery.ParamByName(FLD_EQUIPE_ID_FABRICANTE_PNEU).AsInteger
    := coEQUIPE.FABRICANTE_PNEU.ID;

  coSQLQuery.ParamByName(FLD_EQUIPE_ID_FABRICANTE_MOTOR).AsInteger
    := coEQUIPE.FABRICANTE_MOTOR.ID;
end;

end.
