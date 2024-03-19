@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View with alternative keys'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
//depending on release of the system, the following annotation can be used:

//@ObjectModel.alternativeKey: [
//{ id : 'ObjectInternalID', element : [ 'ObjectInternalID' ] },
//{ id : 'ObjectExternalKey', element : [ 'ObjectID', 'ObjectVersion' ] }]

define view entity Z_ViewWithAlternativeKeys
  as select distinct from zt000_dummy
{

  key hextobin('00000000000000000000000000000001') as ObjectUUID,
      1                                            as ObjectInternalID,
      1                                            as ObjectID,
      1                                            as ObjectVersion

}
