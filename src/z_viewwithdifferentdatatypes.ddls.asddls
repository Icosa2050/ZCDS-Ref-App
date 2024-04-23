@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View with different Data Types'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_ViewWithDifferentDataTypes
  as select from zt000_dummy
{

  key '1'                                                  as KeyField,

      //    language

      abap.lang'E'                                         as LangE,

      //    indicator

      abap.char'X'                                         as CharX,


      abap.char'X'                                         as AnnotatedCharX,

      cast( abap.char'X' as abap_boolean preserving type ) as CastCharX,

      //    numeric character

      abap.numc'0123456789'                                as Numc0123456789,

      abap.numc'0000000000'                                as Numc0000000000,

      cast( '' as abap.numc(10) )                          as CastNumc,

      //    character

      abap.char'0000000000'                                as Char0000000000,

      cast( abap.char'0123456789' as zvbeln_ic preserving type )              as CastChar0123456789,

      cast( '' as abap.char(10) )                          as CastChar,

      //    UUID

      hextobin('506B4BC345D41EDBA2AF23A6C9E8193A')         as RawUUID,

      abap.char'506B4BC345D41EDBA2AF23A6C9E8193A'          as CharUUID,

      @Semantics.uuid:true

      abap.char'506B4BC345D41EDBA2AF23A6C9E8193A'          as AnnotatedCharUUID

}
