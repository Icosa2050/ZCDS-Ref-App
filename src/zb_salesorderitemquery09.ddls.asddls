@AbapCatalog.sqlViewName: 'ZB_SQ09'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View for sales order items'
define view ZB_SALESORDERITEMQUERY09
  with parameters
    parameter_name : abap.char(10)
  as select from ZB_SALESORDERITEMCUBE03
{
  key SalesOrder,
  key SalesOrderItem,
      CreationDate,
      SalesOrganization,
      SoldToParty,
      SoldToCountry,
      Product,
      OrderQuantity,
      OrderQuantityUnit,
      NetAmount,
      TransactionCurrency,
      /* Associations */
      _Product,
      _SalesOrder,
      _SalesOrganization,
      _SoldToParty
}
