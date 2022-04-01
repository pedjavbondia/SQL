SELECT Name, Color, Size, ProductModelID from SalesLT.Product WHERE ProductModelID=1;

	SELECT ProductNumber, Name, Color, Size from SalesLT.Product WHERE Color IN ('Red','Black','White') AND Size IN ('S','M')

	SELECT ProductNumber, Name, ListPrice from SalesLT.Product WHERE ProductNumber LIKE 'BK-%'

	SELECT ProductNumber, Name, ListPrice from SalesLT.Product WHERE ProductNumber LIKE 'BK-[A-Q]___-__' OR ProductNumber LIKE 'BK-[S-Z]___-__'