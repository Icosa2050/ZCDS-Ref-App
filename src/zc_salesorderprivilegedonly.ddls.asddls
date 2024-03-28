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

// only way to access this view is to have Privileged Access
/*
Select *
from ZC_SalesOrderPrivilegedOnly
wiht Privileged Access
into table @DATA(lt_sales_order_privileged_only);
*/
