

class X2Condition_WOTC_APA_DuplicateFocusEffect extends X2Condition;

var name		BaseEffectName;
var name		EmpoweredEffectName;
var int			EmpoweredCost;
var name		FocusUnitValueName;


event name CallMeetsConditionWithSource(XComGameState_BaseObject kTarget, XComGameState_BaseObject kSource)
{
	local XComGameState_Unit SourceUnit, TargetUnit;
	local UnitValue CurrentFocusValue;

	TargetUnit = XComGameState_Unit(kTarget);
	if (TargetUnit == none)
		return 'AA_NotAUnit';

	// If the target already has the empowered effect, exit
	if (TargetUnit.IsUnitAffectedByEffectName(EmpoweredEffectName))
		return 'AA_AlreadyAmplified';

	// If the target does not have the base effect, succeed
	if (!TargetUnit.IsUnitAffectedByEffectName(BaseEffectName))
		return 'AA_Success';

	// If the target has the base effect, but not the empowered effect, check to see if we are applying an empowered version of the ability	
	SourceUnit = XComGameState_Unit(kSource);
	if (SourceUnit != none && SourceUnit.IsUnitAffectedByEffectName(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.EMPOWER_EFFECT_NAME))
	{
		SourceUnit.GetUnitValue(FocusUnitValueName, CurrentFocusValue);
		if (CurrentFocusValue.fValue >= EmpoweredCost)
			return 'AA_Success';

		return 'AA_AlreadyAmplified';
	}

	return 'AA_AbilityUnavailable';
}