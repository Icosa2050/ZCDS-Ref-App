@AccessControl.authorizationCheck: #PRIVILEGED_ONLY

@EndUserText.label: 'Sales Order with Privileged Only Access'

@Metadata.ignorePropagatedAnnotations: true

define view entity ZC_SalesOrderPrivilegedOnly

  as select from ZI_SalesOrder

{

  key SalesOrder,

      SalesOrderType,

      CreatedByUser

}
