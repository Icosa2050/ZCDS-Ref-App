CLASS zcl_insert_zt000_dummy DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_insert_zt000_dummy IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    "COMMENT
    DATA: lt_test TYPE TABLE OF zt000_dummy.
    DATA : ls_test TYPE zt000_dummy.
    GET TIME STAMP FIELD DATA(lv_time).

    ls_test = VALUE  #(
    dummyField = 'd'
     ).

    APPEND ls_test TO lt_test.

    INSERT zt000_dummy FROM TABLE @lt_test.

  ENDMETHOD.
ENDCLASS.
