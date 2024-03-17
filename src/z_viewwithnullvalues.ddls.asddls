@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View with Null Values'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_VIEWWITHNULLVALUES as select from zt000_dummy
{

  key '1' as KeyField,

      'A' as FieldA,

      'B' as FieldB,

      'C' as FieldC

} union all select distinct from zt000_dummy 

  left outer to one join zt000_dummy as JOIN_TARGET

    on 1 = 2

{

  key '2' as KeyField,

      JOIN_TARGET.logsys as FieldA,

      case 1 when 2 then '' end as FieldB,

      '' as FieldC

} union all select distinct from zt000_dummy 

  left outer to one join zt000_dummy as JOIN_TARGET

    on 1 = 2

{

  key '3' as KeyField,

      JOIN_TARGET.logsys as FieldA,

      '' as FieldB,

      '' as FieldC

 }

