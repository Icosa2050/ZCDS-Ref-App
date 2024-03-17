CLASS zcl_select_salesord_with_mandt DEFINITION PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_select_salesord_with_mandt IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT *
       FROM zsalesorder
       "CLIENT SPECIFIED
       INTO TABLE @DATA(lt_salesorder)
       .
    "WHERE client = '001'.

    out->write( lt_salesorder ).

  ENDMETHOD.
ENDCLASS.
