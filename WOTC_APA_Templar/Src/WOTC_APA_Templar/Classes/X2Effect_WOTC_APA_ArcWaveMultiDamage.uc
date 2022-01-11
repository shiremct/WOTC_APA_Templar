
class X2Effect_WOTC_APA_ArcWaveMultiDamage extends X2Effect_ApplyWeaponDamage;

function WeaponDamageValue GetBonusEffectDamageValue(XComGameState_Ability AbilityState, XComGameState_Unit SourceUnit, XComGameState_Item SourceWeapon, StateObjectReference TargetRef)
{
	local WeaponDamageValue Damage;
	local UnitValue CurrentFocusValue;
	local int BonusDamage;

	if (TargetRef.ObjectID > 0)
	{
		SourceUnit.GetUnitValue(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.PSI_CONDUIT_CURRENT_NAME, CurrentFocusValue);
		BonusDamage = class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.ARCWAVE_BASE_DAMAGE;
		BonusDamage += int(CurrentFocusValue.fValue / class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.ARCWAVE_FOCUS_DIVISOR) * class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.ARCWAVE_BONUS_DAMAGE;
		Damage.Damage = BonusDamage;
	}
	return Damage;
}

DefaultProperties
{
	bIgnoreBaseDamage = true
	bAllowFreeKill = false
	bAllowWeaponUpgrade = false
	bBypassShields = false
	bIgnoreArmor = true
	DamageTypes(0)="psi"
}