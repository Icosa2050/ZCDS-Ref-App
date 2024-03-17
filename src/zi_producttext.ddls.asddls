@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Product Text'

@Metadata.ignorePropagatedAnnotations: true

@ObjectModel.representativeKey: 'Product'

@ObjectModel.dataCategory: #TEXT

@Search.searchable: true

define view entity ZI_ProductText 

  as select from zproducttext

  association to parent ZI_Product as _Product on $projection.Product = _Product.Product

{

      @Semantics.language: true

  key language           as Language,

      @ObjectModel.text.element:['ProductName']

  key product            as Product,

      @Search.defaultSearchElement: true

      @Search.fuzzinessThreshold: 0.7

      @Semantics.text: true

      product_name       as ProductName,

      _Product

}
