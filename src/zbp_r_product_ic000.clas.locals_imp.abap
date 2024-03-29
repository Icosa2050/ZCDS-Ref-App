CLASS LHC_ZR_PRODUCT_IC000 DEFINITION INHERITING FROM CL_ABAP_BEHAVIOR_HANDLER.
  PRIVATE SECTION.
    METHODS:
      GET_GLOBAL_AUTHORIZATIONS FOR GLOBAL AUTHORIZATION
        IMPORTING
           REQUEST requested_authorizations FOR ZR_PRODUCT_IC000
        RESULT result.
ENDCLASS.

CLASS LHC_ZR_PRODUCT_IC000 IMPLEMENTATION.
  METHOD GET_GLOBAL_AUTHORIZATIONS.
      DATA: l_auth TYPE ABP_BEHV_FLAG.
            clear l_auth.
  ASSIGN COMPONENT '%CREATE' OF STRUCTURE REQUESTED_AUTHORIZATIONS TO FIELD-SYMBOL(<lv_auth>).
  ASSIGN COMPONENT '%UPDATE' OF STRUCTURE REQUESTED_AUTHORIZATIONS TO FIELD-SYMBOL(<lv_auth1>).
  ASSIGN COMPONENT '%DELETE' OF STRUCTURE REQUESTED_AUTHORIZATIONS TO FIELD-SYMBOL(<lv_auth2>).
  ASSIGN COMPONENT '%ACTION' OF STRUCTURE REQUESTED_AUTHORIZATIONS TO FIELD-SYMBOL(<lv_ACTION>).
  ASSIGN COMPONENT '%ACTION-EDIT' OF STRUCTURE REQUESTED_AUTHORIZATIONS TO FIELD-SYMBOL(<lv_ACTION_ACTION>).
  IF <lv_auth> = 'X'.
"//not working which values are needed to be set to inhibit the action?
  result-%CREATE = 00.
  result-%UPDATE = 00.
  result-%DELETE = 00.
  ELSE.
    endif.
  ENDMETHOD.
ENDCLASS.
