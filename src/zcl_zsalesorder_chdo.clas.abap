class ZCL_ZSALESORDER_CHDO definition
  public
  create public .

public section.

  interfaces IF_CHDO_ENHANCEMENTS .

  types:
     BEGIN OF TY_ZSALESORDER .
      INCLUDE TYPE ZSALESORDER.
      INCLUDE TYPE IF_CHDO_OBJECT_TOOLS_REL=>TY_ICDIND.
 TYPES END OF TY_ZSALESORDER .
  types:
    TT_ZSALESORDER TYPE STANDARD TABLE OF TY_ZSALESORDER .
  types:
     BEGIN OF TY_ZSALESORDERITEM .
      INCLUDE TYPE ZSALESORDERITEM.
      INCLUDE TYPE IF_CHDO_OBJECT_TOOLS_REL=>TY_ICDIND.
 TYPES END OF TY_ZSALESORDERITEM .
  types:
    TT_ZSALESORDERITEM TYPE STANDARD TABLE OF TY_ZSALESORDERITEM .
  types:
     BEGIN OF TY_ZSALESORDERSLINE .
      INCLUDE TYPE ZSALESORDERSLINE.
      INCLUDE TYPE IF_CHDO_OBJECT_TOOLS_REL=>TY_ICDIND.
 TYPES END OF TY_ZSALESORDERSLINE .
  types:
    TT_ZSALESORDERSLINE TYPE STANDARD TABLE OF TY_ZSALESORDERSLINE .

  class-data OBJECTCLASS type IF_CHDO_OBJECT_TOOLS_REL=>TY_CDOBJECTCL read-only value 'ZSALESORDER' ##NO_TEXT.

  class-methods WRITE
    importing
      !OBJECTID type IF_CHDO_OBJECT_TOOLS_REL=>TY_CDOBJECTV
      !UTIME type IF_CHDO_OBJECT_TOOLS_REL=>TY_CDUZEIT
      !UDATE type IF_CHDO_OBJECT_TOOLS_REL=>TY_CDDATUM
      !USERNAME type IF_CHDO_OBJECT_TOOLS_REL=>TY_CDUSERNAME
      !PLANNED_CHANGE_NUMBER type IF_CHDO_OBJECT_TOOLS_REL=>TY_PLANCHNGNR default SPACE
      !OBJECT_CHANGE_INDICATOR type IF_CHDO_OBJECT_TOOLS_REL=>TY_CDCHNGINDH default 'U'
      !PLANNED_OR_REAL_CHANGES type IF_CHDO_OBJECT_TOOLS_REL=>TY_CDFLAG default SPACE
      !NO_CHANGE_POINTERS type IF_CHDO_OBJECT_TOOLS_REL=>TY_CDFLAG default SPACE
      !XZSALESORDER type TT_ZSALESORDER optional
      !YZSALESORDER type TT_ZSALESORDER optional
      !UPD_ZSALESORDER type IF_CHDO_OBJECT_TOOLS_REL=>TY_CDCHNGINDH default SPACE
      !XZSALESORDERITEM type TT_ZSALESORDERITEM optional
      !YZSALESORDERITEM type TT_ZSALESORDERITEM optional
      !UPD_ZSALESORDERITEM type IF_CHDO_OBJECT_TOOLS_REL=>TY_CDCHNGINDH default SPACE
      !XZSALESORDERSLINE type TT_ZSALESORDERSLINE optional
      !YZSALESORDERSLINE type TT_ZSALESORDERSLINE optional
      !UPD_ZSALESORDERSLINE type IF_CHDO_OBJECT_TOOLS_REL=>TY_CDCHNGINDH default SPACE
    exporting
      value(CHANGENUMBER) type IF_CHDO_OBJECT_TOOLS_REL=>TY_CDCHANGENR
    raising
      CX_CHDO_WRITE_ERROR .
protected section.
private section.
ENDCLASS.



CLASS ZCL_ZSALESORDER_CHDO IMPLEMENTATION.


  method WRITE.
*"----------------------------------------------------------------------
*"         this WRITE method is generated for object ZSALESORDER
*"         never change it manually, please!        :04/21/2024
*"         All changes will be overwritten without a warning!
*"
*"         CX_CHDO_WRITE_ERROR is used for error handling
*"----------------------------------------------------------------------

    DATA: l_upd        TYPE if_chdo_object_tools_rel=>ty_cdchngind.

    CALL METHOD cl_chdo_write_tools=>changedocument_open
      EXPORTING
        objectclass             = objectclass
        objectid                = objectid
        planned_change_number   = planned_change_number
        planned_or_real_changes = planned_or_real_changes.

    IF ( YZSALESORDER IS INITIAL ) AND
       ( XZSALESORDER IS INITIAL ).
      l_upd  = space.
    ELSE.
      l_upd = UPD_ZSALESORDER.
    ENDIF.

    IF l_upd NE space.
      CALL METHOD CL_CHDO_WRITE_TOOLS=>changedocument_multiple_case
        EXPORTING
          tablename              = 'ZSALESORDER'
          change_indicator       = UPD_ZSALESORDER
          docu_delete            = 'X'
          docu_insert            = 'X'
          docu_delete_if         = 'X'
          docu_insert_if         = 'X'
          table_old              = YZSALESORDER
          table_new              = XZSALESORDER
                  .
    ENDIF.

    IF ( YZSALESORDERITEM IS INITIAL ) AND
       ( XZSALESORDERITEM IS INITIAL ).
      l_upd  = space.
    ELSE.
      l_upd = UPD_ZSALESORDERITEM.
    ENDIF.

    IF l_upd NE space.
      CALL METHOD CL_CHDO_WRITE_TOOLS=>changedocument_multiple_case
        EXPORTING
          tablename              = 'ZSALESORDERITEM'
          change_indicator       = UPD_ZSALESORDERITEM
          docu_delete            = 'X'
          docu_insert            = 'X'
          docu_delete_if         = 'X'
          docu_insert_if         = 'X'
          table_old              = YZSALESORDERITEM
          table_new              = XZSALESORDERITEM
                  .
    ENDIF.

    IF ( YZSALESORDERSLINE IS INITIAL ) AND
       ( XZSALESORDERSLINE IS INITIAL ).
      l_upd  = space.
    ELSE.
      l_upd = UPD_ZSALESORDERSLINE.
    ENDIF.

    IF l_upd NE space.
      CALL METHOD CL_CHDO_WRITE_TOOLS=>changedocument_multiple_case
        EXPORTING
          tablename              = 'ZSALESORDERSLINE'
          change_indicator       = UPD_ZSALESORDERSLINE
          docu_delete            = 'X'
          docu_insert            = 'X'
          docu_delete_if         = 'X'
          docu_insert_if         = 'X'
          table_old              = YZSALESORDERSLINE
          table_new              = XZSALESORDERSLINE
                  .
    ENDIF.

    CALL METHOD cl_chdo_write_tools=>changedocument_close
      EXPORTING
        objectclass             = objectclass
        objectid                = objectid
        date_of_change          = udate
        time_of_change          = utime
        username                = username
        object_change_indicator = object_change_indicator
        no_change_pointers      = no_change_pointers
      IMPORTING
        changenumber            = changenumber.

  endmethod.
ENDCLASS.
