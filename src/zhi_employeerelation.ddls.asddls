@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'employee association'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZHI_EmployeeRelation as select from ZHP_EmployeeRelation
association [0..1] to ZHI_EmployeeRelation as _Manager  on $projection.Manager = _Manager.Employee
association [0..1] to ZHI_Employee as _Employee on $projection.Employee = _Employee.Employee
{
    Employee,
    _Employee,
    Manager,
    _Manager
}
