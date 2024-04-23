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
      userdescription as UserDescription,
      istechnicaluser as Istechnicaluser,
      @Semantics.eMail.address
      emailaddress    as Emailaddress,
      addresspersonid as Addresspersonid,
      addressid       as Addressid
}

union select distinct from zt000_dummy
{

  key '000000000001'     as Userid,
      'John Doe'         as Userdescription,
      ' '                as Istechnicaluser,
      'johndoe@acme.com' as Emailaddress,
      '0000000001'       as Addresspersonid,
      '0000000001'       as Addressid


}
union select distinct from zt000_dummy
{

  key '000000000002'   as Userid,
      'User 2'         as Userdescription,
      ' '              as Istechnicaluser,
      'user2@acme.com' as Emailaddress,
      '0000000002'     as Addresspersonid,
      '0000000002'     as Addressid

}
union select distinct from zt000_dummy
{

  key '000000000003'   as Userid,
      'User 3'         as Userdescription,
      ' '              as Istechnicaluser,
      'user3@acme.com' as Emailaddress,
      '0000000003'     as Addresspersonid,
      '0000000003'     as Addressid

}
union select distinct from zt000_dummy
{

  key 'CB9980001564'                     as Userid,
      'Markus Frommherz'                 as Userdescription,
      ' '                                as Istechnicaluser,
      'markus.frommherz@frommherz-it.ch' as Emailaddress,
      '0000000004'                       as Addresspersonid,
      '0000000004'                       as Addressid

}
