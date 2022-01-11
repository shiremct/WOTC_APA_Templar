
class X2TargetingMethod_WOTC_APA_FocusRadius extends X2TargetingMethod_TopDown;


function bool GetAdditionalTargets(out AvailableTarget AdditionalTargets)
{
	local XComGameState_Unit SourceUnit;

	SourceUnit = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(Ability.OwnerStateObject.ObjectID));

	Ability.GatherAdditionalAbilityTargetsForLocation(`XWORLD.GetPositionFromTileCoordinates(SourceUnit.TileLocation), AdditionalTargets);
	return true;
}