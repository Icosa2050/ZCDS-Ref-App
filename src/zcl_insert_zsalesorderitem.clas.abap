CLASS zcl_insert_zsalesorderitem DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun.
    DATA : out TYPE REF TO if_oo_adt_classrun_out.
    METHODS: insert_salesorderitem
      RAISING
        zcx_db_message.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_insert_zsalesorderitem IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    TRY.
        me->out = out.
        insert_salesorderitem( ).
      CATCH zcx_db_message.
        out->write( 'error from insert_salesorderitem' ).
    ENDTRY.
  ENDMETHOD.
  METHOD insert_salesorderitem.
    DATA: lt_salesorderitem TYPE TABLE OF zsalesorderitem.
    DATA : ls_salesorderitem TYPE zsalesorderitem.
    GET TIME STAMP FIELD DATA(lv_time).
    DATA(lv_sy_datum) = cl_abap_context_info=>get_system_date( ).
* SY-UZEIT
    DATA(lv_sy_uzeit) = cl_abap_context_info=>get_system_time( ).
* SY-UNAME
    DATA(lv_sy_uname) = cl_abap_context_info=>get_user_technical_name( ).
* Username
    SELECT * FROM zsalesorderitem INTO TABLE @lt_salesorderitem.
    DELETE zsalesorderitem FROM TABLE @lt_salesorderitem.
    COMMIT WORK.
    CLEAR lt_salesorderitem.
    CLEAR ls_salesorderitem.

    ls_salesorderitem = VALUE  #(
    salesorder = 'TEST1'
    salesorderitem = '00001'
    product = 'P1'
    orderquantity = '1'
    orderquantityunit = 'EA'
    netamount = 100
    transactioncurrency = 'USD'
    creationdate        = lv_sy_datum
    createdbyuser       = lv_sy_uname
    creationdatetime = lv_time
    lastchangedbyuser = sy-uname
    lastchangedatetime = lv_time ).

    APPEND ls_salesorderitem TO lt_salesorderitem.

    CLEAR ls_salesorderitem.
    ls_salesorderitem = VALUE  #(
    salesorder = 'TEST2'
    salesorderitem = '00002'
    product = 'P2'
    orderquantity = '1'
    orderquantityunit = 'EA'
    netamount = 200
    transactioncurrency = 'USD'
    creationdate        = lv_sy_datum
    createdbyuser       = sy-uname
    creationdatetime = lv_time
    lastchangedbyuser = sy-uname
    lastchangedatetime = lv_time ).

    APPEND ls_salesorderitem TO lt_salesorderitem.

    CLEAR ls_salesorderitem.

    ls_salesorderitem = VALUE  #(
    salesorder = '00000000S2'
    salesorderitem = '000001'
    product = 'P2'
    orderquantity = '1'
    orderquantityunit = 'EA'
    netamount = 300
    transactioncurrency = 'USD'
    creationdate        = lv_sy_datum
    createdbyuser       = lv_sy_uname
    creationdatetime = lv_time
    lastchangedbyuser = sy-uname
    lastchangedatetime = lv_time ).

    APPEND ls_salesorderitem TO lt_salesorderitem.

    CLEAR ls_salesorderitem.
    ls_salesorderitem = VALUE  #(
    salesorder = '00000000S2'
    salesorderitem = '000002'
    product = 'P3'
    orderquantity = '1'
    orderquantityunit = 'EA'
    netamount = 400
    transactioncurrency = 'USD'
    creationdate        = lv_sy_datum
    createdbyuser       = sy-uname
    creationdatetime = lv_time
    lastchangedbyuser = sy-uname
    lastchangedatetime = lv_time ).

    APPEND ls_salesorderitem TO lt_salesorderitem.

    CLEAR ls_salesorderitem.
    ls_salesorderitem = VALUE  #(
    salesorder = '00000000S2'
    salesorderitem = '000003'
    product = 'P4'
    orderquantity = '2'
    orderquantityunit = 'EA'
    netamount = 500
    transactioncurrency = 'USD'
    creationdate        = lv_sy_datum
    createdbyuser       = sy-uname
    creationdatetime = lv_time
    lastchangedbyuser = sy-uname
    lastchangedatetime = lv_time ).

    APPEND ls_salesorderitem TO lt_salesorderitem.


    CLEAR ls_salesorderitem.


    INSERT zsalesorderitem FROM TABLE @lt_salesorderitem.
    IF sy-subrc = 0.
      COMMIT WORK.
    ELSE.
      RAISE EXCEPTION TYPE zcx_db_message.
    ENDIF.
    SELECT * FROM zsalesorderitem INTO TABLE @lt_salesorderitem.
    out->write( lt_salesorderitem ).
  ENDMETHOD.
ENDCLASS.
