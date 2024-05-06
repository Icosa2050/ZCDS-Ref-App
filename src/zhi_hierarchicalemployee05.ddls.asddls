@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employees for ODATA'
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define hierarchy ZHI_HIERARCHICALEMPLOYEE05
  as parent child hierarchy(
    source ZHI_EmployeeRelation
    child to parent association _Manager
    start where
      Manager is initial
    siblings order by
      Employee
  )
{
  key Employee,
      Manager
}
