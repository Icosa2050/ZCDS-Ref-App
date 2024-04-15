class ZCM_SALESORDER definition
  public
  inheriting from CX_STATIC_CHECK
  final
  create public .

public section.

  interfaces IF_T100_DYN_MSG .
  interfaces IF_T100_MESSAGE .
  interfaces IF_ABAP_BEHV_MESSAGE .

  aliases SEVERITY
    for IF_ABAP_BEHV_MESSAGE~M_SEVERITY .
  aliases T_SEVERITY
    for IF_ABAP_BEHV_MESSAGE~T_SEVERITY .

  constants:
    begin of ZCM_SALESORDER,
      msgid type symsgid value 'Z_SALESORDER',
      msgno type symsgno value '000',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of ZCM_SALESORDER .
  constants:
    begin of LOCKED,
      msgid type symsgid value 'Z_SALESORDER',
      msgno type symsgno value '001',
      attr1 type scx_attrname value 'SALESORDER',
      attr2 type scx_attrname value 'USER',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of LOCKED .
  constants:
    begin of PRODUCT_INITIAL,
      msgid type symsgid value 'Z_SALESORDER',
      msgno type symsgno value '002',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of PRODUCT_INITIAL .
  constants:
    begin of PRODUCT_DOES_NOT_EXIST,
      msgid type symsgid value 'Z_SALESORDER',
      msgno type symsgno value '003',
      attr1 type scx_attrname value 'PRODUCT',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of PRODUCT_DOES_NOT_EXIST .
  constants:
    begin of SOLD_TO_PARTY_INITIAL,
      msgid type symsgid value 'Z_SALESORDER',
      msgno type symsgno value '004',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of SOLD_TO_PARTY_INITIAL .
  constants:
    begin of SOLD_TO_PARTY_DOES_NOT_EXIST,
      msgid type symsgid value 'Z_SALESORDER',
      msgno type symsgno value '005',
      attr1 type scx_attrname value 'SOLD_TO_PARTY',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of SOLD_TO_PARTY_DOES_NOT_EXIST .
  constants:
    begin of UOM_INITIAL,
      msgid type symsgid value 'Z_SALESORDER',
      msgno type symsgno value '006',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of UOM_INITIAL .
  constants:
    begin of UOM_DOES_NOT_EXIST,
      msgid type symsgid value 'Z_SALESORDER',
      msgno type symsgno value '007',
      attr1 type scx_attrname value 'UNIT_OF_MEASURE',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of UOM_DOES_NOT_EXIST .
  constants:
    begin of NO_AUTH_DELETE,
      msgid type symsgid value 'Z_SALESORDER',
      msgno type symsgno value '010',
      attr1 type scx_attrname value 'SALESORDER',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of NO_AUTH_DELETE .
  constants:
    begin of NO_AUTH_UPDATE,
      msgid type symsgid value 'Z_SALESORDER',
      msgno type symsgno value '009',
      attr1 type scx_attrname value 'SALESORDER',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of NO_AUTH_UPDATE .
  constants:
    begin of NO_AUTH_CREATE,
      msgid type symsgid value 'Z_SALESORDER',
      msgno type symsgno value '008',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of NO_AUTH_CREATE .
  constants:
    begin of NO_AUTH_UPDATE_TYPE,
      msgid type symsgid value 'Z_SALESORDER',
      msgno type symsgno value '011',
      attr1 type scx_attrname value 'SALESORDER',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of NO_AUTH_UPDATE_TYPE .
  constants:
    begin of NOT_IMPLEMENTED,
      msgid type symsgid value 'Z_SALESORDER',
      msgno type symsgno value '012',
      attr1 type scx_attrname value '',
      attr2 type scx_attrname value '',
      attr3 type scx_attrname value '',
      attr4 type scx_attrname value '',
    end of NOT_IMPLEMENTED .
  data TEST type ABAP_BOOL read-only .
  data SALESORDER type ZVBELN .
  data USER type ZVDM_USERDESCRIPTION .
  data PRODUCT type MATNR .
  data SOLD_TO_PARTY type ZKUNAG .
  data UNIT_OF_MEASURE type MSEHI .

  methods CONSTRUCTOR
    importing
      !TEXTID like IF_T100_MESSAGE=>T100KEY optional
      !PREVIOUS like PREVIOUS optional
      !TEST type ABAP_BOOL optional
      !SALESORDER type ZVBELN optional
      !USER type ZVDM_USERDESCRIPTION optional
      !PRODUCT type MATNR optional
      !SOLD_TO_PARTY type ZKUNAG optional
      !UNIT_OF_MEASURE type MSEHI optional
      !SEVERITY type T_SEVERITY optional .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCM_SALESORDER IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCM_SALESORDER->CONSTRUCTOR
* +-------------------------------------------------------------------------------------------------+
* | [--->] TEXTID                         LIKE        IF_T100_MESSAGE=>T100KEY(optional)
* | [--->] PREVIOUS                       LIKE        PREVIOUS(optional)
* | [--->] TEST                           TYPE        ABAP_BOOL(optional)
* | [--->] SALESORDER                     TYPE        ZVBELN(optional)
* | [--->] USER                           TYPE        ZVDM_USERDESCRIPTION(optional)
* | [--->] PRODUCT                        TYPE        ZMATNR(optional)
* | [--->] SOLD_TO_PARTY                  TYPE        ZKUNAG(optional)
* | [--->] UNIT_OF_MEASURE                TYPE        MSEHI(optional)
* | [--->] SEVERITY                       TYPE        T_SEVERITY(optional)
* +--------------------------------------------------------------------------------------</SIGNATURE>
  method CONSTRUCTOR ##ADT_SUPPRESS_GENERATION.
CALL METHOD SUPER->CONSTRUCTOR
EXPORTING
PREVIOUS = PREVIOUS
.
me->TEST = TEST .
me->SALESORDER = SALESORDER .
me->USER = USER .
me->PRODUCT = PRODUCT .
me->SOLD_TO_PARTY = SOLD_TO_PARTY .
me->UNIT_OF_MEASURE = UNIT_OF_MEASURE .
me->SEVERITY = SEVERITY .
clear me->textid.
if textid is initial.
  IF_T100_MESSAGE~T100KEY = ZCM_SALESORDER .
else.
  IF_T100_MESSAGE~T100KEY = TEXTID.
endif.
  endmethod.
ENDCLASS.

