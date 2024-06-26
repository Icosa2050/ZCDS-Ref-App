CLASS lsc_zr_salesordertp DEFINITION INHERITING FROM cl_abap_behavior_saver.

  PROTECTED SECTION.

    METHODS save_modified REDEFINITION.

ENDCLASS.

CLASS lsc_zr_salesordertp IMPLEMENTATION.

  METHOD save_modified.
    DATA changed TYPE TABLE FOR EVENT ZR_SalesOrderTP~Changed.
    DATA deleted TYPE TABLE FOR EVENT ZR_SalesOrderTP~Deleted.

    IF create-salesorder IS NOT INITIAL.
      RAISE ENTITY EVENT ZR_SalesOrderTP~Created
        FROM CORRESPONDING #( create-salesorder MAPPING EventRaisedDateTime = CreationDateTime ).
    ENDIF.

    deleted = CORRESPONDING #( delete-salesorder ).

    LOOP AT update-salesorder ASSIGNING FIELD-SYMBOL(<salesorder>).
      IF <salesorder>-DeletionIndicator = abap_true.
        APPEND VALUE #( SalesOrder = <salesorder>-SalesOrder ) TO deleted.
      ELSE.
        APPEND VALUE #( SalesOrder = <salesorder>-SalesOrder ) TO changed.
      ENDIF.
    ENDLOOP.

    IF changed IS NOT INITIAL.
      RAISE ENTITY EVENT ZR_SalesOrderTP~Changed FROM changed.
    ENDIF.

    IF deleted IS NOT INITIAL.
      RAISE ENTITY EVENT ZR_SalesOrderTP~Deleted FROM deleted.
    ENDIF.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_salesorderscheduleline DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS VerifyQuantityUnit FOR VALIDATE ON SAVE
      IMPORTING keys FOR SalesOrderScheduleLine~VerifyQuantityUnit.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR SalesOrderScheduleLine RESULT result.

ENDCLASS.

CLASS lhc_salesorderscheduleline IMPLEMENTATION.

  METHOD VerifyQuantityUnit.
    READ ENTITY IN LOCAL MODE ZR_SalesOrderScheduleLineTP
         FIELDS ( OrderQuantity OrderQuantityUnit )
         WITH CORRESPONDING #( keys )
         RESULT DATA(salesorderschedulelines).

    SELECT UnitOfMeasure FROM i_unitofmeasure WITH PRIVILEGED ACCESS
      FOR ALL ENTRIES IN @salesorderschedulelines
      WHERE UnitOfMeasure = @salesorderschedulelines-OrderQuantityUnit INTO TABLE @DATA(uoms).

    LOOP AT salesorderschedulelines ASSIGNING FIELD-SYMBOL(<salesorderscheduleline>).
      APPEND VALUE #( %tky        = <salesorderscheduleline>-%tky
                      %state_area = 'VERIFYQUANTITY' )
        TO reported-salesorderscheduleline.

      IF <salesorderscheduleline>-OrderQuantity     IS NOT INITIAL AND
         <salesorderscheduleline>-OrderQuantityUnit IS     INITIAL.
        APPEND VALUE #( %tky = <salesorderscheduleline>-%tky ) TO failed-salesorderscheduleline.
        APPEND VALUE #( %tky                      = <salesorderscheduleline>-%tky
                        %msg                      = NEW zcm_salesorder(
                                                          textid   = zcm_salesorder=>uom_initial
                                                          severity = if_abap_behv_message=>severity-error
                                                    )
                        %element-OrderQuantityUnit = if_abap_behv=>mk-on
                        %state_area                = 'VERIFYQUANTITY' )
          TO reported-salesorderscheduleline.
      ENDIF.
      IF <salesorderscheduleline>-OrderQuantityUnit IS NOT INITIAL.
        APPEND VALUE #( %tky = <salesorderscheduleline>-%tky ) TO failed-salesorderscheduleline.
        APPEND VALUE #( %tky                      = <salesorderscheduleline>-%tky
                        %msg                      = NEW zcm_salesorder(
                                                          textid          = zcm_salesorder=>uom_does_not_exist
                                                          unit_of_measure = <salesorderscheduleline>-OrderQuantityUnit
                                                          severity        = zcm_salesorder=>if_abap_behv_message~severity-error
                                                    )
                        %element-OrderQuantityUnit = if_abap_behv=>mk-on
                        %state_area                = 'VERIFYQUANTITY' )
                TO reported-salesorderscheduleline.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD get_instance_features.
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

    METHODS delete FOR MODIFY
      IMPORTING keys FOR ACTION SalesOrder~delete.
    METHODS get_global_features FOR GLOBAL FEATURES
      IMPORTING REQUEST requested_features FOR SalesOrder RESULT result.

    "METHODS CreateFromQuote FOR MODIFY
    "  IMPORTING keys FOR ACTION SalesOrder~CreateFromQuote.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR SalesOrder RESULT result.
    METHODS getnumberofitems FOR READ
      IMPORTING keys FOR FUNCTION salesorder~getnumberofitems RESULT result.
    METHODS getSalesOrder FOR READ IMPORTING keys FOR FUNCTION SalesOrder~getSalesOrder RESULT result.
    "METHODS CalculateTotalNetAmount FOR DETERMINE ON SAVE
    "  IMPORTING keys FOR SalesOrder~CalculateTotalNetAmount.
    METHODS VerifySoldToParty FOR VALIDATE ON SAVE
      IMPORTING keys FOR SalesOrder~VerifySoldToParty.
    METHODS precheck_update FOR PRECHECK
      IMPORTING entities FOR UPDATE SalesOrder.
    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK SalesOrder.


