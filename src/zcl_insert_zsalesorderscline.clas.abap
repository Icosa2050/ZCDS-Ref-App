CLASS zcl_insert_zsalesorderscline DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    METHODS: insert_salesorderscline
      RAISING
        zcx_demo_dyn_t100.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_insert_zsalesorderscline IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    TRY.
        insert_salesorderscline( ).
      CATCH zcx_demo_dyn_t100 INTO DATA(lo_error).
        out->write( lo_error->get_text( ) ).
    ENDTRY.

  ENDMETHOD.
  METHOD insert_salesorderscline.
    DATA: lt_data TYPE TABLE OF zsalesordersline.
    DATA : ls_data TYPE zsalesordersline.
    GET TIME STAMP FIELD DATA(lv_time).
    DATA(lv_sy_datum) = cl_abap_context_info=>get_system_date( ).
* SY-UZEIT
    DATA(lv_sy_uzeit) = cl_abap_context_info=>get_system_time( ).
* SY-UNAME
    DATA(lv_sy_uname) = cl_abap_context_info=>get_user_technical_name( ).
* Username
    CLEAR lt_data.
    CLEAR ls_data.
    SELECT * FROM zsalesordersline INTO TABLE @lt_data.
    DELETE zsalesordersline FROM TABLE @lt_data.
    IF sy-subrc <> 0.
      RAISE EXCEPTION TYPE zcx_demo_dyn_t100
     MESSAGE e001(zcds_ref_app) WITH 'Error in deleting data'.
    ENDIF.
    COMMIT WORK.
    CLEAR lt_data.
    ls_data = VALUE  #(
    salesorder = 'S1'
    salesorderitem = '00010'
    salesorderscheduleline = '00010'
    orderquantity = '1'
    orderquantityunit = 'STK'
    createdbyuser       = lv_sy_uname
    creationdatetime = lv_time
    deliverydate = lv_sy_datum + 10
    lastchangedbyuser = sy-uname
    lastchangedatetime = lv_time ).

    APPEND ls_data TO lt_data.

    CLEAR ls_data.
    ls_data = VALUE  #(
    salesorder = 'S1'
    salesorderitem = '00020'
    salesorderscheduleline = '00020'
    orderquantity = '1'
    orderquantityunit = 'STK'
    createdbyuser       = sy-uname
    deliverydate = lv_sy_datum + 10
    creationdatetime = lv_time
    lastchangedbyuser = sy-uname
    lastchangedatetime = lv_time ).

    APPEND ls_data TO lt_data.

    CLEAR ls_data.

    ls_data = VALUE  #(
    salesorder = 'S2'
    salesorderitem = '00010'
    salesorderscheduleline = '00010'
    orderquantity = '1'
    orderquantityunit = 'STK'
    createdbyuser       = lv_sy_uname
    deliverydate = lv_sy_datum + 20
    creationdatetime = lv_time
    lastchangedbyuser = sy-uname
    lastchangedatetime = lv_time ).

    APPEND ls_data TO lt_data.

    CLEAR ls_data.
    ls_data = VALUE  #(
    salesorder = 'S2'
    salesorderitem = '00020'
    salesorderscheduleline = '00020'
    orderquantity = '1'
    orderquantityunit = 'STK'
    createdbyuser       = sy-uname
    creationdatetime = lv_time
    deliverydate = lv_sy_datum + 30
    lastchangedbyuser = sy-uname
    lastchangedatetime = lv_time ).

    APPEND ls_data TO lt_data.

    CLEAR ls_data.
    ls_data = VALUE  #(
    salesorder = 'S2'
    salesorderitem = '00030'
    salesorderscheduleline = '00030'
    orderquantity = '2'
    orderquantityunit = 'STK'
    createdbyuser       = sy-uname
    deliverydate = lv_sy_datum + 30
    creationdatetime = lv_time
    lastchangedbyuser = sy-uname
    lastchangedatetime = lv_time ).

    APPEND ls_data TO lt_data.


    CLEAR ls_data.


    LOOP AT lt_data INTO ls_data.
      INSERT zsalesordersline FROM @ls_data.
      IF sy-subrc <> 0.
        RAISE EXCEPTION TYPE zcx_demo_dyn_t100
        MESSAGE e001(zcds_ref_app) WITH 'Error in updating data'.
      ENDIF.
    ENDLOOP.
    IF sy-subrc = 0.
      COMMIT WORK.
      SELECT * FROM zsalesordersline INTO TABLE @lt_data.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
