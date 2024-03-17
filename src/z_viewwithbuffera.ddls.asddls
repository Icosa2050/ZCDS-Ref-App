@AbapCatalog.entityBuffer.definitionAllowed: true
@EndUserText.label: 'View with Buffer'
@AccessControl.authorizationCheck: #NOT_REQUIRED
define view entity z_ViewWithBufferA as select from zt000_dummy
{
    key dummyfield as KeyField,
    abap.char'A' as KeyField1    
}
