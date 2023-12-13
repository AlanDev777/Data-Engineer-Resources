-- ####################################################################
-- # Descripción:
-- # Estos codigos muestra un codigo en SQL Server que esta haciendo malas practicas
-- # y por otro lado tenemos la versión optimizada para Hadoop. 
-- # Autor: Alan 
-- # Fecha: 2023-12-12
-- ####################################################################
-- SQL Server
SELECT 
    E.*,
    MAX(E.Nombre) AS Nombre,
    MAX(S.SueldoMensual) AS SueldoMensual,
    MAX(S.SueldoMensual * 12) AS SueldoAnual
FROM 
    Empleados E,
    Salarios S
WHERE
    E.IDEmpleado = S.IDEmpleado
GROUP BY
    E.IDEmpleado
ORDER BY 
    SueldoAnual DESC
OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY;
-- Hadoop
SELECT 
    E.IDEmpleado,
    E.Nombre,
    S.SueldoMensual,
    S.SueldoMensual * 12 AS SueldoAnual
FROM 
    mi_schema.Empleados E
JOIN 
    mi_schema.Salarios S ON E.IDEmpleado = S.IDEmpleado
WHERE
    S.date_partition = '2023-12-12'
ORDER BY 
    SueldoAnual DESC
LIMIT 10;


