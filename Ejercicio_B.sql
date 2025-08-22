/*Ejercicio B*/

declare @hoy DATE = CAST(GETDATE() AS DATE);
declare @ultimos30 DATE = dateadd(DAY, -30, @hoy);
declare @ultimos60 DATE = dateadd(DAY, -60, @hoy);

IF OBJECT_ID('tempdb..#temp_ultimos30a60dias') IS NOT NULL DROP TABLE #temp_ultimos30a60dias;

select 
CAST(CONVERT(CHAR(6), t.created_timestamp, 112) AS CHAR(6)) as mes,
c.country_name,
t.tax_receipt_type,
c.fiscal_id_type,
t.amount,
t.sku_product
INTO #temp_ultimos30a60dias
from transactions t
inner join customers c
on t.customer_id = c.customer_id
where CAST(t.created_timestamp AS DATE) between @ultimos60 and @ultimos30;

select mes,
country_name,
tax_receipt_type,
fiscal_id_type,
sum(amount) as monto_venta,
count(sku_product) as cant_productos
from #temp_ultimos30a60dias
group by mes, country_name, tax_receipt_type, fiscal_id_type;
