CREATE VIEW Produsts_unique_code AS
    SELECT name, unique_code
    FROM PRODUCT, UNIQUE_CODE;


CREATE VIEW Produsers_country AS SELECT
    name, name
    from COUNTRY, PRODUCER
    WITH LOCAL CHECK OPTION;
