@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View for Product Texts'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@ObjectModel.dataCategory: #TEXT
define view entity ZC_ProductText
  as projection on ZI_ProductText
{
      @Semantics.language: true
  key Language,
      @ObjectModel.text.element: ['ProductName']
  key Product,
      @Semantics.text: true
      ProductName,
      _Product : redirected to parent ZC_PRODUCT
}
