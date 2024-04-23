@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'value help for Product Name'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@ObjectModel.supportedCapabilities: [#VALUE_HELP_PROVIDER]
@ObjectModel.dataCategory: #VALUE_HELP
@Search.searchable: true
define view entity ZI_ProductStdVH
  as select from ZI_Product
{
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @ObjectModel.text.element: ['ProductName']
  key Product,
      $session.system_language as Language,
      @Search.defaultSearchElement: true
      @Search.fuzzinessThreshold: 0.8
      @Semantics.text: true
      _Text[1:Language=$session.system_language].ProductName
}
//as projection on ZI_Product
/*
@ObjectModel.supportedCapabilities: [#VALUE_HELP_PROVIDER]
@ObjectModel.dataCategory: #VALUE_HELP
@Search.searchable: true
define root view entity ZI_ProductStdVH
            as projection on ZI_Product{
            @Search.defaultSearchElement: true
            @Search.fuzzinessThreshold: 0.8
            @Search.ranking: #HIGH
            @ObjectModel.text.element: ['ProductName']
            key Product,
            @Search.defaultSearchElement: true
            @Search.fuzzinessThreshold: 0.8
            @Search.ranking: #HIGH
            @Semantics.text: true
            _Text.ProductName as ProductName: localized
            }
            */
