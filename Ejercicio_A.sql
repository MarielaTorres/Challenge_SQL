DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS customers;

-- Customers
CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  fiscal_id_type VARCHAR(50) NOT NULL,
  fiscal_id VARCHAR(32) NOT NULL,
  country_name VARCHAR(255) NOT NULL,
  created_timestamp DATETIME NOT NULL
);

-- Transactions
CREATE TABLE transactions (
  transaction_id INT PRIMARY KEY,
  created_timestamp DATETIME NOT NULL,
  sku_product VARCHAR(255) NOT NULL,
  customer_id INT NOT NULL,
  tax_receipt_type VARCHAR(50) NOT NULL,
  tax_receipt_id INT NOT NULL,
  amount DECIMAL(10,2) NOT NULL
);

INSERT INTO customers (customer_id, name, fiscal_id_type, fiscal_id, country_name, created_timestamp)
VALUES
  (1, 'Ana Pérez', 'DNI', '32123456', 'Argentina', '2024-07-01 10:00:00'),
  (2, 'María Gómez', 'CUIT', '203456789', 'Argentina', '2024-07-02 11:00:00'),
  (3, 'Juan Gomez', 'CUIT', '14566789', 'Argentina', '2024-07-03 12:00:00');

-- Insert a Transactions:
INSERT INTO transactions (transaction_id, created_timestamp, sku_product, customer_id, tax_receipt_type, tax_receipt_id, amount) VALUES
(1001, '2024-07-05 09:15:00', 'SKU-1001', 1, 'FACTURA_A', 70001, 1200.00),
(1002, '2024-07-18 14:30:00', 'SKU-2001', 2, 'FACTURA_B', 70002, 890.50),
(1003, '2024-07-27 16:45:00', 'SKU-3001', 3, 'TICKET',    70003, 430.75),
(1004, '2024-08-03 10:10:00', 'SKU-1002', 1, 'FACTURA_B', 70004, 1500.00),
(1005, '2024-08-15 11:25:00', 'SKU-2002', 2, 'FACTURA_A', 70005, 675.25),
(1006, '2024-09-08 13:50:00', 'SKU-3002', 3, 'FACTURA_A', 70006, 2200.40),
(1007, '2024-09-20 09:40:00', 'SKU-4001', 1, 'TICKET',    70007, 315.00),
(1008, '2024-10-05 12:00:00', 'SKU-1003', 2, 'FACTURA_B', 70008, 1999.99),
(1009, '2024-10-21 15:10:00', 'SKU-2003', 3, 'FACTURA_A', 70009, 810.10),
(1010, '2024-11-07 10:45:00', 'SKU-3003', 1, 'TICKET',    70010, 520.25),
(1011, '2024-11-23 17:55:00', 'SKU-4002', 2, 'FACTURA_A', 70011, 1340.00),
(1030, '2024-11-05 09:20:00', 'SKU-1101', 1, 'FACTURA_A', 70030,  980.00),
(1031, '2024-11-12 11:10:00', 'SKU-2101', 2, 'FACTURA_B', 70031, 1245.50),
(1032, '2024-11-18 16:35:00', 'SKU-3101', 3, 'TICKET',    70032,  275.75),
(1033, '2024-11-25 14:05:00', 'SKU-1202', 1, 'FACTURA_B', 70033,  660.30),
(1034, '2024-11-29 18:45:00', 'SKU-2202', 2, 'FACTURA_A', 70034, 1725.00),
(1012, '2024-12-02 09:05:00', 'SKU-1004', 3, 'FACTURA_A', 70012,  890.90),
(1013, '2024-12-18 11:35:00', 'SKU-2004', 1, 'FACTURA_B', 70013,  475.20),
(1035, '2024-12-03 10:00:00', 'SKU-1303', 3, 'FACTURA_A', 70035, 1050.90),
(1036, '2024-12-09 12:25:00', 'SKU-2303', 1, 'FACTURA_B', 70036,  520.40),
(1037, '2024-12-15 09:55:00', 'SKU-3303', 2, 'TICKET',    70037,  315.20),
(1038, '2024-12-22 17:20:00', 'SKU-1404', 3, 'FACTURA_B', 70038, 1899.99),
(1039, '2024-12-29 15:35:00', 'SKU-2404', 1, 'FACTURA_A', 70039,  745.60),
(1014, '2025-01-10 14:15:00', 'SKU-3004', 2, 'FACTURA_B', 70014, 1500.00),
(1015, '2025-01-27 16:30:00', 'SKU-4003', 3, 'TICKET',    70015, 210.40),
(1016, '2025-02-06 08:20:00', 'SKU-1005', 1, 'FACTURA_A', 70016, 1800.75),
(1017, '2025-02-19 10:55:00', 'SKU-2005', 2, 'FACTURA_A', 70017, 950.30),
(1018, '2025-03-04 12:40:00', 'SKU-3005', 3, 'FACTURA_B', 70018, 770.15),
(1019, '2025-03-22 09:25:00', 'SKU-4004', 1, 'TICKET',    70019, 340.00),
(1020, '2025-04-09 11:10:00', 'SKU-1006', 2, 'FACTURA_A', 70020, 1450.00),
(1021, '2025-04-25 13:45:00', 'SKU-2006', 3, 'FACTURA_B', 70021, 530.60),
(1022, '2025-05-12 10:50:00', 'SKU-3006', 1, 'FACTURA_B', 70022, 1900.80),
(1023, '2025-05-28 15:20:00', 'SKU-4005', 2, 'TICKET',    70023, 410.40),
(1024, '2025-06-03 09:35:00', 'SKU-1007', 3, 'FACTURA_A', 70024, 1230.90),
(1025, '2025-06-17 17:05:00', 'SKU-2007', 1, 'FACTURA_A', 70025, 820.25),
(1026, '2025-07-06 08:55:00', 'SKU-3007', 2, 'FACTURA_B', 70026, 1675.70),
(1027, '2025-07-22 16:15:00', 'SKU-4006', 3, 'TICKET',    70027, 295.00),
(1028, '2025-08-11 10:05:00', 'SKU-1008', 1, 'FACTURA_A', 70028, 1100.10),
(1029, '2025-08-19 14:30:00', 'SKU-2008', 2, 'FACTURA_B', 70029, 845.55);

/*Ejercicio A*/

declare @hoy DATE = CAST(GETDATE() AS DATE);
declare @ultimos30 DATE = dateadd(DAY, -30, @hoy);

with ultimos30dias as (
select 
CAST(CONVERT(CHAR(6), t.created_timestamp, 112) AS CHAR(6)) as mes,
c.country_name,
t.tax_receipt_type,
c.fiscal_id_type,
t.amount,
t.sku_product
from transactions t
inner join customers c
on t.customer_id = c.customer_id
where CAST(t.created_timestamp AS DATE) between @ultimos30 and @hoy)

select mes,
country_name,
tax_receipt_type,
fiscal_id_type,
sum(amount) as monto_venta,
count(sku_product) as cant_productos
from ultimos30dias
group by mes, country_name, tax_receipt_type, fiscal_id_type;