ENDCLASS.

CLASS lhc_SalesOrder IMPLEMENTATION.


  METHOD getSalesOrder.
    READ ENTITY IN LOCAL MODE ZR_SalesOrderTP
    ALL FIELDS
    WITH CORRESPONDING #( keys )
    RESULT DATA(salesorders)
    FAILED failed.

    READ ENTITY IN LOCAL MODE ZR_SalesOrderTP
    BY \_item
    ALL FIELDS
    WITH CORRESPONDING #( keys )
    RESULT DATA(salesorderitems).

    READ ENTITY IN LOCAL MODE ZR_SalesOrderItemTP
    BY \_scheduleline
    ALL FIELDS
    WITH CORRESPONDING #( salesorderitems )
    RESULT DATA(salesorderslines).

    LOOP AT keys ASSIGNING FIELD-SYMBOL(<key>).
      READ TABLE salesorders ASSIGNING FIELD-SYMBOL(<salesorder>) WITH KEY id COMPONENTS %tky = <key>-%tky.
      IF sy-subrc = 0.
        "authority check
        "        AUTHORITY-CHECK OBJECT 'Z_VBAK_VK'
        "        ID 'ACTVT' FIELD '03'
        "        ID 'ZAUART' FIELD <salesorder>-SalesOrderType.
        "        IF sy-subrc <> 0.
        "          APPEND VALUE #( %tky = <salesorder>-%tky
        "          %fail-cause = if_abap_behv=>cause-unauthorized
        "          ) TO failed-salesorder.
        "          CONTINUE.
        "        ENDIF.
        APPEND VALUE #( SalesOrder = <salesorder>-SalesOrder )
        TO result
        ASSIGNING FIELD-SYMBOL(<result>).
        <result>-%param = CORRESPONDING #( <salesorder> ).
        LOOP AT salesorderitems ASSIGNING FIELD-SYMBOL(<salesorderitem>) USING KEY entity WHERE ( SalesOrder = <salesorder>-SalesOrder ).
          APPEND CORRESPONDING #( <salesorderitem> ) TO <result>-%param-_Items ASSIGNING FIELD-SYMBOL(<result_item>).
          LOOP AT salesorderslines ASSIGNING FIELD-SYMBOL(<salesorderline>) USING KEY entity WHERE SAlesOrder = <salesorderitem>-SalesOrder
          AND SalesOrderItem = <salesorderitem>-SalesOrderItem.
            APPEND CORRESPONDING #( <salesorderline> ) TO <result_item>-_schedulelines.
          ENDLOOP.
        ENDLOOP.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.



  METHOD get_instance_authorizations.
    READ ENTITIES OF ZR_SalesOrderTP IN LOCAL MODE
    ENTITY SalesOrder
    FIELDS ( SalesOrderType )
    WITH CORRESPONDING #( keys )
    RESULT DATA(salesorders)
    FAILED failed.

    LOOP AT salesorders ASSIGNING FIELD-SYMBOL(<salesorder>).
      "TODO is this right?
      IF requested_authorizations-%update = if_abap_behv=>mk-on
      OR requested_authorizations-%action-Edit = if_abap_behv=>mk-on.
