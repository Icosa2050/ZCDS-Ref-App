@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'M to N View'
@Metadata.ignorePropagatedAnnotations:true

define view entity Z_MToNRelationViewA
  as select distinct from zt000_dummy
  association [0..*] to Z_MToNRelationViewC as _MToN on $projection.KeyFieldA = _MToN.KeyFieldA
{
  key abap.int4'1' as KeyFieldA
  ,
  _MToN
}
union select distinct from zt000_dummy
association [0..*] to Z_MToNRelationViewC as _MToN on $projection.KeyFieldA = _MToN.KeyFieldA
{
  key abap.int4'2' as KeyFieldA
  ,
  _MToN
}
