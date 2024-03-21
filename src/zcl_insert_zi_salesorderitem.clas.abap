CLASS zcl_insert_zi_salesorderitem DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_insert_zi_salesorderitem IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA: lt_salesorderitem TYPE TABLE OF zsalesorderitem.
    DATA : ls_salesorderitem TYPE zsalesorderitem.
    GET TIME STAMP FIELD DATA(lv_time).
    out->write(  'Date'  ).
    out->write( 'Time' ).
    out->write( lv_time ).
    DATA(lv_sy_datum) = cl_abap_context_info=>get_system_date( ).
* SY-UZEIT
    DATA(lv_sy_uzeit) = cl_abap_context_info=>get_system_time( ).
* SY-UNAME
    DATA(lv_sy_uname) = cl_abap_context_info=>get_user_technical_name( ).
* Username
    clear lt_salesorderitem.
    clear ls_salesorderitem.
    delete from zsalesorderitem where salesorder = 'S1'.
    commit work.
    delete from zsalesorderitem where salesorder = 'S2'.
    commit work.
    ls_salesorderitem = VALUE  #(
    salesorder = 'S1'
    salesorderitem = '00010'
    product = 'P1'
    orderquantity = '1'
    orderquantityunit = 'STK'
    creationdate        = lv_sy_datum
    createdbyuser       = lv_sy_uname
    creationdatetime = lv_time
    lastchangedbyuser = sy-uname
    lastchangedatetime = lv_time ).

    APPEND ls_salesorderitem TO lt_salesorderitem.

    clear ls_salesorderitem.
    ls_salesorderitem = VALUE  #(
    salesorder = 'S1'
    salesorderitem = '00020'
    product = 'P2'
    orderquantity = '1'
    orderquantityunit = 'STK'
    creationdate        = lv_sy_datum
    createdbyuser       = sy-uname
    creationdatetime = lv_time
    lastchangedbyuser = sy-uname
    lastchangedatetime = lv_time ).

    APPEND ls_salesorderitem TO lt_salesorderitem.

    clear ls_salesorderitem.

    INSERT zsalesorderitem FROM TABLE @lt_salesorderitem.
    IF sy-subrc = 0.
      out->write( 'Data Inserted' ).
      COMMIT WORK.
    ELSE.
      out->write( 'Data Not Inserted' ).
    ENDIF.
  select * from zsalesorderitem into table @lt_salesorderitem.
  out->write( 'Data After Insert' ).
  out->write( lt_salesorderitem ).

  ENDMETHOD.
ENDCLASS.
