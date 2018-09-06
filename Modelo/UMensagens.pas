unit UMensagens;

interface

resourcestring
  //Geral
  STR_ATENCAO                 = 'Aten��o';
  STR_CAPTION_ABA_CONSULTAS   = '%d - %s...';
  STR_TODOS                   = 'Todos';
  STR_ATUALIZADO              = 'atualizado(a)';
  STR_GRAVADO                 = 'gravado(a)';
  STR_EXCLUIDO                = 'excluido(a)';
  STR_OPERACAO_COM_SUCESSO    = '%s com c�digo %d %s com sucesso.';
  STR_ENTIDADE_NAO_ENCONTRADA = '%s com c�digo %d n�o foi encontrado(a)';

  //Entidade
  STR_ENTIDADE_GRAVADA_COM_SUCESSO    = '%s gravado(a) com sucesso! C�digo gerado: %d.';
  STR_ENTIDADE_ATUALIZADO_COM_SUCESSO = '%s atualizado(a) com sucesso!';
  STR_ENTIDADE_DESEJA_EXCLUIR         = 'Deseja realmente excluir este(a) %s?';

  //CRUD
  STR_CRUD_CABECALHO = 'Cadastro de %s';

  //Transa��o
  STR_JA_EXISTE_TRANSACAO_ATIVA   = 'N�o foi possivel abrir uma nova transa��o! Motivo: J� existe uma transa��o ativa.';
  STR_NAO_EXISTE_TRANSACAO_ATIVA  = 'N�o foi possivel %s a transa��o! Motivo: N�o existe uma transa��o ativa.';
  STR_VALIDA_TRANSACAO_ATIVA      = 'Opera��o abortada! Motivo: Para realizar esta opera��o � necess�rio ter uma transa��o ativa.';
  STR_ABORTAR                     = 'abortar';
  STR_FINALIZAR                   = 'finalizar';

  //Pa�s
  STR_PAIS                    = 'Pa�s';
  STR_PAIS_NOME_NAO_INFORMADO = 'Nome do pa�s n�o foi informado.';
  STR_PAIS_NOME_JA_EXISTE     = 'J� existe um outro pa�s cadastrado com este nome.';

  //Fabricante
  STR_FABRICANTE                    = 'Fabricante';
  STR_FABRICANTE_NOME_NAO_INFORMADO = 'Nome do fabricante n�o foi informado.';

  //Piloto
  STR_PILOTO                    = 'Piloto';
  STR_PILOTO_NOME_NAO_INFORMADO = 'Nome do piloto n�o foi informado.';
  STR_PILOTO_MENOR_DE_IDADE     = 'Piloto � menor de idade.';

  //Equipe
  STR_EQUIPE                    = 'Equipe';
  STR_EQUIPE_NOME_NAO_INFORMADO = 'Nome da equipe n�o foi informado.';
  STR_EQUIPE_NOME_JA_EXISTE     = 'J� existe uma outra equipe cadastrada com este nome.';

implementation

end.
