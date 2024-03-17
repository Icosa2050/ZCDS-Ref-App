CLASS zcl_read_viewoptparams DEFINITION PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_read_viewoptparams IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA(lv_today) = cl_abap_context_info=>get_system_date( ).

    SELECT *
       FROM z_viewwithoptionalparameters( p_keydate = @lv_today )
       INTO TABLE @DATA(lt_viewwithoptionalparameters).

    out->write( '***parameter value from program' ).
    out->write( lt_viewwithoptionalparameters ).


    SELECT *
       FROM z_viewwithoptionalparameters
       INTO TABLE @lt_viewwithoptionalparameters.

    out->write( '***implicit parameter value from system fields' ).
    out->write( lt_viewwithoptionalparameters ).


  ENDMETHOD.
ENDCLASS.
