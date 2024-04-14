define root abstract entity ZD_SalesOrderCreateFromQuoteP
{
  Dummy        : abap.int1;
  _SalesQuotes : composition [0..*] of ZD_SalesOrderCreateFromQuoteSP;
}
