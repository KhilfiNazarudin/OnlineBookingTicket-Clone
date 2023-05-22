-- Name: MOHAMED KHILFI BIN MOHAMED NAZARUDIN
-- AdminNo: 201945D
-- Project: Bus Ticketing System

CREATE DATABASE L2_201945D_Khilfi_Project;
USE L2_201945D_Khilfi_Project ;

CREATE TABLE rewards (
	rewardId VARCHAR(5) NOT NULL,
	rewardType ENUM('BOT MILES', 'CASHBACK') NOT NULL,
	status TINYINT NOT NULL, -- ACT AS BOOLEAN
	PRIMARY KEY (rewardId))
ENGINE = InnoDB;


CREATE TABLE user (
	userId VARCHAR(5) NOT NULL,
    role ENUM('customer', 'admin'),
	fullName VARCHAR(100) NOT NULL,
	email VARCHAR(254) NOT NULL,
	dateOfBirth DATE NOT NULL,
	password VARCHAR(45) NOT NULL,
	hpNumber INT NOT NULL,
	PRIMARY KEY (userId))
ENGINE = InnoDB;


CREATE TABLE user_rewards (
	userId VARCHAR(5) NOT NULL,
	rewardId VARCHAR(5) NOT NULL,
	value INT NOT NULL,
	PRIMARY KEY (userId, rewardId),
	FOREIGN KEY (rewardId)
	REFERENCES rewards (rewardId),
	FOREIGN KEY (userId)
	REFERENCES `user` (userId)
	)
ENGINE = InnoDB;


CREATE TABLE tickets (
	ticketId VARCHAR(5) NOT NULL,
	seating CHAR(3) NOT NULL,
	PRIMARY KEY (ticketId))
ENGINE = InnoDB;


CREATE TABLE operator (
	operatorId VARCHAR(5) NOT NULL,
	operatorName VARCHAR(45) NOT NULL,
	operatorDesc VARCHAR(254) NOT NULL,
	reschedulable TINYINT NOT NULL,
	refundable TINYINT NOT NULL,
	PRIMARY KEY (operatorId))
ENGINE = InnoDB;


-- CREATE TABLE vehicle (
-- 	vehicleId VARCHAR(5) NOT NULL,
-- 	operatorId VARCHAR(5) NOT NULL,
-- 	vehicleNo CHAR(8) NOT NULL,
-- 	vehicleType ENUM('ferry', 'bus', 'train') NOT NULL,
-- 	PRIMARY KEY (vehicleId),
-- 	FOREIGN KEY (operatorId)
-- 	REFERENCES operator (operatorId)
-- 	)
-- ENGINE = InnoDB;


CREATE TABLE services (
	serviceId VARCHAR(5) NOT NULL,
	ticketId VARCHAR(5) NOT NULL,
	-- vehicleId VARCHAR(45) NOT NULL,
	operatorId VARCHAR(5) NOT NULL,
	prices DECIMAL(4,2) NOT NULL,
    origin VARCHAR(45) NOT NULL,
	departingTime TIME NOT NULL,
	departingDate DATE NOT NULL,
	destination VARCHAR(45) NOT NULL,
	PRIMARY KEY (serviceId, ticketId),
	FOREIGN KEY (ticketId)
	REFERENCES tickets (ticketId),
	FOREIGN KEY (operatorId)
	REFERENCES operator (operatorId)
	-- FOREIGN KEY (vehicleId)
-- 	REFERENCES vehicle (vehicleId)
	)
ENGINE = InnoDB;


CREATE TABLE bookings (

	userId VARCHAR(5) NOT NULL,
	ticketId VARCHAR(5) NOT NULL,
	PRIMARY KEY (userId, ticketId),
	FOREIGN KEY (userId)
	REFERENCES user (userId),
	FOREIGN KEY (ticketId)
	REFERENCES tickets (ticketId)
	)
ENGINE = InnoDB;


CREATE TABLE review (
	userId VARCHAR(5) NOT NULL,
	operatorId VARCHAR(5) NOT NULL,
	rating DECIMAL(2,1) NOT NULL,
	review VARCHAR(254) NOT NULL,
	PRIMARY KEY (userId, operatorId),
	FOREIGN KEY (userId)
	REFERENCES user (userId),
	FOREIGN KEY (operatorId)
	REFERENCES operator (operatorId)
	)
ENGINE = InnoDB;

