@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'hierarchy 01'
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define hierarchy ZHI_HIerarchicalEmployee01 as parent child hierarchy 
( source ZHI_EmployeeRelation 
child to parent association _Manager
start where Manager = '0000'
siblings order by Employee
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
