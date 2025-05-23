-- CONSULTA 04
SELECT
    p.nome AS pais,
    an.id AS ano,
    ge.unidade_geracao AS unidade,
    ROUND(SUM(ge.valor_geracao) :: numeric, 3) AS total_gerado
FROM
    "GERACAO_ENERGIA" ge
    JOIN "AREA" a ON ge.id_area = a.id
    JOIN "PAIS" p ON a.id = p.id
    JOIN "ANO" an ON ge.id_ano = an.id
WHERE
    an.id BETWEEN 2000
    AND 2024
GROUP BY
    p.nome,
    an.id,
    ge.unidade_geracao
ORDER BY
    p.nome,
    an.id;