CLASS zcx_db_message DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .

    ALIASES msgty
      FOR if_t100_dyn_msg~msgty .

    METHODS constructor
      IMPORTING
        !textid   LIKE if_t100_message=>t100key OPTIONAL
        !previous LIKE previous OPTIONAL
        !msgty    TYPE symsgty OPTIONAL .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcx_db_message IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    CALL METHOD super->constructor
      EXPORTING
        previous = previous.
    me->msgty = msgty .
    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
