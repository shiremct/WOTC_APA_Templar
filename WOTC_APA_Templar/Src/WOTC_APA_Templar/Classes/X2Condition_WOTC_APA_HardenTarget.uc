
class X2Condition_WOTC_APA_HardenTarget extends X2Condition;


event name CallMeetsConditionWithSource(XComGameState_BaseObject kTarget, XComGameState_BaseObject kSource)
{
	local XComGameState_Unit TargetUnit;
	local UnitValue CurrentFocusValue;

	TargetUnit = XComGameState_Unit(kTarget);
	if (TargetUnit == none)
		return 'AA_NotAUnit';

	// If target can benefit from effects, succeed
	if (TargetUnit.GetCurrentStat(eStat_ShieldHP) < class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.HARDEN_SHIELD_POINTS)
		return 'AA_Success';

	// If target cannot benefit from effects, and is not empowered, exit
	if (!TargetUnit.IsUnitAffectedByEffectName(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.EMPOWER_EFFECT_NAME))
		return 'AA_AlreadyAmplified';

	// If target cannot benefit from effects and empowered, ensure the caster can afford the focus cost
	TargetUnit.GetUnitValue(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.PSI_CONDUIT_CURRENT_NAME, CurrentFocusValue);
	if (CurrentFocusValue.fValue >= class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.HARDEN_FOCUS_COST + class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.EMPOWER_FOCUS_COST_INCREASE)
		return 'AA_Success';

	return 'AA_CannotAfford_Focus';
}