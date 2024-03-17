@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'M to N View B'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_MToNRelationViewB
  as select from zt000_dummy

//  association [0..*] to Z_MToNRelationViewC as _MToN on $projection.KeyFieldB = _MToN.KeyFieldB
{
  key abap.int4'3' as KeyFieldB
  //,
 //     _MToN
}
union select distinct from zt000_dummy
//association [0..*] to Z_MToNRelationViewC as _MToN on $projection.KeyFieldB = _MToN.KeyFieldB
{
  key abap.int4'4' as KeyFieldB
  //,
//      _MToN
}
