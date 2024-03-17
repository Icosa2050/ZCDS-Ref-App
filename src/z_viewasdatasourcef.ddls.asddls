@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View F  Aggregation'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_VIEWAsDataSourceF as select from zt000_dummy
{

  key abap.char'A' as Field1,

  key abap.char'A' as Field2,

      abap.int1'1' as Field3

}

union all select distinct from zt000_dummy

{

  key abap.char'A' as Field1,

  key abap.char'B' as Field2,

      abap.int1'2' as Field3

}

union all select distinct from zt000_dummy

{

  key abap.char'A' as Field1,

  key abap.char'C' as Field2,

      abap.int1'3' as Field3

}