"        AUTHORITY-CHECK OBJECT 'Z_VBAK_VK'
"          ID 'ACTVT' FIELD '02'
"          ID 'AUART' FIELD <salesorder>-SalesOrderType.
"        IF sy-subrc <> 0.
"          APPEND VALUE #( %tky    = <salesorder>-%tky
"                          %update = if_abap_behv=>auth-unauthorized
"                        ) TO result.
"          APPEND VALUE #( %tky = <salesorder>-%tky
"                          %msg = NEW zcm_salesorder(
"                                       textid     = zcm_salesorder=>no_auth_update
"                                       salesorder = <salesorder>-SalesOrder
"                                       severity   = zcm_salesorder=>if_abap_behv_message~severity-error
"                                 )
"                        ) TO reported-salesorder.
"        ENDIF.
      ENDIF.
      IF requested_authorizations-%delete = if_abap_behv=>mk-on.
"        AUTHORITY-CHECK OBJECT 'Z_VBAK_VK'
"          ID 'ACTVT' FIELD '06'
"          ID 'AUART' FIELD <salesorder>-SalesOrderType.
"        IF sy-subrc <> 0.
"          APPEND VALUE #( %tky           = <salesorder>-%tky
"                          %delete = if_abap_behv=>auth-unauthorized
"                        ) TO result.
"          APPEND VALUE #( %tky = <salesorder>-%tky
"                          %msg = NEW zcm_salesorder(
"                                       textid     = zcm_salesorder=>no_auth_delete
"                                       salesorder = <salesorder>-SalesOrder
"                                       severity   = zcm_salesorder=>if_abap_behv_message~severity-error
"                                 )
"                        ) TO reported-salesorder.
"        ENDIF.
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

      DATA(max_item_id) = REDUCE #(  INIT max = CONV zposnr_ic( '000000' )
                          FOR sales_order_item IN sales_order_items USING KEY entity WHERE ( salesorder = <sales_order>-salesorder )
                          NEXT max = COND zposnr_ic( WHEN sales_order_item-salesorderitem > max
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
"    IF requested_authorizations-%create = if_abap_behv=>mk-on.
"      AUTHORITY-CHECK OBJECT 'Z_VBAK_VK'
"        ID 'ACTVT' FIELD '01'
"        ID 'ZAUART' DUMMY.
"      IF sy-subrc <> 0.
"        result-%create = if_abap_behv=>auth-unauthorized.
"        APPEND VALUE #( %global = if_abap_behv=>mk-on
"                        %msg = NEW zcm_salesorder(
"                                     textid   = zcm_salesorder=>no_auth_create
"                                     severity = zcm_salesorder=>if_abap_behv_message~severity-error
"                               )
"                      ) TO reported-salesorder.
"
"      ENDIF.
      IF requested_authorizations-%update = if_abap_behv=>mk-on.
"        AUTHORITY-CHECK OBJECT 'Z_VBAK_VK'
"          ID 'ACTVT' FIELD '02'
"          ID 'AUART' DUMMY.
"        IF sy-subrc <> 0.
"          result-%update = if_abap_behv=>auth-unauthorized.
"          APPEND VALUE #( %global = if_abap_behv=>mk-on
"                          %msg = NEW zcm_salesorder(
"                                       textid   = zcm_salesorder=>no_auth_update
"                                       severity = zcm_salesorder=>if_abap_behv_message~severity-error
"                                 )
"                        ) TO reported-salesorder.
"        ENDIF.
      ENDIF.
      IF requested_authorizations-%Delete = if_abap_behv=>mk-on.
"        AUTHORITY-CHECK OBJECT 'Z_VBAK_VK'
"          ID 'ACTVT' FIELD '06'
"          ID 'AUART' DUMMY.
"        IF sy-subrc <> 0.
"          result-%Delete = if_abap_behv=>auth-unauthorized.
"          APPEND VALUE #( %global = if_abap_behv=>mk-on
"                          %msg = NEW zcm_salesorder(
"                                       textid   = zcm_salesorder=>no_auth_delete
"                                       severity = zcm_salesorder=>if_abap_behv_message~severity-error
"                                 )
"                        ) TO reported-salesorder.
"        ENDIF.
"      ENDIF.
    ENDIF.
  ENDMETHOD.
  METHOD delete.
    READ ENTITY IN LOCAL MODE ZR_SalesOrderTP
       FIELDS ( DeliveryStatus DeletionIndicator )
       WITH CORRESPONDING #( keys )
       RESULT DATA(salesorders)
       FAILED failed.

    DATA update TYPE TABLE FOR UPDATE zr_salesordertp\\salesorder.
    DATA delete TYPE TABLE FOR DELETE zr_salesordertp\\salesorder.

    LOOP AT salesorders ASSIGNING FIELD-SYMBOL(<salesorder>).
      IF <salesorder>-DeliveryStatus = space OR <salesorder>-DeliveryStatus = 'A'.
        "physically delete sales orders with delivery status space or A
        APPEND VALUE #( %tky = <salesorder>-%tky ) TO delete.
      ELSEIF <salesorder>-DeletionIndicator = abap_false.
        "logically delete sales orders with delivery status B or C
        APPEND VALUE #( %tky                       = <salesorder>-%tky
                        DeletionIndicator          = abap_true
                        %control-DeletionIndicator = if_abap_behv=>mk-on ) TO update.
      ENDIF.
    ENDLOOP.

    MODIFY ENTITY IN LOCAL MODE ZR_SalesOrderTP
      UPDATE FROM update
      DELETE FROM delete
      FAILED failed
      REPORTED reported.
  ENDMETHOD.

  METHOD get_global_features.
    DATA(salesordercreationswitchedeof) = abap_false.
    "read system configuration to check if creation is allowed
    "...
    IF salesordercreationswitchedeof = abap_true.
      result = CORRESPONDING #( requested_features ).
    ENDIF.
  ENDMETHOD.

