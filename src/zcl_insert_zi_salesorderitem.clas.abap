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
    DATA: lt_test TYPE TABLE OF zsalesorderitem.
    DATA : ls_test TYPE zsalesorderitem.
    GET TIME STAMP FIELD DATA(lv_time).
    DATA(lv_sy_datum) = cl_abap_context_info=>get_system_date( ).
* SY-UZEIT
DATA(lv_sy_uzeit) = cl_abap_context_info=>get_system_time( ).
* SY-UNAME
DATA(lv_sy_uname) = cl_abap_context_info=>get_user_technical_name( ).
* Username
    ls_test = VALUE  #(
    salesorder = 'S1'
    salesorderitem = '00010'
    product = 'P1'
    orderquantity = '1'
    orderquantityunit = 'STK'
    creationdate        = lv_sy_datum
    createdbyuser       = lv_sy_uname
    lastchangedatetime = lv_time ).

    APPEND ls_test TO lt_test.

    ls_test = VALUE  #(
    salesorder = 'S1'
    salesorderitem = '00020'
    product = 'P2'
    orderquantity = '1'
    orderquantityunit = 'STK'
    creationdate        = lv_sy_datum
    createdbyuser       = sy-uname
    lastchangedatetime = lv_time ).

    APPEND ls_test TO lt_test.


    INSERT zsalesorderitem FROM TABLE @lt_test.


  ENDMETHOD.
ENDCLASS.
