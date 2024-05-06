CLASS zcl_insert_zhpemployee_rel DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    DATA : out TYPE REF TO if_oo_adt_classrun_out.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_insert_zhpemployee_rel IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
*####################################################################

    me->out = out.
*####################################################################

    DATA: ls_zhp_emploeerel TYPE  zhp_employeerel.
    DATA: lt_zhp_emploeerel TYPE STANDARD TABLE OF zhp_employeerel WITH EMPTY KEY.
    DATA: timestampl TYPE timestampl.
    GET TIME STAMP FIELD DATA(lv_time).
    DATA(lv_sy_datum) = cl_abap_context_info=>get_system_date( ).
* SY-UZEIT
    DATA(lv_sy_uzeit) = cl_abap_context_info=>get_system_time( ).
* SY-UNAME
    DATA(lv_sy_uname) = cl_abap_context_info=>get_user_technical_name( ).

    SELECT * FROM zhp_employeerel INTO TABLE @lt_zhp_emploeerel.
    IF sy-subrc = 0.
      DELETE zhp_employeerel FROM TABLE @lt_zhp_emploeerel.
      COMMIT WORK.
    ENDIF.
    CLEAR lt_zhp_emploeerel.
    CLEAR ls_zhp_emploeerel.


    ls_zhp_emploeerel-employee   = '0001'.
    ls_zhp_emploeerel-manager    = '0000'.
    ls_zhp_emploeerel-demoset    = '1'.

    INSERT ls_zhp_emploeerel INTO TABLE lt_zhp_emploeerel.
    CLEAR ls_zhp_emploeerel.


    ls_zhp_emploeerel-employee   = '0002'.
    ls_zhp_emploeerel-manager    = '0001'.
    ls_zhp_emploeerel-demoset    = '1'.

    INSERT ls_zhp_emploeerel INTO TABLE lt_zhp_emploeerel.
    CLEAR ls_zhp_emploeerel.

    ls_zhp_emploeerel-employee   = '0003'.
    ls_zhp_emploeerel-manager    = '0001'.
    ls_zhp_emploeerel-demoset    = '1'.

    INSERT ls_zhp_emploeerel INTO TABLE lt_zhp_emploeerel.
    CLEAR ls_zhp_emploeerel.

    ls_zhp_emploeerel-employee   = '0004'.
    ls_zhp_emploeerel-manager    = '0003'.
    ls_zhp_emploeerel-demoset    = '1'.

    INSERT ls_zhp_emploeerel INTO TABLE lt_zhp_emploeerel.
    CLEAR ls_zhp_emploeerel.

    ls_zhp_emploeerel-employee   = '0005'.
    ls_zhp_emploeerel-manager    = '0001'.
    ls_zhp_emploeerel-demoset    = '1'.

    INSERT ls_zhp_emploeerel INTO TABLE lt_zhp_emploeerel.
    CLEAR ls_zhp_emploeerel.

    ls_zhp_emploeerel-employee   = '0006'.
    ls_zhp_emploeerel-manager    = '0005'.
    ls_zhp_emploeerel-demoset    = '1'.


    INSERT ls_zhp_emploeerel INTO TABLE lt_zhp_emploeerel.
    CLEAR ls_zhp_emploeerel.

    ls_zhp_emploeerel-employee   = '0007'.
    ls_zhp_emploeerel-manager    = '0005'.
    ls_zhp_emploeerel-demoset    = '1'.

    INSERT ls_zhp_emploeerel INTO TABLE lt_zhp_emploeerel.
    CLEAR ls_zhp_emploeerel.

    ls_zhp_emploeerel-employee   = '0008'.
    ls_zhp_emploeerel-manager    = '0007'.
    ls_zhp_emploeerel-demoset    = '1'.

    INSERT ls_zhp_emploeerel INTO TABLE lt_zhp_emploeerel.
    CLEAR ls_zhp_emploeerel.

    ls_zhp_emploeerel-employee   = '0009'.
    ls_zhp_emploeerel-manager    = '0000'.
    ls_zhp_emploeerel-demoset    = '1'.


    INSERT ls_zhp_emploeerel INTO TABLE lt_zhp_emploeerel.
    CLEAR ls_zhp_emploeerel.

    ls_zhp_emploeerel-employee   = '0010'.
    ls_zhp_emploeerel-manager    = '0009'.
    ls_zhp_emploeerel-demoset    = '1'.

    INSERT ls_zhp_emploeerel INTO TABLE lt_zhp_emploeerel.
    CLEAR ls_zhp_emploeerel.

    ls_zhp_emploeerel-employee   = '0011'.
    ls_zhp_emploeerel-manager    = '0009'.
    ls_zhp_emploeerel-demoset    = '1'.


    "orphan

    INSERT ls_zhp_emploeerel INTO TABLE lt_zhp_emploeerel.
    CLEAR ls_zhp_emploeerel.

    ls_zhp_emploeerel-employee   = '0012'.
    ls_zhp_emploeerel-manager    = '1000'.
    ls_zhp_emploeerel-demoset    = '2'.

   "multiple managers

    INSERT ls_zhp_emploeerel INTO TABLE lt_zhp_emploeerel.
    CLEAR ls_zhp_emploeerel.

    ls_zhp_emploeerel-employee   = '0010'.
    ls_zhp_emploeerel-manager    = '0007'.
    ls_zhp_emploeerel-demoset    = '3'.

    INSERT ls_zhp_emploeerel INTO TABLE lt_zhp_emploeerel.
    CLEAR ls_zhp_emploeerel.



   "cycle

   "TODO: Add cycle data here





    LOOP AT lt_zhp_emploeerel INTO ls_zhp_emploeerel.
      INSERT zhp_employeerel FROM @ls_zhp_emploeerel.
      IF sy-subrc <> 0.
        out->write( 'Data modification failed' ).
        out->write(  ls_zhp_emploeerel  ).
        EXIT.
      ENDIF.
    ENDLOOP.
    "  INSERT zhp_emploeerel FROM TABLE @lt_zhp_emploeerel.
    IF sy-subrc = 0.
      out->write(  'Data modification was successfully' ).
      COMMIT WORK.
      CLEAR lt_zhp_emploeerel.
      SELECT * FROM zhp_employeerel INTO TABLE @lt_zhp_emploeerel.
      out->write(  lt_zhp_emploeerel ).
    ELSE.
      out->write( 'Data modification failed' ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
