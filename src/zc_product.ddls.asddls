@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'projection view on ZI_PRODUCT_IC'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define root view entity ZC_PRODUCT
  provider contract transactional_query
  as projection on ZI_Product
{
      @Consumption.valueHelpDefinition: [
        {  entity: { name:'ZI_ProductSTdVH',
           element: 'Product'} }]
      @EndUserText.label: 'Product'
      @ObjectModel.text.element: [ 'ProductName' ]
      @UI.lineItem: [ { position: 10, importance: #HIGH } ]
      @UI.selectionField: [ { element:'Product', position: 10 } ]
  key Product,
      ProductType,
      @EndUserText.label: 'Product Type'
      @UI.lineItem: [ { position: 20, importance: #HIGH } ]
      @Semantics.text:true
      _Text.ProductName : localized,
      _Text : redirected to composition child ZC_ProductText
}
