---Table:User
--Create
INSERT INTO User (UserName, FirstName, LastName, DateOfBirth, Password, Email, Admin) VALUES (?,?,?,?,?,?,?)
--Read
SELECT * FROM User WHERE ID = ?
SELECT Password FROM User Where Email = ? 
--Update
UPDATE User set UserName = ?, FirstName = ?, LastName = ?, DateOfBirth = ?, Password = ?, Email = ? WHERE ID = ?
--Delete
DELETE FROM User Where ID = ?

---Table:Address
--Create
INSERT INTO Address (Street, City, User_ID, State, Zip) VALUES (?,?,?,?,?)
--Read
SELECT * FROM Address WHERE ID = ?
SELECT * FROM Address WHERE User_ID = ?
--Update
UPDATE Address set Street = ?, City = ?, User_ID = ?, State = ?, Zip = ? WHERE ID = ?
--Delete
DELETE FROM Address Where ID = ?
DELETE FROM Address Where User_ID = ?


---Table:Shipping
--Create
INSERT INTO Shipping (ShippingType, Cost, ETA, User_ID, Status, Address_ID) VALUES (?,?,?,?,?,?)
--Read
SELECT * FROM Shipping WHERE User_ID = ?
SELECT * FROM Shipping WHERE ID = ?
--Update
UPDATE Shipping set ShippingType = ?, Cost = ?, ETA = ?, User_ID = ?, Status = ?, Address_ID = ? WHERE ID = ?
--Delete
DELETE FROM Shipping Where ID = ?

---Table:Invoice
--Create
INSERT INTO Invoice (Cost, User_ID, Shipping_ID, PaymentMethods_ID) VALUES (?,?,?,?)
--Read
SELECT * FROM Invoice WHERE ID = ?
SELECT * FROM Invoice WHERE User_ID = ?
--Update
UPDATE Invoice set Cost = ?, User_ID = ?, Shipping_ID = ?, PaymentMethods_ID = ? WHERE ID = ?
--Delete
DELETE FROM Invoice Where ID = ?
DELETE FROM Invoice Where User_ID = ?

---Table:Orders
--Create
INSERT INTO Orders (Cost, Description, Invoice_ID) VALUES (?,?,?,?)
--Read
SELECT * FROM Orders WHERE ID = ?
SELECT * FROM Orders WHERE Invoice_ID = ?
--Update
UPDATE Orders set  Cost = ?, Description = ?, Invoice_ID = ? WHERE ID = ?
--Delete
DELETE FROM Orders Where ID = ?
DELETE FROM Orders Where User_ID = ?

---Table:Catagory
--Create
INSERT INTO Catagory (Title) VALUES (?)
--Read
SELECT * FROM Catagory WHERE ID = ?
SELECT * FROM Catagory 
--Update
UPDATE Catagory set Title = ? WHERE ID = ?
--Delete
DELETE FROM Catagory Where ID = ?

---Table:Payment Methods
--Create
INSERT INTO PaymentMethods (CardNumber, CVC, Expiration, Name, User_ID, Address_ID) VALUES (?,?,?,?,?,?)
--Read
SELECT * FROM PaymentMethods WHERE User_ID = ?
SELECT * FROM PaymentMethods WHERE ID = ?
--Update
UPDATE PaymentMethods set CardNumber = ?, CVC = ?, Expiration = ?, Name = ?, User_ID = ?, Address_ID = ?  WHERE ID = ?
--Delete
DELETE FROM PaymentMethods Where ID = ?
DELETE FROM PaymentMethods Where User_ID = ?

---Table:Items
--Create
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG ) VALUES (?,?,?,?,?)
--Read
SELECT * FROM Items WHERE ID = ?
SELECT * FROM Items WHERE Catagory_ID = ?
SELECT * FROM Items WHERE Name = ?
SELECT * FROM Items WHERE ID IN (SELECT Items_ID from Orders_Details WHERE Orders_ID IN (SELECT ID From Orders WHERE Invoice_ID = ?))      
SELECT * FROM Items WHERE ID IN (SELECT Items_ID from Orders_Details WHERE Orders_ID = ?)
--Update
UPDATE Items set Name  = ?, Description = ?, Cost = ?, Catagory_ID = ?, Stock = ?, IMG = ?, Availability = ?  WHERE ID  = ?
--Delete
DELETE FROM Items Where ID = ?

---Table:Review
--Create
INSERT INTO Review (Body, User_ID, Rate, Items_ID, Catagory_ID) VALUES (?,?,?,?,?)
--Read
SELECT * FROM Review WHERE ID = ?
SELECT * FROM Review WHERE User_ID = ?
SELECT * FROM Review WHERE Catagory_ID = ?
SELECT * FROM Review WHERE Items_ID = ?
--Update
UPDATE Review set Body = ?, User_ID = ?, Rate = ?, Items_ID = ?, Catagory_ID  = ? WHERE ID = ?
--Delete
DELETE FROM Review Where ID = ?
DELETE FROM Review Where User_ID = ?

---Table:Order_Details
--Create
INSERT INTO Orders_Details (Items_ID, Orders_ID, Quantity) VALUES (?,?,?)
--Read
SELECT * FROM Orders_Details WHERE ID = ?
SELECT * FROM Orders_Details WHERE Items_ID = ?

--Update
UPDATE Orders_Details set Items_ID = ?, Orders_ID = ?, Quantity = ? WHERE ID = ?
--Delete
DELETE FROM Orders_Details Where ID = ?