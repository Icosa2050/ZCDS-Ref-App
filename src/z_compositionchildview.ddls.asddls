@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Composition Child View'
define view entity Z_COMPOSITIONCHILDVIEW as select from zt000_dummy
association to parent Z_CompositionRootView as _RootView
on $projection.RootKeyField = _RootView.RootKeyField
composition [0..*] of Z_CompositionGrandChildView as _GrandchildView
// must be activated separately by commenting out  dependencies
// then dependencies must be included per view until all dependencies are fullfilled
{
 key abap.char'R' as RootKeyField,
 key abap.char'C' as ChildKeyField
 ,
    _RootView 
    ,
    _GrandchildView
}
