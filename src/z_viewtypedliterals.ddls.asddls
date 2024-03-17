@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'view with type literals'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_ViewTypedLiterals
  as select from ZI_SalesOrderItem
{
  key SalesOrder                                                         as SalesOrder,
  key SalesOrderItem                                                     as SalesOrderItem,
      '  Char10  '                                                       as CharacterValue,
      cast( '   Char10' as abap.char(10) )                           as CastCharacterValue,
      abap.char'        Char10  '                                        as TypedCharacterValue,
      cast( abap.char'  Char10  '           as ztext10 preserving type ) as CastTypedCharacterValue,
      1234.56                                                            as FloatingPointValue,
      abap.fltp'1234.56'                                                 as TypedFloatingPointValue,
      fltp_to_dec( 1234.56 as abap.dec(6,2) )                            as ConvertedDecimalValue,
      abap.dec'1234.56'                                                  as TypedDecimalValue,
      abap.dec'001234.5600'                                              as TypedDecimalValue2,
      cast ( abap.lang'E' as ZBT_LANGUAGEA preserving type )             as Language1

}
