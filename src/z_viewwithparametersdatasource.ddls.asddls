@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View  with Parameters Data Source'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_ViewWithParametersDataSource
  as select distinct from zt000_dummy
{
  key abap.char'A'        as KeyField,
  key abap.lang'E'        as Language,
  key abap.dats'99580809' as ValidityEndDate,
      abap.dats'20111004' as ValidityStartDate
}


union select distinct from zt000_dummy
{

  key abap.char'A'        as KeyField,
  key abap.lang'E'        as Language,
  key abap.dats'99580809' as ValidityEndDate,
      abap.dats'20121004' as ValidityStartDate

} 
union select distinct from zt000_dummy
{

  key abap.char'A'        as KeyField,
  key abap.lang'E'        as Language,
  key abap.dats'99580809' as ValidityEndDate,
      abap.dats'20101004' as ValidityStartDate

}
union select distinct from zt000_dummy
{

  key abap.char'A'        as KeyField,
  key abap.lang'D'        as Language,
  key abap.dats'99580809' as ValidityEndDate,
      abap.dats'20121004' as ValidityStartDate

} 
union select distinct from zt000_dummy
{

  key abap.char'A'        as KeyField,
  key abap.lang'D'        as Language,
  key abap.dats'99580809' as ValidityEndDate,
      abap.dats'20101004' as ValidityStartDate

}
