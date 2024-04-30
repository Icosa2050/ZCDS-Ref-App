CLASS zcl_insert_zsalesorder DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    DATA : out TYPE REF TO if_oo_adt_classrun_out.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_insert_zsalesorder IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
*####################################################################

    me->out = out.
*####################################################################

    DATA: ls_zsalesorder TYPE zsalesorder.
    DATA: lt_zsalesorder TYPE STANDARD TABLE OF zsalesorder WITH EMPTY KEY.
    DATA: timestampl TYPE timestampl.
    GET TIME STAMP FIELD DATA(lv_time).
    DATA(lv_sy_datum) = cl_abap_context_info=>get_system_date( ).
* SY-UZEIT
    DATA(lv_sy_uzeit) = cl_abap_context_info=>get_system_time( ).
* SY-UNAME
    DATA(lv_sy_uname) = cl_abap_context_info=>get_user_technical_name( ).

    SELECT * FROM zsalesorder INTO TABLE @lt_zsalesorder.
    IF sy-subrc = 0.
      DELETE zsalesorder FROM TABLE @lt_zsalesorder.
    ENDIF.
    CLEAR lt_zsalesorder.

    CLEAR ls_zsalesorder.
    ls_zsalesorder-salesorder        = 'TEST1'.
    ls_zsalesorder-salesordertype = 'D1'.
    ls_zsalesorder-salesorganization = '01'.
    ls_zsalesorder-distributionchannel = 'D1'.
    ls_zsalesorder-soldtoparty = 'CUSTOMER1'.
    ls_zsalesorder-createdbyuser = '0000000001'.
    ls_zsalesorder-organizationdivision = '01'.
    ls_zsalesorder-createdbyuser = sy-uname.

    ls_zsalesorder-creationdatetime = lv_time.
    ls_zsalesorder-transactioncurrency = 'USD'.
    INSERT ls_zsalesorder INTO TABLE lt_zsalesorder.
    CLEAR ls_zsalesorder.
    GET TIME STAMP FIELD lv_time.
    ls_zsalesorder-salesorder        = 'TEST2'.
    ls_zsalesorder-salesordertype    = 'T2'.
    ls_zsalesorder-salesorganization = '02'.
    ls_zsalesorder-distributionchannel = 'D2'.
    ls_zsalesorder-soldtoparty = 'CUSTOMER2'.
    ls_zsalesorder-createdbyuser = '0000000001'.
    ls_zsalesorder-creationdatetime = lv_time.
    ls_zsalesorder-transactioncurrency = 'USD'.
    INSERT ls_zsalesorder INTO TABLE lt_zsalesorder.
    CLEAR ls_zsalesorder.

    GET TIME STAMP FIELD lv_time.
    ls_zsalesorder-salesorder        = '00000000S3'.
    ls_zsalesorder-salesordertype    = 'TAF'.
    ls_zsalesorder-salesorganization = '02'.
    ls_zsalesorder-soldtoparty = 'CUSTOMER2'.
    ls_zsalesorder-distributionchannel = 'D2'.
    ls_zsalesorder-organizationdivision = '01'.
    ls_zsalesorder-createdbyuser = '0000000002'.
    ls_zsalesorder-creationdatetime = lv_time.
    ls_zsalesorder-transactioncurrency = 'USD'.
    INSERT ls_zsalesorder INTO TABLE lt_zsalesorder.
    CLEAR ls_zsalesorder.
    GET TIME STAMP FIELD lv_time.
    ls_zsalesorder-salesorder        = '00000000S2'.
    ls_zsalesorder-salesordertype    = 'TAF'.
    ls_zsalesorder-salesorganization = '02'.
    ls_zsalesorder-soldtoparty = 'CUSTOMER2'.
    ls_zsalesorder-distributionchannel = 'D2'.
    ls_zsalesorder-organizationdivision = '01'.
    ls_zsalesorder-createdbyuser = '0000000002'.
    ls_zsalesorder-creationdatetime = lv_time.
    ls_zsalesorder-transactioncurrency = 'USD'.
    INSERT ls_zsalesorder INTO TABLE lt_zsalesorder.
    CLEAR ls_zsalesorder.
    GET TIME STAMP FIELD lv_time.
    ls_zsalesorder-salesorder        = '00000000S1'.
    ls_zsalesorder-salesordertype    = 'TAF'.
    ls_zsalesorder-salesorganization = '02'.
    ls_zsalesorder-soldtoparty = 'CUSTOMER2'.
    ls_zsalesorder-distributionchannel = 'D2'.
    ls_zsalesorder-organizationdivision = '01'.
    ls_zsalesorder-createdbyuser = '0000000002'.
    ls_zsalesorder-creationdatetime = lv_time.
    ls_zsalesorder-transactioncurrency = 'USD'.
    INSERT ls_zsalesorder INTO TABLE lt_zsalesorder.
    CLEAR ls_zsalesorder.


    GET TIME STAMP FIELD lv_time.
    ls_zsalesorder-salesorder        = '00000000S4'.
    ls_zsalesorder-salesordertype    = 'TA'.
    ls_zsalesorder-salesorganization = '02'.
    ls_zsalesorder-soldtoparty = 'CUSTOMER2'.
    ls_zsalesorder-organizationdivision = '01'.
    ls_zsalesorder-distributionchannel = 'D2'.
    ls_zsalesorder-createdbyuser = '0000000003'.
    ls_zsalesorder-creationdatetime = lv_time.
    ls_zsalesorder-deliveryStatus = 'C'.
    ls_zsalesorder-transactioncurrency = 'USD'.
    INSERT ls_zsalesorder INTO TABLE lt_zsalesorder.

    MODIFY zsalesorder FROM TABLE @lt_zsalesorder.
    IF sy-subrc = 0.
      out->write(  'Data modification was successfully' ).
      commit work.
      CLEAR lt_zsalesorder.
      SELECT * FROM zsalesorder INTO TABLE @lt_zsalesorder.
      out->write(  lt_zsalesorder ).
    ELSE.
      out->write( 'Data modification failed' ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
