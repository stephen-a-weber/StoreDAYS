USE StoreDAYS;
-- User
INSERT INTO User (UserName, FirstName, LastName, DateOfBirth, Password, Email, Admin) VALUES ('S','Steven','Monroe','1994-06-02','123Password!','Steven@gmail.com',1);
INSERT INTO User (UserName, FirstName, LastName, DateOfBirth, Password, Email, Admin) VALUES ('A','Andrew','Malmstead','1994-06-02','123Password!','malmsteadaa@gmail.com',0);
INSERT INTO User (UserName, FirstName, LastName, DateOfBirth, Password, Email, Admin) VALUES ('D','David','Gonzalez','2021-11-20','123Password!','DavidG@gmail.com',0);
INSERT INTO User (UserName, FirstName, LastName, DateOfBirth, Password, Email, Admin) VALUES ('Y','Young','','2021-11-20','123Password!','Young@gmail.com',0);
-- Address
INSERT INTO Address (Street, City, User_ID, State, Zip) VALUES ('2155 Corte Vista apt 147','Chula Vista',2,'CA','91915');
INSERT INTO Address (Street, City, User_ID, State, Zip) VALUES ('905 Ivy Ave','Amityville',3,'NY','11701');
INSERT INTO Address (Street, City, User_ID, State, Zip) VALUES ('72 Surrey Rd','Lakeville',4,'MN','55044');
-- Shipping
INSERT INTO Shipping (ShippingType, Cost, ETA, User_ID, Status, Address_ID) VALUES ('Priority',5.00,'2022-4-05',2,'Delevered',1);
INSERT INTO Shipping (ShippingType, Cost, ETA, User_ID, Status, Address_ID) VALUES ('Normal',20.00,'2022-12-20',3,'OnGoing',1);
INSERT INTO Shipping (ShippingType, Cost, ETA, User_ID, Status, Address_ID) VALUES ('NextDay',6.00,'2021-11-20',4,'Preparing',1);

INSERT INTO Shipping (ShippingType, Cost, ETA, User_ID, Status, Address_ID) VALUES ('Priority',5.00,'2022-4-05',2,'Delevered',2);
INSERT INTO Shipping (ShippingType, Cost, ETA, User_ID, Status, Address_ID) VALUES ('Normal',20.00,'2022-12-20',3,'OnGoing',2);
INSERT INTO Shipping (ShippingType, Cost, ETA, User_ID, Status, Address_ID) VALUES ('NextDay',6.00,'2021-11-20',4,'Preparing',2);

INSERT INTO Shipping (ShippingType, Cost, ETA, User_ID, Status, Address_ID) VALUES ('Priority',5.00,'2022-4-05',2,'Delevered',3);
INSERT INTO Shipping (ShippingType, Cost, ETA, User_ID, Status, Address_ID) VALUES ('Normal',20.00,'2022-12-20',3,'OnGoing',3);
INSERT INTO Shipping (ShippingType, Cost, ETA, User_ID, Status, Address_ID) VALUES ('NextDay',6.00,'2021-11-20',4,'Preparing',3);
-- PaymentMethods
INSERT INTO PaymentMethods (CardNumber, CVC, Expiration, Name, User_ID, Address_ID) VALUES ("1234567891234567",123,'25/12',"Chase",2,1);
INSERT INTO PaymentMethods (CardNumber, CVC, Expiration, Name, User_ID, Address_ID) VALUES ("1234567891234567",123,'26/2',"WellsFargo",3,2);
INSERT INTO PaymentMethods (CardNumber, CVC, Expiration, Name, User_ID, Address_ID) VALUES ("1234567891234567",123,'23/9',"Bank Of America",4,3);

-- Invoice
INSERT INTO Invoice (Cost, User_ID, Shipping_ID, PaymentMethods_ID) VALUES (84.65,2,1,1);
INSERT INTO Invoice (Cost, User_ID, Shipping_ID, PaymentMethods_ID) VALUES (114.20,2,2,1);
INSERT INTO Invoice (Cost, User_ID, Shipping_ID, PaymentMethods_ID) VALUES (52.20,2,3,1);

INSERT INTO Invoice (Cost, User_ID, Shipping_ID, PaymentMethods_ID) VALUES (114.20,3,4,2);
INSERT INTO Invoice (Cost, User_ID, Shipping_ID, PaymentMethods_ID) VALUES (84.65,3,5,2);
INSERT INTO Invoice (Cost, User_ID, Shipping_ID, PaymentMethods_ID) VALUES (52.20,3,6,2);


INSERT INTO Invoice (Cost, User_ID, Shipping_ID, PaymentMethods_ID) VALUES (114.20,4,7,3);
INSERT INTO Invoice (Cost, User_ID, Shipping_ID, PaymentMethods_ID) VALUES (84.65,4,8,3);
INSERT INTO Invoice (Cost, User_ID, Shipping_ID, PaymentMethods_ID) VALUES (52.20,4,9,3);
-- Orders
INSERT INTO Orders ( Cost, Description, Invoice_ID) VALUES (79.65,'INPROGRESS',1);
INSERT INTO Orders ( Cost, Description, Invoice_ID) VALUES (94.20,'COMPLETE',1);
INSERT INTO Orders ( Cost, Description, Invoice_ID) VALUES (46.20,'REFUND',1);


