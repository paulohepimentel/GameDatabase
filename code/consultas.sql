-- Questão 1
SELECT DISTINCT nomeplat
FROM (plataforma NATURAL JOIN compativel_midia) NATURAL JOIN midia
WHERE velocidade_leitura > 100;

-- Questão 2
SELECT nomeplat, ano_lancamento
FROM (plataforma NATURAL JOIN fabricante)
WHERE ano_fundacao > 1970;

-- Questão 3
SELECT nomemid, velocidade_leitura
FROM midia
WHERE velocidade_leitura BETWEEN 10 AND 30
ORDER BY velocidade_leitura DESC, nomemid;

-- Questão 4
INSERT INTO plataforma VALUES (7, 'Wiiu', 2012, 2147483648,( 
		SELECT idfabricante
		FROM fabricante
		WHERE nomefab = 'Nintendo')
);
SELECT * FROM plataforma;

-- Questão 5
SELECT nomeplat, nomefab, SUM(quantidade) AS numero_jogos
FROM (plataforma NATURAL JOIN compativel_jogo_plataforma) NATURAL JOIN fabricante
GROUP BY idplataforma
ORDER BY nomeplat;

-- Questão 6
SELECT nomejogo
FROM (jogo NATURAL JOIN compativel_jogo_plataforma) NATURAL JOIN plataforma
GROUP BY idjogo
HAVING COUNT(*) > 1;

-- Questão 7
SELECT COUNT(*) AS jogos_lancados, ano_lancamento_jogo 
FROM (jogo NATURAL JOIN compativel_jogo_plataforma
GROUP BY ano_lancamento_jogo
ORDER BY ano_lancamento_jogo ASC;

-- Questão 8
SELECT nomejogo, ano_lancamento_jogo, nomeplat
FROM (plataforma NATURAL JOIN compativel_jogo_plataforma) NATURAL JOIN jogo
WHERE ano_lancamento_jogo = (SELECT MIN(ano_lancamento_jogo) FROM compativel_jogo_plataforma);

-- Questão 9
SELECT AVG(memoria) AS media_memoria
FROM (plataforma NATURAL JOIN compativel_jogo_plataforma) NATURAL JOIN jogo;

-- Questão 10
SELECT nomefab
FROM fabricante NATURAL JOIN plataforma NATURAL JOIN compativel_midia
GROUP BY idfabricante
HAVING COUNT(*) > 1 
ORDER BY nomefab