"  METHOD CreateFromQuote.
"    DATA keys_base TYPE TABLE FOR ACTION IMPORT zr_salesordertp~createfromquote .
"    LOOP AT keys ASSIGNING FIELD-SYMBOL(<key>).
"      APPEND VALUE #( %cid                = <key>-%cid
""                      %param-%is_draft    = <key>-%param-%is_draft
""TODO salesquotes and salesquote do not match???
"*                      %param-_salesquotes = VALUE #( ( <key>-%param-salesquote ) )
"                    ) TO keys_base.
"    ENDLOOP.
"    "added local mode
"    MODIFY ENTITY IN LOCAL MODE ZR_SalesOrderTP
"      EXECUTE CreateFromQuote FROM keys_base
"      MAPPED   DATA(mapped_base)
"      FAILED   DATA(failed_base)
"      REPORTED DATA(reported_base).
"    mapped   = CORRESPONDING #( DEEP mapped_base ).
"    failed   = CORRESPONDING #( DEEP failed_base ).
"    reported = CORRESPONDING #( DEEP reported_base ).
"    "TODO implement
"  ENDMETHOD.

  METHOD get_instance_features.
    READ ENTITY IN LOCAL MODE ZR_SalesOrderTP
      FIELDS ( DeliveryStatus )
      WITH CORRESPONDING #( keys )
      RESULT DATA(salesorders)
      FAILED failed.

    LOOP AT salesorders ASSIGNING FIELD-SYMBOL(<salesorder>).
      IF <salesorder>-DeliveryStatus = 'C'.
        APPEND VALUE #( %tky      = <salesorder>-%tky
                        %features = CORRESPONDING #( requested_features ) ) TO result.
        "      ELSEIF <salesorder>-%is_draft = if_abap_behv=>mk-on.
        "        APPEND VALUE #( %tky      = <salesorder>-%tky
        "                        %features = VALUE #( %action-delete = if_abap_behv=>mk-on ) ) TO result.
      ENDIF.
    ENDLOOP.
    "TODO implement
  ENDMETHOD.

  METHOD GetNumberOfItems.
    READ ENTITY ZR_SalesOrderTP ##NO_LOCAL_MODE
    BY \_item
    FROM CORRESPONDING #( keys )
    RESULT DATA(salesorderitems)
    FAILED failed.

    LOOP AT keys ASSIGNING FIELD-SYMBOL(<key>).
      READ TABLE failed-salesorder TRANSPORTING NO FIELDS WITH KEY id COMPONENTS %tky = <key>-%tky.
      CHECK sy-subrc <> 0.
      APPEND VALUE #( %tky = <key>-%tky
                      %param = REDUCE #( INIT count = 0
                                            FOR salesorderitem IN salesorderitems
                                          WHERE (  %tky = <key>-%tky )  ##PRIMKEY
                                          NEXT count += count ) ) TO result.

    ENDLOOP.
  ENDMETHOD.