INSERT INTO Orders ( Cost, Description, Invoice_ID) VALUES (79.65,'INPROGRESS',2);
INSERT INTO Orders ( Cost, Description, Invoice_ID) VALUES (94.20,'COMPLETE',2);
INSERT INTO Orders ( Cost, Description, Invoice_ID) VALUES (46.20,'REFUND',2);



INSERT INTO Orders ( Cost, Description, Invoice_ID) VALUES (79.65,'INPROGRESS',3);
INSERT INTO Orders ( Cost, Description, Invoice_ID) VALUES (94.20,'COMPLETE',3);
INSERT INTO Orders ( Cost, Description, Invoice_ID) VALUES (46.20,'REFUND',3);


-- Catagory
INSERT INTO Catagory (Title) VALUES ('Kittens');
INSERT INTO Catagory (Title) VALUES ('Puppies');
INSERT INTO Catagory (Title) VALUES ('Animals');

-- Items
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Snow','White/Black',20.00,1,'http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/img/kitten1.jpeg',1);
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Tiger','Brown',30.00,1,'http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/img/kitten2.jpeg',1);
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Pair','white/brown',40.00,1,'http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/img/kitten3.jpeg',1);
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Blue','white/black',50.00,1,'http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/img/kitten4.jpeg',1);
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Sleepy','White',50.50,1,'http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/img/kitten5.jpeg',1);
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Bear','Dark Brown',60.00,1,'http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/img/kitten6.jpeg',1);
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Sneeky','Grey/Black',15.50,1,'http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/img/kitten7.jpeg',1);
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Cuddles','Light Brown',30.89,1,'http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/img/kitten8.jpeg',1);
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Smalls','Amber',30.89,1,'http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/img/kitten9.jpeg',1);
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Max','Tuxedo',79.65,1,'http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/img/kitten10.jpeg',0);

INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Runner','Lamb',20.00,2,'http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/img/puppy1.jpeg',1);
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Sniffer','Baige',30.00,2,'http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/img/puppy2.jpeg',1);
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Buddy','White/Brown',40.00,2,'http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/img/puppy3.jpeg',1);
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Snuggles','White/Light Brown',50.00,2,'http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/img/puppy4.jpeg',1);
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('AW','Fluffy',50.50,2,'http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/img/puppy5.jpeg',1);
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Fishy','small',15.50,2,'http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/img/puppy6.jpeg',1);
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Tucker','light brown',30.89,2,'http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/img/puppy7.jpeg',1);
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Jim','Big eyes',79.65,2,'http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/img/puppy8.jpeg',1);
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Wolfy','Blue eyes',63.12,2,'http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/img/puppy9.jpeg',1);
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Boss','German Shepard',94.20,2,'http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/img/puppy10.jpeg',0);

INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Lynn','fruit',50.20,3,'http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/img/animal1.jpeg',1);
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Jesus','fins',97.20,3,'http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/img/animal2.jpeg',1);
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Sara','deer',31.20,3,'http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/img/animal3.jpeg',1);
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Susan','Penguin',9.48,3,'http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/img/animal4.jpeg',1);
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Vicky','Rabbit',6.48,3,'http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/img/animal5.jpeg',1);
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Minnie','Pig',9.64,3,'http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/img/animal6.jpeg',1);
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Fredrick','Big eyes',36.6,3,'http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/img/animal7.jpeg',1);
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Nelson','Lamb',72.65,3,'http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/img/animal8.jpeg',1);
INSERT INTO Items (Name, Description, Cost, Catagory_ID, IMG, Availability ) VALUES ('Shaun','Turtle',46.20,3,'http://ec2-18-118-34-246.us-east-2.compute.amazonaws.com/StoreDAYS/ServerSide/img/animal9.jpeg',0);

-- Review
INSERT INTO Review (Body, User_ID, Rate, Items_ID, Catagory_ID) VALUES ('Best Pet Ever',3,5,10,1);
INSERT INTO Review (Body, User_ID, Rate, Items_ID, Catagory_ID) VALUES ('Good timing',4,4,20,2);
INSERT INTO Review (Body, User_ID, Rate, Items_ID, Catagory_ID) VALUES ('It was okay',2,3,29,3);


-- Orders_Details
INSERT INTO Orders_Details (Items_ID, Orders_ID, Quantity) VALUES (10,1,1);
INSERT INTO Orders_Details (Items_ID, Orders_ID, Quantity) VALUES (20,2,1);
INSERT INTO Orders_Details (Items_ID, Orders_ID, Quantity) VALUES (29,3,1);

INSERT INTO Orders_Details (Items_ID, Orders_ID, Quantity) VALUES (10,4,1);
INSERT INTO Orders_Details (Items_ID, Orders_ID, Quantity) VALUES (20,5,1);
INSERT INTO Orders_Details (Items_ID, Orders_ID, Quantity) VALUES (29,6,1);

INSERT INTO Orders_Details (Items_ID, Orders_ID, Quantity) VALUES (10,7,1);
INSERT INTO Orders_Details (Items_ID, Orders_ID, Quantity) VALUES (20,8,1);
INSERT INTO Orders_Details (Items_ID, Orders_ID, Quantity) VALUES (29,9,1);