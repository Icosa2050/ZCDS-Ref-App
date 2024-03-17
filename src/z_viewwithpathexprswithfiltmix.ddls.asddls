@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View with Path Expressions and Filters'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_VIEWWITHPATHEXPRSWITHFILTMIX
  as select from ZI_Product
  //with only one inner the empty row is excluded
{
  key Product,
      _Text[1: left outer where Language='E'].ProductName as ProductNameEnglish,
      _Text[1: inner where Language='E'].ProductName as ProductOfEnglishText
}