"  METHOD CalculateTotalNetAmount.
"    READ ENTITY IN LOCAL MODE ZR_SalesOrderTP BY \_item
"      FIELDS (  NetAmount TransactionCurrency )
"      WITH CORRESPONDING #( keys )
"      RESULT DATA(salesorderitems).
"    DATA updates TYPE TABLE FOR UPDATE ZR_SalesOrderTP.
"    LOOP AT salesorderitems ASSIGNING FIELD-SYMBOL(<salesorderitem>).
"      READ TABLE updates ASSIGNING FIELD-SYMBOL(<update>)
"      WITH KEY id COMPONENTS %tky = CORRESPONDING #( <salesorderitem>-%tky ).
"      IF sy-subrc <> 0.
"        APPEND VALUE #( %tky = CORRESPONDING #( <salesorderitem>-%tky ) )
"        TO updates ASSIGNING <update>.
"      ENDIF.
"      <update>-TransactionCurrency = <salesorderitem>-TransactionCurrency.
"      <update>-NetAmount += <salesorderitem>-NetAmount.
"    ENDLOOP.
"
"    MODIFY ENTITY IN LOCAL MODE ZR_SalesOrderTP
"    UPDATE FIELDS (  netamount transactioncurrency ) WITH updates.
"  ENDMETHOD.
"
  METHOD VerifySoldToParty.
    READ ENTITY IN LOCAL MODE ZR_SalesOrderTP
    FIELDS ( SoldToParty )
    WITH CORRESPONDING #( keys )
    RESULT DATA(salesorders).

    SELECT customer FROM zi_customer WITH PRIVILEGED ACCESS
    FOR ALL ENTRIES IN @salesorders
    WHERE customer = @salesorders-SoldToParty
    INTO TABLE @DATA(customers).

    LOOP AT salesorders ASSIGNING FIELD-SYMBOL(<salesorder>).
      APPEND VALUE #( %tky = <salesorder>-%tky
      %state_area = 'VERIFYSOLDTO'  ) TO reported-salesorder.
      IF <salesorder>-SoldToParty IS INITIAL.
        APPEND VALUE #( %tky = <salesorder>-%tky ) TO failed-salesorder.
        APPEND VALUE #( %tky = <salesorder>-%tky
                        %msg = NEW zcm_salesorder(
                                     textid   = zcm_salesorder=>sold_to_party_does_not_exist
                                     sold_to_party = <salesorder>-SoldToParty
                                     severity = zcm_salesorder=>if_abap_behv_message~severity-error
                               )
        %element-SoldToParty = if_abap_behv=>mk-on
        %state_area = 'VERIFYSOLDTO' ) TO reported-salesorder.
      ELSE.
        READ TABLE customers TRANSPORTING NO FIELDS WITH KEY customer = <salesorder>-SoldToParty.
        IF sy-subrc <> 0.
          APPEND VALUE #( %tky = <salesorder>-%tky ) TO failed-salesorder.
          APPEND VALUE #( %tky = <salesorder>-%tky
                          %msg = NEW zcm_salesorder(
                                       textid   = zcm_salesorder=>sold_to_party_does_not_exist
                                       sold_to_party = <salesorder>-SoldToParty
                                       severity = zcm_salesorder=>if_abap_behv_message~severity-error
                                 )
          %element-SoldToParty = if_abap_behv=>mk-on
          %state_area = 'VERIFYSOLDTO' ) TO reported-salesorder.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD precheck_update.
    LOOP AT entities ASSIGNING FIELD-SYMBOL(<salesorder>)
    WHERE %control-SalesOrderType = if_abap_behv=>mk-on.
      "AUTHORITY-CHECK OBJECT 'Z_VBAK_VK'
      "ID 'ACTVT' FIELD '02'
      "ID 'ZAUART' FIELD <salesorder>-SalesOrderType.
      "IF sy-subrc <> 0.
