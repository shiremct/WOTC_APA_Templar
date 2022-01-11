
class X2Condition_WOTC_APA_VoltTarget extends X2Condition;

var bool	bEmpowered;
var bool	bRobotic;
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

	// If target should be a Robot unit, but is not, exit
	if (bRobotic && !TargetUnit.IsRobotic())
		return 'AA_UnitIsWrongType';

	// if target should not be a Robot unit, but is, exit
	if (!bRobotic && TargetUnit.IsRobotic())
		return 'AA_UnitIsWrongType';

	return 'AA_Success';
}