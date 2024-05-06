@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'hierarchy 02'
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define hierarchy ZHI_HIERARCHICALEMPLOYEE02 
as parent child hierarchy ( 
  source ZHI_EmployeeRelation 
  child to parent association _Manager
  start where Manager is initial
  siblings order by Employee
  orphans root
)
{
@ObjectModel.foreignKey.association: '_Employee'
    key Employee,
    /* Associations */
    _Employee,
    Manager,
    /* Associations */
    _Manager
}