"        APPEND VALUE #( %cid = <salesorder>-%cid_ref
"                %tky = <salesorder>-%tky
"                %fail-cause = if_abap_behv=>cause-unspecific
"                %update = if_abap_behv=>mk-on
"                )
"        TO failed-salesorder.
"        APPEND VALUE #( %tky = <salesorder>-%tky
"        %msg = NEW zcm_salesorder(
"                textid = zcm_salesorder=>no_auth_update_type
"                salesorder = <salesorder>-SalesOrder
"                severity = zcm_salesorder=>if_abap_behv_message~severity-error
"                )
"        ) TO reported-salesorder.
      "ENDIF.
    ENDLOOP.

  ENDMETHOD.

  METHOD lock.

  ENDMETHOD.

ENDCLASS.
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

    METHODS delete FOR MODIFY
      IMPORTING keys FOR ACTION SalesOrderItem~delete.
    METHODS Copy FOR MODIFY
      IMPORTING keys FOR ACTION SalesOrderItem~Copy RESULT result.
    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR SalesOrderItem RESULT result.

    METHODS get_global_authorizations FOR GLOBAL AUTHORIZATION
      IMPORTING REQUEST requested_authorizations FOR SalesOrderItem RESULT result.
    "METHODS CalculateTotalAmount FOR DETERMINE ON SAVE
    "  IMPORTING keys FOR SalesOrderItem~CalculateTotalAmount.
    METHODS CalculateNetAmount FOR DETERMINE ON SAVE
      IMPORTING keys FOR SalesOrderItem~CalculateNetAmount.
    METHODS VerifyProduct FOR VALIDATE ON SAVE
      IMPORTING keys FOR SalesOrderItem~VerifyProduct.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR SalesOrderItem RESULT result.

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
      DATA(max_schedule_line_id) =
      REDUCE #( INIT max = CONV zetenr( '0000' )
             FOR sales_order_schedule_line IN sales_order_schedule_lines
               USING KEY entity WHERE ( SalesOrder = <sales_order_item>-SalesOrder
               AND SalesOrderItem = <sales_order_item>-SalesOrderItem )
               NEXT max = COND zposnr_ic( WHEN sales_order_schedule_line-SalesOrderScheduleLine > max
               THEN sales_order_schedule_line-SalesOrderScheduleLine
               ELSE max )
              ).

      "assign sales order schedule line id
      LOOP AT <sales_order_item>-%target ASSIGNING FIELD-SYMBOL(<sales_order_schedule_line>).
        APPEND CORRESPONDING #( <sales_order_schedule_line> ) TO mapped-salesorderscheduleline
        ASSIGNING FIELD-SYMBOL(<mapped_sales_order_sline>).
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
    DATA create TYPE TABLE FOR CREATE zr_salesordertp\\salesorderitem\_scheduleline.

    create = CORRESPONDING #( DEEP entities_cba ).
    LOOP AT create ASSIGNING FIELD-SYMBOL(<create>).
      LOOP AT <create>-%target ASSIGNING FIELD-SYMBOL(<target>).
        <target>-SalesOrderScheduleLineType = 'C'.
        <target>-%control-SalesOrderScheduleLineType = if_abap_behv=>mk-on.
      ENDLOOP.
    ENDLOOP.

    MODIFY ENTITY IN LOCAL MODE ZR_SalesOrderItemTP
      CREATE BY \_ScheduleLine FROM create
      MAPPED DATA(mapped_local)
      FAILED failed
      REPORTED reported.

    mapped = CORRESPONDING #( DEEP mapped_local ).
  ENDMETHOD.

  METHOD cba_Requestedscheduleline.
    DATA create TYPE TABLE FOR CREATE zr_salesordertp\\salesorderitem\_scheduleline.
    create = CORRESPONDING #( DEEP entities_cba ).
    LOOP AT create ASSIGNING FIELD-SYMBOL(<create>).
      LOOP AT <create>-%target ASSIGNING FIELD-SYMBOL(<target>).
        <target>-SalesOrderScheduleLineType = 'R'.
        <target>-%control-SalesOrderScheduleLineType =  if_abap_behv=>mk-on.
      ENDLOOP.
    ENDLOOP.
    MODIFY ENTITY IN LOCAL MODE ZR_SalesOrderItemTP
    CREATE BY \_ScheduleLine FROM create
    MAPPED DATA(mapped_local)
    FAILED failed
    REPORTED reported.
    mapped = CORRESPONDING #( DEEP mapped_local ).
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD Copy.
    READ ENTITY IN LOCAL MODE ZR_SalesOrderItemTP
    ALL FIELDS
    WITH CORRESPONDING #( keys )
    RESULT DATA(salesorderitems)
    FAILED failed.

    DATA create TYPE TABLE FOR CREATE zr_salesordertp\\salesorder\_item.

    LOOP AT keys ASSIGNING FIELD-SYMBOL(<key>).
      READ TABLE salesorderitems ASSIGNING FIELD-SYMBOL(<salesorderitem>) WITH KEY id COMPONENTS %tky = <key>-%tky.
      CHECK sy-subrc = 0.
      READ TABLE create ASSIGNING FIELD-SYMBOL(<create>)
      WITH KEY cid COMPONENTS %cid_ref = <key>-%cid_ref
      SalesOrder = <key>-SalesOrder.
      IF sy-subrc <> 0.
        APPEND VALUE #( %cid_ref = <key>-%cid_ref
                      SalesOrder = <key>-SalesOrder ) TO create ASSIGNING <create>.
      ENDIF.
      DO <key>-%param-numberofcopies TIMES.
        APPEND VALUE #( product = <salesorderitem>-product
                        orderquantity = <salesorderitem>-orderquantity
                        orderquantityunit = <salesorderitem>-orderquantityunit
                        netamount = <salesorderitem>-netamount
                        transactioncurrency = <salesorderitem>-transactioncurrency
                        ) TO <create>-%target.
      ENDDO.
      MODIFY ENTITY IN LOCAL MODE zr_salesordertp
      CREATE BY \_item
      FIELDS (  product orderquantity orderquantityunit netamount transactioncurrency )
      AUTO FILL CID WITH create
      MAPPED DATA(mapped_local)
      FAILED failed
      REPORTED reported.
      READ ENTITY IN LOCAL MODE ZR_SalesOrderItemTP
      FROM CORRESPONDING #( mapped_local-salesorderitem )
      RESULT DATA(new_salesorderitems).
      LOOP AT new_salesorderitems ASSIGNING
      FIELD-SYMBOL(<new_salesorderitem>).
        APPEND VALUE #( %cid_ref = <key>-%cid_ref
                        %tky = <key>-%tky
                        %param = CORRESPONDING #( <new_salesorderitem> ) ) TO result.
      ENDLOOP.
    ENDLOOP.

  ENDMETHOD.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD get_global_authorizations.
  ENDMETHOD.

  METHOD calculatenetamount.

    DATA updates TYPE TABLE FOR UPDATE ZR_SalesOrderItemTP.
    "please note that for the sake of simplicity in this example
    "we assume to have only one transaction currency, e.g. USD
    READ ENTITY IN LOCAL MODE ZR_SalesOrderItemTP
      FIELDS ( OrderQuantity Product )
      WITH CORRESPONDING #( keys )
      RESULT DATA(salesorderitems)
      FAILED DATA(read_failed).

    SELECT product, price, currency FROM zi_product WITH PRIVILEGED ACCESS
      FOR ALL ENTRIES IN @salesorderitems
      WHERE product = @salesorderitems-Product
      INTO TABLE @DATA(products).

    LOOP AT salesorderitems ASSIGNING FIELD-SYMBOL(<salesorderitem>).
      READ TABLE products ASSIGNING FIELD-SYMBOL(<product>)
        WITH KEY Product = <salesorderitem>-Product.
      CHECK sy-subrc = 0.
      APPEND VALUE #( %tky                         = <salesorderitem>-%tky
                      "NetAmount                    = <salesorderitem>-OrderQuantity * <product>-Price
                      TransactionCurrency          = <product>-Currency
                      "%control-NetAmount           = if_abap_behv=>mk-on
                      %control-TransactionCurrency = if_abap_behv=>mk-on
                      )
        TO updates.
    ENDLOOP.

    MODIFY ENTITY IN LOCAL MODE ZR_SalesOrderItemTP
      UPDATE FIELDS ( TransactionCurrency ) WITH updates FAILED DATA(modifyfailed) REPORTED DATA(modifyReported).
      reported = CORRESPONDING #( DEEP modifyReported ).
      "failed = CORRESPONDING #( DEEP modifyFailed ).
  ENDMETHOD.

