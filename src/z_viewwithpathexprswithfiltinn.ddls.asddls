@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View with Path Expressions and Filters'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
//added where condition to eliminate empty fields
define view entity Z_VIEWWITHPATHEXPRSWITHFILTINN
  as select from ZI_Product
  //with both inner the empty row is excluded
{
  key Product,
      _Text[1: inner where Language='E'].ProductName as ProductNameEnglish,
      _Text[1: inner where Language='E'].ProductName as ProductOfEnglishText
}
