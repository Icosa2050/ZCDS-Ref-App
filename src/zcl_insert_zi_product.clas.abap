CLASS zcl_insert_zi_product DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_insert_zi_product IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA: lt_test TYPE TABLE OF zproduct_ic.
    DATA : ls_test TYPE zproduct_ic.
    GET TIME STAMP FIELD DATA(lv_time).

    ls_test = VALUE  #(
    product = 'P1'
    product_type   =   'T1'
  creation_date_time  = lv_time
     ).

    APPEND ls_test TO lt_test.

    GET TIME STAMP FIELD lv_time.

    ls_test = VALUE  #(
    product = 'P2'
    product_type   =   'T2'
  creation_date_time  = lv_time
     ).


    APPEND ls_test TO lt_test.


    INSERT zproduct_ic FROM TABLE @lt_test.


  ENDMETHOD.
ENDCLASS.
