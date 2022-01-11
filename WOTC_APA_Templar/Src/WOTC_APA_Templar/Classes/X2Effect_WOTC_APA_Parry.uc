
class X2Effect_WOTC_APA_Parry extends X2Effect_Persistent;

var bool bEmpowered;
var name ParryUnitValueName;


function bool ChangeHitResultForTarget(XComGameState_Effect EffectState, XComGameState_Unit Attacker, XComGameState_Unit TargetUnit, XComGameState_Ability AbilityState, bool bIsPrimaryTarget, const EAbilityHitResult CurrentResult, out EAbilityHitResult NewHitResult)
{
	local UnitValue UnitValue;
	local X2AbilityToHitCalc_StandardAim AttackToHit;

	// Target must be able to act
	if (!TargetUnit.IsAbleToAct())
		return false;

	// Don't respond to reaction fire
	AttackToHit = X2AbilityToHitCalc_StandardAim(AbilityState.GetMyTemplate().AbilityToHitCalc);
	if (AttackToHit != none && AttackToHit.bReactionFire)
		return false;

	// Don't change a natural miss
	if (!class'XComGameStateContext_Ability'.static.IsHitResultHit(CurrentResult))
		return false;
	
	TargetUnit.GetUnitValue(ParryUnitValueName, UnitValue);
	if (UnitValue.fValue > 0)
	{
		if (bEmpowered)
		{ NewHitResult = eHit_Reflect; }
		else
		{ NewHitResult = eHit_Parry; }

		TargetUnit.SetUnitFloatValue(ParryUnitValueName, UnitValue.fValue - 1);
		return true;
	}

	return false;
}