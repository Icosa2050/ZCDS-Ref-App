CLASS zcl_insert_zsalesorder DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_insert_zsalesorder IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
*####################################################################

*####################################################################

    DATA: gs_zsalesorder TYPE zsalesorder.
    DATA: gt_zsalesorder TYPE STANDARD TABLE OF zsalesorder WITH EMPTY KEY.
    DATA: timestampl TYPE timestampl.
    GET TIME STAMP FIELD DATA(lv_time).
    DATA(lv_sy_datum) = cl_abap_context_info=>get_system_date( ).
* SY-UZEIT
    DATA(lv_sy_uzeit) = cl_abap_context_info=>get_system_time( ).
* SY-UNAME
    DATA(lv_sy_uname) = cl_abap_context_info=>get_user_technical_name( ).

    SELECT * FROM zsalesorder INTO TABLE @gt_zsalesorder.
    IF sy-subrc = 0.
      DELETE zsalesorder FROM TABLE @gt_zsalesorder.
    ENDIF.
    CLEAR gt_zsalesorder.

    CLEAR gs_zsalesorder.
    gs_zsalesorder-salesorder        = '00000000S1'.
    gs_zsalesorder-salesordertype    = 'KL'.
    gs_zsalesorder-salesorganization = 'US'.
    gs_zsalesorder-soldtoparty = '0000000001'.
    gs_zsalesorder-createdbyuser = sy-uname.
    gs_zsalesorder-creationdatetime = lv_time.
    gs_zsalesorder-transactioncurrency = 'USD'.
    INSERT gs_zsalesorder INTO TABLE gt_zsalesorder.
    CLEAR gs_zsalesorder.
    GET TIME STAMP FIELD lv_time.
    gs_zsalesorder-salesorder        = '00000000S2'.
    gs_zsalesorder-salesordertype    = 'AG'.
    gs_zsalesorder-salesorganization = 'EU'.
    gs_zsalesorder-soldtoparty = '0000000002'.
    gs_zsalesorder-createdbyuser = sy-uname.
    gs_zsalesorder-creationdatetime = lv_time.
    gs_zsalesorder-transactioncurrency = 'EUR'.
    INSERT gs_zsalesorder INTO TABLE gt_zsalesorder.
    CLEAR gs_zsalesorder.

    GET TIME STAMP FIELD lv_time.
    gs_zsalesorder-salesorder        = '00000000S3'.
    gs_zsalesorder-salesordertype    = 'TAF'.
    gs_zsalesorder-salesorganization = 'US'.
    gs_zsalesorder-soldtoparty = '0000000003'.
    gs_zsalesorder-createdbyuser = sy-uname.
    gs_zsalesorder-creationdatetime = lv_time.
    gs_zsalesorder-transactioncurrency = 'US'.
    INSERT gs_zsalesorder INTO TABLE gt_zsalesorder.
    CLEAR gs_zsalesorder.
    GET TIME STAMP FIELD lv_time.
    gs_zsalesorder-salesorder        = '00000000S4'.
    gs_zsalesorder-salesordertype    = 'TA'.
    gs_zsalesorder-salesorganization = 'EU'.
    gs_zsalesorder-soldtoparty = '0000000004'.
    gs_zsalesorder-createdbyuser = sy-uname.
    gs_zsalesorder-creationdatetime = lv_time.
    gs_zsalesorder-transactioncurrency = 'EUR'.
    INSERT gs_zsalesorder INTO TABLE gt_zsalesorder.

    MODIFY zsalesorder FROM TABLE @gt_zsalesorder.
    IF sy-subrc = 0.
      out->write(  'Data modification was successfully' ).
      CLEAR gt_zsalesorder.
      SELECT * FROM zsalesorder INTO TABLE @gt_zsalesorder.
      out->write(  gt_zsalesorder ).
    ELSE.
      out->write( 'Data modification failed' ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
