CLASS zcl_select_salesorderitem_cube DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_select_salesorderitem_cube IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA: lt_result TYPE TABLE OF zb_salesorderitemcube01,
          ls_result TYPE zb_salesorderitemcube01.

    SELECT * FROM zb_salesorderitemcube01 INTO TABLE @lt_result.

    LOOP AT lt_result INTO ls_result.
      " Process each record from the cube
      out->write( lt_result ).
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.

