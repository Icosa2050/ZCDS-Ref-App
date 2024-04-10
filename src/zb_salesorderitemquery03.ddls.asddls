@AccessControl.authorizationCheck: #NOT_ALLOWED
@EndUserText.label:
'Query 03 für Kundenauftragspositionen'
transient view entity ZB_SalesOrderItemQuery03
  provider contract analytical_query
  with parameters
    @Consumption.hidden: true
    @Environment.systemField: #SYSTEM_DATE
    P_Today   : abap.dats,
    @EndUserText.label: 'Land des Auftraggebers'
    @Consumption.valueHelpDefinition: [
    { entity: { name: 'I_Country', element: 'Country' } }
    ]
    @Consumption.defaultValue: 'DE'
    P_Country : abap.char(3)
  as projection on ZB_SalesOrderItemCube04
{
          SalesOrder,
          SalesOrderItem,
          @AnalyticsDetails.query.axis: #ROWS
          @AnalyticsDetails.query.totals: #SHOW
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.filter:
          { selectionType: #RANGE, multipleSelections: true }
          Product,
          @AnalyticsDetails.query.axis: #COLUMNS
          _SalesOrganization._Text.SalesOrgName,
          @AnalyticsDetails.query.totals: #SHOW
          @Consumption.filter:
          { selectionType: #SINGLE, multipleSelections: true }
          SoldToParty,
          @AnalyticsDetails.query.sortDirection: #ASC
          _SoldToParty.CustomerName,
          //_SoldToParty.CityName,
          @EndUserText.label: 'Land des Auftraggebers'
          SoldToCountry,
          @AnalyticsDetails.query.axis: #ROWS
          @Consumption.filter:
          { selectionType: #INTERVAL, multipleSelections: false }
          @Consumption.derivation: {
          lookupEntity: 'I_CalendarDate',
          resultElement: 'CalendarYear',
          binding: [ { targetElement: 'CalendarDate',
          type: #PARAMETER, value: 'P_Today' } ]  }
          CreationYear,
          @EndUserText.label: 'Durchschnittlicher Betrag pro Einheit'
          @Aggregation.default: #FORMULA
          @Semantics.quantity.unitOfMeasure: 'CurrencyPerUnit'
          curr_to_decfloat_amount( NetAmount ) / OrderQuantity as AverageAmountPerUnit,
          @EndUserText.label: 'Währung pro Einheit'
  virtual CurrencyPerUnit : dd_cds_calculated_unit
}
where
  SoldToCountry = $parameters.P_Country
