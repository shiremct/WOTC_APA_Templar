
class X2Effect_WOTC_APA_ConsecratedBladesDamage extends X2Effect_Persistent config(WOTC_APA_TemplarSkills);

var config array<name>		ConsecratedBladesValidAbilities;

var int		BonusDmg;
var float	fBonusDmgChance;
var name	FocusUnitValueName;



function int GetAttackingDamageModifier(XComGameState_Effect EffectState, XComGameState_Unit Attacker, Damageable TargetDamageable, XComGameState_Ability AbilityState, const out EffectAppliedData AppliedData, const int CurrentDamage, optional XComGameState NewGameState) 
{
	local name								AbilityName;
	local X2Effect_ApplyWeaponDamage		DamageEffect;
	local UnitValue							CurrentFocusValue;
	local float								fBonusDamageRoll;
	local int								RandRoll, BonusDamage;

	// Do not apply to actions dealing no damage
	if (!class'XComGameStateContext_Ability'.static.IsHitResultHit(AppliedData.AbilityResultContext.HitResult) || CurrentDamage == 0)
		return 0;

	// Check for appropriate weapon
	if (AbilityState.SourceWeapon != EffectState.ApplyEffectParameters.ItemStateObjectRef)
		return 0;

	// Only applies to Rend, Arcwave, or TemplarBladestormAttack
	AbilityName = AbilityState.GetMyTemplateName();
	if (default.ConsecratedBladesValidAbilities.Find(AbilityName) == Index_None)
		return 0;

	// Only apply when the damage effect is applying the weapon's base damage
	if (NewGameState != none)
	{
		DamageEffect = X2Effect_ApplyWeaponDamage(class'X2Effect'.static.GetX2Effect(AppliedData.EffectRef));
		if (DamageEffect == none || DamageEffect.bIgnoreBaseDamage)
		{
			return 0;
	}	}


	// Get current Focus level
	Attacker.GetUnitValue(FocusUnitValueName, CurrentFocusValue);
	fBonusDamageRoll = (fBonusDmgChance + 0.1) * CurrentFocusValue.fValue; 
	BonusDamage = BonusDmg * int(fBonusDamageRoll / 100);		// convert any full 100%s straight to guaranteed Bonus Damage
	fBonusDamageRoll = fBonusDamageRoll % 100;					// grab remainder for % roll chance for additional Bonus Damage

	// Roll for any remaining ungauranteed Bonus Damage if not previewing damage
	if (NewGameState != none)
	{
		RandRoll = `SYNC_RAND(100);
		if (RandRoll <= fBonusDamageRoll)
		{
			BonusDamage += BonusDmg;
	}	}
		
	return BonusDamage;
}