@EndUserText.label: 'Sales Order Item'
@AccessControl.authorizationCheck: #CHECK
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}

@AbapCatalog.extensibility: {
  extensible: true,
  elementSuffix: 'ZSI',
  allowNewDatasources: false,
  dataSources: ['ZR_SalesOrderItemTP'],
  quota: {
    maximumFields: 1000,
    maximumBytes: 100000
  }
}

@Metadata.allowExtensions: true
@OData.entityType.name: 'SalesOrderItem_Type'
define view entity ZC_SalesOrderItemTP
  as projection on ZR_SalesOrderItemTP as ZR_SalesOrderItemTP
{
  key     SalesOrder,
  key     SalesOrderItem,
          @ObjectModel.text.element: ['ProductName']
          @Consumption.valueHelpDefinition: [{entity.name: 'ZI_ProductStdVH', entity.element: 'Product'}]
          Product,
          _Product._Text.ProductName : localized,
          _Product._Text[1:Language=$session.system_language].ProductName as ProductNameViaFilter,
          @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
          OrderQuantity,
          @Consumption.valueHelpDefinition: [{entity.name: 'I_UnitOfMeasureStdVH', entity.element: 'UnitOfMeasure'}]
          OrderQuantityUnit,
          @Semantics.amount.currencyCode: 'TransactionCurrency'
          NetAmount,
          @Consumption.valueHelpDefinition: [{entity.name: 'I_CurrencyStdVH', entity.element: 'Currency'}]
          TransactionCurrency,
          //@Semantics.booleanIndicator: true
          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_F_SALESORDERITEM'
          @ObjectModel.sort.enabled: true
          @ObjectModel.sort.transformedBy: 'ABAP:ZCL_F_SALESORDERITEM'
          @ObjectModel.filter.enabled: true
          //@ObjectModel.filter.transformedBy: 'ABAP:ZCL_F_SALESORDERITEM'
  virtual OrderIsFreeOfCharge :abap.char(1),
          @ObjectModel.text.element: ['CreatedByUserDescription']
          CreatedByUser,
          _CreatedByUser.UserDescription                                  as CreatedByUserDescription,
          CreationDateTime,
          @ObjectModel.text.element: ['LastChangedByUserDescription']
          LastChangedByUser,
          _LastChangedByUser.UserDescription                              as LastChangedByUserDescription,
          LastChangeDateTime,
          _SalesOrder : redirected to parent ZC_SalesOrderTP,
          _ScheduleLine : redirected to composition child ZC_SalesOrderScheduleLineTP,
          _Product
}
