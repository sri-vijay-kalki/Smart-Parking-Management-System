SET
SERVEROUTPUT ON
CLEAR SCREEN;

CREATE
OR REPLACE PACKAGE spms_manager_management_pkg AS

        -- Declare custom exceptions for each column
    invalid_name EXCEPTION;
    invalid_street_address
EXCEPTION;
    invalid_city
EXCEPTION;
    invalid_state
EXCEPTION;
    invalid_country
EXCEPTION;
    invalid_zip_code
EXCEPTION;
    invalid_latitude
EXCEPTION;
    invalid_longitude
EXCEPTION;
    invalid_pricing_per_hour
EXCEPTION;
    invalid_floor_level
EXCEPTION;
    invalid_max_height
EXCEPTION;
    invalid_slot_name
EXCEPTION;

    -- Declare custom exceptions for length validation
    invalid_name_length
EXCEPTION;
    invalid_street_address_length
EXCEPTION;
    invalid_city_length
EXCEPTION;
    invalid_state_length
EXCEPTION;
    invalid_country_length
EXCEPTION;
    invalid_zip_code_length
EXCEPTION;
    invalid_floor_level_length
EXCEPTION;
    invalid_slot_name_length
EXCEPTION;

    --other validations
    address_already_exists
EXCEPTION;
    parking_lot_already_exists
EXCEPTION;
    already_address_exists_with_lat_long
EXCEPTION;
    null_input
EXCEPTION;
    address_not_exists
EXCEPTION;
    parking_lot_not_exists
EXCEPTION;

    PROCEDURE spms_add_parking_lot (
        p_name             VARCHAR,
        p_street_address   VARCHAR,
        p_city             VARCHAR,
        p_state            VARCHAR,
        p_country          VARCHAR,
        p_zip_code         VARCHAR,
        p_latitude         DECIMAL,
        p_longitude        DECIMAL,
        p_pricing_per_hour DECIMAL
    );

    PROCEDURE spms_add_floor (
        p_parking_lot_name VARCHAR,
        p_street_address   VARCHAR,
        p_city             VARCHAR,
        p_zip_code         VARCHAR,
        p_floor_level      VARCHAR,
        p_max_height       DECIMAL
    );

    PROCEDURE spms_add_parking_slot (
        p_parking_lot_name VARCHAR,
        p_street_address   VARCHAR,
        p_city             VARCHAR,
        p_zip_code         VARCHAR,
        p_floor_level      VARCHAR,
        p_slot_name        VARCHAR
    );


END spms_manager_management_pkg;
/


CREATE
OR REPLACE PACKAGE BODY spms_manager_management_pkg AS

    PROCEDURE spms_add_parking_lot (
        p_name             VARCHAR,
        p_street_address   VARCHAR,
        p_city             VARCHAR,
        p_state            VARCHAR,
        p_country          VARCHAR,
        p_zip_code         VARCHAR,
        p_latitude         DECIMAL,
        p_longitude        DECIMAL,
        p_pricing_per_hour DECIMAL
    ) AS
        v_address_id     NUMBER;
        v_parking_lot_id
NUMBER;
        v_name
VARCHAR(100);
        v_street_address
VARCHAR(50);
        v_city
VARCHAR(20);
        v_state
VARCHAR(20);
        v_country
VARCHAR(20);
        v_zip_code
VARCHAR(10);
        v_next_address_id
NUMBER;
BEGIN
        -- Trim string values
        v_name
:= upper(trim(p_name));
        v_street_address
:= upper(trim(p_street_address));
        v_city
:= upper(trim(p_city));
        v_state
:= upper(trim(p_state));
        v_country
:= upper(trim(p_country));
        v_zip_code
:= upper(trim(p_zip_code));

        -- Validate inputs
        IF
v_name IS NULL OR v_street_address IS NULL OR v_city IS NULL OR v_state IS NULL OR v_country IS NULL OR v_zip_code IS NULL
            OR p_pricing_per_hour IS NULL THEN
            raise null_input;
            --raise_application_error(-20001, 'All fields are required.');
END IF;

        IF
LENGTH(v_name) > 50 THEN
            raise invalid_name_length;
END IF;

        IF
LENGTH(v_street_address) > 50 THEN
            raise invalid_street_address_length;
END IF;

        IF
LENGTH(v_state) > 20 THEN
            raise invalid_state_length;
END IF;

        IF
LENGTH(v_country) > 20 THEN
            raise invalid_country_length;
END IF;

        IF
LENGTH(v_zip_code) > 10 THEN
            raise invalid_zip_code_length;
END IF;

        IF
LENGTH(v_city) > 20 THEN
            raise invalid_city_length;
END IF;


        IF
NOT regexp_like(v_street_address, '^.+$') THEN
            raise invalid_street_address;
END IF;

      --Regex validation for city
        IF
NOT regexp_like(v_city, '^[A-Za-z]+(?:\s+[A-Za-z]+)*$') THEN
            raise invalid_city;
END IF;
--


        -- Regex validation
        IF
NOT regexp_like(v_zip_code, '^\d{5}(-\d{4})?$') THEN
            raise invalid_zip_code;
END IF;

        IF
p_latitude < -90 OR p_latitude > 90 THEN
            raise invalid_latitude;
