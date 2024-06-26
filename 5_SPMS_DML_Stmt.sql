------------------------------------------------------Execute below script to insert sample records into the tables-------------------------------
--Execution Order:5
--Execute using: PLADMIN


ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD';
SET AUTOCOMMIT ON;
CLEAR SCREEN;
SET SERVEROUTPUT ON;
--------------------------------Execute below truncate statements if overwrite of existing records are required---------------------------------
/*Truncate statements - Execute in the same order as relationships are already established, clearing the tables in random order would cause inconsistency*/

 
BEGIN 
	EXECUTE IMMEDIATE 'TRUNCATE TABLE FEEDBACK';
    DBMS_OUTPUT.PUT_LINE('FEEDBACK table has been trunacted');
EXCEPTION
    WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('FEEDBACK table doesn''t exist');
END;
/




BEGIN 
	EXECUTE IMMEDIATE 'TRUNCATE TABLE CHECK_IN';
    DBMS_OUTPUT.PUT_LINE('CHECK_IN table has been trunacted');
EXCEPTION
    WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('CHECK_IN table doesn''t exist');
END;
/




BEGIN 
	EXECUTE IMMEDIATE 'TRUNCATE TABLE SLOT_BOOKING';
    DBMS_OUTPUT.PUT_LINE('SLOT_BOOKING table has been trunacted');
EXCEPTION
    WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('SLOT_BOOKING table doesn''t exist');
END;
/





BEGIN 
	EXECUTE IMMEDIATE 'TRUNCATE TABLE PAYMENT';
    DBMS_OUTPUT.PUT_LINE('PAYMENT table has been trunacted');
EXCEPTION
    WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('PAYMENT table doesn''t exist');
END;
/





BEGIN 
	EXECUTE IMMEDIATE 'TRUNCATE TABLE VEHICLE';
    DBMS_OUTPUT.PUT_LINE('VEHICLE table has been trunacted');
EXCEPTION
    WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('VEHICLE table doesn''t exist');
END;
/





BEGIN 
	EXECUTE IMMEDIATE 'TRUNCATE TABLE CUSTOMER';
    DBMS_OUTPUT.PUT_LINE('CUSTOMER table has been trunacted');
EXCEPTION
    WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('CUSTOMER table doesn''t exist');
END;
/





BEGIN 
	EXECUTE IMMEDIATE 'TRUNCATE TABLE PARKING_SLOT';
    DBMS_OUTPUT.PUT_LINE('PARKING_SLOT table has been trunacted');
EXCEPTION
    WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('PARKING_SLOT table doesn''t exist');
END;
/





BEGIN 
	EXECUTE IMMEDIATE 'TRUNCATE TABLE FLOOR';
    DBMS_OUTPUT.PUT_LINE('FLOOR table has been trunacted');
EXCEPTION
    WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('FLOOR table doesn''t exist');
END;
/





BEGIN 
	EXECUTE IMMEDIATE 'TRUNCATE TABLE PARKING_LOT';
    DBMS_OUTPUT.PUT_LINE('PARKING_LOT table has been trunacted');
EXCEPTION
    WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('PARKING_LOT table doesn''t exist');
END;
/




BEGIN 
	EXECUTE IMMEDIATE 'TRUNCATE TABLE ADDRESS';
    DBMS_OUTPUT.PUT_LINE('ADDRESS table has been trunacted');
EXCEPTION
    WHEN OTHERS THEN
		DBMS_OUTPUT.PUT_LINE('ADDRESS table doesn''t exist');
END;
/

----------------------------------Execute below statements to insert sample records into the table------------------------------------------------
/*If executing it for not the first time, please ensure whether the table is truncated before executing*/
/*As these are static inserts please truncate the table first and execute below else will throw error*/

--Insert Statement for ADDRESS table


INSERT INTO ADDRESS VALUES (1, '123 Main St', 'Boston', 'MA', 'USA', '02110', 42.3601, -71.0589);
INSERT INTO ADDRESS VALUES (2, '456 Park Ave', 'New York', 'NY', 'USA', '10001', 40.7128, -74.0060);
INSERT INTO ADDRESS VALUES (3, '789 West St', 'Chicago', 'IL', 'USA', '60604', 41.8781, -87.6298);
INSERT INTO ADDRESS VALUES (4, '101 East Ave', 'San Francisco', 'CA', 'USA', '94102', 37.7749, -122.4194);
INSERT INTO ADDRESS VALUES (5, '202 South Rd', 'Seattle', 'WA', 'USA', '98101', 47.6062, -122.3321);





