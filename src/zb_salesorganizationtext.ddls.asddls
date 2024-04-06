@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'view for sales org texts'
@ObjectModel.dataCategory: #TEXT
@ObjectModel.representativeKey: 'salesorganization'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZB_SalesOrganizationText
  as select from zsalesorgtext
  //  association [0..1] to ZB_SalesOrganization as _SalesOrganization
  //    on $projection.salesorganization = _SalesOrganization.salesorganization
  //  association [0..1] to I_Language as _Language
  //   on $projection.Language = _Language.Language
{

  key salesorganization as Salesorganization,
      @Semantics.language: true
  key language          as Language
      /*
            @ObjectModel.foreignKey.association: 'SalesOrganization'
        key salesorganization  as Salesorganization,
            @ObjectModel.foreignKey.association: '_language.Language'
            @Semantics.language: true
        key Language as Language,
            @Semantics.text: true
            vtext              as SalesOrganizationName
            */
}
