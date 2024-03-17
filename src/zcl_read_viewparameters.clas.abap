CLASS zcl_read_viewparameters DEFINITION PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_read_viewparameters IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA(lv_today) = cl_abap_context_info=>get_system_date( ).
    CONSTANTS cvl TYPE spras VALUE 'E'.

    SELECT keyfield, Language, ValidityStartDate, ValidityEndDate
      FROM z_viewwithparameters(
        p_keydate  = @lv_today,
        p_language = @cvl )
      INTO TABLE @FINAL(lt_viewwithparameters).
    out->write( lt_viewwithparameters ).

  ENDMETHOD.
ENDCLASS.
