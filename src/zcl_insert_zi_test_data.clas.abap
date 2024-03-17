CLASS zcl_insert_zi_test_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_insert_zi_test_data IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
*####################################################################

    DATA: gs_zproduct    TYPE zproduct_ic.
    DATA: gt_zproduct    TYPE STANDARD TABLE OF zproduct_ic WITH EMPTY KEY.

    CLEAR gt_zproduct.

    CLEAR gs_zproduct.

    SELECT * FROM zproduct_ic INTO TABLE @DATA(lt_data).
    LOOP AT lt_data INTO gs_zproduct.

      out->write( 'delete product' ).
      out->write( gs_zproduct ).
      DELETE zproduct_ic FROM @gs_zproduct.
      IF sy-subrc <> 0.

        out->write( 'delete error' ).

        "cl_demo_output=>begin_section( 'delete error' ).
        "cl_demo_output=>write_data( gs_zproduct-product ).
        "cl_demo_output=>end_section( ).
        "cl_demo_output=>display( ).
      ENDIF.
    ENDLOOP.

    gs_zproduct-product             = 'P1'.
    gs_zproduct-product_type        = 'T1'.
    GET TIME STAMP FIELD gs_zproduct-creation_date_time.
    INSERT gs_zproduct INTO TABLE gt_zproduct.
    IF ( sy-subrc <> 0 ).
      out->write( 'insert error P1' ).
    ENDIF.

    CLEAR gs_zproduct.
    gs_zproduct-product             = 'P2'.
    gs_zproduct-product_type        = 'T1'.
    GET TIME STAMP FIELD gs_zproduct-creation_date_time.
    INSERT gs_zproduct INTO TABLE gt_zproduct.
    IF ( sy-subrc <> 0 ).
      out->write( 'insert error P2' ).
    ENDIF.



    CLEAR gs_zproduct.
    gs_zproduct-product             = 'P3'.
    gs_zproduct-product_type        = 'T3'.
    GET TIME STAMP FIELD gs_zproduct-creation_date_time.
    INSERT gs_zproduct INTO TABLE gt_zproduct.
    IF ( sy-subrc <> 0 ).
      out->write( 'insert error P3' ).
    ENDIF.


*Entry without product text
    CLEAR gs_zproduct.
    gs_zproduct-product             = 'P4'.
    gs_zproduct-product_type        = 'T3'.
    GET TIME STAMP FIELD gs_zproduct-creation_date_time.
    INSERT gs_zproduct INTO TABLE gt_zproduct.
    IF ( sy-subrc <> 0 ).
      out->write( 'insert error P4' ).
    ENDIF.



    MODIFY zproduct_ic FROM TABLE @gt_zproduct.
    IF ( sy-subrc <> 0 ).
      out->write( 'modifying table zproduct_ic failed' ).
    ENDIF.


    COMMIT WORK.

*####################################################################

    DATA: gs_zproducttext    TYPE zproducttext.
    DATA: gt_zproducttext    TYPE STANDARD TABLE OF zproducttext WITH EMPTY KEY.
*SY-DATUM
    DATA(lv_sy_datum) = cl_abap_context_info=>get_system_date( ).
* SY-UZEIT
    DATA(lv_sy_uzeit) = cl_abap_context_info=>get_system_time( ).
* SY-UNAME
    DATA(lv_sy_uname) = cl_abap_context_info=>get_user_technical_name( ).

    CLEAR gt_zproducttext.

    CLEAR gs_zproducttext.
    gs_zproducttext-product             = 'P1'.
    gs_zproducttext-product_name        = 'P1 English'.
    gs_zproducttext-language            = 'E'.
    INSERT gs_zproducttext INTO TABLE gt_zproducttext.

    CLEAR gs_zproducttext.
    gs_zproducttext-product             = 'P1'.
    gs_zproducttext-product_name        = 'P1 Deutsch'.
    gs_zproducttext-language            = 'D'.
    INSERT gs_zproducttext INTO TABLE gt_zproducttext.

    CLEAR gs_zproducttext.
    gs_zproducttext-product             = 'P2'.
    gs_zproducttext-product_name        = 'P2 English'.
    gs_zproducttext-language            = 'E'.
    INSERT gs_zproducttext INTO TABLE gt_zproducttext.

    CLEAR gs_zproducttext.
    gs_zproducttext-product             = 'P2'.
    gs_zproducttext-product_name        = 'P2 Deutsch'.
    gs_zproducttext-language            = 'D'.
    INSERT gs_zproducttext INTO TABLE gt_zproducttext.

    CLEAR gs_zproducttext.
    gs_zproducttext-product             = 'P3'.
    gs_zproducttext-product_name        = 'P3 English'.
    gs_zproducttext-language            = 'E'.
    INSERT gs_zproducttext INTO TABLE gt_zproducttext.

    CLEAR gs_zproducttext.
    gs_zproducttext-product             = 'P3'.
    gs_zproducttext-product_name        = 'P3 Deutsch'.
    gs_zproducttext-language            = 'D'.
    INSERT gs_zproducttext INTO TABLE gt_zproducttext.


    MODIFY zproducttext FROM TABLE @gt_zproducttext.
    IF ( sy-subrc <> 0 ).
      out->write( 'modifying table zproducttext failed' ).
    ENDIF.


    COMMIT WORK.