INSERT INTO user
values('U0005','customer','User 5','user5@email.com','1995-05-05','password5','85647890');
INSERT INTO rewards values('R0099','CASHBACK',1);
INSERT INTO rewards values('R0098','CASHBACK',1);
INSERT INTO rewards values('R0097','BOT MILES',0);
INSERT INTO rewards values('R0096','BOT MILES',0);
-- user with rewards
					-- Insert Users
					INSERT INTO user
					values('U0001','customer','User 1','user1@email.com','2000-01-01','password1','81112222');


					-- Insert Rewards
					INSERT INTO rewards
					values('R0001','CASHBACK',1);


					-- INSERT INTO BRIDGING TABLE user_rewards
                    INSERT INTO user_rewards
					values ('U0001','R0001',10);
					INSERT INTO user_rewards
					values ('U0001','R0099',10);
                    INSERT INTO user_rewards
					values ('U0001','R0098',10);

				

-- user with service
					-- Insert Users
					INSERT INTO user
					values('U0002','customer','User 2','user2@email.com','2002-02-02','password2','82223333');

                    
                    -- INSERT ticket
					INSERT INTO tickets
					values ('T0001','A01');

                    
                    -- INSERT operator
					INSERT INTO operator
					values ('O0001','SBS Transit EXPRESS','This sbs transit can bring you outside Singapore',1,1);

                   --  -- INSERT vehicle
-- 					INSERT INTO vehicle
-- 					values ('V0001','O0001','SAB0001X','Bus');
-- 					SELECT * FROM vehicle;
                    
                    -- INSERT services
					INSERT INTO services
					values ('S0001','T0001','O0001',5.5,'Johor','13:30','2022-02-19','Singapore');

                    
                    

					-- Insert into bridging table bookings
					INSERT INTO bookings
					values('U0002','T0001');

						
                    
-- user with review
					-- INSERT user
					INSERT INTO user
					values('U0003','customer','User 3','user3@email.com','2003-03-03','password3','83334444');

                    
                    -- INSERT operator
					INSERT INTO operator
					values ('O0002','Malaysian Transit EXPRESS','This Malaysian transit can bring you outside Malaysia',1,1);

                    
                    INSERT INTO review 
                    values ('U0003','O0002',4,'Malaysian Transit is quite fast to bring me to Singapore');

                    
                    -- INSERT ticket
					INSERT INTO tickets
					values ('T0002','A02');

                    -- service
					INSERT INTO services
					values ('S0006','T0002','O0002',5.5,'Johor','14:30','2022-02-15','Singapore');

                    
                    -- bookings
                    INSERT INTO bookings
					values('U0003','T0002');

                    
                    
-- user with review
-- INSERT user
					INSERT INTO user
					values('U0009','customer','User 9','user9@email.com','2003-03-23','password9','82345123');

                    
                    INSERT INTO review 
                    values ('U0009','O0002',1,'Worst transit ever');

                    -- INSERT ticket
					INSERT INTO tickets
					values ('T0003','A03');

                    
                    -- service
					INSERT INTO services
					values ('S0006','T0003','O0002',5.5,'Johor','14:30','2022-02-15','Singapore');

                    
                    -- bookings
                    INSERT INTO bookings
					values('U0009','T0003');

-- user with review
					-- INSERT user
					INSERT INTO user
					values('U0006','customer','User 6','user6@email.com','2006-06-06','password6','84385373');
                    
                    INSERT INTO review 
                    values ('U0006','O0002',5,'Malaysian transit is the best for me');

                    
                    -- INSERT ticket
					INSERT INTO tickets
					values ('T0004','B01');

                    
                    -- service
					INSERT INTO services
					values ('S0006','T0004','O0002',5.5,'Johor','14:30','2022-02-15','Singapore');

                    
                    -- bookings
                    INSERT INTO bookings
					values('U0006','T0004');

-- user with review
-- INSERT user
					INSERT INTO user
					values('U0010','customer','User 10','user10@email.com','1998-03-03','password10','88374629');

                    INSERT INTO review 
                    values ('U0010','O0002',3,'It is the bare minimum');

                    
                    -- INSERT ticket
					INSERT INTO tickets
					values ('T0005','B02');

                    
                    -- service
					INSERT INTO services
					values ('S0006','T0005','O0002',5.5,'Johor','14:30','2022-02-15','Singapore');

                    -- bookings
                    INSERT INTO bookings
					values('U0010','T0005');

