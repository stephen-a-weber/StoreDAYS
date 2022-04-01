--User
INSERT INTO User (UserName, FirstName, LastName, DateOfBirth, Password, Email) VALUES ('Steven','Monroe','1994-06-02','123Password!','Steven@gmail.com',1)
INSERT INTO User (UserName, FirstName, LastName, DateOfBirth, Password, Email) VALUES ('Andrew','Malmstead','1994-06-02','123Password!','malmsteadaa@gmail.com',0)
INSERT INTO User (UserName, FirstName, LastName, DateOfBirth, Password, Email) VALUES ('David','Gonzalez','','123Password!','DavidG@gmail.com',0)
INSERT INTO User (UserName, FirstName, LastName, DateOfBirth, Password, Email) VALUES ('Young','','','123Password!','Young@gmail.com',0)
--Address
INSERT INTO Address (Street, City, User_ID, State, Zip) VALUES ('2155 Corte Vista apt 147','Chula Vista',2,'CA','91915')
INSERT INTO Address (Street, City, User_ID, State, Zip) VALUES ('905 Ivy Ave','Amityville',3,'NY','11701')
INSERT INTO Address (Street, City, User_ID, State, Zip) VALUES ('72 Surrey Rd','Lakeville',4,'MN','55044')
--Shipping
INSERT INTO Shipping (Type, Cost, ETA, User_ID, Status, Address_ID) VALUES (?,?,?,2,?,?)
INSERT INTO Shipping (Type, Cost, ETA, User_ID, Status, Address_ID) VALUES (?,?,?,3,?,?)
INSERT INTO Shipping (Type, Cost, ETA, User_ID, Status, Address_ID) VALUES (?,?,?,4,?,?)

--Invoice
INSERT INTO Invoice (Sum, User_ID, Shipping_ID) VALUES (?,2,1)
INSERT INTO Invoice (Sum, User_ID, Shipping_ID) VALUES (?,3,2)
INSERT INTO Invoice (Sum, User_ID, Shipping_ID) VALUES (?,4,3)
--Order
INSERT INTO Order (Name, Cost, Description, Invoice_ID) VALUES (?,?,?,1)
INSERT INTO Order (Name, Cost, Description, Invoice_ID) VALUES (?,?,?,2)
INSERT INTO Order (Name, Cost, Description, Invoice_ID) VALUES (?,?,?,3)

--Catagory
INSERT INTO Catagory (Title) VALUES ('Kittens')
INSERT INTO Catagory (Title) VALUES ('Puppies')
INSERT INTO Catagory (Title) VALUES ('Animals')
--Payment_Methods
INSERT INTO Payment_Methods (CardNumber, CVC, Expiration, Name, User_ID, Address_ID) VALUES (?,?,?,?,?,?)
INSERT INTO Payment_Methods (CardNumber, CVC, Expiration, Name, User_ID, Address_ID) VALUES (?,?,?,?,?,?)
INSERT INTO Payment_Methods (CardNumber, CVC, Expiration, Name, User_ID, Address_ID) VALUES (?,?,?,?,?,?)

--Items
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Snow','White/Black',20.00,1,'ServerSide/img/kitten1.jpeg',1)
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Tiger','Brown',30.00,1,'ServerSide/img/kitten2.jpeg',1)
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Pair','white/brown',40.00,1,'ServerSide/img/kitten3.jpeg',1)
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Blue','white/black',50.00,1,'ServerSide/img/kitten4.jpeg',1)
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Sleepy','White',50.50,1,'ServerSide/img/kitten5.jpeg',1)
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Bear','Dark Brown',60.00,1,'ServerSide/img/kitten6.jpeg',1)
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Sneeky','Grey/Black',15.50,1,'ServerSide/img/kitten7.jpeg',1)
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Cuddles','Light Brown',30.89,1,'ServerSide/img/kitten8.jpeg',1)
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Smalls','Amber',30.89,1,'ServerSide/img/kitten9.jpeg',1)
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Max','Tuxedo',79.65,1,'ServerSide/img/kitten10.jpeg',0)

INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Runner','Lamb',20.00,2,'ServerSide/img/puppy1.jpeg',1)
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Sniffer','Baige',30.00,2,'ServerSide/img/puppy2.jpeg',1)
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Buddy','White/Brown',40.00,2,'ServerSide/img/puppy3.jpeg',1)
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Snuggles','White/Light Brown',50.00,2,'ServerSide/img/puppy4.jpeg',1)
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('AW','Fluffy',50.50,2,'ServerSide/img/puppy5.jpeg',1)
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Fishy','small',15.50,2,'ServerSide/img/puppy6.jpeg',1)
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Tucker','light brown',30.89,2,'ServerSide/img/puppy7.jpeg',1)
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Jim','Big eyes',79.65,2,'ServerSide/img/puppy8.jpeg',1)
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Wolfy','Blue eyes',63.12,2,'ServerSide/img/puppy9.jpeg',1)
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Boss','German Shepard',94.20,2,'ServerSide/img/puppy10.jpeg',0)

INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Lynn','fruit',50.20,3,'ServerSide/img/animal1.jpeg',1)
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Jesus','fins',97.20,3,'ServerSide/img/animal2.jpeg',1)
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Sara','deer',31.20,3,'ServerSide/img/animal3.jpeg',1)
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Susan','Penguin',9.48,3,'ServerSide/img/animal4.jpeg',1)
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Vicky','Rabbit',6.48,3,'ServerSide/img/animal5.jpeg',1)
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Minnie','Pig',9.64,3,'ServerSide/img/animal6.jpeg',1)
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Fredrick','Big eyes',36.6,3,'ServerSide/img/animal7.jpeg',1)
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Nelson','Lamb',72.65,3,'ServerSide/img/animal8.jpeg',1)
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Shaun','Turtle',46.20,3,'ServerSide/img/animal9.jpeg',0)

--Review
INSERT INTO Review (Body, User_ID, Rate, Items_ID, Catagory_ID) VALUES ('Best Pet Ever',3,5,10,1)
INSERT INTO Review (Body, User_ID, Rate, Items_ID, Catagory_ID) VALUES ('Good timing',4,4,20,2)
INSERT INTO Review (Body, User_ID, Rate, Items_ID, Catagory_ID) VALUES ('It was okay',2,3,29,3)


--Order_Details
INSERT INTO Order_Details (Items_ID, Order_ID, Quantity) VALUES (10,1,1)
INSERT INTO Order_Details (Items_ID, Order_ID, Quantity) VALUES (20,2,1)
INSERT INTO Order_Details (Items_ID, Order_ID, Quantity) VALUES (29,3,1)