*####################################################################

    DATA: gs_zsalesorderitem TYPE zsalesorderitem.
    DATA: gt_zsalesorderitem TYPE STANDARD TABLE OF zsalesorderitem WITH EMPTY KEY.

    CLEAR gt_zsalesorderitem.

    CLEAR gs_zsalesorderitem.
    gs_zsalesorderitem-salesorder          = 'S1'.
    gs_zsalesorderitem-salesorderitem      = '000010'.
    gs_zsalesorderitem-product             = 'P1'.
    gs_zsalesorderitem-netamount           = 10.
    gs_zsalesorderitem-transactioncurrency = 'EUR'.
    gs_zsalesorderitem-orderquantity       = 10.
    gs_zsalesorderitem-orderquantityunit   = 'KG'.
    gs_zsalesorderitem-creationdate        = lv_sy_datum.
    INSERT gs_zsalesorderitem INTO TABLE gt_zsalesorderitem.

    CLEAR gs_zsalesorderitem.
    gs_zsalesorderitem-salesorder          = 'S1'.
    gs_zsalesorderitem-salesorderitem      = '000020'.
    gs_zsalesorderitem-product             = 'P2'.
    gs_zsalesorderitem-netamount           = 20.
    gs_zsalesorderitem-transactioncurrency = 'EUR'.
    gs_zsalesorderitem-orderquantity       = 20.
    gs_zsalesorderitem-orderquantityunit   = 'KG'.
    gs_zsalesorderitem-creationdate        = lv_sy_datum.
    INSERT gs_zsalesorderitem INTO TABLE gt_zsalesorderitem.

    CLEAR gs_zsalesorderitem.
    gs_zsalesorderitem-salesorder          = 'S2'.
    gs_zsalesorderitem-salesorderitem      = '000010'.
    gs_zsalesorderitem-product             = 'P1'.
    gs_zsalesorderitem-netamount           = 10.
    gs_zsalesorderitem-transactioncurrency = 'EUR'.
    gs_zsalesorderitem-orderquantity       = 10.
    gs_zsalesorderitem-orderquantityunit   = 'KG'.
    gs_zsalesorderitem-creationdate        = lv_sy_datum.
    INSERT gs_zsalesorderitem INTO TABLE gt_zsalesorderitem.

    CLEAR gs_zsalesorderitem.
    gs_zsalesorderitem-salesorder          = 'S2'.
    gs_zsalesorderitem-salesorderitem      = '000020'.
    gs_zsalesorderitem-product             = 'P3'.
    gs_zsalesorderitem-netamount           = 10.
    gs_zsalesorderitem-transactioncurrency = 'EUR'.
    gs_zsalesorderitem-orderquantity       = 10.
    gs_zsalesorderitem-orderquantityunit   = 'KG'.
    gs_zsalesorderitem-creationdate        = lv_sy_datum.
    INSERT gs_zsalesorderitem INTO TABLE gt_zsalesorderitem.

    MODIFY zsalesorderitem FROM TABLE @gt_zsalesorderitem.
    COMMIT WORK.

*####################################################################

    DATA: gs_zsalesorder TYPE zsalesorder.
    DATA: gt_zsalesorder TYPE STANDARD TABLE OF zsalesorder WITH EMPTY KEY.

    CLEAR gt_zsalesorder.

    CLEAR gs_zsalesorder.
    gs_zsalesorder-salesorder        = 'S1'.
    gs_zsalesorder-salesordertype    = 'TAF'.
    gs_zsalesorder-salesorganization = 'US'.
    INSERT gs_zsalesorder INTO TABLE gt_zsalesorder.
    CLEAR gs_zsalesorder.
    gs_zsalesorder-salesorder        = 'S2'.
    gs_zsalesorder-salesordertype    = 'TAF'.
    gs_zsalesorder-salesorganization = 'US'.
    INSERT gs_zsalesorder INTO TABLE gt_zsalesorder.
    CLEAR gs_zsalesorder.
    gs_zsalesorder-salesorder        = 'S3'.
    gs_zsalesorder-salesordertype    = 'OAF'.
    gs_zsalesorder-salesorganization = 'US'.
    INSERT gs_zsalesorder INTO TABLE gt_zsalesorder.
    CLEAR gs_zsalesorder.
    gs_zsalesorder-salesorder        = 'S4'.
    gs_zsalesorder-salesordertype    = ''.
    gs_zsalesorder-salesorganization = ''.
    INSERT gs_zsalesorder INTO TABLE gt_zsalesorder.

    MODIFY zsalesorder FROM TABLE @gt_zsalesorder.
  ENDMETHOD.
ENDCLASS.
