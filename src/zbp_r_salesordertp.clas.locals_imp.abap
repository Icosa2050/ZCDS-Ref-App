CLASS lhc_salesorderitem DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS earlynumbering_cba_Schedulelin FOR NUMBERING
      IMPORTING entities FOR CREATE SalesOrderItem\_Scheduleline.
    METHODS rba_Confirmedscheduleline FOR READ
      IMPORTING keys_rba FOR READ SalesOrderItem\_Confirmedscheduleline FULL result_requested RESULT result LINK association_links.

    METHODS rba_Requestedscheduleline FOR READ
      IMPORTING keys_rba FOR READ SalesOrderItem\_Requestedscheduleline FULL result_requested RESULT result LINK association_links.

    METHODS cba_Confirmedscheduleline FOR MODIFY
      IMPORTING entities_cba FOR CREATE SalesOrderItem\_Confirmedscheduleline.

    METHODS cba_Requestedscheduleline FOR MODIFY
      IMPORTING entities_cba FOR CREATE SalesOrderItem\_Requestedscheduleline.

ENDCLASS.

CLASS lhc_salesorderitem IMPLEMENTATION.

  METHOD earlynumbering_cba_Schedulelin.
    READ ENTITIES OF ZR_SalesOrderTP IN LOCAL MODE
        ENTITY SalesOrderItem BY \_ScheduleLine
          FIELDS ( SalesOrderScheduleLine )
            WITH CORRESPONDING #( entities )
            RESULT DATA(sales_order_schedule_lines)
          FAILED failed.

    LOOP AT entities ASSIGNING FIELD-SYMBOL(<sales_order_item>).
      " get highest item from sales order items of a sales order
      DATA(max_schedule_line_id) = REDUCE #( INIT max = CONV zetenr( '0000' )
                                             FOR sales_order_schedule_line IN sales_order_schedule_lines
                                               USING KEY entity WHERE ( SalesOrder = <sales_order_item>-SalesOrder
                                               AND SalesOrderItem = <sales_order_item>-SalesOrderItem )
                                             NEXT max = COND zposnr( WHEN sales_order_schedule_line-SalesOrderScheduleLine > max
                                                                    THEN sales_order_schedule_line-SalesOrderScheduleLine
                                                                    ELSE max )
                                           ).

      "assign sales order schedule line id
      LOOP AT <sales_order_item>-%target ASSIGNING FIELD-SYMBOL(<sales_order_schedule_line>).
        APPEND CORRESPONDING #( <sales_order_schedule_line> ) TO mapped-salesorderscheduleline ASSIGNING FIELD-SYMBOL(<mapped_sales_order_sline>).
        IF <sales_order_schedule_line>-SalesOrderScheduleLine IS INITIAL.
          max_schedule_line_id += 1.
          <mapped_sales_order_sline>-SalesOrderScheduleLine = max_schedule_line_id.
        ENDIF.
      ENDLOOP.
    ENDLOOP.
  ENDMETHOD.

  METHOD rba_Confirmedscheduleline.
  ENDMETHOD.

  METHOD rba_Requestedscheduleline.
    cl_abap_behv_aux=>get_current_context( IMPORTING in_local_mode = DATA(in_local_mode) ).
    IF in_local_mode = abap_true.
      READ ENTITY IN LOCAL MODE zr_salesorderitemtp
      BY \_scheduleline
      FROM CORRESPONDING #( keys_rba )
      RESULT DATA(salesorderschedulelines)
      LINK DATA(salesorderschedulelinelinks)
      FAILED failed
      REPORTED reported.
    ELSE.
      READ ENTITY zr_salesorderitemtp
      BY \_scheduleline ##NO_LOCAL_MODE
      FROM CORRESPONDING #( keys_rba )
      RESULT salesorderschedulelines
      LINK salesorderschedulelinelinks
      FAILED failed
      REPORTED reported.
    ENDIF.
    LOOP AT salesorderschedulelines ASSIGNING FIELD-SYMBOL(<salesorderscheduleline>)
    WHERE SalesOrderScheduleLineType <> 'R'.
      DELETE salesorderschedulelinelinks WHERE target-%tky = <salesorderscheduleline>-%tky.
      DELETE salesorderschedulelines WHERE %tky = <salesorderscheduleline>-%tky.
    ENDLOOP.
    result = CORRESPONDING #( salesorderschedulelines ).
    association_links = CORRESPONDING #( DEEP salesorderschedulelinelinks ).
  ENDMETHOD.

  METHOD cba_Confirmedscheduleline.
  ENDMETHOD.

  METHOD cba_Requestedscheduleline.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_SalesOrder DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS earlynumbering_cba_item FOR NUMBERING
      IMPORTING entities FOR CREATE salesorder\_item.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR SalesOrder RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR SalesOrder RESULT result.


ENDCLASS.