--Insert Statement for PARKING_LOT table

INSERT INTO PARKING_LOT VALUES (1, 'Downtown Parking', 3.50, 1);
INSERT INTO PARKING_LOT VALUES (2, 'Midtown Garage', 5.00, 2);
INSERT INTO PARKING_LOT VALUES (3, 'City Center Lot', 4.00, 3);
INSERT INTO PARKING_LOT VALUES (4, 'Bay Area Parking', 6.50, 4);
INSERT INTO PARKING_LOT VALUES (5, 'Pike Place Garage', 5.50, 5);






-- Insert Statement for  FLOOR table

-- Downtown Parking Floors
INSERT INTO FLOOR VALUES (1, 'P1', 2.1, 1);
INSERT INTO FLOOR VALUES (2, 'P2', 2.0, 1);

-- Midtown Garage Floors
INSERT INTO FLOOR VALUES (3, 'F1', 2.2, 2);
INSERT INTO FLOOR VALUES (4, 'F2', 2.1, 2);

-- City Center Lot Floors
INSERT INTO FLOOR VALUES (5, '1A', 2.0, 3);
INSERT INTO FLOOR VALUES (6, '1B', 2.2, 3);

-- Bay Area Parking Floors
INSERT INTO FLOOR VALUES (7, 'P1', 2.1, 4);
INSERT INTO FLOOR VALUES (8, 'P2', 2.0, 4);

-- Pike Place Garage Floors
INSERT INTO FLOOR VALUES (9, '1A', 2.2, 5); 
INSERT INTO FLOOR VALUES (10, '2A', 2.1, 5);








-- Insert statement for PARKING_SLOT table

-- Downtown Parking - Floor P1 Slots
INSERT INTO PARKING_SLOT VALUES (1, 'P1-S1', 1);
INSERT INTO PARKING_SLOT VALUES (2, 'P1-S2', 1);
INSERT INTO PARKING_SLOT VALUES (3, 'P1-S3', 1); 
INSERT INTO PARKING_SLOT VALUES (4, 'P1-S4', 1); 
INSERT INTO PARKING_SLOT VALUES (5, 'P1-S5', 1);

-- Downtown Parking - Floor P2 Slots
INSERT INTO PARKING_SLOT VALUES (6, 'P2-S1', 2);
INSERT INTO PARKING_SLOT VALUES (7, 'P2-S2', 2); 
INSERT INTO PARKING_SLOT VALUES (8, 'P2-S3', 2); 
INSERT INTO PARKING_SLOT VALUES (9, 'P2-S4', 2); 
INSERT INTO PARKING_SLOT VALUES (10, 'P2-S5', 2);

-- Midtown Garage - Floor F1 Slots
INSERT INTO PARKING_SLOT VALUES (11, 'F1-S1', 3); 
INSERT INTO PARKING_SLOT VALUES (12, 'F1-S2', 3); 
INSERT INTO PARKING_SLOT VALUES (13, 'F1-S3', 3); 
INSERT INTO PARKING_SLOT VALUES (14, 'F1-S4', 3); 
INSERT INTO PARKING_SLOT VALUES (15, 'F1-S5', 3);

-- Midtown Garage - Floor F2 Slots
INSERT INTO PARKING_SLOT VALUES (16, 'F2-S1', 4); 
INSERT INTO PARKING_SLOT VALUES (17, 'F2-S2', 4); 
INSERT INTO PARKING_SLOT VALUES (18, 'F2-S3', 4); 
INSERT INTO PARKING_SLOT VALUES (19, 'F2-S4', 4); 
INSERT INTO PARKING_SLOT VALUES (20, 'F2-S5', 4);

-- City Center Lot - Floor 1A Slots
INSERT INTO PARKING_SLOT VALUES (21, '1A-S1', 5); 
INSERT INTO PARKING_SLOT VALUES (22, '1A-S2', 5); 
INSERT INTO PARKING_SLOT VALUES (23, '1A-S3', 5); 
INSERT INTO PARKING_SLOT VALUES (24, '1A-S4', 5); 
INSERT INTO PARKING_SLOT VALUES (25, '1A-S5', 5);

