@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'view with case'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity Z_ViewWithCaseStatements
  as select from ZI_SalesOrder
{
  key SalesOrder,
      case (SalesOrderType)
        when 'TAF' then 'X'
        when 'OAF' then 'X'
        else ''
      end                   as IsStandardOrder,
      cast( case (SalesOrderType)
        when 'TAF' then 'T'
        when 'OAF' then 'O'
        else ''
      end as abap.char(3) ) as IsStandardOrderAsChar3,
      case when SalesOrderType = 'TAF' then 'A'
           when SalesOrderType = 'OAF' then 'F'
        else 'NOT REL'
      end                   as IsStandardOrder2,
      case when SalesOrderType like '%TA%' then 'TA LIKE'
      when SalesOrderType like '%OA%' then 'OA LIKE'
        else 'NOT REL'
      end                   as IsStandardOrder3,
      SalesOrderType as OrderType,
      SalesOrganization as soz,
      SoldToParty as party,
      DistributionChannel as channel,
      OrganizationDivision,
      @Semantics.amount.currencyCode: 'currency'
      NetAmount as amount,
      TransactionCurrency as currency,
      DeliveryStatus as status,
      DeletionIndicator as deleted,
      CreatedByUser as usr,
      CreationDateTime as time,
      LastChangedByUser as changedBy,
      LastChangeDateTime as changedTime,
      /* Associations */
      _Item,
      _SalesOrganization,
      _SoldToParty
}
