CLASS zcl_f_salesorderitem DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    "INTERFACES if_sadl_exit .
    INTERFACES if_sadl_exit_calc_element_read .
    "INTERFACES if_sadl_exit_filter_transform .
    INTERFACES if_sadl_exit_sort_transform .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_F_SALESORDERITEM IMPLEMENTATION.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_F_SALESORDERITEM->IF_SADL_EXIT_CALC_ELEMENT_READ~CALCULATE
* +-------------------------------------------------------------------------------------------------+
* | [--->] IT_ORIGINAL_DATA               TYPE        STANDARD TABLE
* | [--->] IT_REQUESTED_CALC_ELEMENTS     TYPE        TT_ELEMENTS
* | [<-->] CT_CALCULATED_DATA             TYPE        STANDARD TABLE
* | [!CX!] CX_SADL_EXIT
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_sadl_exit_calc_element_read~calculate.
    LOOP AT it_original_data ASSIGNING FIELD-SYMBOL(<salesorderitem>).
      ASSIGN COMPONENT 'NETAMOUNT'
        OF STRUCTURE <salesorderitem>
        TO FIELD-SYMBOL(<netamount>).
      CHECK sy-subrc = 0.
      CHECK <netamount> IS INITIAL.
      ASSIGN COMPONENT 'ORDERISFREEOFCHARGE'
        OF STRUCTURE ct_calculated_data[ sy-tabix ]
        TO FIELD-SYMBOL(<orderisfreeofcharge>).
      CHECK sy-subrc = 0.
      <orderisfreeofcharge> = abap_true.
    ENDLOOP.
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_F_SALESORDERITEM->IF_SADL_EXIT_CALC_ELEMENT_READ~GET_CALCULATION_INFO
* +-------------------------------------------------------------------------------------------------+
* | [--->] IT_REQUESTED_CALC_ELEMENTS     TYPE        TT_ELEMENTS
* | [--->] IV_ENTITY                      TYPE        STRING
* | [<---] ET_REQUESTED_ORIG_ELEMENTS     TYPE        TT_ELEMENTS
* | [!CX!] CX_SADL_EXIT
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_sadl_exit_calc_element_read~get_calculation_info.
    INSERT CONV #( 'NETAMOUNT' ) INTO TABLE et_requested_orig_elements.
  ENDMETHOD.


* <SIGNATURE>---------------------------------------------------------------------------------------+
* | Instance Public Method ZCL_F_SALESORDERITEM->IF_SADL_EXIT_SORT_TRANSFORM~MAP_ELEMENT
* +-------------------------------------------------------------------------------------------------+
* | [--->] IV_ENTITY                      TYPE        STRING
* | [--->] IV_ELEMENT                     TYPE        STRING
* | [<---] ET_SORT_ELEMENTS               TYPE        TT_SORT_ELEMENTS
* | [!CX!] CX_SADL_EXIT
* +--------------------------------------------------------------------------------------</SIGNATURE>
  METHOD if_sadl_exit_sort_transform~map_element.
    ASSERT iv_entity = 'ZC_SALESORDERITEMTP'.
    ASSERT iv_element = 'ORDERISFREEOFCHARGE'.
    APPEND VALUE #( name = 'NETAMOUNT' reverse = abap_true ) TO et_sort_elements.
  ENDMETHOD.
ENDCLASS.


