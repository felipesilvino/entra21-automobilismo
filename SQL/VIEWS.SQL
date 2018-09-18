create or replace view vw_piloto as
select pi.id "Id."
     , pi.nome "Nome"
     , pi.data_nascimento "Data de Nascimento"
     , TimeStampDiff(YEAR, pi.data_nascimento, CURDATE()) "Idade"
     , pa.nome "País"
  from piloto pi
     , pais pa 
 where pa.id = pi.id_pais;
 
create or replace view vw_equipe as
 select e.id "Id."
      , e.nome "Nome"
      , p.nome "País da Equipe"
      , fp.nome "Fabricante de Pneu"
      , fm.nome "Fabricante do Motor"
   from equipe e
      , pais p
	  , fabricante fp
      , fabricante fm
  where e.id_pais = p.id
    and e.id_fabricante_pneu = fp.id
    and e.id_fabricante_motor = fm.id; 
    
create or replace view vw_usuario as
select id as "Cód."
     , login as "login"
     , nome as "Nome"
  from usuario;    