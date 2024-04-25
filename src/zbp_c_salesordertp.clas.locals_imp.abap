CLASS lhc_salesorderscheduleline DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS augment_update FOR MODIFY
      IMPORTING entities FOR UPDATE SalesOrderScheduleLine.


ENDCLASS.

CLASS lhc_salesorderscheduleline IMPLEMENTATION.

  METHOD augment_update.
    DATA updates TYPE TABLE FOR UPDATE ZR_SalesOrderScheduleLineTP.
    DATA: timestampl TYPE timestampl.
    GET TIME STAMP FIELD DATA(lv_time).
    DATA(lv_sy_datum) = cl_abap_context_info=>get_system_date( ).
* SY-UZEIT
    DATA(lv_sy_uzeit) = cl_abap_context_info=>get_system_time( ).
* SY-UNAME
    DATA(lv_sy_uname) = cl_abap_context_info=>get_user_technical_name( ).


    LOOP AT entities ASSIGNING FIELD-SYMBOL(<entity>).

      APPEND VALUE #( %cid_ref = <entity>-%cid_ref

      %is_draft = <entity>-%is_draft

      %key = <entity>-%key

       LastChangedByUser = lv_sy_uname

      %control-LastChangedByUser = if_abap_behv=>mk-on

      ) TO updates.

    ENDLOOP.

    MODIFY AUGMENTING ENTITY ZR_SalesOrderScheduleLineTP
    UPDATE
    FROM updates.
  ENDMETHOD.

ENDCLASS.


CLASS lhc_SalesOrder DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
"    METHODS get_global_features FOR GLOBAL FEATURES
"      IMPORTING REQUEST requested_features FOR SalesOrder RESULT result.

   METHODS augment_update FOR MODIFY
      IMPORTING entities FOR UPDATE SalesOrder.
ENDCLASS.

CLASS lhc_SalesOrder IMPLEMENTATION.
 method augment_update.
 endmethod.
"  METHOD get_global_features.
"    GET PERMISSIONS ONLY GLOBAL FEATURES OF ZR_salesorderTP
"    ENTITY Salesorder REQUEST CORRESPONDING #( requested_features )
"    RESULT DATA(result_base)
"    REPORTED DATA(reported_base).
"
"    Result = CORRESPONDING #( DEEP result_base ).
"    Reported = CORRESPONDING #( DEEP reported_base ).
"
"  ENDMETHOD.


ENDCLASS.
CLASS lhc_salesorderitem DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.
"    METHODS CreateFromQuote FOR MODIFY
"      IMPORTING keys FOR ACTION SalesOrder~CreateFromSalesQuote.

    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR SalesOrderItem RESULT result.

    METHODS augment_update FOR MODIFY
      IMPORTING entities FOR UPDATE SalesOrderItem.


ENDCLASS.

CLASS lhc_salesorderitem IMPLEMENTATION.

  METHOD get_instance_features.
  ENDMETHOD.

  METHOD augment_update.
    DATA updates TYPE TABLE FOR UPDATE zr_salesordertp\\salesorderitem.
    LOOP AT entities ASSIGNING FIELD-SYMBOL(<entity>)
    WHERE %control-OrderIsFreeOfCharge = abap_true.
      APPEND VALUE #( %cid_ref = <entity>-%cid_ref
                       %tky = <entity>-%tky
                       NetAmount = 0
                       %control-NetAmount = if_abap_behv=>mk-on
                       ) TO updates.
    ENDLOOP.
    IF updates IS NOT INITIAL.
      MODIFY AUGMENTING ENTITY ZR_SalesOrderItemTP UPDATE FROM updates.
    ENDIF.

  ENDMETHOD.


"  METHOD createFromQuote.
"    DATA keys_base TYPE TABLE FOR ACTION IMPORT zr_salesordertp~createfromquote.
"    LOOP AT keys ASSIGNING FIELD-SYMBOL(<key>).
"      APPEND VALUE #( %cid  = <key>-%cid %param-%is_draft = <key>-%param-%is_draft
"                      %param-_salesquotes =
"                      VALUE #( ( <key>-%param-salesquote ) )
"                      ) TO keys_base.
"    ENDLOOP.
"
"    MODIFY ENTITY ZR_SalesOrderTP
"    EXECUTE CreateFromQuote FROM keys_base
"    MAPPED   DATA(mapped_base)
"    FAILED   DATA(failed_base)
"    REPORTED DATA(reported_base).
"    mapped   = CORRESPONDING #( DEEP mapped_base ).
"    failed   = CORRESPONDING #( DEEP failed_base ).
"    reported = CORRESPONDING #( DEEP reported_base ).
"  ENDMETHOD.


ENDCLASS.
