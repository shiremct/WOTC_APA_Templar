
class X2Condition_WOTC_APA_BelowMaxFocus extends X2Condition;

var name		CurrentFocusUnitValueName;
var name		MaxFocusUnitValueName;


event name CallMeetsCondition(XComGameState_BaseObject kTarget) 
{
	local XComGameState_Unit TargetUnit;
	local UnitValue CurrentFocusValue;
	local UnitValue MaxFocusValue;

	TargetUnit = XComGameState_Unit(kTarget);
	if (TargetUnit == none)
		return 'AA_NotAUnit';

	TargetUnit.GetUnitValue(CurrentFocusUnitValueName, CurrentFocusValue);
	TargetUnit.GetUnitValue(MaxFocusUnitValueName, MaxFocusValue);
	if (CurrentFocusValue.fValue >= MaxFocusValue.fValue)
		return 'AA_AmmoAlreadyFull';

	return 'AA_Success';
}