-- user with review
					-- INSERT user
					INSERT INTO user
					values('U0007','customer','User 7','user7@email.com','2000-07-07','password7','83897384');

                    
                    INSERT INTO review 
                    values ('U0007','O0001',5,'SINGAPORE SERVICES IS DA BEST');

                    
                    -- INSERT ticket
					INSERT INTO tickets
					values ('T0006','A01');

                    
                    -- service
					INSERT INTO services
					values ('S0007','T0006','O0001',5.5,'Singapore','15:30','2022-02-15','Johor');

                    
                    -- bookings
                    INSERT INTO bookings
					values('U0007','T0006');

-- user with review
					INSERT INTO user
					values('U0011','customer','User 11','user11@email.com','1991-03-03','password11','82746281');

                    
                    INSERT INTO review 
                    values ('U0011','O0001',1.5,'Should have take Malaysian Express');

                    
                    -- INSERT ticket
					INSERT INTO tickets
					values ('T0007','A02');

                    
                    -- service
					INSERT INTO services
					values ('S0007','T0007','O0001',5.5,'Singapore','15:30','2022-02-15','Johor');

                    
                    -- bookings
                    INSERT INTO bookings
					values('U0011','T0007');
				
-- user with review
					-- INSERT user
					INSERT INTO user
					values('U0008','customer','User 8','user8@email.com','1999-03-03','password8','83847361');

                    
                    INSERT INTO review 
                    values ('U0008','O0001',4,'Similar to Malaysian Express');

                    
                    -- INSERT ticket
					INSERT INTO tickets
					values ('T0008','C01');

                    
                    -- service
					INSERT INTO services
					values ('S0007','T0008','O0001',5.5,'Singapore','15:30','2022-02-15','Johor');

                    
                    -- bookings
                    INSERT INTO bookings
					values('U0008','T0008');

-- user with review
					-- INSERT user
					INSERT INTO user
					values('U0012','customer','User 12','user12@email.com','1980-03-03','password12','87382567');


                    INSERT INTO review 
                    values ('U0012','O0001',5,'Good service');

                    
                    -- INSERT ticket
					INSERT INTO tickets
					values ('T0009','C02');

                    
                    -- service
					INSERT INTO services
					values ('S0007','T0009','O0001',5.5,'Singapore','15:30','2022-02-15','Johor');

                    
                    -- bookings
                    INSERT INTO bookings
					values('U0012','T0009');

-- CREATE 10 TICKETS 
INSERT INTO tickets
values ('T0090','A01');
INSERT INTO tickets
values ('T0091','A02');
INSERT INTO tickets
values ('T0092','A03');
INSERT INTO tickets
values ('T0093','B01');
INSERT INTO tickets
values ('T0094','B02');
INSERT INTO tickets
values ('T0095','B03');
INSERT INTO tickets
values ('T0096','A01');
INSERT INTO tickets
values ('T0097','A01');
INSERT INTO tickets
values ('T0098','A01');
INSERT INTO tickets
values ('T0099','B01');


SELECT * FROM REWARDS;
SELECT * FROM USER;
SELECT * FROM user_rewards;
SELECT * FROM TICKETS;
SELECT * FROM OPERATOR;
SELECT * FROM SERVICES;
SELECT * FROM BOOKINGS;
SELECT * FROM REVIEW;
                    
-- ----------------------------- STORED PROCEDURES AND CALLS -------------------------------------
-- -------------------------------------------------------------------------------------------------   
-- -------------------------------------------------------------------------------------------------
-- SP to REGISTER a USER
-- 3.1
DELIMITER //
CREATE PROCEDURE spRegisterUser(
								in userId VARCHAR(5),
                                in role ENUM('customer', 'admin'),
								in fullName VARCHAR(100),
								in email VARCHAR(254),
								in dateOfBirth Date,
								in password varchar(45),
								in hpNumber int)
	BEGIN
		INSERT INTO user
		values(userId,role,fullName,email,dateOfBirth,password,hpNumber);
	END // 
	DELIMITER ;
	call spRegisterUser('U0004','customer','User 4','user4@email.com','2004-04-04','password4','84445555');
    -- Create an admin
    call spRegisterUser('U9999','admin','administrator','administrator@email.com','1982-09-10','administrator','90067804');
--
-- SP to LOGIN a USER
-- 1.1
DELIMITER //
CREATE PROCEDURE logInUser(
								in id VARCHAR(5),
								in pw varchar(45)
								)
	BEGIN
		SELECT * FROM USER
		WHERE userId = id AND password = pw;
	END // 
	DELIMITER ;
	call logInUser('U0004','password4');

