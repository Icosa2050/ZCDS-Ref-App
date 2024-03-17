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
          TYPE STANDARD TABLE OF zi_product
          WITH DEFAULT KEY.
    SELECT \_product-product            AS product,
           \_product-producttype        AS producttype,
           \_product-authorizationgroup AS authorizationgroup,
           \_product-creationdatetime   AS creationdatetime
       FROM zi_salesorderitem
       WHERE zi_salesorderitem~salesorder = 'S1'
         AND \_product-product IS NOT NULL
       INTO TABLE @lt_zi_product.

       out->write( lt_zi_product ).
       "loop at lt_zi_product ASSIGNING FIELD-SYMBOL(<line>).
       "out->write( <line> ).
       "endloop.

  ENDMETHOD.
ENDCLASS.
