@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Read Countries using a Table Function'
@ClientHandling.type:      #CLIENT_DEPENDENT
@ClientHandling.algorithm: #SESSION_VARIABLE
define table function Z_TableFunctionCountry
  with parameters
    @Environment.systemField: #CLIENT
    P_SAPClient : abap.clnt
  //,
  //@Environment.systemField: #SYSTEM_LANGUAGE
  //P_Language  : spras
returns
{
  mandt                     : abap.clnt;
  Country                   : land1;
  CountryThreeLetterISOCode : land1;
  CountryThreeDigitISOCode  : land1;
  CountryISOCode            : intca;
}
implemented by method
  zcl_table_function_country=>get_countries