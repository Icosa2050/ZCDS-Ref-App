@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Customer (CDS)'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_Customer

  as select from zcustomer_ic

{

      @ObjectModel.text.element: ['CustomerName']

  key customer as Customer,
      @Semantics.text: true
      name     as CustomerName,
      country  as Country

}
