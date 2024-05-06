@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'hierarchy 03'
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define hierarchy ZHI_HIERARCHICALEMPLOYEE03 
as parent child hierarchy ( 
  source ZHI_EmployeeRelation 
  child to parent association _Manager
  start where Manager is initial
  siblings order by Employee
  multiple parents allowed
  orphans root
)
{
@ObjectModel.foreignKey.association: '_Employee'
    key Employee,
    /* Associations */
    _Employee,
@ObjectModel.foreignKey.association: '_Employee'
    Manager,
    /* Associations */
    _Manager
}
