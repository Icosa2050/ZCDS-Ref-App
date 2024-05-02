@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Sales Organization (CDS)'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_SalesOrganization
  as select from zsalesorg
{

      @ObjectModel.text.element: ['Description']

  key salesorganization as SalesOrganization,

      @Semantics.text: true

      description as Description
}