-- City Center Lot - Floor 1B Slots
INSERT INTO PARKING_SLOT VALUES (26, '1B-S1', 6); 
INSERT INTO PARKING_SLOT VALUES (27, '1B-S2', 6); 
INSERT INTO PARKING_SLOT VALUES (28, '1B-S3', 6); 
INSERT INTO PARKING_SLOT VALUES (29, '1B-S4', 6); 
INSERT INTO PARKING_SLOT VALUES (30, '1B-S5', 6);

-- Bay Area Parking - Floor P1 Slots
INSERT INTO PARKING_SLOT VALUES (31, 'P1-S1', 7); 
INSERT INTO PARKING_SLOT VALUES (32, 'P1-S2', 7); 
INSERT INTO PARKING_SLOT VALUES (33, 'P1-S3', 7); 
INSERT INTO PARKING_SLOT VALUES (34, 'P1-S4', 7); 
INSERT INTO PARKING_SLOT VALUES (35, 'P1-S5', 7);

-- Bay Area Parking - Floor P2 Slots
INSERT INTO PARKING_SLOT VALUES (36, 'P2-S1', 8); 
INSERT INTO PARKING_SLOT VALUES (37, 'P2-S2', 8); 
INSERT INTO PARKING_SLOT VALUES (38, 'P2-S3', 8); 
INSERT INTO PARKING_SLOT VALUES (39, 'P2-S4', 8); 
INSERT INTO PARKING_SLOT VALUES (40, 'P2-S5', 8);

-- Pike Place Garage - Floor 1A Slots
INSERT INTO PARKING_SLOT VALUES (41, '1A-S1', 9); 
INSERT INTO PARKING_SLOT VALUES (42, '1A-S2', 9); 
INSERT INTO PARKING_SLOT VALUES (43, '1A-S3', 9); 
INSERT INTO PARKING_SLOT VALUES (44, '1A-S4', 9); 
INSERT INTO PARKING_SLOT VALUES (45, '1A-S5', 9);

-- Pike Place Garage - Floor 2A Slots
INSERT INTO PARKING_SLOT VALUES (46, '2A-S1', 10); 
INSERT INTO PARKING_SLOT VALUES (47, '2A-S2', 10); 
INSERT INTO PARKING_SLOT VALUES (48, '2A-S3', 10); 
INSERT INTO PARKING_SLOT VALUES (49, '2A-S4', 10); 
INSERT INTO PARKING_SLOT VALUES (50, '2A-S5', 10);









--Insert statement for CUSTOMER table

INSERT INTO CUSTOMER VALUES (1, 'John', 'Doe', 'john.doe@example.com', 'hashed_password_1', '99955-12345');
INSERT INTO CUSTOMER VALUES (2, 'Jane', 'Smith', 'jane.smith@example.com', 'hashed_password_2', '99555-56789');
INSERT INTO CUSTOMER VALUES (3, 'Bob', 'Brown', 'bob.brown@example.com', 'hashed_password_3', '99555-91011');
INSERT INTO CUSTOMER VALUES (4, 'Alice', 'Johnson', 'alice.johnson@example.com', 'hashed_password_4', '99555-11223');
INSERT INTO CUSTOMER VALUES (5, 'Charlie', 'Davis', 'charlie.davis@example.com', 'hashed_password_5', '99555-33442');
INSERT INTO CUSTOMER VALUES (6, 'Eva', 'Green', 'eva.green@example.com', 'hashed_password_6', '77555-77881');
INSERT INTO CUSTOMER VALUES (7, 'Frank', 'Wright', 'frank.wright@example.com', 'hashed_password_7', '88555-99881');
INSERT INTO CUSTOMER VALUES (8, 'Grace', 'Hopper', 'grace.hopper@example.com', 'hashed_password_8', '88555-67671');
INSERT INTO CUSTOMER VALUES (9, 'Henry', 'Ford', 'henry.ford@example.com', 'hashed_password_9', '88555-45453');
INSERT INTO CUSTOMER VALUES (10, 'Irene', 'Adler', 'irene.adler@example.com', 'hashed_password_10', '99555-23231');
INSERT INTO CUSTOMER VALUES (11, 'Jack', 'Sparrow', 'jack.sparrow@example.com', 'hashed_password_11', '77555-34342');
INSERT INTO CUSTOMER VALUES (12, 'Kara', 'Thrace', 'kara.thrace@example.com', 'hashed_password_12', '66555-56562');
INSERT INTO CUSTOMER VALUES (13, 'Liam', 'Neeson', 'liam.neeson@example.com', 'hashed_password_13', '66555-78728');
INSERT INTO CUSTOMER VALUES (14, 'Mia', 'Wallace', 'mia.wallace@example.com', 'hashed_password_14', '77555-90901');
INSERT INTO CUSTOMER VALUES (15, 'Nathan', 'Drake', 'nathan.drake@example.com', 'hashed_password_15', '77555-12121');
INSERT INTO CUSTOMER VALUES (16, 'Olivia', 'Benson', 'olivia.benson@example.com', 'hashed_password_16', '81888-34345');
INSERT INTO CUSTOMER VALUES (17, 'Peter', 'Parker', 'peter.parker@example.com', 'hashed_password_17', '91888-56562');
INSERT INTO CUSTOMER VALUES (18, 'Quinn', 'Fabray', 'quinn.fabray@example.com', 'hashed_password_18', '91789-78783');
INSERT INTO CUSTOMER VALUES (19, 'Rachel', 'Green', 'rachel.green@example.com', 'hashed_password_19', '88999-90901');
INSERT INTO CUSTOMER VALUES (20, 'Steve', 'Rogers', 'steve.rogers@example.com', 'hashed_password_20', '77444-10102');








