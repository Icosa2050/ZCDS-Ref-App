CLASS zcl_table_function_country DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_amdp_marker_hdb .
    CLASS-METHODS get_countries
        FOR TABLE FUNCTION Z_TableFunctionCountry.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_table_function_country IMPLEMENTATION.
  METHOD get_countries
  BY DATABASE FUNCTION FOR HDB
  LANGUAGE SQLSCRIPT
  OPTIONS READ-ONLY
  USING I_Country.
    RETURN
    select distinct
    :P_SAPClient as mandt,
    Country,
    CountryThreeLetterISOCode,
    CountryThreeDigitISOCode,
    CountryISOCode
    FROM
    I_Country
    WHERE
    mandt = :P_SAPClient ;
  ENDMETHOD.
ENDCLASS.
