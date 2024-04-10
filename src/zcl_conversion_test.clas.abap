CLASS zcl_conversion_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .
    DATA : out TYPE REF TO if_oo_adt_classrun_out.
    METHODS: conversion.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_conversion_test IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    me->out = out.
    CALL METHOD conversion.
  ENDMETHOD.

  METHOD conversion.
    DATA: l_exchange_rate     TYPE cl_exchange_rates=>ty_convert_curr-ukurs ##NEEDED,
          l_foreign_amount    TYPE decfloat34 ##NEEDED,
          l_foreign_factor    TYPE cl_exchange_rates=>ty_convert_curr-ffact ##NEEDED,
          l_local_factor      TYPE cl_exchange_rates=>ty_convert_curr-tfact ##NEEDED,
          l_derived_rate_type TYPE cl_exchange_rates=>ty_convert_curr-kurst ##NEEDED,
          l_fixed_rate        TYPE cl_exchange_rates=>ty_convert_curr-ukurs ##NEEDED.
    TRY.
********** Conversion to Foreign Currency **********/
*    Row  MANDT  FCURR  TCURR  GDATU     NOTATION
*============================================
*9    100           USD    82019898  2
*Date is inverted to 1998-08-20
        "data dat1 type d value '82019898' .
        DATA dat1 TYPE d VALUE '82019898' .
        DATA dat2 TYPE d .
        TRANSLATE dat1 USING '09182736455463728190'.
        out->write( dat1 ).
*    * 1. Convert 1 EUR to USD on
        CALL METHOD cl_exchange_rates=>convert_to_foreign_currency
          EXPORTING
            date              = '01011798'
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
        out->write( 'Error in conversion' ).
        cl_abap_unit_assert=>fail(
           level = if_abap_unit_constant=>severity-low
           msg   = 'Issue on converting to foreign currency.' ) ##NO_TEXT.
    ENDTRY.
    out->write( l_exchange_rate ).
    out->write( l_foreign_amount ).
    out->write( l_foreign_factor ).

  ENDMETHOD.

ENDCLASS.