-- -------------------------------------------------------------------------------------------------
-- SP to EDIT PASSWORD 
-- 2.1
DELIMITER //
CREATE PROCEDURE spEditPassword(
								in uid char(5),
								in pw varchar(45)
								)
	BEGIN
		UPDATE user
		SET password = pw
        WHERE userId = uid;
	END // 
	DELIMITER ;
	call spEditPassword('U0001','password4');
 -------------------------------------------------------------------------------------------------
-- SP to REGISTER an OPERATOR
-- 2.3 Admin
DELIMITER //
CREATE PROCEDURE spRegisterOperator(
								in operatorId VARCHAR(5),
								in operatorName VARCHAR(100),
								in operatorDesc VARCHAR(254),
								in rechedulable TINYINT,
                                in refundable TINYINT)
	BEGIN
		INSERT INTO operator
		values(operatorId,operatorName,operatorDesc,rechedulable,refundable);
	END // 
	DELIMITER ;
	call spRegisterOperator('O0003','Johor Express','Anywhere but Johor!',0,0);
    call spRegisterOperator('O0004','Star Busses','GUARANTEED 5 STARS',1,1);
    call spRegisterOperator('O0005','3$ Express','Cheapest you can find',0,0);
-- -------------------------------------------------------------------------------------------------
-- SP to REGISTER a VEHICLE
-- 2.3 Admin
-- DELIMITER //
-- CREATE PROCEDURE spRegisterVehicle(
-- 								in vehicleId VARCHAR(5),
-- 								in operatorId varchar(5),
-- 								in vehicleNo VARCHAR(100),
-- 								in vehicleType ENUM('ferry', 'bus', 'train') 
--                               )
-- 	BEGIN
-- 		
-- 						INSERT INTO vehicle
-- 						values (vehicleId,operatorId,vehicleNo,vehicleType);
-- 	END // 
-- 	DELIMITER ;
-- 	call spRegisterVehicle('V0002','O0002','SAB4444X','Bus');
--     call spRegisterVehicle('V0003','O0003','SBA9123F','Ferry');

-- -------------------------------------------------------------------------------------------------
-- SP to CREATE TICKET
-- 2.3 Admin
DELIMITER //
CREATE PROCEDURE spCreateTicket(
								in ticketId VARCHAR(5),
								in seatings CHAR(3))
	BEGIN
		INSERT INTO tickets
		values(ticketId,seatings);
	END // 
	DELIMITER ;
	-- CREATE 20 MORE TICKETS
    call spCreateTicket('T0070','G01');
	call spCreateTicket('T0071','G02');
	call spCreateTicket('T0072','G03');
	call spCreateTicket('T0073','H01');
	call spCreateTicket('T0074','H02');
	call spCreateTicket('T0075','H03');
	call spCreateTicket('T0076','I01');
	call spCreateTicket('T0077','I02');
	call spCreateTicket('T0078','I03');
	call spCreateTicket('T0079','J01');
	call spCreateTicket('T0080','D01');
	call spCreateTicket('T0081','D02');
	call spCreateTicket('T0082','D03');
	call spCreateTicket('T0083','E01');
	call spCreateTicket('T0084','E02');
	call spCreateTicket('T0085','E03');
	call spCreateTicket('T0086','F01');
	call spCreateTicket('T0087','F02');
	call spCreateTicket('T0088','F03');
	call spCreateTicket('T0089','F01');
