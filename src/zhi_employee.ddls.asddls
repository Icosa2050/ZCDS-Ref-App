@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Employess'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZHI_Employee
  as select from zhp_employee
{
      @ObjectModel.text.element: ['EmployeeName']
      @EndUserText.label: 'Employee Name'
  key employee                            as Employee,
      @Semantics.text: true
      @EndUserText.label: 'Employee Name'
      employeename                        as EmployeeName,
      @EndUserText.label: 'Gender'
      gender                              as Gender,
      @EndUserText.label: 'Part Time Percent'
      parttimepercent                     as PartTimePercent,
      @Aggregation.default: #SUM
      @EndUserText.label: 'Full Time Equivalent'
      division (parttimepercent, 100, 2 ) as FullTimeEquivalent,
      @EndUserText.label: 'Score'
      score                               as Score
}
