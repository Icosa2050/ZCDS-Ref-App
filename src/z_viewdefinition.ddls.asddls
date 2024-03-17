/*comment*/
//other comment
//annotations
@AccessControl.authorizationCheck: #MANDATORY
@EndUserText.label: 'View Definition'
//view definition
define view entity Z_ViewDefinition
  //parameter definition
  with parameters
    P_SalesOrderType : zauart
  //data source of selection with alias name
  as select from                 ZI_SalesOrderItem as ITEM
  //join
    left outer to exact one join ZI_SalesOrder     as SO on SO.SalesOrder = ITEM.SalesOrder
  //association definition
  association [0..1] to ZI_Product as _Product on $projection.RenamedProduct = _Product.Product
{
      //projected field as key
  key ITEM.SalesOrder,
      //projected field used in association definition
  key ITEM.Product                            as RenamedProduct,
      //constant
      abap.char'A'                            as Constant,
      //calculated field
      concat( ITEM.SalesOrder, ITEM.Product ) as CalculatedField,
      //aggregate
      count(*)                                as NumberOfAggregatedItems,
      case ITEM.Product
      when 'P1'
      //constant
      then 'P1 found'
      when 'P2'
      then 'P2 found'
      else
      'other product'
      end                                     as foundProduct,
      //projected association
      ITEM._SalesOrder,
      //association exposure
      _Product
}
//filter conditions based on join partner and parameter
where
  SO.SalesOrderType = $parameters.P_SalesOrderType
//aggregation level
group by
  ITEM.SalesOrder,
  ITEM.Product
