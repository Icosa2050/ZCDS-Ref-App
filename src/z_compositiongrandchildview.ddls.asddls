@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Composition Grand Child View'
// must be activated separately by commenting out  dependencies
// then dependencies must be included per view until all dependencies are fullfilled

define view entity Z_CompositionGrandChildView as select from zt000_dummy

association [1..1]to Z_CompositionRootView as _RootView
    on $projection.RootKeyField = _RootView.RootKeyField

association to parent Z_COMPOSITIONCHILDVIEW as _ChildView
    on $projection.RootKeyField = _ChildView.RootKeyField
    and $projection.ChildKeyField = _ChildView.ChildKeyField
{
  key abap.char'R' as RootKeyField,
  key abap.char'C' as ChildKeyField,
  key abap.char'G' as GrandChildKeyField,
  _RootView
 ,
  _ChildView
}
