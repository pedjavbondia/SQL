SELECT * from SalesLT.Customer
-- Lista de Clientes por t�tulo, nombres y apellido.  Se realiz� un cambio de los valores NULL del t�tulo y middle name por espacio.
SELECT SalesPerson, (ISNULL(Title,' ')+' '+FirstName+' '+ISNULL(MiddleName,' ')+' '+LastName) as NombreCliente, Phone from SalesLT.Customer

--Lista de Clientes con formato <CustomerID>:<CompanyName> se realiz� un CAST a varchar por error en el formato para concatenaci�n.
SELECT (CAST(CustomerID AS varchar(8))+':'+CompanyName) as ID_Company_Name from SalesLT.Customer

--Lista de N�mero de Orden de Ventas y N�mero de revisi�n con fecha de la orden en formato ANSI
SELECT CAST(SalesOrderNumber AS varchar(8))+'('+CAST(RevisionNumber AS varchar(8))+')' as N�mero_Orden_de_Ventas_N�mero_de_Revisi�n, 
CONVERT(nvarchar(30),OrderDate,102) as ANSIformatDate
from SalesLT.SalesOrderHeader

-- Lista de Clientes nombre, inicial del medio y apellido.  Se realiz� un cambio de los valores NULL del middle name por espacio.
SELECT (FirstName+' '+ISNULL(MiddleName,' ')+' '+LastName) as NombreCliente from SalesLT.Customer

UPDATE SalesLT.Customer SET EmailAddress = NULL WHERE CustomerID % 7 = 1;

-- Lista de Contacto Primario de Clientes.  Se us� la funci�n ISNULL para reemplazar el correo electr�nico por el tel�fono en caso que el primero no est� definido.
SELECT CustomerID, ISNULL(EmailAddress,Phone) as ContactoPrimario from SalesLT.Customer

UPDATE SalesLT.SalesOrderHeader SET ShipDate = NULL WHERE SalesOrderID > 71899;

-- Lista de Ordenes de Compra que muestra el ID de la orden, la fecha de la orden y que en caso que exista una fecha de env�o devuelve el Status: Enviado y en caso contrario muestra En Espera.
SELECT SalesOrderID, OrderDate, 'Status del Env�o'= 
ISNULL(CASE
	WHEN ShipDate IS NOT NULL THEN 'Enviado'
END,'En Espera')
from SalesLT.SalesOrderHeader