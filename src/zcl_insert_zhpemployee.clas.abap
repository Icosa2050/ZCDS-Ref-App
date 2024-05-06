CLASS zcl_insert_zhpemployee DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
    DATA : out TYPE REF TO if_oo_adt_classrun_out.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_insert_zhpemployee IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
*####################################################################

    me->out = out.
*####################################################################

    DATA: ls_zhp_employee TYPE zhp_employee.
    DATA: lt_zhp_employee TYPE STANDARD TABLE OF zhp_employee WITH EMPTY KEY.
    DATA: timestampl TYPE timestampl.
    GET TIME STAMP FIELD DATA(lv_time).
    DATA(lv_sy_datum) = cl_abap_context_info=>get_system_date( ).
* SY-UZEIT
    DATA(lv_sy_uzeit) = cl_abap_context_info=>get_system_time( ).
* SY-UNAME
    DATA(lv_sy_uname) = cl_abap_context_info=>get_user_technical_name( ).

    SELECT * FROM zhp_employee INTO TABLE @lt_zhp_employee.
    IF sy-subrc = 0.
      DELETE zhp_employee FROM TABLE @lt_zhp_employee.
      commit work.
    ENDIF.
    CLEAR lt_zhp_employee.

    CLEAR ls_zhp_employee.
    ls_zhp_employee-employee        = '0001'.
    ls_zhp_employee-employeename    = 'Anne'.
    ls_zhp_employee-gender    = 'F'.
    ls_zhp_employee-parttimepercent = 100.
    ls_zhp_employee-score = 53.

    INSERT ls_zhp_employee INTO TABLE lt_zhp_employee.
    CLEAR ls_zhp_employee.

    ls_zhp_employee-employee        = '0002'.
    ls_zhp_employee-employeename    = 'Ben'.
    ls_zhp_employee-gender    = 'M'.
    ls_zhp_employee-parttimepercent = 80.
    ls_zhp_employee-score = 84.

    INSERT ls_zhp_employee INTO TABLE lt_zhp_employee.
    CLEAR ls_zhp_employee.

    ls_zhp_employee-employee        =   '0003' .
    ls_zhp_employee-employeename    =  'Carmen'     .
    ls_zhp_employee-gender   = 'F' .
    ls_zhp_employee-parttimepercent =  100 .
    ls_zhp_employee-score =  66 .

    INSERT ls_zhp_employee INTO TABLE lt_zhp_employee.
    CLEAR ls_zhp_employee.


    ls_zhp_employee-employee        =   '0004'  .
    ls_zhp_employee-employeename    = 'David'.
    ls_zhp_employee-gender   = 'M' .
    ls_zhp_employee-parttimepercent =  100.
    ls_zhp_employee-score =  92.

    INSERT ls_zhp_employee INTO TABLE lt_zhp_employee.
    CLEAR ls_zhp_employee.

    ls_zhp_employee-employee        =   '0005'  .
    ls_zhp_employee-employeename    = 'Elisabeth'.
    ls_zhp_employee-gender  = 'F'.
    ls_zhp_employee-parttimepercent = 100.
    ls_zhp_employee-score = 69.

    INSERT ls_zhp_employee INTO TABLE lt_zhp_employee.
    CLEAR ls_zhp_employee.


    ls_zhp_employee-employee        =   '0006'  .
    ls_zhp_employee-employeename    = 'Frank'.
    ls_zhp_employee-gender  = 'M' .
    ls_zhp_employee-parttimepercent =  60 .
    ls_zhp_employee-score =  72 .

    INSERT ls_zhp_employee INTO TABLE lt_zhp_employee.
    CLEAR ls_zhp_employee.


    ls_zhp_employee-employee        =   '0007' .
    ls_zhp_employee-employeename    = 'Greta'.
    ls_zhp_employee-gender =  'F' .
    ls_zhp_employee-parttimepercent = 100 .
    ls_zhp_employee-score = 87 .

    INSERT ls_zhp_employee INTO TABLE lt_zhp_employee.
    CLEAR ls_zhp_employee.


    ls_zhp_employee-employee        =   '0008'  .
    ls_zhp_employee-employeename    = 'Harald'.
    ls_zhp_employee-gender = 'M' .
    ls_zhp_employee-parttimepercent =  80 .
    ls_zhp_employee-score =  79 .

    INSERT ls_zhp_employee INTO TABLE lt_zhp_employee.
    CLEAR ls_zhp_employee.


    ls_zhp_employee-employee        =   '0009'  .
    ls_zhp_employee-employeename    = 'Isabell' .
    ls_zhp_employee-gender = 'F' .
    ls_zhp_employee-parttimepercent = 90.
    ls_zhp_employee-score = 61 .

    INSERT ls_zhp_employee INTO TABLE lt_zhp_employee.
    CLEAR ls_zhp_employee.


    ls_zhp_employee-employee        =   '0010'  .
    ls_zhp_employee-employeename    = 'Jon'.
    ls_zhp_employee-gender = 'M' .
    ls_zhp_employee-parttimepercent =  100 .
    ls_zhp_employee-score =   87 .

    INSERT ls_zhp_employee INTO TABLE lt_zhp_employee.
    CLEAR ls_zhp_employee.


    ls_zhp_employee-employee        =   '0011' .
    ls_zhp_employee-employeename    = 'Kim'        .
    ls_zhp_employee-gender = 'F' .
    ls_zhp_employee-parttimepercent = 50 .
    ls_zhp_employee-score = 56 .

    INSERT ls_zhp_employee INTO TABLE lt_zhp_employee.
    CLEAR ls_zhp_employee.


    ls_zhp_employee-employee        =   '0012'  .
    ls_zhp_employee-employeename    = 'Linus'.
    ls_zhp_employee-gender =  'M' .
    ls_zhp_employee-parttimepercent = 100 .
    ls_zhp_employee-score =   82 .

    INSERT ls_zhp_employee INTO TABLE lt_zhp_employee.
    CLEAR ls_zhp_employee.


    ls_zhp_employee-employee        =   '0013'  .
    ls_zhp_employee-employeename    = 'Michelle' .
    ls_zhp_employee-gender = 'F' .
    ls_zhp_employee-parttimepercent = 100 .
    ls_zhp_employee-score =  74 .

    INSERT ls_zhp_employee INTO TABLE lt_zhp_employee.
    CLEAR ls_zhp_employee.


    ls_zhp_employee-employee        =   '0014' .
    ls_zhp_employee-employeename    = 'Nils'.
    ls_zhp_employee-gender = 'M' .
    ls_zhp_employee-parttimepercent = 100 .
    ls_zhp_employee-score =  95 .

    INSERT ls_zhp_employee INTO TABLE lt_zhp_employee.
    CLEAR ls_zhp_employee.


    ls_zhp_employee-employee        =   '0015'   .
    ls_zhp_employee-employeename    = 'Olga'.
    ls_zhp_employee-gender = 'F' .
    ls_zhp_employee-parttimepercent = 100 .
    ls_zhp_employee-score = 49 .

    INSERT ls_zhp_employee INTO TABLE lt_zhp_employee.
    CLEAR ls_zhp_employee.


    ls_zhp_employee-employee        =   '0016'  .
    ls_zhp_employee-employeename    = 'Patrick' .
    ls_zhp_employee-gender = 'M' .
    ls_zhp_employee-parttimepercent =  100 .
    ls_zhp_employee-score =  85 .

    INSERT ls_zhp_employee INTO TABLE lt_zhp_employee.
    CLEAR ls_zhp_employee.


    ls_zhp_employee-employee        =   '0017'  .
    ls_zhp_employee-employeename    = 'Quinta'  .
    ls_zhp_employee-gender = 'F' .
    ls_zhp_employee-parttimepercent = 100 .
    ls_zhp_employee-score =  55 .

    INSERT ls_zhp_employee INTO TABLE lt_zhp_employee.
    CLEAR ls_zhp_employee.


    ls_zhp_employee-employee        =   '0018'  .
    ls_zhp_employee-employeename    = 'Raphael'.
    ls_zhp_employee-gender =  'M' .
    ls_zhp_employee-parttimepercent =   100 .
    ls_zhp_employee-score =    73 .

    INSERT ls_zhp_employee INTO TABLE lt_zhp_employee.
    CLEAR ls_zhp_employee.


    ls_zhp_employee-employee        =   '0019'  .
    ls_zhp_employee-employeename    = 'Sara'.
    ls_zhp_employee-gender = 'F' .
    ls_zhp_employee-parttimepercent = 100.
    ls_zhp_employee-score = 86 .

    INSERT ls_zhp_employee INTO TABLE lt_zhp_employee.
    CLEAR ls_zhp_employee.


    ls_zhp_employee-employee        =   '0020'  .
    ls_zhp_employee-employeename    = 'Thomas'    .
    ls_zhp_employee-gender = 'M'.
    ls_zhp_employee-parttimepercent = 100 .
    ls_zhp_employee-score = 99 .

    INSERT ls_zhp_employee INTO TABLE lt_zhp_employee.
    CLEAR ls_zhp_employee.

    LOOP AT lt_zhp_employee INTO ls_zhp_employee.
      INSERT zhp_employee FROM @ls_zhp_employee.
      IF sy-subrc <> 0.
        out->write( 'Data modification failed' ).
        out->write(  ls_zhp_employee  ).
        EXIT.
      ENDIF.
    ENDLOOP.
    "  INSERT zhp_employee FROM TABLE @lt_zhp_employee.
    IF sy-subrc = 0.
      out->write(  'Data modification was successfully' ).
      COMMIT WORK.
      CLEAR lt_zhp_employee.
      SELECT * FROM zhp_employee INTO TABLE @lt_zhp_employee.
      out->write(  lt_zhp_employee ).
    ELSE.
      out->write( 'Data modification failed' ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
