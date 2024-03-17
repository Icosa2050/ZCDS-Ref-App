@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'M to N View C'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_MToNRelationViewC
  as select from zt000_dummy
  association [0..1] to Z_MToNRelationViewA as _ViewA on $projection.KeyFieldA = _ViewA.KeyFieldA
  association [0..1] to Z_MToNRelationViewB as _ViewB on $projection.KeyFieldB = _ViewB.KeyFieldB
{
  key abap.int4'1' as KeyFieldA,
  key abap.int4'3' as KeyFieldB,
      _ViewA,
      _ViewB
}
union select distinct from zt000_dummy
association [0..1] to Z_MToNRelationViewA as _ViewA on $projection.KeyFieldA = _ViewA.KeyFieldA
association [0..1] to Z_MToNRelationViewB as _ViewB on $projection.KeyFieldB = _ViewB.KeyFieldB
{
  key abap.int4'1' as KeyFieldA,
  key abap.int4'4' as KeyFieldB,
      _ViewA,
      _ViewB
}
union select distinct from zt000_dummy
association [0..1] to Z_MToNRelationViewA as _ViewA on $projection.KeyFieldA = _ViewA.KeyFieldA
association [0..1] to Z_MToNRelationViewB as _ViewB on $projection.KeyFieldB = _ViewB.KeyFieldB
{
  key abap.int4'2' as KeyFieldA,
  key abap.int4'4' as KeyFieldB,
      _ViewA,
      _ViewB
}