-- -------------------------------------------------------------------------------------------------
-- SP to create AVAILABLE SERVICES
-- 2.3 Admin
DELIMITER //
CREATE PROCEDURE spCreateServices(
										in serviceId VARCHAR(5),
										in	ticketId VARCHAR(5) ,
										-- in vehicleId VARCHAR(45),
										in operatorId VARCHAR(5) ,
										in prices DECIMAL(4,2) ,
                                        in origin VARCHAR(45),
										in	departingTime TIME,
										in	departingDate DATE ,
										in	destination VARCHAR(45) 
									)
	BEGIN
		INSERT INTO services
		values(serviceId,ticketId,operatorId,prices,origin,departingTime,departingDate,destination);
	END // 
	DELIMITER ;
	-- CREATE 12 MORE SERVICES-  6 UNIQUE SERVICEES
	call spCreateServices('S0001','T0080','O0002',10,'Singapore','13:30','2022-02-19','Malaysia');
	call spCreateServices('S0001','T0081','O0002',10,'Singapore','13:30','2022-02-19','Malaysia');
	call spCreateServices('S0001','T0082','O0002',10,'Singapore','13:30','2022-02-19','Malaysia');
    
    call spCreateServices('S0003','T0086','O0002',10,'Malaysia','06:00','2022-01-01','Pineng');
    call spCreateServices('S0003','T0087','O0002',10,'Malaysia','06:00','2022-01-01','Pineng');
    call spCreateServices('S0003','T0088','O0002',10,'Malaysia','06:00','2022-01-01','Pineng');
    
	call spCreateServices('S0002','T0083','O0001',15,'Melacca','14:00','2022-02-19','Johor');
	call spCreateServices('S0002','T0084','O0001',15,'Melacca','14:00','2022-02-19','Johor');
	call spCreateServices('S0002','T0085','O0001',15,'Melacca','14:00','2022-02-19','Johor');
    
    call spCreateServices('S0002','T0089','O0001',15,'Johor','17:00','2022-04-01','Melacca');
	call spCreateServices('S0002','T0090','O0001',15,'Johor','17:00','2022-04-01','Melacca');
	call spCreateServices('S0002','T0091','O0001',15,'Johor','17:00','2022-04-01','Melacca');
    
	call spCreateServices('S0004','T0092','O0004',20,'Kuala Lumpur','08:00','2022-03-25','Indonesia');
	call spCreateServices('S0004','T0093','O0004',20,'Kuala Lumpur','08:00','2022-02-19','Indonesia');
	call spCreateServices('S0004','T0094','O0004',20,'Kuala Lumpur','08:00','2022-02-19','Indonesia');
    
    call spCreateServices('S0005','T0095','O0003',15,'Kuala Lumpur','11:00','2022-11-11','Bali');
    call spCreateServices('S0005','T0096','O0003',15,'Kuala Lumpur','11:00','2022-11-11','Bali');
    call spCreateServices('S0005','T0097','O0003',15,'Kuala Lumpur','11:00','2022-11-11','Bali');
-- -------------------------------------------------------------------------------------------------
-- SP for filtered search
-- 5.1 
DELIMITER //
CREATE PROCEDURE spSearchByName(in keyword VARCHAR(254) )
	BEGIN
		SELECT * FROM services as a 
        inner join operator as b
        on a.operatorId = b.operatorId
        WHERE b.operatorName = keyword;
        
	END // 
	DELIMITER ;
call spSearchByName('SBS Transit EXPRESS');
-- -------------------------------------------------------------------------------------------------
-- SP for filtered search
-- 5.3
        
DELIMITER //
CREATE PROCEDURE spSearchByLocation(in keyword VARCHAR(45) )
	BEGIN
		SELECT * FROM services as a 
        inner join operator as b
        on a.operatorId = b.operatorId
        WHERE a.destination = keyword;
        
	END // 
	DELIMITER ;
call spSearchByLocation('Johor');
-- -------------------------------------------------------------------------------------------------
-- SP to BOOK SERVICES   
-- 6.2 
DELIMITER //
CREATE PROCEDURE spBookServices(
								in userId VARCHAR(5) ,
								in ticketId VARCHAR(5) 
                                )
	BEGIN
		INSERT INTO bookings
        values (userId,ticketId);
	END // 
DELIMITER ;
call spBookServices('U0004','T0081');
call spBookServices('U0005','T0092');
call spBookServices('U0005','T0093');
call spBookServices('U0005','T0094');

-- -------------------------------------------------------------------------------------------------
-- SP to CREATE REWARDS
-- 2.3 Admin
DELIMITER //
CREATE PROCEDURE spCreateReward(
								in rewardId VARCHAR(5),
								in rewardType ENUM('BOT MILES', 'CASHBACK'),
                                status TINYINT)
	BEGIN
		INSERT INTO rewards
		values(rewardId,rewardType,status);
	END // 
	DELIMITER ;
	call spCreateReward('R0002','CASHBACK',1);
    call spCreateReward('R0003','BOT MILES',0);
	call spCreateReward('R0004','BOT MILES',0);
-- -------------------------------------------------------------------------------------------------
-- SP to GIVE REWARDS
-- 2.3 Admin
DELIMITER //
CREATE PROCEDURE spGiveReward(
								in userId VARCHAR(5),
								in rewardId VARCHAR(5),
                                value int)
	BEGIN
		INSERT INTO user_rewards
		values(userId,rewardId,value);
	END // 
	DELIMITER ;
    call spGiveReward('U0003','R0002',10);
    call spGiveReward('U0003','R0003',10);
