CLASS zcl_insert_zproducttext DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_insert_zproducttext IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
*####################################################################
*#  Insert test data to ZPRODUCTTEXT table
*####################################################################

    DATA: gs_zproducttext    TYPE zproducttext.
    DATA: gt_zproducttext    TYPE STANDARD TABLE OF zproducttext WITH EMPTY KEY.
*SY-DATUM
    DATA(lv_sy_datum) = cl_abap_context_info=>get_system_date( ).
* SY-UZEIT
    DATA(lv_sy_uzeit) = cl_abap_context_info=>get_system_time( ).
* SY-UNAME
    DATA(lv_sy_uname) = cl_abap_context_info=>get_user_technical_name( ).


    SELECT * FROM zproducttext INTO TABLE @DATA(lt_producttext).
    LOOP AT lt_producttext INTO gs_zproducttext.
      out->write( 'delete product text' ).
      out->write( gs_zproducttext ).
      DELETE zproducttext FROM @gs_zproducttext.
      IF sy-subrc <> 0.
        out->write( 'delete error' ).
      ENDIF.
    ENDLOOP.


    CLEAR gt_zproducttext.

    CLEAR gs_zproducttext.

    gs_zproducttext-product             = '0000000000000000000000000000000000000P1'.
    gs_zproducttext-product_name        = 'Product 1'.
    gs_zproducttext-language            = 'E'.
    INSERT gs_zproducttext INTO TABLE gt_zproducttext.

    CLEAR gs_zproducttext.
    gs_zproducttext-product             = '0000000000000000000000000000000000000P1'.
    gs_zproducttext-product_name        = 'Produkt 1'.
    gs_zproducttext-language            = 'D'.
    INSERT gs_zproducttext INTO TABLE gt_zproducttext.

    CLEAR gs_zproducttext.
    gs_zproducttext-product             = '0000000000000000000000000000000000000P2'.
    gs_zproducttext-product_name        = 'Product 2'.
    gs_zproducttext-language            = 'E'.
    INSERT gs_zproducttext INTO TABLE gt_zproducttext.

    CLEAR gs_zproducttext.
    gs_zproducttext-product             = '0000000000000000000000000000000000000P2'.
    gs_zproducttext-product_name        = 'Produkt 2'.
    gs_zproducttext-language            = 'D'.
    INSERT gs_zproducttext INTO TABLE gt_zproducttext.

    CLEAR gs_zproducttext.
    gs_zproducttext-product             = '0000000000000000000000000000000000000P3'.
    gs_zproducttext-product_name        = 'Product 3'.
    gs_zproducttext-language            = 'E'.
    INSERT gs_zproducttext INTO TABLE gt_zproducttext.

    CLEAR gs_zproducttext.
    gs_zproducttext-product             = '0000000000000000000000000000000000000P3'.
    gs_zproducttext-product_name        = 'Produkt 3'.
    gs_zproducttext-language            = 'D'.
    INSERT gs_zproducttext INTO TABLE gt_zproducttext.

    CLEAR gs_zproducttext.
    gs_zproducttext-product             = '0000000000000000000000000000000000000P4'.
    gs_zproducttext-product_name        = 'Product 4'.
    gs_zproducttext-language            = 'E'.

    INSERT gs_zproducttext INTO TABLE gt_zproducttext.

    CLEAR gs_zproducttext.
    gs_zproducttext-product             = '0000000000000000000000000000000000000P4'.
    gs_zproducttext-product_name        = 'Produkt 4'.
    gs_zproducttext-language            = 'D'.

    INSERT gs_zproducttext INTO TABLE gt_zproducttext.
    CLEAR gs_zproducttext.

    gs_zproducttext-product             = '0000000000000000000000000000000000000P4'.
    gs_zproducttext-product_name        = 'Produkt 4'.
    gs_zproducttext-language            = 'D'.

    INSERT gs_zproducttext INTO TABLE gt_zproducttext.

    CLEAR gs_zproducttext.
***********************************************************************************
    MODIFY zproducttext FROM TABLE @gt_zproducttext.
***********************************************************************************
    IF ( sy-subrc <> 0 ).
      out->write( 'modifying table zproducttext failed' ).
    ENDIF.

    out->write( gt_zproducttext ).

    COMMIT WORK.

  ENDMETHOD.
ENDCLASS.
