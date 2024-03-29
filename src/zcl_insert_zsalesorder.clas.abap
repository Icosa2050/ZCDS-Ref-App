CLASS zcl_insert_zsalesorder DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_insert_zsalesorder IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
*####################################################################

*####################################################################

    DATA: gs_zsalesorder TYPE zsalesorder.
    DATA: gt_zsalesorder TYPE STANDARD TABLE OF zsalesorder WITH EMPTY KEY.

    SELECT * FROM zsalesorder INTO TABLE @gt_zsalesorder.
    IF sy-subrc = 0.
      DELETE zsalesorder FROM TABLE @gt_zsalesorder.
    ENDIF.
    CLEAR gt_zsalesorder.

    CLEAR gs_zsalesorder.
    gs_zsalesorder-salesorder        = 'S1'.
    gs_zsalesorder-salesordertype    = 'KL'.
    gs_zsalesorder-salesorganization = 'US'.
    INSERT gs_zsalesorder INTO TABLE gt_zsalesorder.
    CLEAR gs_zsalesorder.
    gs_zsalesorder-salesorder        = 'S2'.
    gs_zsalesorder-salesordertype    = 'AG'.
    gs_zsalesorder-salesorganization = 'EU'.
    INSERT gs_zsalesorder INTO TABLE gt_zsalesorder.
    CLEAR gs_zsalesorder.
    gs_zsalesorder-salesorder        = 'S3'.
    gs_zsalesorder-salesordertype    = 'TAF'.
    gs_zsalesorder-salesorganization = 'US'.
    INSERT gs_zsalesorder INTO TABLE gt_zsalesorder.
    CLEAR gs_zsalesorder.
    gs_zsalesorder-salesorder        = 'S4'.
    gs_zsalesorder-salesordertype    = 'TA'.
    gs_zsalesorder-salesorganization = 'EU'.
    INSERT gs_zsalesorder INTO TABLE gt_zsalesorder.

    MODIFY zsalesorder FROM TABLE @gt_zsalesorder.
    IF sy-subrc = 0.
      out->write(  'Data modification was successfully' ).
    ELSE.
      out->write( 'Data modification failed' ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
