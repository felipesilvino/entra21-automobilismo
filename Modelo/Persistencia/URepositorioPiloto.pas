unit URepositorioPiloto;

interface

uses
    URepositorioDB
  , UPiloto
  , SqlExpr
  , URepositorioPais
  ;

type
  TRepositorioPiloto = class(TRepositorioDB<TPILOTO>)
  private
    FRepositorioPais: TRepositorioPais;

  protected
    //Atribui os dados do banco no objeto
    procedure AtribuiDBParaEntidade(const coPILOTO: TPILOTO); override;
    //Atribui os dados do objeto no banco
    procedure AtribuiEntidadeParaDB(const coPILOTO: TPILOTO;
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
  ;

{ TRepositorioPiloto }

constructor TRepositorioPiloto.Create;
begin
  Inherited Create(TPILOTO, TBL_PILOTO, FLD_ENTIDADE_ID, STR_PILOTO);
  FRepositorioPais := TRepositorioPais.Create;
end;

destructor TRepositorioPiloto.Destroy;
begin
  FreeAndNil(FRepositorioPais);
  inherited;
end;

procedure TRepositorioPiloto.AtribuiDBParaEntidade(const coPILOTO: TPILOTO);
var
  IdPais: Integer;
begin
  inherited;

  coPILOTO.NOME            := FSQLSelect.FieldByName(FLD_PILOTO_NOME).AsString;
  coPILOTO.DATA_NASCIMENTO := FSQLSelect.FieldByName(FLD_PILOTO_DATA_NASCIMENTO).AsDateTime;

  IdPais        := FSQLSelect.FieldByName(FLD_PILOTO_ID_PAIS).AsInteger;
  coPILOTO.PAIS := TPAIS(FRepositorioPais.Retorna(IdPais));
end;

procedure TRepositorioPiloto.AtribuiEntidadeParaDB(const coPILOTO: TPILOTO;
  const coSQLQuery: TSQLQuery);
begin
  inherited;
  coSQLQuery.ParamByName(FLD_PILOTO_NOME).AsString          := coPILOTO.NOME;
  coSQLQuery.ParamByName(FLD_PILOTO_DATA_NASCIMENTO).AsDate := coPILOTO.DATA_NASCIMENTO;
  coSQLQuery.ParamByName(FLD_PILOTO_ID_PAIS).AsInteger      := coPILOTO.PAIS.ID;
end;

end.
