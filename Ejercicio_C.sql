declare @mes_actual DATE = '2024-12-01';
declare @mes_anterior DATE = DATEADD(MONTH, -1, @mes_actual);
declare @mes_siguiente DATE = DATEADD(MONTH,  1, @mes_actual);

IF OBJECT_ID('tempdb..#temp_table') IS NOT NULL DROP TABLE #temp_table;

SELECT
    CAST(CONVERT(CHAR(6), t.created_timestamp, 112) AS CHAR(6)) AS mes,
    c.country_name,
    c.fiscal_id_type,
    t.tax_receipt_type,
    SUM(t.amount) AS monto_total,
    COUNT(*) AS cantidad_productos
INTO #temp_table
FROM transactions t
JOIN customers c 
ON c.customer_id = t.customer_id
WHERE t.created_timestamp >= @mes_anterior AND t.created_timestamp <  @mes_siguiente
GROUP BY  CAST(CONVERT(CHAR(6), t.created_timestamp, 112) AS CHAR(6)), c.country_name, c.fiscal_id_type, t.tax_receipt_type;

WITH prev AS (
  SELECT * FROM #temp_table
  WHERE mes = CONVERT(CHAR(6), @mes_anterior, 112)
),
act AS (
  SELECT * FROM #temp_table
  WHERE mes = CONVERT(CHAR(6), @mes_actual, 112)
)
SELECT 
    CONVERT(CHAR(6), @mes_actual, 112) AS mes_actual,
    a.country_name,
    a.fiscal_id_type,
    a.tax_receipt_type,
    ISNULL(a.monto_total, 0) AS monto_actual,
    ISNULL(p.monto_total, 0) AS monto_prev,
    ISNULL(a.cantidad_productos, 0) AS cant_actual,
    ISNULL(p.cantidad_productos, 0) AS cant_prev,
    CAST(CASE WHEN ISNULL(p.monto_total, 0) = 0 THEN NULL
           ELSE (ISNULL(a.monto_total, 0) - p.monto_total) / p.monto_total * 100.0 END AS DECIMAL(10,2)) AS pct_diferencial_monto,
    CAST(CASE WHEN ISNULL(p.cantidad_productos, 0) = 0 THEN NULL
           ELSE (ISNULL(a.cantidad_productos, 0) - p.cantidad_productos)/ NULLIF(CAST(p.cantidad_productos AS float), 0) * 100.0 END AS DECIMAL(10,2)) AS pct_diferencial_cantidad,
    CAST(CASE WHEN ISNULL(p.monto_total, 0) = 0 OR ISNULL(p.cantidad_productos, 0) = 0 THEN NULL
           ELSE (ISNULL(a.monto_total, 0) - p.monto_total) / p.monto_total * 100.0 + (ISNULL(a.cantidad_productos, 0) - p.cantidad_productos) 
		   / NULLIF(CAST(p.cantidad_productos AS float), 0) * 100.0 END AS DECIMAL(10,2)) AS pct_diferencial_total
FROM act a
LEFT JOIN prev p
ON p.country_name = a.country_name
AND p.fiscal_id_type = a.fiscal_id_type
AND p.tax_receipt_type = a.tax_receipt_type;
