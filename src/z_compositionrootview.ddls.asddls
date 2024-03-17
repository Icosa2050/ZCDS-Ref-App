@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Composition Root View'
// must be activated separately by commenting out  dependencies
// then dependencies must be included per view until all dependencies are fullfilled
define root view entity Z_CompositionRootView as select distinct from zt000_dummy
composition [0..*] of Z_COMPOSITIONCHILDVIEW as _ChildView
{
    key abap.char'R' as RootKeyField
    ,
    _ChildView // Make association public
}
