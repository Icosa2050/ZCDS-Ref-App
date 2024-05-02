CLASS zcl_insert_zsalesorg DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .
  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    METHODS insert_sales_org_ic
      IMPORTING
        out TYPE REF TO if_oo_adt_classrun_out.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_insert_zsalesorg IMPLEMENTATION.
  METHOD insert_sales_org_ic.
    DATA: lt_sales_org_ic TYPE TABLE OF zsalesorg.
    DATA: ls_sales_org_ic TYPE zsalesorg.
    SELECT * FROM zsalesorg INTO TABLE @lt_sales_org_ic.
    DELETE zsalesorg FROM TABLE @lt_sales_org_ic.
    IF sy-subrc <> 0.
      out->write( 'error delete' ).
    ENDIF.
    CLEAR ls_sales_org_ic.
    CLEAR lt_sales_org_ic.

    ls_sales_org_ic = VALUE  #(
    client = sy-mandt
    salesorganization = 'CENT'
    description = 'Central' ).

    APPEND ls_sales_org_ic TO lt_sales_org_ic.

    ls_sales_org_ic = VALUE  #(
        client = sy-mandt
        salesorganization = 'FILA'
        description = 'America' ).

    APPEND ls_sales_org_ic TO lt_sales_org_ic.

    ls_sales_org_ic = VALUE  #(
        client = sy-mandt
        salesorganization = 'FILB'
        description = 'Brazil' ).

    APPEND ls_sales_org_ic TO lt_sales_org_ic.

    ls_sales_org_ic = VALUE  #(
        client = sy-mandt
        salesorganization = 'FILC'
        description = 'Canada' ).

    APPEND ls_sales_org_ic TO lt_sales_org_ic.

    INSERT zsalesorg FROM TABLE @lt_sales_org_ic.
    commit work.
    out->write( lt_sales_org_ic ).



  ENDMETHOD.
  METHOD if_oo_adt_classrun~main.
    insert_sales_org_ic( out = out ).
  ENDMETHOD.
ENDCLASS.