--Insert statement for VEHICLE table

INSERT INTO VEHICLE VALUES (1, 'ABCD1234', 1);
INSERT INTO VEHICLE VALUES (2, 'EFGH5678', 2);
INSERT INTO VEHICLE VALUES (3, 'IJKL9101', 3);
INSERT INTO VEHICLE VALUES (4, 'MNOP1122', 4);
INSERT INTO VEHICLE VALUES (5, 'QRST3344', 5);
INSERT INTO VEHICLE VALUES (6, 'UVWX7788', 6);
INSERT INTO VEHICLE VALUES (7, 'YZAB9988', 7);
INSERT INTO VEHICLE VALUES (8, 'CDEF6767', 8);
INSERT INTO VEHICLE VALUES (9, 'GHIJ4545', 9);
INSERT INTO VEHICLE VALUES (10, 'KLMN2323', 10);
INSERT INTO VEHICLE VALUES (11, 'OPQR3434', 11);
INSERT INTO VEHICLE VALUES (12, 'STUV5656', 12);
INSERT INTO VEHICLE VALUES (13, 'WXYZ7878', 13);
INSERT INTO VEHICLE VALUES (14, 'ABEF9090', 14);
INSERT INTO VEHICLE VALUES (15, 'CJKT1212', 15);
INSERT INTO VEHICLE VALUES (16, 'DLMN3434', 16);
INSERT INTO VEHICLE VALUES (17, 'EOPQ5656', 17);
INSERT INTO VEHICLE VALUES (18, 'FQRS7878', 18);
INSERT INTO VEHICLE VALUES (19, 'GHIT9090', 19);
INSERT INTO VEHICLE VALUES (20, 'JKLM1010', 20);








-- Insert Statement for PAYMENTS table

