*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations


*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
"CLASS lcl_test_event_handler DEFINITION DEFERRED FOR TESTING.

"CLASS lhe_salesorder DEFINITION INHERITING FROM cl_abap_behavior_event_handler FRIENDS lcl_test_event_handler.
CLASS lhe_salesorder DEFINITION INHERITING FROM cl_abap_behavior_event_handler .
  PRIVATE SECTION.
    METHODS on_created FOR ENTITY EVENT
       created          FOR SalesOrder~Created
       created_specific FOR SalesOrder~CreatedWithSoldToParty.
    METHODS on_changed FOR ENTITY EVENT
       changed FOR SalesOrder~changed.
    METHODS on_deleted FOR ENTITY EVENT
       deleted FOR SalesOrder~deleted.
ENDCLASS.

CLASS lhe_salesorder IMPLEMENTATION.

  METHOD on_created.
    "do something
  ENDMETHOD.

  METHOD on_changed.
    "do something
    READ ENTITY ZR_SalesOrderTP ALL FIELDS WITH CORRESPONDING #( changed ) RESULT DATA(result).
  ENDMETHOD.

  METHOD on_deleted.
    "do something
  ENDMETHOD.

ENDCLASS.
