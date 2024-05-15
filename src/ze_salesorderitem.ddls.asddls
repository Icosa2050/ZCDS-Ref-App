@AccessControl.authorizationCheck: #PRIVILEGED_ONLY
@EndUserText.label: 'extension'
@AbapCatalog.extensibility:{

extensible:true,
elementSuffix:'ZSI',
dataSources: ['Persistence'],
allowNewDatasources:false,
quota: {
maximumFields:1000,
maximumBytes:10000
}
}
define view entity ZE_SalesOrderItem
  as select from zsalesorderitem as Persistence
{
  key Persistence.salesorder,
  key Persistence.salesorderitem
}
