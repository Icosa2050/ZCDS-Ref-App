@AccessControl.authorizationCheck: #CHECK

@EndUserText.label: 'Sales Order with User Input'

@Metadata.ignorePropagatedAnnotations: true

define view entity ZC_SalesOrderWithUserInput

  with parameters

    P_UserInput : abap.char(4)

  as select from ZI_SalesOrder

{

  key SalesOrder,

      $parameters.P_UserInput as UserInput

}

