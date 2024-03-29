CLASS zcl_read_viewwithleftoutjoins DEFINITION PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_read_viewwithleftoutjoins IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    SELECT *
    FROM z_viewwithleftouterjoins
    INTO TABLE @DATA(lt_viewwithleftouterjoins).
    out->write( lt_viewwithleftouterjoins ).
  ENDMETHOD.
ENDCLASS.
