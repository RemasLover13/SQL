ALTER TABLE PRODUCT
    ADD CONSTRAINT positive_price CHECK ( price > 0 );

ALTER TABLE PRODUCT
    ADD CONSTRAINT less_when_number CHECK ( price > 500000 );
ALTER TABLE CUSTOMER
    ADD COLUMN email VARCHAR(50) NOT NULL default ('@email.ru');

ALTER TABLE CUSTOMER
    ADD CONSTRAINT unique_email UNIQUE (email);
CREATE TABLE PASSPORT
(
    series varchar(4) CHECK ( char_length(series) = 4 ),
    number varchar(6) CHECK ( char_length(number) = 6 ),
    unique (series, number),
    PRIMARY KEY (series, number)
);
