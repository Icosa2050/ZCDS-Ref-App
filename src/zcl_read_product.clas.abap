CLASS zcl_read_product DEFINITION PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_read_product IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA: lt_zi_product
          TYPE STANDARD TABLE OF zproduct_ic
          WITH DEFAULT KEY.
    SELECT product            AS product,
           product_type        AS producttype,
           authorization_group AS authorizationgroup
       FROM zproduct_ic
      INTO TABLE @lt_zi_product.

    out->write( ' Products' ).
    out->write( lt_zi_product ).
    "loop at lt_zi_product ASSIGNING FIELD-SYMBOL(<line>).
    "out->write( <line> ).
    "endloop.

  ENDMETHOD.
ENDCLASS.
