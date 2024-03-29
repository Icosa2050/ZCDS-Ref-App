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
// this overrides the authorizationCheck annotation
/*
Select *
from ZC_SalesOrderPrivilegedOnly
with Privileged Access
into table @DATA(lt_sales_order_privileged_only);
*/
// to ovvreride the annotation and use path expressions, you can use the following code
// to access the view
/*
Select *
from ZC_SalesOrderPrivilegedOnly
into table @DATA(lt_sales_order_privileged_only)
Privileged Access.
*/
