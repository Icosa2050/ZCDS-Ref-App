CLASS zcl_insert_zproduct_ic DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_insert_zproduct_ic IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA: lt_product_ic TYPE TABLE OF zproduct_ic.
    DATA: ls_product_ic TYPE zproduct_ic.
    SELECT * FROM zproduct_ic INTO TABLE @lt_product_ic.
    LOOP AT lt_product_ic INTO ls_product_ic.
      out->write( ls_product_ic ).
      DELETE zproduct_ic FROM @ls_product_ic.
    ENDLOOP.
    GET TIME STAMP FIELD DATA(lv_time).
    CLEAR ls_product_ic.
    CLEAR lt_product_ic.

    ls_product_ic = VALUE  #(
    product = 'P1'
    product_type   =   'T1'
  creation_date_time  = lv_time
     ).

    APPEND ls_product_ic TO lt_product_ic.

    GET TIME STAMP FIELD lv_time.

    ls_product_ic = VALUE  #(
    product = 'P2'
    product_type   =   'T2'
  creation_date_time  = lv_time
     ).


    APPEND ls_product_ic TO lt_product_ic.

    ls_product_ic = VALUE  #(
    product = 'P3'
    product_type   =   'FERT'
  creation_date_time  = lv_time
     ).
    " //write a comment

    APPEND ls_product_ic TO lt_product_ic.

    ls_product_ic = VALUE  #(
    product = 'P4'
    product_type   =   'FERT'
    creation_date_time  = lv_time


     ).

    APPEND ls_product_ic TO lt_product_ic.


    INSERT zproduct_ic FROM TABLE @lt_product_ic.
    out->write( 'after insert' ).
    out->write( lt_product_ic ).


  ENDMETHOD.
ENDCLASS.
