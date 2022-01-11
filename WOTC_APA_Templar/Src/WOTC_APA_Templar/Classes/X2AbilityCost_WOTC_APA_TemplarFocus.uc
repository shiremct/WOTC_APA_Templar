
class X2AbilityCost_WOTC_APA_TemplarFocus extends X2AbilityCost_Focus;

var int					FocusCost;
var name				FocusUnitValueName;

simulated function name CanAfford(XComGameState_Ability kAbility, XComGameState_Unit ActivatingUnit)
{
	local UnitValue						CurrentFocusValue;

	ActivatingUnit.GetUnitValue(FocusUnitValueName, CurrentFocusValue);
	if (CurrentFocusValue.fValue >= FocusCost)
		return 'AA_Success';

	return 'AA_CannotAfford_Focus';
}

simulated function ApplyCost(XComGameStateContext_Ability AbilityContext, XComGameState_Ability kAbility, XComGameState_BaseObject AffectState, XComGameState_Item AffectWeapon, XComGameState NewGameState)
{
	local XComGameState_Unit			ActivatingUnit;
	local UnitValue						CurrentFocusValue;
	local int							FocusDeducted;

	if (bFreeCost || FocusCost < 1)
		return;

	FocusDeducted = FocusCost;

	ActivatingUnit = XComGameState_Unit(AffectState);
	ActivatingUnit.GetUnitValue(FocusUnitValueName, CurrentFocusValue);

	// Check whether we are attempting to empower this ability
	if (ActivatingUnit.IsUnitAffectedByEffectName(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.EMPOWER_EFFECT_NAME))
	{
		if (CurrentFocusValue.fValue >= (FocusCost + class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.EMPOWER_FOCUS_COST_INCREASE))
		{
			FocusDeducted += class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.EMPOWER_FOCUS_COST_INCREASE;
	}	}

	ActivatingUnit.SetUnitFloatValue(FocusUnitValueName, CurrentFocusValue.fValue - FocusDeducted, eCleanup_BeginTactical);
}


simulated function bool PreviewFocusCost(XComGameState_Unit UnitState, XComGameState_Ability AbilityState, out int TotalPreviewCost)
{
	local UnitValue						CurrentFocusValue;
	local int							FocusDeducted;

	if (bFreeCost || FocusCost < 1)
		return false;

	UnitState.GetUnitValue(FocusUnitValueName, CurrentFocusValue);
	if (CurrentFocusValue.fValue < FocusCost)
		return false;

	FocusDeducted = FocusCost;

	// Check whether we are attempting to empower this ability
	if (UnitState.IsUnitAffectedByEffectName(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.EMPOWER_EFFECT_NAME))
	{
		if (CurrentFocusValue.fValue >= (FocusCost + class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.EMPOWER_FOCUS_COST_INCREASE))
		{
			FocusDeducted += class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.EMPOWER_FOCUS_COST_INCREASE;
	}	}

	TotalPreviewCost = FocusDeducted;
	return false;
}