END IF;

        IF
p_longitude < -180 OR p_longitude > 180 THEN
            raise invalid_longitude;
END IF;

        IF
p_pricing_per_hour < 0 OR p_pricing_per_hour > 999.99 THEN
            raise invalid_pricing_per_hour;
END IF;

        -- Get the next value of the address sequence
SELECT address_val.NEXTVAL
INTO v_next_address_id
FROM dual;

-- Check if address already exists
BEGIN
SELECT address_id
INTO v_address_id
FROM address
WHERE street_address = v_street_address
  AND city = v_city
  AND state = v_state
  AND country = v_country
  AND zip_code = v_zip_code;

EXCEPTION
            WHEN no_data_found THEN
                v_address_id := NULL; -- Set v_address_id to NULL if no data found
END;

        IF
v_address_id IS NOT NULL THEN
            raise address_already_exists;
            --raise_application_error(-20002, 'Address already exists.');
END IF;

        -- Check if latitude and longitude are unique
BEGIN
SELECT COUNT(*)
INTO v_address_id
FROM address
WHERE latitude = p_latitude
  AND longitude = p_longitude;

-- If no rows are found, set v_address_id to 0
IF
v_address_id IS NULL THEN
                v_address_id := 0;
END IF;
EXCEPTION
            WHEN no_data_found THEN
                v_address_id := 0;
END;

        IF
v_address_id > 0 THEN
            raise already_address_exists_with_lat_long;
            --raise_application_error(-20003, 'Latitude and longitude should be unique.');
END IF;

        -- Insert new address
INSERT INTO address (address_id,
                     street_address,
                     city,
                     state,
                     country,
                     zip_code,
                     latitude,
                     longitude)
VALUES (v_next_address_id,
        v_street_address,
        v_city,
        v_state,
        v_country,
        v_zip_code,
        p_latitude,
        p_longitude);

-- Insert new parking lot
BEGIN
SELECT parking_lot_id
INTO v_parking_lot_id
FROM parking_lot
WHERE name = v_name
  AND address_id = v_next_address_id;

EXCEPTION
            WHEN no_data_found THEN
                v_parking_lot_id := NULL; -- Set v_parking_lot_id to NULL if no data found
END;

        IF
v_parking_lot_id IS NOT NULL THEN
            raise parking_lot_already_exists;
            --raise_application_error(-20004, 'Parking lot already exists with the same name and address.');
END IF;

INSERT INTO parking_lot (parking_lot_id,
                         name,
                         address_id,
                         pricing_per_hour)
VALUES (parking_lot_id_val.NEXTVAL,
        v_name,
        v_next_address_id,
        p_pricing_per_hour);

COMMIT;
EXCEPTION
        WHEN invalid_zip_code THEN
            DBMS_OUTPUT.PUT_LINE('Invalid zip code format');
WHEN invalid_latitude THEN
            DBMS_OUTPUT.PUT_LINE('Invalid latitude. Latitude must be between -90 and 90.');
WHEN invalid_longitude THEN
            DBMS_OUTPUT.PUT_LINE('Invalid longitude. Longitude must be between -180 and 180.');
WHEN invalid_pricing_per_hour THEN
            DBMS_OUTPUT.PUT_LINE('Invalid pricing per hour. Must be between 0 and 999.99.');
WHEN invalid_street_address THEN
            DBMS_OUTPUT.PUT_LINE('Invalid Street Address');
WHEN invalid_city THEN
            DBMS_OUTPUT.PUT_LINE('Invalid city format.');
WHEN invalid_city_length THEN
            DBMS_OUTPUT.PUT_LINE('Invalid city length, max length 20');
WHEN invalid_name_length THEN
            DBMS_OUTPUT.PUT_LINE('Parking lot name length exceeded the maximum length 50');
WHEN invalid_name THEN
            DBMS_OUTPUT.PUT_LINE('Invalid Parkling lot name format');
WHEN invalid_street_address_length THEN
            DBMS_OUTPUT.PUT_LINE('Street address length exceeded the maximum length 50');
WHEN invalid_state_length THEN
            DBMS_OUTPUT.PUT_LINE('State length exceeded the maximum length 20');
WHEN invalid_zip_code_length THEN
            DBMS_OUTPUT.PUT_LINE('Zip Code length exceeded the maximum length 10');
WHEN invalid_country_length THEN
            DBMS_OUTPUT.PUT_LINE('Country length exceeded the maximum length 20');
WHEN address_already_exists THEN
            DBMS_OUTPUT.PUT_LINE('Address already exists');
WHEN parking_lot_already_exists THEN
            DBMS_OUTPUT.PUT_LINE('Parking lot already exists with the same name and address.');
WHEN already_address_exists_with_lat_long THEN
            DBMS_OUTPUT.PUT_LINE('Already an address exists lat/long, Latitude and longitude should be unique.');
WHEN null_input THEN
            DBMS_OUTPUT.PUT_LINE('Please provide a valid input for the fields, All fields are required');

WHEN OTHERS THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE
('Not able to add parking lot details');
            RAISE; -- Re-raise the exception to the calling code

END spms_add_parking_lot;

END spms_manager_management_pkg;
/
