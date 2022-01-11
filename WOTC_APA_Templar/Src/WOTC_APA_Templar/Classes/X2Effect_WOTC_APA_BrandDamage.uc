class X2Effect_WOTC_APA_BrandDamage extends X2Effect_Persistent;

var int		BonusDmg;
var int		BonusCritDmg;


function int GetDefendingDamageModifier(XComGameState_Effect EffectState, XComGameState_Unit Attacker, Damageable TargetDamageable, XComGameState_Ability AbilityState, const out EffectAppliedData AppliedData, const int CurrentDamage, X2Effect_ApplyWeaponDamage WeaponDamageEffect, optional XComGameState NewGameState)
{
	local X2Effect_ApplyWeaponDamage		DamageEffect;
	local X2AbilityToHitCalc_StandardAim	StandardHit;
	local float								fBonusDamage;

	// Do not apply to actions dealing no damage
	if (!class'XComGameStateContext_Ability'.static.IsHitResultHit(AppliedData.AbilityResultContext.HitResult) || CurrentDamage == 0)
		return 0;

	// Only apply when the damage effect is applying the weapon's base damage
	if (NewGameState != none)
	{
		DamageEffect = X2Effect_ApplyWeaponDamage(class'X2Effect'.static.GetX2Effect(AppliedData.EffectRef));
		if (DamageEffect == none || (DamageEffect.bIgnoreBaseDamage && DamageEffect.DamageTag == ''))
		{
			return 0;
	}	}

	if (BonusDmg != 0)
		fBonusDamage += BonusDmg;

	if (BonusCritDmg != 0 && AppliedData.AbilityResultContext.HitResult == eHit_Crit)
		fBonusDamage += BonusCritDmg;

	return round(fBonusDamage);
}