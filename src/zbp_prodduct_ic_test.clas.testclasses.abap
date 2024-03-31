"!@testing SRVB:ZUI_PRODUCT_IC000_O4
CLASS ltc_CREATE DEFINITION FINAL FOR TESTING DURATION SHORT RISK LEVEL HARMLESS.

  PRIVATE SECTION.


    METHODS:
      create FOR TESTING RAISING cx_static_check.

ENDCLASS.

CLASS ltc_CREATE IMPLEMENTATION.


  METHOD create.
    DATA:
      ls_business_data TYPE zproduct_ic000_d,
      lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_request       TYPE REF TO /iwbep/if_cp_request_create,
      lo_response      TYPE REF TO /iwbep/if_cp_response_create.


    lo_client_proxy = /iwbep/cl_cp_factory_unit_tst=>create_v4_local_proxy(
                    EXPORTING
                      is_service_key     = VALUE #( service_id      = 'ZUI_PRODUCT_DISPLAY'
                                                    repository_id   = 'SRVD'
                                                    service_version = '0001' )
                       iv_do_write_traces = abap_true ).


* Prepare business data
    ls_business_data = VALUE #(
              product                        = 'Product'
              producttype                    = 'Producttype'
              authorizationgroup             = 'Authorizationgroup'
              price                          = '1'
              currency                       = 'Currency'
              creationdatetime               = 20240101123000
              locallastchangedat             = 20240101123000
              draftfieldchanges              = ''
              draftentitycreationdatetime    = 20240101123000
              draftentitylastchangedatetime  = 20240101123000
              hasactiveentity                = abap_true ).

    " Navigate to the resource and create a request for the create operation
    lo_request = lo_client_proxy->create_resource_for_entity_set( 'ZC_PRODUCT_IC000' )->create_request_for_create( ).

    " Set the business data for the created entity
    lo_request->set_business_data( ls_business_data ).

    " Execute the request
    lo_response = lo_request->execute( ).

    " Get the after image
    lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
    IF ls_business_data IS INITIAL.
      cl_abap_unit_assert=>fail( 'no products found' ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.

"!@testing SRVB:ZUI_PRODUCT_IC000_O4
CLASS ltc_READ_ENTITY DEFINITION FINAL FOR TESTING DURATION SHORT RISK LEVEL HARMLESS.

  PRIVATE SECTION.


    METHODS:
      read_entity FOR TESTING RAISING cx_static_check.

ENDCLASS.

CLASS ltc_READ_ENTITY IMPLEMENTATION.


  METHOD read_entity.
    DATA:
      ls_entity_key    TYPE zproduct_ic000_d,
      ls_business_data TYPE zproduct_ic000_d,
      lo_resource      TYPE REF TO /iwbep/if_cp_resource_entity,
      lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_request       TYPE REF TO /iwbep/if_cp_request_read,
      lo_response      TYPE REF TO /iwbep/if_cp_response_read.



    lo_client_proxy = /iwbep/cl_cp_factory_unit_tst=>create_v4_local_proxy(
                    EXPORTING
                      is_service_key     = VALUE #( service_id      = 'ZUI_PRODUCT_IC000_O4'
                                                    repository_id   = 'SRVD'
                                                    service_version = '0001' )
                       iv_do_write_traces = abap_true ).


    " Set entity key
    ls_entity_key = VALUE #(
              product         = 'P2'
              hasactiveentity  = abap_true ).

    " Navigate to the resource
    lo_resource = lo_client_proxy->create_resource_for_entity_set( 'ZC_PRODUCT' )->navigate_with_key( ls_entity_key ).

    " Execute the request and retrieve the business data
    lo_response = lo_resource->create_request_for_read( )->execute( ).
    lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
    IF ls_business_data IS INITIAL.
      cl_abap_unit_assert=>fail( 'no products found' ).
    ENDIF.

  ENDMETHOD.

ENDCLASS.

"!@testing SRVB:ZUI_PRODUCT_IC000_O4
CLASS ltc_READ_LIST DEFINITION FINAL FOR TESTING DURATION SHORT RISK LEVEL HARMLESS.

  PRIVATE SECTION.


    METHODS:
      read_list FOR TESTING RAISING cx_static_check.

ENDCLASS.

CLASS ltc_READ_LIST IMPLEMENTATION.


  METHOD read_list.
    DATA:
      lt_business_data TYPE TABLE OF zproduct_ic000_d,
      lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_request       TYPE REF TO /iwbep/if_cp_request_read_list,
      lo_response      TYPE REF TO /iwbep/if_cp_response_read_lst.

*DATA:
* lo_filter_factory   TYPE REF TO /iwbep/if_cp_filter_factory,
* lo_filter_node_1    TYPE REF TO /iwbep/if_cp_filter_node,
* lo_filter_node_2    TYPE REF TO /iwbep/if_cp_filter_node,
* lo_filter_node_root TYPE REF TO /iwbep/if_cp_filter_node,
* lt_range_PRODUCT TYPE RANGE OF zdmd_de_id,
* lt_range_PRODUCTTYPE TYPE RANGE OF zmtart.



    lo_client_proxy = /iwbep/cl_cp_factory_unit_tst=>create_v4_local_proxy(
                    EXPORTING
                      is_service_key     = VALUE #( service_id      = 'ZUI_PRODUCT_DISPLAY'
                                                    repository_id   = 'SRVD'
                                                    service_version = '0001' )
                       iv_do_write_traces = abap_true ).


    " Navigate to the resource and create a request for the read operation
    lo_request = lo_client_proxy->create_resource_for_entity_set( 'ZC_PRODUCT' )->create_request_for_read( ).

    " Create the filter tree
