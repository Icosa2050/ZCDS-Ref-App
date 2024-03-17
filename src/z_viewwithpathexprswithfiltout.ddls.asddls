@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View with Path Expressions and Filters'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
// with explicit left outer the not matching entry is shown, also
// the same as there is no where condition in the path
define view entity Z_VIEWWITHPATHEXPRSWITHFILTOUT
  as select from ZI_Product
{
  key Product,
      _Text[1: left outer where Language='E'].ProductName as ProductNameEnglish,
      _Text[1: left outer where Language='E'].ProductName as ProductOfEnglishText
}