INSERT INTO PAYMENT VALUES (1, 'CREDIT', TO_DATE('2024-03-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 20.00);
INSERT INTO PAYMENT VALUES (2, 'DEBIT', TO_DATE('2024-03-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 15.00);
INSERT INTO PAYMENT VALUES (3, 'CREDIT', TO_DATE('2024-03-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 18.00);
INSERT INTO PAYMENT VALUES (4, 'DEBIT', TO_DATE('2024-03-01 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 22.00);
INSERT INTO PAYMENT VALUES (5, 'CREDIT', TO_DATE('2024-03-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 25.00);
INSERT INTO PAYMENT VALUES (6, 'DEBIT', TO_DATE('2024-03-01 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 12.00);
INSERT INTO PAYMENT VALUES (7, 'CREDIT', TO_DATE('2024-03-02 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 19.00);
INSERT INTO PAYMENT VALUES (8, 'DEBIT', TO_DATE('2024-03-02 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 17.00);
INSERT INTO PAYMENT VALUES (9, 'CREDIT', TO_DATE('2024-03-02 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 16.00);
INSERT INTO PAYMENT VALUES (10, 'DEBIT', TO_DATE('2024-03-02 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 21.00);
INSERT INTO PAYMENT VALUES (11, 'CREDIT', TO_DATE('2024-03-02 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 23.00);
INSERT INTO PAYMENT VALUES (12, 'DEBIT', TO_DATE('2024-03-02 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 14.00);
INSERT INTO PAYMENT VALUES (13, 'CREDIT', TO_DATE('2024-03-03 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 20.00);
INSERT INTO PAYMENT VALUES (14, 'DEBIT', TO_DATE('2024-03-03 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 18.00);
INSERT INTO PAYMENT VALUES (15, 'CREDIT', TO_DATE('2024-03-03 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 22.00);
INSERT INTO PAYMENT VALUES (16, 'DEBIT', TO_DATE('2024-03-03 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 20.00);
INSERT INTO PAYMENT VALUES (17, 'CREDIT', TO_DATE('2024-03-03 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 19.00);
INSERT INTO PAYMENT VALUES (18, 'DEBIT', TO_DATE('2024-03-03 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 15.00);
INSERT INTO PAYMENT VALUES (19, 'CREDIT', TO_DATE('2024-03-04 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 24.00);
INSERT INTO PAYMENT VALUES (20, 'DEBIT', TO_DATE('2024-03-04 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 16.00);
INSERT INTO PAYMENT VALUES (21, 'CREDIT', TO_DATE('2024-03-04 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 21.00);
INSERT INTO PAYMENT VALUES (22, 'DEBIT', TO_DATE('2024-03-04 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 23.00);
INSERT INTO PAYMENT VALUES (23, 'CREDIT', TO_DATE('2024-03-04 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 20.00);
INSERT INTO PAYMENT VALUES (24, 'DEBIT', TO_DATE('2024-03-04 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 22.00);
INSERT INTO PAYMENT VALUES (25, 'CREDIT', TO_DATE('2024-03-05 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), 18.00);
INSERT INTO PAYMENT VALUES (26, 'DEBIT', TO_DATE('2024-03-05 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), 24.00);
INSERT INTO PAYMENT VALUES (27, 'CREDIT', TO_DATE('2024-03-05 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), 17.00);
INSERT INTO PAYMENT VALUES (28, 'DEBIT', TO_DATE('2024-03-05 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), 19.00);
INSERT INTO PAYMENT VALUES (29, 'CREDIT', TO_DATE('2024-03-05 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 23.00);
INSERT INTO PAYMENT VALUES (30, 'DEBIT', TO_DATE('2024-03-05 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 21.00);








-- Insert Statement for SLOT BOOKING TABLE

INSERT INTO SLOT_BOOKING VALUES (1, TO_DATE('2024-03-01 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 1, 1, 1);
INSERT INTO SLOT_BOOKING VALUES (2, TO_DATE('2024-03-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-01 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 2, 2, 2);
INSERT INTO SLOT_BOOKING VALUES (3, TO_DATE('2024-03-01 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-01 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3, 3, 3);
INSERT INTO SLOT_BOOKING VALUES (4, TO_DATE('2024-03-01 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-01 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 4, 4, 4);
INSERT INTO SLOT_BOOKING VALUES (5, TO_DATE('2024-03-01 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-01 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 5, 5, 5);
INSERT INTO SLOT_BOOKING VALUES (6, TO_DATE('2024-03-01 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-01 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 6, 6, 6);
INSERT INTO SLOT_BOOKING VALUES (7, TO_DATE('2024-03-02 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-02 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 7, 7, 7);
INSERT INTO SLOT_BOOKING VALUES (8, TO_DATE('2024-03-02 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-02 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 8, 8, 8);
INSERT INTO SLOT_BOOKING VALUES (9, TO_DATE('2024-03-02 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-02 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 9, 9, 9);
INSERT INTO SLOT_BOOKING VALUES (10, TO_DATE('2024-03-02 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-02 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 10, 10, 10);
INSERT INTO SLOT_BOOKING VALUES (11, TO_DATE('2024-03-02 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-02 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 11, 11, 11);
INSERT INTO SLOT_BOOKING VALUES (12, TO_DATE('2024-03-02 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-02 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 12, 12, 12);
INSERT INTO SLOT_BOOKING VALUES (13, TO_DATE('2024-03-03 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-03 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 13, 13, 13);
INSERT INTO SLOT_BOOKING VALUES (14, TO_DATE('2024-03-03 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-03 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 14, 14, 14);
INSERT INTO SLOT_BOOKING VALUES (15, TO_DATE('2024-03-03 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-03 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 15, 15, 15);
INSERT INTO SLOT_BOOKING VALUES (16, TO_DATE('2024-03-03 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-03 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 16, 16, 16);
INSERT INTO SLOT_BOOKING VALUES (17, TO_DATE('2024-03-03 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-03 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 17, 17, 17);
INSERT INTO SLOT_BOOKING VALUES (18, TO_DATE('2024-03-03 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-03 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 18, 18, 18);
INSERT INTO SLOT_BOOKING VALUES (19, TO_DATE('2024-03-04 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-04 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 19, 19, 19);
INSERT INTO SLOT_BOOKING VALUES (20, TO_DATE('2024-03-04 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-04 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 20, 20, 20);
INSERT INTO SLOT_BOOKING VALUES (21, TO_DATE('2024-03-04 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-04 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 21, 1, 1);
INSERT INTO SLOT_BOOKING VALUES (22, TO_DATE('2024-03-04 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-04 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 22, 2, 2);
INSERT INTO SLOT_BOOKING VALUES (23, TO_DATE('2024-03-04 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-04 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 23, 3, 3);
INSERT INTO SLOT_BOOKING VALUES (24, TO_DATE('2024-03-04 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-04 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 24, 4, 4);
INSERT INTO SLOT_BOOKING VALUES (25, TO_DATE('2024-03-05 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-05 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), 25, 5, 5);
INSERT INTO SLOT_BOOKING VALUES (26, TO_DATE('2024-03-05 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-05 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), 26, 6, 6);
INSERT INTO SLOT_BOOKING VALUES (27, TO_DATE('2024-03-05 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-05 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 27,7, 7);
INSERT INTO SLOT_BOOKING VALUES (28, TO_DATE('2024-03-05 11:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-05 15:00:00', 'YYYY-MM-DD HH24:MI:SS'), 28, 8, 8);
INSERT INTO SLOT_BOOKING VALUES (29, TO_DATE('2024-03-05 12:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-05 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 29, 9, 9);
INSERT INTO SLOT_BOOKING VALUES (30, TO_DATE('2024-03-05 13:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-05 17:00:00', 'YYYY-MM-DD HH24:MI:SS'), 30, 10, 10);






-- Insert statement for CHECKIN table

INSERT INTO CHECK_IN VALUES (1, TO_DATE('2024-03-01 08:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-01 11:50:00', 'YYYY-MM-DD HH24:MI:SS'), 1);
INSERT INTO CHECK_IN VALUES (2, TO_DATE('2024-03-01 09:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-01 13:05:00', 'YYYY-MM-DD HH24:MI:SS'), 2);
INSERT INTO CHECK_IN VALUES (3, TO_DATE('2024-03-01 10:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-01 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), 3);
INSERT INTO CHECK_IN VALUES (4, TO_DATE('2024-03-01 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-01 15:10:00', 'YYYY-MM-DD HH24:MI:SS'), 4);
INSERT INTO CHECK_IN VALUES (5, TO_DATE('2024-03-01 12:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-01 16:20:00', 'YYYY-MM-DD HH24:MI:SS'), 5);
INSERT INTO CHECK_IN VALUES (6, TO_DATE('2024-03-02 08:05:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-02 12:15:00', 'YYYY-MM-DD HH24:MI:SS'), 7);
INSERT INTO CHECK_IN VALUES (7, TO_DATE('2024-03-02 09:25:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-02 13:30:00', 'YYYY-MM-DD HH24:MI:SS'), 8);
INSERT INTO CHECK_IN VALUES (8, TO_DATE('2024-03-02 10:35:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-02 14:45:00', 'YYYY-MM-DD HH24:MI:SS'), 9);
INSERT INTO CHECK_IN VALUES (9, TO_DATE('2024-03-02 11:40:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-02 15:50:00', 'YYYY-MM-DD HH24:MI:SS'), 10);
INSERT INTO CHECK_IN VALUES (10, TO_DATE('2024-03-02 12:55:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-02 16:05:00', 'YYYY-MM-DD HH24:MI:SS'), 11);
INSERT INTO CHECK_IN VALUES (11, TO_DATE('2024-03-03 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-03 11:40:00', 'YYYY-MM-DD HH24:MI:SS'), 13);
INSERT INTO CHECK_IN VALUES (12, TO_DATE('2024-03-03 09:10:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-03 13:20:00', 'YYYY-MM-DD HH24:MI:SS'), 14);
INSERT INTO CHECK_IN VALUES (13, TO_DATE('2024-03-03 10:25:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-03 14:35:00', 'YYYY-MM-DD HH24:MI:SS'), 15);
INSERT INTO CHECK_IN VALUES (14, TO_DATE('2024-03-03 11:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-03 15:40:00', 'YYYY-MM-DD HH24:MI:SS'), 16);
INSERT INTO CHECK_IN VALUES (15, TO_DATE('2024-03-03 12:45:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-03 16:55:00', 'YYYY-MM-DD HH24:MI:SS'), 17);
INSERT INTO CHECK_IN VALUES (16, TO_DATE('2024-03-04 08:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-04 12:25:00', 'YYYY-MM-DD HH24:MI:SS'), 19);
INSERT INTO CHECK_IN VALUES (17, TO_DATE('2024-03-04 09:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-04 13:30:00', 'YYYY-MM-DD HH24:MI:SS'), 20);
INSERT INTO CHECK_IN VALUES (18, TO_DATE('2024-03-04 10:30:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-04 14:40:00', 'YYYY-MM-DD HH24:MI:SS'), 21);
INSERT INTO CHECK_IN VALUES (19, TO_DATE('2024-03-04 11:35:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-04 15:45:00', 'YYYY-MM-DD HH24:MI:SS'), 22);
INSERT INTO CHECK_IN VALUES (20, TO_DATE('2024-03-04 12:50:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-04 16:00:00', 'YYYY-MM-DD HH24:MI:SS'), 23);
INSERT INTO CHECK_IN VALUES (21, TO_DATE('2024-03-05 08:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-05 12:10:00', 'YYYY-MM-DD HH24:MI:SS'), 24);
INSERT INTO CHECK_IN VALUES (22, TO_DATE('2024-03-05 09:15:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-05 13:25:00', 'YYYY-MM-DD HH24:MI:SS'), 25);
INSERT INTO CHECK_IN VALUES (23, TO_DATE('2024-03-05 10:20:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-05 14:30:00', 'YYYY-MM-DD HH24:MI:SS'), 26);
INSERT INTO CHECK_IN VALUES (24, TO_DATE('2024-03-05 11:35:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-05 15:45:00', 'YYYY-MM-DD HH24:MI:SS'), 27);
INSERT INTO CHECK_IN VALUES (25, TO_DATE('2024-03-05 12:40:00', 'YYYY-MM-DD HH24:MI:SS'), TO_DATE('2024-03-05 16:50:00', 'YYYY-MM-DD HH24:MI:SS'), 28);









--Insert statement for Feedback

INSERT INTO FEEDBACK VALUES (1, 5, 'Exceptionally convenient and well-organized.', 1);
INSERT INTO FEEDBACK VALUES (2, 4, 'Very good location, easy access.', 3);
INSERT INTO FEEDBACK VALUES (3, 3, 'Adequate space, but a bit expensive.', 5);
INSERT INTO FEEDBACK VALUES (4, 5, 'Outstanding service, very secure.', 6);
INSERT INTO FEEDBACK VALUES (5, 2, 'Difficult to find a spot, not well-signed.', 8);
INSERT INTO FEEDBACK VALUES (6, 5, 'Perfect experience, will recommend!', 10);
INSERT INTO FEEDBACK VALUES (7, 3, 'Okay, but could be cleaner.', 12);
INSERT INTO FEEDBACK VALUES (8, 4, 'Great app, easy booking and payment.', 14);
INSERT INTO FEEDBACK VALUES (9, 1, 'Had some issues with the check-in process.', 16);
INSERT INTO FEEDBACK VALUES (10, 4, 'Convenient location, fair pricing.', 18);
INSERT INTO FEEDBACK VALUES (11, 5, 'Effortless parking, very friendly staff.', 20);
INSERT INTO FEEDBACK VALUES (12, 3, 'Average experience, nothing special.', 22);
INSERT INTO FEEDBACK VALUES (13, 2, 'Parking lot was full, had to wait.', 24);




