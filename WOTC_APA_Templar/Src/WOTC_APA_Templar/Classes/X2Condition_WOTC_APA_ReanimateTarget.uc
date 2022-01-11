
class X2Condition_WOTC_APA_ReanimateTarget extends X2Condition;

var bool	bEmpowered;
var int		EmpoweredCost;
var name	EmpoweredEffectName;
var name	FocusUnitValueName;


event name CallMeetsConditionWithSource(XComGameState_BaseObject kTarget, XComGameState_BaseObject kSource)
{
	local XComGameState_Unit SourceUnit, TargetUnit;
	local UnitValue CurrentFocusValue;

	SourceUnit = XComGameState_Unit(kSource);
	TargetUnit = XComGameState_Unit(kTarget);
	if (SourceUnit == none || TargetUnit == none)
		return 'AA_NotAUnit';

	SourceUnit.GetUnitValue(FocusUnitValueName, CurrentFocusValue);

	// If should not be Empowered, but Source is attempting to Empower and has sufficient Focus, exit
	if (!bEmpowered && SourceUnit.IsUnitAffectedByEffectName(EmpoweredEffectName) && CurrentFocusValue.fValue >= EmpoweredCost)
		return 'AA_AlreadyAmplified';

	// If should be Empowered, but Source does not have Empower effect or does not have enough Focus, exit
	if (bEmpowered && (!SourceUnit.IsUnitAffectedByEffectName(EmpoweredEffectName) || CurrentFocusValue.fValue < EmpoweredCost))
		return 'AA_CannotAfford_Focus';

	return 'AA_Success';
}