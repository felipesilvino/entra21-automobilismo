unit UPais;

interface

uses
    UEntidade
  ;

type
  TPAIS = class(TENTIDADE)
  private
    FNome: String;

  public
    property NOME: String read FNome write FNome;

  end;

const
  TBL_PAIS      = 'PAIS';
  FLD_PAIS_NOME = 'NOME';

implementation

end.
