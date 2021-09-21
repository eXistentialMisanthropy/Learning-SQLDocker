--************************************
-- INIT
--************************************
DROP TABLE Products

CREATE TABLE Products
(
	Id INT IDENTITY(1, 1) NOT NULL PRIMARY KEY,
	Title NVARCHAR(MAX),
	[Description] NVARCHAR(MAX),
	ImageName NVARCHAR(MAX),
	Price DECIMAL(38, 2)
)

INSERT INTO Products (Title, [Description], ImageName, Price) VALUES ('Ice Cream', 'Handmade with milk from happy cows', 'ice cream.jpg', 5.99)
INSERT INTO Products (Title, [Description], ImageName, Price) VALUES ('Frozen Yogurt', 'Handmade with milk from happy lactobacillae', 'frozen yogurt.jpg', 6.99)
INSERT INTO Products (Title, [Description], ImageName, Price) VALUES ('Gelatto', 'Handmade with whatever gelatto is', 'frozen yogurt.jpg', 7.99)

SELECT * FROM Products

--************************************
-- V2
--************************************
ALTER TABLE Products
ADD Instock BIT DEFAULT(1) NOT NULL

--************************************
-- V3
--************************************
ALTER TABLE Products
DROP COLUMN ImageName

--************************************
-- V4
--************************************
CREATE TABLE ProductImages
(
	Id INT NOT NULL PRIMARY KEY,
	Title NVARCHAR(MAX) NOT NULL,
	[Path] NVARCHAR(MAX) NOT NULL,
	ProductId INT NOT NULL
)

ALTER TABLE ProductImages WITH CHECK ADD CONSTRAINT [FK_ProductImages_Products] FOREIGN KEY(ProductId)
REFERENCES Products(Id)

ALTER TABLE ProductImages CHECK CONSTRAINT [FK_ProductImages_Products]
