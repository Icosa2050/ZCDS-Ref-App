@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'view for dummy users'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZI_USER
  as select from zpiuser_ic
{
  key userid          as Userid,
      userdescription as Userdescription,
      istechnicaluser as Istechnicaluser,
      @Semantics.eMail.address
      emailaddress    as Emailaddress,
      addresspersonid as Addresspersonid,
      addressid       as Addressid
}

union select distinct from zt000_dummy
{

  key '0000000001'          as Userid,
      'Dummy User 1 '       as Userdescription,
      ' '                   as Istechnicaluser,
      'icosa2050@gmail.com' as Emailaddress,
      '0000000001'          as Addresspersonid,
      '0000000001'          as Addressid


}
union select distinct from zt000_dummy
{

  key 'CB9980001564'                     as Userid,
      'Dummy User 2'                     as Userdescription,
      ' '                                as Istechnicaluser,
      'markus.frommherz@frommherz-it.ch' as Emailaddress,
      '0000000001'                       as Addresspersonid,
      '0000000001'                       as Addressid

}