-- -------------------------------------------------------------------------------------------------
-- SP to LEAVE A REVIEW
-- 7
DELIMITER //
CREATE PROCEDURE spLeaveReview(
								in userId VARCHAR(5),
								in operatorId VARCHAR(5),
                                rating DECIMAL(2,1),
                                review varchar(254)
                                )
	BEGIN
		INSERT INTO review
		values(userId,operatorId,rating,review);
	END // 
	DELIMITER ;
    call spLeaveReview('U0002','O0001',9.5,'SINGAPORE EXPRESS IS DA BEST');
    call spLeaveReview('U0004','O0002',5,'SINGAPORE > MALAYSIA EXPRESS');

-- -------------------------------------------------------------------------------------------------
-- ------------------------------------------ VIEWS -----------------------------------------------
-- -------------------------------------------------------------------------------------------------   
-- SHOW ALL USERS THAT HAVE A BOOKING
CREATE VIEW showAllBookings as 
	SELECT ticketId,a.userId,fullName,email,hpNumber from user as a inner join bookings as b
	on a.userId = b.userId;
	SELECT * FROM showAllBookings;
-- -------------------------------------------------------------------------------------------------   
-- SHOW ALL AVAILABLE SERVICES for bookings
CREATE VIEW availableServices AS
SELECT a.ticketId,operatorName,origin,departingDate,departingTime,destination,seating FROM SERVICES as a
	inner join operator as b
	on a.operatorId = b.operatorId
	inner join tickets as c
	on a.ticketId = c.ticketId
	WHERE a.ticketId NOT IN (select ticketId from bookings);
	SELECT * FROM availableServices;
-- -------------------------------------------------------------------------------------------------   
-- SHOW ALL REVIEWS
CREATE VIEW showAllReviews AS
	SELECT c.fullName,c.email,b.operatorName,a.rating,a.review 
	FROM REVIEW AS a inner join operator as b
	on a.operatorId = b.operatorId
	inner join user as c
	on a.userId = c.userId;
	SELECT * FROM showAllReviews;
-- -------------------------------------------------------------------------------------------------   
-- SHOW all tickets THAT ARE UNASSIGNED TO A SERVICE
CREATE VIEW showAllAvailableTicket AS
	SELECT * FROM tickets 
    where ticketId 
    not in ( SELECT ticketId FROM SERVICES);
    SELECT * from showAllAvailableTicket;
-- -------------------------------------------------------------------------------------------------   
-- ----------------------------------- REPORT QUERIES ---------------------------------------------
-- SHOW popular seats

SELECT seating , COUNT(seating) as timesBooked 
FROM tickets where seating in 
( SELECT seating from services as a 
inner join tickets as b 
on a.ticketId = b.ticketId)
GROUP BY seating
ORDER BY timesBooked DESC
LIMIT 1;

-- -------------------------------------------------------------------------------------------------   
-- Show best operator
select a.operatorName, avg(b.rating) as averageRating, count(operatorName) as totalReviewsReceived
from operator as a inner join review as b
on a.operatorId = b.operatorId
group By a.operatorName
ORDER BY averageRating DESC
LIMIT 1;
-- -------------------------------------------------------------------------------------------------   
-- Show best  booked tourist destination
SELECT destination, COUNT(destination) as timesBooked FROM SERVICES as a
inner join bookings as b
on a.ticketId = b.ticketId
GROUP BY DESTINATION
ORDER BY timesBooked DESC
LIMIT 1;
-- -------------------------------------------------------------------------------------------------   
-- Show total money acquired from SOLD tickets of each operator
SELECT c.operatorName, SUM(PRICES) AS totalMoney FROM SERVICES AS A INNER JOIN BOOKINGS AS B ON
A.TICKETID = B.TICKETID
INNER JOIN OPERATOR AS C ON
A.OPERATORID = C.OPERATORID
GROUP BY OPERATORNAME;

-- ------------------------------------------ SEARCH A USER'S BOOKING -----------------------------------------
--



DELIMITER //
CREATE PROCEDURE spSearchUserBookings(
								in userId VARCHAR(5)
                                )
	BEGIN
		SELECT b.ticketId,a.userId,a.fullName,a.hpNumber,
		d.operatorName,c.origin,c.destination,c.departingdate,c.departingTime  from 
		user as a inner join bookings as b
		on a.userId = b.userId
		inner join services as c
		on b.ticketId = c.ticketId
		inner join operator as d
		on c.operatorId = d.operatorId
		WHERE b.userId = userId;
	END // 
	DELIMITER ;
    CALL spSearchUserBookings('U0005');






