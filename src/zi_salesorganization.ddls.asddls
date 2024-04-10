@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Organization (CDS)'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@AbapCatalog.entityBuffer.definitionAllowed: true
// view for table zsalesorg
define root view entity ZI_SalesOrganization
  as select from zsalesorg
  composition [0..1] of ZI_SALESORGTEXT as _Text
{
  key salesorganization as Salesorganization,
      _Text
}
