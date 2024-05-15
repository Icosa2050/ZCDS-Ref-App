@AccessControl.authorizationCheck: #CHECK

@EndUserText.label: 'Sales Order'

@Metadata.ignorePropagatedAnnotations: true



@EnterpriseSearch.model: true

@EnterpriseSearch.modelName: 'Sales Order'

@EnterpriseSearch.modelNamePlural: 'Sales Orders'

@EnterpriseSearch.resultItemKey: ['SalesOrder']

@EnterpriseSearch.title: { titleField:  'SalesOrder' }

@Consumption.semanticObject: 'SalesOrder'
@Metadata.allowExtensions: true


define root view entity ZESH_S_SalesOrder

  as select from zsalesorder

  left outer to many join zsalesorderitem

    on zsalesorderitem.salesorder = zsalesorder.salesorder

  left outer to one join zproduct_ic

    on zproduct_ic.product = zsalesorderitem.product

{

      @EnterpriseSearch.freeStyleField: { withAutoCompletion: true, importance: #HIGH }

  key zsalesorder.salesorder           as SalesOrder,

  key zsalesorderitem.salesorderitem   as SalesOrderItem,

      @EnterpriseSearch.navigation.intentBased.semanticObject: 'Product'
      @EnterpriseSearch.responseField.standard: {displayPosition: 1}

      @EnterpriseSearch.freeStyleField: { withAutoCompletion: true, importance: #MEDIUM }

      zsalesorderitem.product          as Product,

      @EnterpriseSearch.responseField.standard: {displayPosition: 2}

      zproduct_ic.product_type           as ProductType

}


