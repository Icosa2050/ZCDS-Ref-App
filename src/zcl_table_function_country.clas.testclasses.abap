*"* use this source file for your ABAP unit test classes
CLASS ltcl_ DEFINITION FINAL FOR TESTING
  DURATION SHORT
  RISK LEVEL HARMLESS.
  PUBLIC SECTION.
  PRIVATE SECTION.
    METHODS:
      all_test FOR TESTING RAISING cx_static_check,
      de_test FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS ltcl_ IMPLEMENTATION.

  METHOD all_test.
**********************************************************************
*cannot call table function directly
**********************************************************************
    DATA lt_data TYPE tt_country.
    SELECT
       z_countryviatablefunction~country,
       z_countryviatablefunction~countrythreeletterisocode,
       z_countryviatablefunction~countrythreedigitisocode,
       z_countryviatablefunction~countryisocode,
       z_countryviatablefunction~countryname,
       z_countryviatablefunction~countrycurrency
     FROM
      z_countryviatablefunction INTO TABLE @lt_data up to 10 Rows.
    cl_abap_unit_assert=>assert_not_initial( lt_data ).
  ENDMETHOD.

  METHOD de_test.
**********************************************************************
*cannot call table function directly
**********************************************************************
    DATA lt_data TYPE tt_country.
    SELECT
       z_countryviatablefunction~country,
       z_countryviatablefunction~countrythreeletterisocode,
       z_countryviatablefunction~countrythreedigitisocode,
       z_countryviatablefunction~countryisocode,
       z_countryviatablefunction~countryname,
       z_countryviatablefunction~countrycurrency
     FROM
      z_countryviatablefunction wHERE country = 'DE' AND COUNTRYNAME = 'Deutschland' INTO TABLE @lt_data.
    cl_abap_unit_assert=>assert_equals( act = lines( lt_data ) exp = 1 ).
  ENDMETHOD.


ENDCLASS.
