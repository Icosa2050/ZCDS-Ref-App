@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Country (via Table Function)'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_CountryViaTableFunction
  as select from Z_TableFunctionCountry
                 ( P_SAPClient : $session.client )
  association [0..*] to I_CountryText as _Text
    on $projection.Country = _Text.Country
  association [0..1] to I_Currency    as _CountryCurrency
    on $projection.CountryISOCode = _CountryCurrency.Currency
{
  key Country,
      CountryThreeLetterISOCode,
      CountryThreeDigitISOCode,
      CountryISOCode,
      _Text.CountryName         as CountryName,
      _CountryCurrency.Currency as CountryCurrency
}
group by
  Country,
  CountryThreeLetterISOCode,
  CountryThreeDigitISOCode,
  CountryISOCode,
  _Text.CountryName,
  _CountryCurrency.Currency;
