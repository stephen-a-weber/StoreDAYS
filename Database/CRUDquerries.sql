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
INSERT INTO Shipping (Type, Cost, ETA, User_ID, Status, Address_ID) VALUES (?,?,?,?,?,?)
--Read
SELECT * FROM Shipping WHERE User_ID = ?
SELECT * FROM Shipping WHERE ID = ?
--Update
UPDATE Shipping set Type = ?, Cost = ?, ETA = ?, User_ID = ?, Status = ?, Address_ID = ? WHERE ID = ?
--Delete
DELETE FROM Shipping Where ID = ?

---Table:Invoice
--Create
INSERT INTO Invoice (Sum, User_ID, Shipping_ID) VALUES (?,?,?)
--Read
SELECT * FROM Invoice WHERE ID = ?
SELECT * FROM Invoice WHERE User_ID = ?
--Update
UPDATE Invoice set Sum = ?, User_ID = ?, Shipping_ID = ? WHERE ID = ?
--Delete
DELETE FROM Invoice Where ID = ?

---Table:Order
--Create
INSERT INTO Order (Name, Cost, Description, Invoice_ID) VALUES (?,?,?,?)
--Read
SELECT * FROM Order WHERE ID = ?
SELECT * FROM Order WHERE Invoice_ID = ?
--Update
UPDATE Order set Name = ?, Cost = ?, Description = ?, Invoice_ID = ? WHERE ID = ?
--Delete
DELETE FROM Order Where ID = ?

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
INSERT INTO Payment_Methods (CardNumber, CVC, Expiration, Name, User_ID, Address_ID) VALUES (?,?,?,?,?,?)
--Read
SELECT * FROM Payment_Methods WHERE User_ID = ?
SELECT * FROM Payment_Methods WHERE ID = ?
--Update
UPDATE Payment_Methods set CardNumber = ?, CVC = ?, Expiration = ?, Name = ?, User_ID = ?, Address_ID = ?  WHERE ID = ?
--Delete
DELETE FROM Payment_Methods Where ID = ?
DELETE FROM Payment_Methods Where User_ID = ?

---Table:Items
--Create
INSERT INTO Items (Name, Description, Cost, Catagory_ID, Stock ) VALUES (?,?,?,?,?)
--Read
SELECT * FROM Items WHERE ID = ?
SELECT * FROM Items WHERE Catagory_ID = ?
SELECT * FROM Items WHERE Name = ?
--Update
UPDATE Items set Name  = ?, Description = ?, Cost = ?, Catagory_ID = ?, Stock = ?  WHERE ID  = ?
--Delete
DELETE FROM Items Where ID = ?

---Table:Review
--Create
INSERT INTO Review (Body, User_ID, Rate, Items_ID, Catagory_ID) VALUES (?,?,?,?,?)
--Read
SELECT * FROM Review WHERE ID = ?
SELECT * FROM Review WHERE Catagory_ID = ?
SELECT * FROM Review WHERE Items_ID = ?
--Update
UPDATE Review set (Body = ?, User_ID = ?, Rate = ?, Items_ID = ?, Catagory_ID  = ? WHERE ID = ?
--Delete
DELETE FROM Review Where ID = ?
DELETE FROM Review Where User_ID = ?

---Table:Order_Details
--Create
INSERT INTO Order_Details (Items_ID, Order_ID, Quantity) VALUES (?,?,?)
--Read
SELECT * FROM Order_Details WHERE ID =
--Update
UPDATE Order_Details set Items_ID = ?, Order_ID = ?, Quantity = ? WHERE ID = ?
--Delete
DELETE FROM Order_Details Where ID = ?