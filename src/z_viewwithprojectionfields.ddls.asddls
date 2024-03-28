@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View with Projection Fields'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_ViewWithProjectionFields
  as select distinct from zt000_dummy

{

  key abap.char'A'                                                 as FieldA,

      abap.char'B'                                                 as FieldB,

      concat( $projection.FieldA, $projection.FieldB )             as FieldC,

      concat( abap.char'A', abap.char'B' )                         as FieldC2,

      concat( $projection.FieldC, abap.char'D' )                   as FieldD,

      concat( concat( abap.char'A', abap.char'B' ), abap.char'D' ) as FieldD2

}
