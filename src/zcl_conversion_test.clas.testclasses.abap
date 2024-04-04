CLASS ltc_CREATE DEFINITION FINAL FOR TESTING DURATION SHORT RISK LEVEL HARMLESS.

  PRIVATE SECTION.


    METHODS:
      conversion_test FOR TESTING RAISING cx_static_check.

ENDCLASS.

CLASS ltc_CREATE IMPLEMENTATION.


  METHOD conversion_test.
    DATA: l_exchange_rate     TYPE cl_exchange_rates=>ty_convert_curr-ukurs ##NEEDED,
          l_foreign_amount    TYPE decfloat34 ##NEEDED,
          l_foreign_factor    TYPE cl_exchange_rates=>ty_convert_curr-ffact ##NEEDED,
          l_local_factor      TYPE cl_exchange_rates=>ty_convert_curr-tfact ##NEEDED,
          l_derived_rate_type TYPE cl_exchange_rates=>ty_convert_curr-kurst ##NEEDED,
          l_fixed_rate        TYPE cl_exchange_rates=>ty_convert_curr-ukurs ##NEEDED.
    TRY.
        CALL METHOD cl_exchange_rates=>convert_to_foreign_currency
          EXPORTING
            date              = '20210101'
            foreign_currency  = 'USD'
            local_amount      = 1
            local_currency    = 'EUR'
*           rate              = 0
*           rate_type         = 'M'
*           do_read_tcurr     = ABAP_TRUE
          IMPORTING
            exchange_rate     = l_exchange_rate
            foreign_amount    = l_foreign_amount
            foreign_factor    = l_foreign_factor
            local_factor      = l_local_factor
            derived_rate_type = l_derived_rate_type
            fixed_rate        = l_fixed_rate.
      CATCH cx_exchange_rates.

        cl_abap_unit_assert=>fail(
           level = if_abap_unit_constant=>severity-medium
           msg   = 'Issue on converting to foreign currency.' ) ##NO_TEXT.
    ENDTRY.

  ENDMETHOD.

ENDCLASS.
