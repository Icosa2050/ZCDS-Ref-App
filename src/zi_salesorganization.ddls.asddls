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
define view entity ZI_SalesOrganization as select from zsalesorg
{
    key salesorganization as Salesorganization
}
