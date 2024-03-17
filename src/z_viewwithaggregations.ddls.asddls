@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'View with Aggregations'

define view entity Z_ViewWithAggregations

  as select from Z_VIEWAsDataSourceF

{

  key Field1,

      min(Field3)                      as FieldWithMin,

      max(Field3)                      as FieldWithMax,

      avg( Field3 as abap.decfloat34 ) as FieldWithAvg,

      cast( sum(Field3) as abap.int4 ) as FieldWithSum,

//      sum(Field3)                      as FieldWithSum2,

      count( distinct Field1 )         as FieldWithCountDistinct,

      count(*)                         as FieldWithCountAll

}

group by

  Field1

