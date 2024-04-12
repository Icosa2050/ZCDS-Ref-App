CLASS lhc_ZR_SALESORDERTP_2 DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zr_salesordertp_2 RESULT result.

    METHODS create FOR MODIFY
      IMPORTING entities FOR CREATE zr_salesordertp_2.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zr_salesordertp_2.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zr_salesordertp_2.

    METHODS read FOR READ
      IMPORTING keys FOR READ zr_salesordertp_2 RESULT result.

    METHODS lock FOR LOCK
      IMPORTING keys FOR LOCK zr_salesordertp_2.

    METHODS rba_Item FOR READ
      IMPORTING keys_rba FOR READ zr_salesordertp_2\_Item FULL result_requested RESULT result LINK association_links.

    METHODS cba_Item FOR MODIFY
      IMPORTING entities_cba FOR CREATE zr_salesordertp_2\_Item.

ENDCLASS.

CLASS lhc_ZR_SALESORDERTP_2 IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

  METHOD create.
  ENDMETHOD.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD lock.
  ENDMETHOD.

  METHOD rba_Item.
  ENDMETHOD.

  METHOD cba_Item.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_ZR_SALESORDERITEMTP_2 DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zr_salesorderitemtp_2.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zr_salesorderitemtp_2.

    METHODS read FOR READ
      IMPORTING keys FOR READ zr_salesorderitemtp_2 RESULT result.

    METHODS rba_Salesorder FOR READ
      IMPORTING keys_rba FOR READ zr_salesorderitemtp_2\_Salesorder FULL result_requested RESULT result LINK association_links.

    METHODS rba_Scheduleline FOR READ
      IMPORTING keys_rba FOR READ zr_salesorderitemtp_2\_Scheduleline FULL result_requested RESULT result LINK association_links.

    METHODS cba_Scheduleline FOR MODIFY
      IMPORTING entities_cba FOR CREATE zr_salesorderitemtp_2\_Scheduleline.

ENDCLASS.

CLASS lhc_ZR_SALESORDERITEMTP_2 IMPLEMENTATION.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD rba_Salesorder.
  ENDMETHOD.

  METHOD rba_Scheduleline.
  ENDMETHOD.

  METHOD cba_Scheduleline.
  ENDMETHOD.

ENDCLASS.

CLASS lhc_ZR_SALESORDERSCHEDULELINET DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS update FOR MODIFY
      IMPORTING entities FOR UPDATE zr_salesorderschedulelinetp_2.

    METHODS delete FOR MODIFY
      IMPORTING keys FOR DELETE zr_salesorderschedulelinetp_2.

    METHODS read FOR READ
      IMPORTING keys FOR READ zr_salesorderschedulelinetp_2 RESULT result.

    METHODS rba_Salesorderitem FOR READ
      IMPORTING keys_rba FOR READ zr_salesorderschedulelinetp_2\_Salesorderitem FULL result_requested RESULT result LINK association_links.

    METHODS rba_Salesorder FOR READ
      IMPORTING keys_rba FOR READ zr_salesorderschedulelinetp_2\_Salesorder FULL result_requested RESULT result LINK association_links.

ENDCLASS.

CLASS lhc_ZR_SALESORDERSCHEDULELINET IMPLEMENTATION.

  METHOD update.
  ENDMETHOD.

  METHOD delete.
  ENDMETHOD.

  METHOD read.
  ENDMETHOD.

  METHOD rba_Salesorderitem.
  ENDMETHOD.

  METHOD rba_Salesorder.
  ENDMETHOD.

ENDCLASS.

CLASS lsc_ZR_SALESORDERTP_2 DEFINITION INHERITING FROM cl_abap_behavior_saver.
  PROTECTED SECTION.

    METHODS finalize REDEFINITION.

    METHODS check_before_save REDEFINITION.

    METHODS save REDEFINITION.

    METHODS cleanup REDEFINITION.

    METHODS cleanup_finalize REDEFINITION.

ENDCLASS.

CLASS lsc_ZR_SALESORDERTP_2 IMPLEMENTATION.

  METHOD finalize.
  ENDMETHOD.

  METHOD check_before_save.
  ENDMETHOD.

  METHOD save.
  ENDMETHOD.

  METHOD cleanup.
  ENDMETHOD.

  METHOD cleanup_finalize.
  ENDMETHOD.

ENDCLASS.
