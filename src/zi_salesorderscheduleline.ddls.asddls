@AccessControl.authorizationCheck: #NOT_REQUIRED

@EndUserText.label: 'Sales Order Schedule Line'

@Metadata.ignorePropagatedAnnotations: true

define view entity ZI_SalesOrderScheduleLine

  as select from zsalesordersline

  association [1..1] to ZI_SalesOrder            as _SalesOrder     
  on  $projection.SalesOrder = _SalesOrder.SalesOrder
  association to parent ZI_SalesOrderItem as _SalesOrderItem 
  on  $projection.SalesOrder     = _SalesOrderItem.SalesOrder
  and $projection.SalesOrderItem = _SalesOrderItem.SalesOrderItem

{

      @ObjectModel.foreignKey.association: '_SalesOrder'

  key salesorder             as SalesOrder,

      @ObjectModel.foreignKey.association: '_SalesOrderItem'

  key salesorderitem         as SalesOrderItem,

  key salesorderscheduleline as SalesOrderScheduleLine,

      deliverydate           as DeliveryDate,

      @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'

      orderquantity          as OrderQuantity,

      orderquantityunit      as OrderQuantityUnit,

      createdbyuser          as CreatedByUser,

      creationdatetime       as CreationDateTime,

      lastchangedbyuser      as LastChangedByUser,

      lastchangedatetime     as LastChangeDateTime,

      _SalesOrder,

      _SalesOrderItem

}