"  METHOD calculatetotalamount.
"
"    "please note that for the sake of simplicity in this example
"    "we assume to have only one transaction currency, e.g. USD
"    READ ENTITY IN LOCAL MODE ZR_SalesOrderItemTP
"      FIELDS ( OrderQuantity Product )
"      WITH CORRESPONDING #( keys )
"      RESULT DATA(salesorderitems).
"
"    SELECT product, price, currency FROM zi_product WITH PRIVILEGED ACCESS
"      FOR ALL ENTRIES IN @salesorderitems
"      WHERE product = @salesorderitems-Product
"      INTO TABLE @DATA(products).
"
"    DATA updates TYPE TABLE FOR UPDATE ZR_SalesOrderItemTP.
"
"    LOOP AT salesorderitems ASSIGNING FIELD-SYMBOL(<salesorderitem>).
"      READ TABLE products ASSIGNING FIELD-SYMBOL(<product>)
"        WITH KEY Product = <salesorderitem>-Product.
"      CHECK sy-subrc = 0.
"      APPEND VALUE #( %tky                         = <salesorderitem>-%tky
"                      NetAmount                    = <salesorderitem>-OrderQuantity * <product>-Price
"                      "TransactionCurrency          = <product>-Currency
"                      %control-NetAmount           = if_abap_behv=>mk-on
"                      "%control-TransactionCurrency = if_abap_behv=>mk-on
"                      )
"        TO updates.
"    ENDLOOP.
"
"    MODIFY ENTITY IN LOCAL MODE ZR_SalesOrderItemTP
"      UPDATE FROM updates.
"  ENDMETHOD.

  METHOD VerifyProduct.
  ENDMETHOD.

  METHOD get_instance_features.
    READ ENTITY IN LOCAL MODE ZR_SalesOrderItemTP BY \_SalesOrder
     FIELDS ( DeliveryStatus )
     WITH CORRESPONDING #( keys )
     RESULT DATA(salesorderitems)
     FAILED failed.
    "TODO find out what these keys could mean
    LOOP AT keys ASSIGNING FIELD-SYMBOL(<key>).
      READ TABLE salesorderitems ASSIGNING FIELD-SYMBOL(<salesorderitem>)
      WITH KEY id COMPONENTS %tky = <key>-%tky.
      IF <salesorderitem>-DeliveryStatus = 'C'.
        APPEND VALUE #( %tky = <salesorderitem>-%tky
                          %features = CORRESPONDING #( requested_features ) ) TO result.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