CLASS lhc_SalesOrder IMPLEMENTATION.

  METHOD get_instance_authorizations.
    READ ENTITIES OF ZR_SalesOrderTP IN LOCAL MODE
    ENTITY SalesOrder
    FIELDS ( SalesOrderType )
    WITH CORRESPONDING #( keys )
    RESULT DATA(salesorders)
    FAILED failed.

    LOOP AT salesorders ASSIGNING FIELD-SYMBOL(<salesorder>).
      IF requested_authorizations-%update = if_abap_behv=>mk-on
      OR requested_authorizations-%update = if_abap_behv=>mk-on.
        AUTHORITY-CHECK OBJECT 'Z_VBAK_AAT'
          ID 'ACTVT' FIELD '02'
          ID 'AUART' FIELD <salesorder>-SalesOrderType.
        IF sy-subrc <> 0.
          APPEND VALUE #( %tky    = <salesorder>-%tky
                          %update = if_abap_behv=>auth-unauthorized
                        ) TO result.
          APPEND VALUE #( %tky = <salesorder>-%tky
                          %msg = NEW zcm_salesorder(
                                       textid     = zcm_salesorder=>no_auth_update
                                       salesorder = <salesorder>-SalesOrder
                                       severity   = zcm_salesorder=>if_abap_behv_message~severity-error
                                 )
                        ) TO reported-salesorder.
        ENDIF.
      ENDIF.
      IF requested_authorizations-%delete = if_abap_behv=>mk-on.
        AUTHORITY-CHECK OBJECT 'Z_VBAK_AAT'
          ID 'ACTVT' FIELD '06'
          ID 'AUART' FIELD <salesorder>-SalesOrderType.
        IF sy-subrc <> 0.
          APPEND VALUE #( %tky           = <salesorder>-%tky
                          %delete = if_abap_behv=>auth-unauthorized
                        ) TO result.
          APPEND VALUE #( %tky = <salesorder>-%tky
                          %msg = NEW zcm_salesorder(
                                       textid     = zcm_salesorder=>no_auth_delete
                                       salesorder = <salesorder>-SalesOrder
                                       severity   = zcm_salesorder=>if_abap_behv_message~severity-error
                                 )
                        ) TO reported-salesorder.
        ENDIF.
      ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD earlynumbering_cba_item.

    READ ENTITIES OF zr_salesordertp IN LOCAL MODE
    ENTITY salesorder BY  \_item
    FIELDS ( salesorderitem )
    WITH CORRESPONDING #( entities )
    RESULT DATA(sales_order_items)
    FAILED failed.
    LOOP AT entities ASSIGNING FIELD-SYMBOL(<sales_order>).
      "get highest item from sales order items of a sales order

      DATA(max_item_id) = REDUCE #(  INIT max = CONV zposnr( '000000' )
                          FOR sales_order_item IN sales_order_items USING KEY entity WHERE ( salesorder = <sales_order>-salesorder )
                          NEXT max = COND zposnr( WHEN sales_order_item-salesorderitem > max
                          THEN sales_order_item-salesorderitem
                          ELSE max )
                          ).
    ENDLOOP.
    "assign sales order item id
    LOOP AT <sales_order>-%target ASSIGNING
    FIELD-SYMBOL(<sales_order_item>).
      APPEND CORRESPONDING #( <sales_order_item> ) TO
      mapped-salesorderitem
      ASSIGNING FIELD-SYMBOL(<mapped_sales_order_item>).
      IF <sales_order_item>-salesorderitem IS INITIAL.
        max_item_id += 1.
        <sales_order_item>-salesorderitem = max_item_id.
      ENDIF.

    ENDLOOP.
  ENDMETHOD.

  METHOD get_global_authorizations.
    IF requested_authorizations-%create = if_abap_behv=>mk-on.
      AUTHORITY-CHECK OBJECT 'Z_VBAK_AAT'
        ID 'ACTVT' FIELD '01'
        ID 'ZAUART' DUMMY.
      IF sy-subrc <> 0.
        result-%create = if_abap_behv=>auth-unauthorized.
        APPEND VALUE #( %global = if_abap_behv=>mk-on
                        %msg = NEW zcm_salesorder(
                                     textid   = zcm_salesorder=>no_auth_create
                                     severity = zcm_salesorder=>if_abap_behv_message~severity-error
                               )
                      ) TO reported-salesorder.
      ENDIF.
    ENDIF.
    IF requested_authorizations-%update = if_abap_behv=>mk-on.
      AUTHORITY-CHECK OBJECT 'V_VBAK_AAT'
        ID 'ACTVT' FIELD '02'
        ID 'AUART' DUMMY.
      IF sy-subrc <> 0.
        result-%update = if_abap_behv=>auth-unauthorized.
        APPEND VALUE #( %global = if_abap_behv=>mk-on
                        %msg = NEW zcm_salesorder(
                                     textid   = zcm_salesorder=>no_auth_update
                                     severity = zcm_salesorder=>if_abap_behv_message~severity-error
                               )
                      ) TO reported-salesorder.
      ENDIF.
    ENDIF.
    IF requested_authorizations-%Delete = if_abap_behv=>mk-on.
      AUTHORITY-CHECK OBJECT 'V_VBAK_AAT'
        ID 'ACTVT' FIELD '06'
        ID 'AUART' DUMMY.
      IF sy-subrc <> 0.
        result-%Delete = if_abap_behv=>auth-unauthorized.
        APPEND VALUE #( %global = if_abap_behv=>mk-on
                        %msg = NEW zcm_salesorder(
                                     textid   = zcm_salesorder=>no_auth_delete
                                     severity = zcm_salesorder=>if_abap_behv_message~severity-error
                               )
                      ) TO reported-salesorder.
      ENDIF.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
