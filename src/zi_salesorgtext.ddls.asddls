@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Product Text'

@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.representativeKey: 'SalesOrg'

@ObjectModel.dataCategory: #TEXT

@Search.searchable: true

define view entity ZI_SALESORGTEXT

  as select from zsalesorgtext as SalesOrgText

  association to parent ZI_SalesOrganization as _SalesOrg

    on $projection.SalesOrg = _SalesOrg.Salesorganization


{

      @Semantics.language: true

  key language          as Language,

      @ObjectModel.text.element:['SalesOrgName']

  key salesorganization as SalesOrg,

      @Search.defaultSearchElement: true

      @Search.fuzzinessThreshold: 0.7

      @Semantics.text: true

      vtext             as SalesOrgName,

      _SalesOrg

}
