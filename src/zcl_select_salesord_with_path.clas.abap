CLASS zcl_select_salesord_with_path DEFINITION PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_select_salesord_with_path IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT \_salesorder-salesordertype,
    \_salesorderitem\_product\_text[ (1) INNER : WHERE language = 'E' ]-productname
    FROM zi_salesorderscheduleline
    WHERE \_salesorderitem\_product-producttype EQ 'FERT'  OR \_salesorderitem\_product-producttype EQ 'T1'
    INTO TABLE @DATA(lt_result).
    IF ( sy-subrc = 0 ).
      out->write( lt_result ).
    ELSE.
      out->write( 'No data found' ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
