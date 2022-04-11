CREATE TABLE FLIGHT (ID NUMBER(10,0) NOT NULL, AVAILABLE_SEATS NUMBER(10,0), DEPARTURE VARCHAR2(255), FROM_LOCATION VARCHAR2(255),
NAME VARCHAR2(255), PRICE NUMBER(10,0), TIME VARCHAR2(255), TO_LOCATION VARCHAR2(255), PRIMARY KEY (ID))
/
CREATE TABLE USER_CRED (USER_NAME VARCHAR2(255) NOT NULL, AADHAR VARCHAR2(12), NAME VARCHAR2(255), PASSWORD VARCHAR2(255), 
PHONE VARCHAR2(10), PRIMARY KEY (USER_NAME));
/
INSERT INTO USER_CRED (USER_NAME,PHONE,NAME,PASSWORD,AADHAR) VALUES('admin@gmail.com','987321654010','Admin','123','9876543210')
/
INSERT INTO USER_CRED (USER_NAME,PHONE,NAME,PASSWORD,AADHAR) VALUES('user1@gmail.com','987321654011','User 1','123','9876543211')
/
INSERT INTO USER_CRED (USER_NAME,PHONE,NAME,PASSWORD,AADHAR) VALUES('user2@gmail.com','987321654012','User 2','123','9976543212')
/
INSERT INTO USER_CRED (USER_NAME,PHONE,NAME,PASSWORD,AADHAR) VALUES('user3@gmail.com','987321654013','User 3','123','9996543213')
/
INSERT INTO USER_CRED (USER_NAME,PHONE,NAME,PASSWORD,AADHAR) VALUES('user4@gmail.com','987321654014','User 4','123','9888843214')
/
INSERT INTO USER_CRED (USER_NAME,PHONE,NAME,PASSWORD,AADHAR) VALUES('user5@gmail.com','987321654015','User 5','123','9777773215')
/
INSERT INTO FLIGHT (ID,DEPARTURE,FROM_LOCATION,NAME,PRICE,TIME,TO_LOCATION,AVAILABLE_SEATS) VALUES(1141,'2022-04-14','Mumbai','Mumbai-Panvel-Pune',5000,'06:30','Pune',100)
/
INSERT INTO FLIGHT (ID,DEPARTURE,FROM_LOCATION,NAME,PRICE,TIME,TO_LOCATION,AVAILABLE_SEATS) VALUES(1142,'2022-04-14','Mumbai','Mumbai-Kalyan-Pune',2500,'12:30','Pune',50)
/
INSERT INTO FLIGHT (ID,DEPARTURE,FROM_LOCATION,NAME,PRICE,TIME,TO_LOCATION,AVAILABLE_SEATS) VALUES(1143,'2022-04-14','Mumbai','Mumbai-Thane-Pune',3500,'18:30','Pune',150)
/
INSERT INTO FLIGHT (ID,DEPARTURE,FROM_LOCATION,NAME,PRICE,TIME,TO_LOCATION,AVAILABLE_SEATS) VALUES(1144,'2022-04-15','Pune','Pune-Nashik-Mumbai',1500,'03:15','Mumbai',200)
/
INSERT INTO FLIGHT (ID,DEPARTURE,FROM_LOCATION,NAME,PRICE,TIME,TO_LOCATION,AVAILABLE_SEATS) VALUES(1145,'2022-04-15','Pune','Pune-Nagpur-Mumbai',3000,'11:33','Mumbai',75)
/
INSERT INTO FLIGHT (ID,DEPARTURE,FROM_LOCATION,NAME,PRICE,TIME,TO_LOCATION,AVAILABLE_SEATS) VALUES(1146,'2022-04-15','Pune','Pune-Delhi-Mumbai',4300,'21:40','Mumbai',60);
/
INSERT INTO FLIGHT (ID,DEPARTURE,FROM_LOCATION,NAME,PRICE,TIME,TO_LOCATION,AVAILABLE_SEATS) VALUES(1147,'2022-04-23','Amritsar','Amritsar-Manali-Delhi',15000,'16:35','Delhi',110)
/
INSERT INTO FLIGHT (ID,DEPARTURE,FROM_LOCATION,NAME,PRICE,TIME,TO_LOCATION,AVAILABLE_SEATS) VALUES(1148,'2022-04-23','Amritsar','Amritsar-Jaipur-Delhi',12500,'12:30','Delhi',57)
/
INSERT INTO FLIGHT (ID,DEPARTURE,FROM_LOCATION,NAME,PRICE,TIME,TO_LOCATION,AVAILABLE_SEATS) VALUES(1149,'2022-04-23','Amritsar','Amritsar-Agra-Delhi',13500,'14:30','Delhi',120)
/
INSERT INTO FLIGHT (ID,DEPARTURE,FROM_LOCATION,NAME,PRICE,TIME,TO_LOCATION,AVAILABLE_SEATS) VALUES(1150,'2022-04-25','Mysore','Mysore-Goa-Chennai',11500,'13:05','Chennai',175)
/
INSERT INTO FLIGHT (ID,DEPARTURE,FROM_LOCATION,NAME,PRICE,TIME,TO_LOCATION,AVAILABLE_SEATS) VALUES(1151,'2022-04-25','Mysore','Mysore-Mumbai-Chennai',13000,'12:03','Chennai',80)
/
INSERT INTO FLIGHT (ID,DEPARTURE,FROM_LOCATION,NAME,PRICE,TIME,TO_LOCATION,AVAILABLE_SEATS) VALUES(1152,'2022-04-25','Mysore','Mysore-Tiruvanantpuram-Chennai',14300,'22:40','Chennai',90);
/
COMMIT
/