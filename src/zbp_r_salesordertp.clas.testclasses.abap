*"* use this source file for your ABAP unit test classes
CLASS zbp_r_salesodertTP_for_testing DEFINITION
  FOR TESTING
  CREATE PUBLIC
  DURATION SHORT
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    CLASS-DATA:cds_test_environment TYPE REF TO if_cds_test_environment,
               sql_test_environment TYPE REF TO if_osql_test_environment.


    METHODS: setup,
      test_get_sales_order FOR TESTING,
      teardown.
    CLASS-METHODS:
      class_setup,    " setup test double framework
      class_teardown. " stop test doubles


ENDCLASS.

CLASS zbp_r_salesodertTP_for_testing IMPLEMENTATION.

  METHOD setup.
    "cds_test_environment->clear_doubles(  ).
    "sql_test_environment->clear_doubles(  ).
    " Initialize the object to be tested

    " Prepare the test data
    " Assuming zyour_key_table_type is the type of keys parameter and similarly for result
    " Fill mt_keys with relevant keys to test
    " Fill mt_expected_result with the expected output for verification

    " Optionally, you could prepare mocks here if dependencies need to be isolated
  ENDMETHOD.

  METHOD test_get_sales_order.
    "Read operation executing a function
    READ ENTITIES OF zr_salesordertp
     ENTITY SalesOrder
"      EXECUTE GetSalesOrder
      FROM VALUE #( ( %key-SalesOrder = '00000000S1' )
                       )
     RESULT FINAL(result)
     FAILED FINAL(failed)
     REPORTED FINAL(reported).

    " Check the results
    cl_ABAP_unit_assert=>assert_not_initial(
        act = result
      msg = 'NO data returned.'
    ).

    " Additional assertions can be added here to verify the correctness of each part of the output
  ENDMETHOD.

  METHOD teardown.
    " Clean up after tests if necessary
    ROLLBACK ENTITIES.
  ENDMETHOD.

  METHOD class_setup.

    " create the test doubles for the underlying CDS entities
    IF cds_test_environment IS NOT INITIAL.
      cds_test_environment = cl_cds_test_environment=>create_for_multiple_cds(
                        i_for_entities = VALUE #(
                          ( i_for_entity = 'ZR_SALESORDERTP' ) ) ).
    ENDIF.

    " create test doubles for additional used tables.
    IF sql_test_environment IS NOT BOUND.
      sql_test_environment = cl_osql_test_environment=>create(
      i_dependency_list = VALUE #( ( 'ZR_SALESORDERTP' )
                                   ( 'ZR_SALESORDERITEMTP' )
                                   ( 'ZR_SALESORDERSCHEDULELINETP' ) ) ).

    ENDIF.
  ENDMETHOD.

  METHOD class_teardown.
    " remove test doubles
    IF  cds_test_environment IS NOT INITIAL.
      cds_test_environment->destroy(  ).
    ENDIF.
    IF sql_test_environment IS NOT INITIAL.
      sql_test_environment->destroy(  ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.