*lo_filter_factory = lo_request->create_filter_factory( ).
*
*lo_filter_node_1  = lo_filter_factory->create_by_range( iv_property_path     = 'PRODUCT'
*                                                        it_range             = lt_range_PRODUCT ).
*lo_filter_node_2  = lo_filter_factory->create_by_range( iv_property_path     = 'PRODUCTTYPE'
*                                                        it_range             = lt_range_PRODUCTTYPE ).

*lo_filter_node_root = lo_filter_node_1->and( lo_filter_node_2 ).
*lo_request->set_filter( lo_filter_node_root ).

    lo_request->set_top( 50 )->set_skip( 0 ).

    " Execute the request and retrieve the business data
    lo_response = lo_request->execute( ).
    lo_response->get_business_data( IMPORTING et_business_data = lt_business_data ).
    IF lt_business_data IS INITIAL.
      cl_abap_unit_assert=>fail( 'no products found' ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.

"!@testing SRVB:ZUI_PRODUCT_IC000_O4
CLASS ltc_UPDATE DEFINITION FINAL FOR TESTING DURATION SHORT RISK LEVEL HARMLESS.

  PRIVATE SECTION.


    METHODS:
      update FOR TESTING RAISING cx_static_check.

ENDCLASS.

CLASS ltc_UPDATE IMPLEMENTATION.


  METHOD update.
    DATA:
      ls_business_data TYPE zproduct_ic000_d,
      ls_entity_key    TYPE zproduct_ic000_d,
      lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_resource      TYPE REF TO /iwbep/if_cp_resource_entity,
      lo_request       TYPE REF TO /iwbep/if_cp_request_update,
      lo_response      TYPE REF TO /iwbep/if_cp_response_update.



    lo_client_proxy = /iwbep/cl_cp_factory_unit_tst=>create_v4_local_proxy(
                    EXPORTING
                      is_service_key     = VALUE #( service_id      = 'ZUI_PRODUCT_DISPLAY'
                                                    repository_id   = 'SRVD'
                                                    service_version = '0001' )
                       iv_do_write_traces = abap_true ).


    " Set entity key
    ls_entity_key = VALUE #(
              product         = 'P1'
              hasactiveentity  = abap_true ).

    " Prepare the business data
    ls_business_data = VALUE #(
              product                        = 'P1'
              producttype                    = 'T1'
              authorizationgroup             = ''
              price                          = '600'
              currency                       = 'EUR'
              creationdatetime               = 20240101123000
              locallastchangedat             = 20240101123000
              draftfieldchanges              = ''
              draftentitycreationdatetime    = 20240101123000
              draftentitylastchangedatetime  = 20240101123000
              hasactiveentity                = abap_true ).

    " Navigate to the resource and create a request for the update operation
    lo_resource = lo_client_proxy->create_resource_for_entity_set( 'ZC_PRODUCT_IC000' )->navigate_with_key( ls_entity_key ).
    lo_request = lo_resource->create_request_for_update( /iwbep/if_cp_request_update=>gcs_update_semantic-put ).


    lo_request->set_business_data( ls_business_data ).

    " Execute the request and retrieve the business data
    lo_response = lo_request->execute( ).

    " Get updated entity
    CLEAR ls_business_data.
    lo_response->get_business_data( IMPORTING es_business_data = ls_business_data ).
    cl_abap_unit_assert=>fail( 'Implement your assertions' ).
  ENDMETHOD.

ENDCLASS.

"!@testing SRVB:ZUI_PRODUCT_IC000_O4
CLASS ltc_DELETE_ENTITY DEFINITION FINAL FOR TESTING DURATION SHORT RISK LEVEL HARMLESS.

  PRIVATE SECTION.


    METHODS:
      delete_entity FOR TESTING RAISING cx_static_check.

ENDCLASS.

CLASS ltc_DELETE_ENTITY IMPLEMENTATION.


  METHOD delete_entity.
    DATA:
      ls_entity_key    TYPE  zproduct_ic000_d,
      ls_business_data TYPE zproduct_ic000_d,
      lo_resource      TYPE REF TO /iwbep/if_cp_resource_entity,
      lo_client_proxy  TYPE REF TO /iwbep/if_cp_client_proxy,
      lo_request       TYPE REF TO /iwbep/if_cp_request_delete.


    lo_client_proxy = /iwbep/cl_cp_factory_unit_tst=>create_v4_local_proxy(
                    EXPORTING
                      is_service_key     = VALUE #( service_id      = 'ZUI_PRODUCT_DISPLAY'
                                                    repository_id   = 'SRVD'
                                                    service_version = '0001' )
                       iv_do_write_traces = abap_true ).


    "Set entity key
    ls_entity_key = VALUE #(
              product         = 'P1'
              hasactiveentity  = abap_true ).

    "Navigate to the resource and create a request for the delete operation
    lo_resource = lo_client_proxy->create_resource_for_entity_set( 'ZC_PRODUCT_IC000' )->navigate_with_key( ls_entity_key ).
    lo_request = lo_resource->create_request_for_delete( ).


    " Execute the request
    lo_request->execute( ).

    cl_abap_unit_assert=>fail( 'Implement your assertions' ).
  ENDMETHOD.

ENDCLASS.
