CLASS zcl_insert_zcustomer_ic DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_insert_zcustomer_ic IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA: lt_product_ic TYPE TABLE OF zcustomer_ic.
    DATA: ls_product_ic TYPE zcustomer_ic.
    SELECT * FROM zcustomer_ic INTO TABLE @lt_product_ic.
    DELETE zcustomer_ic FROM TABLE @lt_product_ic.
    GET TIME STAMP FIELD DATA(lv_time).
    CLEAR ls_product_ic.
    CLEAR lt_product_ic.

    ls_product_ic = VALUE  #(
    customer = '0000000001'
    name   =   'Customer 1'
    country = 'DE'
     ).

    APPEND ls_product_ic TO lt_product_ic.

    GET TIME STAMP FIELD lv_time.

    ls_product_ic = VALUE  #(

    customer   =   '0000000002'
    name   =   'Customer 2'
    country = 'DE'
     ).


    APPEND ls_product_ic TO lt_product_ic.

    ls_product_ic = VALUE  #(
    customer = '0000000003'
    name   =   'Customer 3'
    country = 'EN'
     ).

    " //write a comment

    APPEND ls_product_ic TO lt_product_ic.

    ls_product_ic = VALUE  #(
    customer = '0000000004'
    name   =   'Customer 4'
    country = 'EN'
     ).

    APPEND ls_product_ic TO lt_product_ic.


    INSERT zcustomer_ic FROM TABLE @lt_product_ic.
    out->write( 'after insert' ).
    out->write( lt_product_ic ).


  ENDMETHOD.
ENDCLASS.
