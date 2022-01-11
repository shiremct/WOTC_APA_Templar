
class X2AbilityTag_WOTC_APA_Templar extends X2AbilityTag;

// Modified and Implemented from Xylith's XModBase

// The previous X2AbilityTag. We save it so we can just call it to handle any tag we don't
// recognize, so we don't have to include a copy of the regular X2AbilityTag code. This also
// makes it so we will play well with any other mods that replace X2AbilityTag this way.
var X2AbilityTag WrappedTag;

var localized string strSingleAttack;
var localized string strPluralAttacks;
var localized string strTimes;

var localized string strEmpowered;

var localized string strBaseBrandDesc;
var localized string strEmpoweredBrandDesc;

var localized string strBaseVoltDesc;
var localized string strEmpoweredVoltDesc;

var localized string strBaseParryDesc;
var localized string strEmpoweredParryDesc;

var localized string strBasePsiStrikeDesc;
var localized string strEmpoweredPsiStrikeDesc;

var localized string strBaseFuseDesc;
var localized string strEmpoweredFuseDesc;

var localized string strBaseHardenDesc;
var localized string strEmpoweredHardenDesc;

var localized string strBaseExchangeDesc;
var localized string strEmpoweredExchangeDesc;

var localized string strBaseReanimateDesc;
var localized string strEmpoweredReanimateDesc;

var localized string strBaseVoidConduitDesc;
var localized string strEmpoweredVoidConduitDesc;

var localized string strBaseSkyfallDesc;
var localized string strEmpoweredSkyfallDesc;

var localized string strBaseSunderingStormDesc;
var localized string strEmpoweredSunderingStormDesc;

// Supporting Text Functions
static function TrimTrailingZerosFromFloat(float InputValue, out string text)
{
	text = string(InputValue);

	while ((Len(text) > 0) && (InStr(text, "0", true) == Len(text) - 1))
		text = left(text, Len(text) - 1);
	while ((Len(text) > 0) && (InStr(text, ".", true) == Len(text) - 1))
		text = left(text, Len(text) - 1);
}

static function TrimTrailingZerosFromFloatExceptOne(float InputValue, out string text)
{
	text = string(InputValue);

	while ((Len(text) > 0) && (InStr(text, "0", true) == Len(text) - 1))
		text = left(text, Len(text) - 1);
	while ((Len(text) > 0) && (InStr(text, ".", true) == Len(text) - 1))
		text = left(text, Len(text) - 1);

	if (InStr(text, ".", true) == -1)
		text = text $ ".0";
}

static function RoundUpFloat(float InputValue, out int i)
{

	if (InputValue - int(InputValue) > 0)
	{
		i = int(InputValue) + 1;
	}
	else
	{
		i = InputValue;
	}
}

// Handles the cost checks for all Empowered alternate FriendlyName functions
static function bool EmpoweredFocusCostCheck(int FocusCost, XComGameState_Unit SourceUnit)
{
	local UnitValue					CurrentFocusValue;

	SourceUnit.GetUnitValue(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.PSI_CONDUIT_CURRENT_NAME, CurrentFocusValue);
	if (CurrentFocusValue.fValue >= FocusCost + class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.EMPOWER_FOCUS_COST_INCREASE)
		return true;

	return false;
}


event ExpandHandler(string InString, out string OutString)
{
	local name						Type;
	local XComGameStateHistory		History;
	local XComGameState_Unit		TargetUnitState, SourceUnitState;
	local XComGameState_Item		ItemState;
	local X2WeaponTemplate			WeaponTemplate;
	local X2SoldierClassTemplate	ClassTemplate;
	local XComGameState_Effect		EffectState;
	local XComGameState_Ability		AbilityState;
	local X2AbilityTemplate			AbilityTemplate;
	local UnitValue					UnitValue;
	local name						nName;
	local string					sStr;
	local float						fVal;
	local int						iVal;

	Type = name(InString);
	History = `XCOMHISTORY;

	switch (Type)
	{	
	
		// PSI Conduit Proficiency Level Tags
		case 'PSI_CONDUIT_I_MAX_FOCUS':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.PSI_CONDUIT_I_MAX_FOCUS);
			break;
		case 'PSI_CONDUIT_II_MAX_FOCUS':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.PSI_CONDUIT_II_MAX_FOCUS);
			break;
		case 'PSI_CONDUIT_III_MAX_FOCUS':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.PSI_CONDUIT_III_MAX_FOCUS);
			break;
		case 'PSI_CONDUIT_II_STARTING_FOCUS':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.PSI_CONDUIT_II_STARTING_FOCUS);
			break;
		case 'PSI_CONDUIT_I_DEFLECT_CHANCE':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.PSI_CONDUIT_I_DEFLECT_CHANCE);
			break;
		case 'PSI_CONDUIT_II_DEFLECT_CHANCE':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.PSI_CONDUIT_II_DEFLECT_CHANCE);
			break;
		case 'PSI_CONDUIT_III_DEFLECT_CHANCE':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.PSI_CONDUIT_III_DEFLECT_CHANCE);
			break;
		
		

		// Class Ability Tags:
		case 'EMPOWER_FOCUS_COST_INCREASE':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.EMPOWER_FOCUS_COST_INCREASE);
			break;

		// Brand:
		case 'BRAND_COOLDOWN':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.BRAND_COOLDOWN - 1);
			break;
		case 'BRAND_FOCUS_COST':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.BRAND_FOCUS_COST);
			break;
		case 'BRAND_EMPOWERED_FOCUS_COST':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.BRAND_FOCUS_COST + class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.EMPOWER_FOCUS_COST_INCREASE);
			break;
		case 'BRAND_FOCUS_CHANCE':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.BRAND_FOCUS_CHANCE);
			break;
		case 'BRAND_OFFENSE_STAT_BONUS':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.BRAND_OFFENSE_STAT_BONUS);
			break;
		case 'BRAND_EMPOWERED_BASE_DAMAGE_BONUS':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.BRAND_EMPOWERED_BASE_DAMAGE_BONUS);
			break;
		case 'BRAND_EMPOWERED_CRIT_DAMAGE_BONUS':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.BRAND_EMPOWERED_CRIT_DAMAGE_BONUS);
			break;
		case 'DYNAMIC_BRAND_DESCRIPTION':
			OutString = default.strBaseBrandDesc;
			if (StrategyParseObj == none)
			{
				AbilityState = XComGameState_Ability(ParseObj);
				EffectState = XComGameState_Effect(ParseObj);
				if (AbilityState != none)
					SourceUnitState = XComGameState_Unit(History.GetGameStateForObjectID(AbilityState.OwnerStateObject.ObjectID));
				else if (EffectState != none)
					SourceUnitState = XComGameState_Unit(History.GetGameStateForObjectID(EffectState.ApplyEffectParameters.SourceStateObjectRef.ObjectID));	

				if (SourceUnitState != none)
				{
					if (SourceUnitState.IsUnitAffectedByEffectName(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.EMPOWER_EFFECT_NAME))
					{
						if (EmpoweredFocusCostCheck(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.BRAND_FOCUS_COST, SourceUnitState))
						{
							OutString = default.strEmpoweredBrandDesc;
				}	}	}
			}
			Outstring = `XEXPAND.ExpandString(Outstring);
			break;
		
		// Volt:
		case 'VOLT_FOCUS_COST':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.VOLT_FOCUS_COST);
			break;
		case 'VOLT_EMPOWERED_FOCUS_COST':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.VOLT_FOCUS_COST + class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.EMPOWER_FOCUS_COST_INCREASE);
			break;
		case 'DYNAMIC_VOLT_DESCRIPTION':
			OutString = default.strBaseVoltDesc;
			if (StrategyParseObj == none)
			{
				AbilityState = XComGameState_Ability(ParseObj);
				EffectState = XComGameState_Effect(ParseObj);
				if (AbilityState != none)
					SourceUnitState = XComGameState_Unit(History.GetGameStateForObjectID(AbilityState.OwnerStateObject.ObjectID));
				else if (EffectState != none)
					SourceUnitState = XComGameState_Unit(History.GetGameStateForObjectID(EffectState.ApplyEffectParameters.SourceStateObjectRef.ObjectID));	

				if (SourceUnitState != none)
				{
					if (SourceUnitState.IsUnitAffectedByEffectName(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.EMPOWER_EFFECT_NAME))
					{
						if (EmpoweredFocusCostCheck(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.VOLT_FOCUS_COST, SourceUnitState))
						{
							OutString = default.strEmpoweredVoltDesc;
				}	}	}
			}
			Outstring = `XEXPAND.ExpandString(Outstring);
			break;

		// Parry:
		case 'PARRY_FOCUS_COST':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.PARRY_FOCUS_COST);
			break;
		case 'PARRY_EMPOWERED_FOCUS_COST':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.PARRY_FOCUS_COST + class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.EMPOWER_FOCUS_COST_INCREASE);
			break;
		case 'PARRY_ACTIVATIONS':
			OutString = default.strSingleAttack;
			iVal = class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.PARRY_ACTIVATIONS;
			if (iVal > 1)
			{
				OutString = "<font color='#3ABD23'>" $ string(iVal) $ "</font>" @ default.strPluralAttacks;
			}
			break;
		case 'DYNAMIC_PARRY_DESCRIPTION':
			OutString = default.strBaseParryDesc;
			if (StrategyParseObj == none)
			{
				AbilityState = XComGameState_Ability(ParseObj);
				EffectState = XComGameState_Effect(ParseObj);
				if (AbilityState != none)
					SourceUnitState = XComGameState_Unit(History.GetGameStateForObjectID(AbilityState.OwnerStateObject.ObjectID));
				else if (EffectState != none)
					SourceUnitState = XComGameState_Unit(History.GetGameStateForObjectID(EffectState.ApplyEffectParameters.SourceStateObjectRef.ObjectID));	

				if (SourceUnitState != none)
				{
					if (SourceUnitState.IsUnitAffectedByEffectName(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.EMPOWER_EFFECT_NAME))
					{
						if (EmpoweredFocusCostCheck(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.PARRY_FOCUS_COST, SourceUnitState))
						{
							OutString = default.strEmpoweredParryDesc;
				}	}	}
			}
			Outstring = `XEXPAND.ExpandString(Outstring);
			break;

		// Psi Strike:
		case 'PSI_STRIKE_FOCUS_COST':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.PSI_STRIKE_FOCUS_COST);
			break;
		case 'PSI_STRIKE_EMPOWERED_FOCUS_COST':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.PSI_STRIKE_FOCUS_COST + class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.EMPOWER_FOCUS_COST_INCREASE);
			break;
		case 'PSI_STRIKE_STUN_CHANCE':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.PSI_STRIKE_STUN_CHANCE);
			break;
		case 'DYNAMIC_PSI_STRIKE_DESCRIPTION':
			OutString = default.strBasePsiStrikeDesc;
			if (StrategyParseObj == none)
			{
				AbilityState = XComGameState_Ability(ParseObj);
				EffectState = XComGameState_Effect(ParseObj);
				if (AbilityState != none)
					SourceUnitState = XComGameState_Unit(History.GetGameStateForObjectID(AbilityState.OwnerStateObject.ObjectID));
				else if (EffectState != none)
					SourceUnitState = XComGameState_Unit(History.GetGameStateForObjectID(EffectState.ApplyEffectParameters.SourceStateObjectRef.ObjectID));	

				if (SourceUnitState != none)
				{
					if (SourceUnitState.IsUnitAffectedByEffectName(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.EMPOWER_EFFECT_NAME))
					{
						if (EmpoweredFocusCostCheck(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.PSI_STRIKE_FOCUS_COST, SourceUnitState))
						{
							OutString = default.strEmpoweredPsiStrikeDesc;
				}	}	}
			}
			Outstring = `XEXPAND.ExpandString(Outstring);
			break;
			
		// Soulbind, Consecrated Blades, Castigate, Meditate, & Arcwave:
		case 'SOULBIND_FOCUS_CHANCE':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.SOULBIND_FOCUS_CHANCE);
			break;
		case 'SOULBIND_HP_HEALED':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.SOULBIND_HP_HEALED);
			break;
		case 'CONSECRATED_BLADES_DAMAGE_BONUS':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.CONSECRATED_BLADES_DAMAGE_BONUS);
			break;
		case 'CONSECRATED_BLADES_DAMAGE_CHANCE':
			TrimTrailingZerosFromFloat(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.CONSECRATED_BLADES_DAMAGE_CHANCE, Outstring);
			break;
		case 'CONSECRATED_BLADES_MAX_FOCUS_MODIFIER':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.CONSECRATED_BLADES_MAX_FOCUS_MODIFIER);
			break;
		case 'CASTIGATE_MENTAL_STAT_MODIFIER':
			TrimTrailingZerosFromFloat((1 - class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.CASTIGATE_MENTAL_STAT_MODIFIER) * 100, Outstring);
			break;
		case 'CASTIGATE_OFFENSE_STAT_MODIFIER':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.CASTIGATE_OFFENSE_STAT_MODIFIER);
			break;
		case 'MEDITATE_FOCUS_CAP':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.MEDITATE_FOCUS_CAP);
			break;
		case 'ARCWAVE_BASE_DAMAGE':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.ARCWAVE_BASE_DAMAGE);
			break;

		// Fuse:
		case 'FUSE_COOLDOWN':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.FUSE_COOLDOWN - 1);
			break;
		case 'FUSE_FOCUS_COST':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.FUSE_FOCUS_COST);
			break;
		case 'FUSE_EMPOWERED_FOCUS_COST':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.FUSE_FOCUS_COST + class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.EMPOWER_FOCUS_COST_INCREASE);
			break;
		case 'FUSE_EMPOWERED_EXPLOSION_RADIUS_BONUS':
			TrimTrailingZerosFromFloat(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.FUSE_EMPOWERED_EXPLOSION_RADIUS_BONUS, Outstring);
			break;
		case 'DYNAMIC_FUSE_DESCRIPTION':
			OutString = default.strBaseFuseDesc;
			if (StrategyParseObj == none)
			{
				AbilityState = XComGameState_Ability(ParseObj);
				EffectState = XComGameState_Effect(ParseObj);
				if (AbilityState != none)
					SourceUnitState = XComGameState_Unit(History.GetGameStateForObjectID(AbilityState.OwnerStateObject.ObjectID));
				else if (EffectState != none)
					SourceUnitState = XComGameState_Unit(History.GetGameStateForObjectID(EffectState.ApplyEffectParameters.SourceStateObjectRef.ObjectID));	

				if (SourceUnitState != none)
				{
					if (SourceUnitState.IsUnitAffectedByEffectName(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.EMPOWER_EFFECT_NAME))
					{
						if (EmpoweredFocusCostCheck(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.FUSE_FOCUS_COST, SourceUnitState))
						{
							OutString = default.strEmpoweredFuseDesc;
				}	}	}
			}
			Outstring = `XEXPAND.ExpandString(Outstring);
			break;

		// Harden:
		case 'HARDEN_COOLDOWN':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.HARDEN_COOLDOWN - 1);
			break;
		case 'HARDEN_FOCUS_COST':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.HARDEN_FOCUS_COST);
			break;
		case 'HARDEN_EMPOWERED_FOCUS_COST':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.HARDEN_FOCUS_COST + class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.EMPOWER_FOCUS_COST_INCREASE);
			break;
		case 'HARDEN_SHIELD_POINTS':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.HARDEN_SHIELD_POINTS);
			break;
		case 'HARDEN_AREA_SHIELD_POINTS':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.HARDEN_AREA_SHIELD_POINTS);
			break;
		case 'HARDEN_AREA_TILE_RADIUS':
			TrimTrailingZerosFromFloat(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.HARDEN_AREA_TILE_RADIUS, Outstring);
			break;
		case 'DYNAMIC_HARDEN_DESCRIPTION':
			OutString = default.strBaseHardenDesc;
			if (StrategyParseObj == none)
			{
				AbilityState = XComGameState_Ability(ParseObj);
				EffectState = XComGameState_Effect(ParseObj);
				if (AbilityState != none)
					SourceUnitState = XComGameState_Unit(History.GetGameStateForObjectID(AbilityState.OwnerStateObject.ObjectID));
				else if (EffectState != none)
					SourceUnitState = XComGameState_Unit(History.GetGameStateForObjectID(EffectState.ApplyEffectParameters.SourceStateObjectRef.ObjectID));	

				if (SourceUnitState != none)
				{
					if (SourceUnitState.IsUnitAffectedByEffectName(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.EMPOWER_EFFECT_NAME))
					{
						if (EmpoweredFocusCostCheck(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.HARDEN_FOCUS_COST, SourceUnitState))
						{
							OutString = default.strEmpoweredHardenDesc;
				}	}	}
			}
			Outstring = `XEXPAND.ExpandString(Outstring);
			break;

		// Exchange:
		case 'EXCHANGE_COOLDOWN':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.EXCHANGE_COOLDOWN - 1);
			break;
		case 'EXCHANGE_FOCUS_COST':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.EXCHANGE_FOCUS_COST);
			break;
		case 'EXCHANGE_EMPOWERED_FOCUS_COST':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.EXCHANGE_FOCUS_COST + class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.EMPOWER_FOCUS_COST_INCREASE);
			break;
		case 'DYNAMIC_EXCHANGE_DESCRIPTION':
			OutString = default.strBaseExchangeDesc;
			if (StrategyParseObj == none)
			{
				AbilityState = XComGameState_Ability(ParseObj);
				EffectState = XComGameState_Effect(ParseObj);
				if (AbilityState != none)
					SourceUnitState = XComGameState_Unit(History.GetGameStateForObjectID(AbilityState.OwnerStateObject.ObjectID));
				else if (EffectState != none)
					SourceUnitState = XComGameState_Unit(History.GetGameStateForObjectID(EffectState.ApplyEffectParameters.SourceStateObjectRef.ObjectID));	

				if (SourceUnitState != none)
				{
					if (SourceUnitState.IsUnitAffectedByEffectName(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.EMPOWER_EFFECT_NAME))
					{
						if (EmpoweredFocusCostCheck(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.EXCHANGE_FOCUS_COST, SourceUnitState))
						{
							OutString = default.strEmpoweredExchangeDesc;
				}	}	}
			}
			Outstring = `XEXPAND.ExpandString(Outstring);
			break;

		// Reanimate:
		case 'REANIMATE_COOLDOWN':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.REANIMATE_COOLDOWN - 1);
			break;
		case 'REANIMATE_FOCUS_COST':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.REANIMATE_FOCUS_COST);
			break;
		case 'REANIMATE_EMPOWERED_FOCUS_COST':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.REANIMATE_FOCUS_COST + class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.EMPOWER_FOCUS_COST_INCREASE);
			break;
		case 'REANIMATE_TILE_RANGE':
			TrimTrailingZerosFromFloat(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.REANIMATE_TILE_RANGE, Outstring);
			break;
		case 'REANIMATE_ZOMBIE_LIMIT':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.REANIMATE_ZOMBIE_LIMIT);
			break;
		case 'DYNAMIC_REANIMATE_DESCRIPTION':
			OutString = default.strBaseReanimateDesc;
			if (StrategyParseObj == none)
			{
				AbilityState = XComGameState_Ability(ParseObj);
				EffectState = XComGameState_Effect(ParseObj);
				if (AbilityState != none)
					SourceUnitState = XComGameState_Unit(History.GetGameStateForObjectID(AbilityState.OwnerStateObject.ObjectID));
				else if (EffectState != none)
					SourceUnitState = XComGameState_Unit(History.GetGameStateForObjectID(EffectState.ApplyEffectParameters.SourceStateObjectRef.ObjectID));	

				if (SourceUnitState != none)
				{
					if (SourceUnitState.IsUnitAffectedByEffectName(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.EMPOWER_EFFECT_NAME))
					{
						if (EmpoweredFocusCostCheck(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.REANIMATE_FOCUS_COST, SourceUnitState))
						{
							OutString = default.strEmpoweredReanimateDesc;
				}	}	}
			}
			Outstring = `XEXPAND.ExpandString(Outstring);
			break;

		// Void Conduit
		case 'VOID_CONDUIT_COOLDOWN':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.VOID_CONDUIT_COOLDOWN - 1);
			break;
		case 'VOID_CONDUIT_FOCUS_COST':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.VOID_CONDUIT_FOCUS_COST);
			break;
		case 'VOID_CONDUIT_EMPOWERED_FOCUS_COST':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.VOID_CONDUIT_FOCUS_COST + class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.EMPOWER_FOCUS_COST_INCREASE);
			break;
		case 'VOID_CONDUIT_BASE_DURATION':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.VOID_CONDUIT_BASE_DURATION);
			break;
		case 'VOID_CONDUIT_BONUS_DURATION':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.VOID_CONDUIT_BONUS_DURATION);
			break;
		case 'VOID_CONDUIT_EMPOWERED_DURATION':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.VOID_CONDUIT_BASE_DURATION + class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.VOID_CONDUIT_BONUS_DURATION);
			break;
		case 'VOID_CONDUIT_DAMAGE':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.VOID_CONDUIT_DAMAGE);
			break;
		case 'VOID_CONDUIT_HEALED':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.VOID_CONDUIT_HEALED);
			break;
		case 'DYNAMIC_VOID_CONDUIT_DESCRIPTION':
			OutString = default.strBaseVoidConduitDesc;
			if (StrategyParseObj == none)
			{
				AbilityState = XComGameState_Ability(ParseObj);
				EffectState = XComGameState_Effect(ParseObj);
				if (AbilityState != none)
					SourceUnitState = XComGameState_Unit(History.GetGameStateForObjectID(AbilityState.OwnerStateObject.ObjectID));
				else if (EffectState != none)
					SourceUnitState = XComGameState_Unit(History.GetGameStateForObjectID(EffectState.ApplyEffectParameters.SourceStateObjectRef.ObjectID));	

				if (SourceUnitState != none)
				{
					if (SourceUnitState.IsUnitAffectedByEffectName(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.EMPOWER_EFFECT_NAME))
					{
						if (EmpoweredFocusCostCheck(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.VOID_CONDUIT_FOCUS_COST, SourceUnitState))
						{
							OutString = default.strEmpoweredVoidConduitDesc;
				}	}	}
			}
			Outstring = `XEXPAND.ExpandString(Outstring);
			break;

		// Skyfall
		case 'SKYFALL_COOLDOWN':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.SKYFALL_COOLDOWN - 1);
			break;
		case 'SKYFALL_FOCUS_COST':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.SKYFALL_FOCUS_COST);
			break;
		case 'SKYFALL_EMPOWERED_FOCUS_COST':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.SKYFALL_FOCUS_COST + class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.EMPOWER_FOCUS_COST_INCREASE);
			break;
		case 'SKYFALL_DAMAGE_MULTIPLIER':
			TrimTrailingZerosFromFloat((class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.SKYFALL_DAMAGE_MULTIPLIER - 1) * 100, Outstring);
			break;
		case 'SKYFALL_TILE_RADIUS':
			TrimTrailingZerosFromFloat(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.SKYFALL_TILE_RADIUS, Outstring);
			break;
		case 'DYNAMIC_SKYFALL_DESCRIPTION':
			OutString = default.strBaseSkyfallDesc;
			if (StrategyParseObj == none)
			{
				AbilityState = XComGameState_Ability(ParseObj);
				EffectState = XComGameState_Effect(ParseObj);
				if (AbilityState != none)
					SourceUnitState = XComGameState_Unit(History.GetGameStateForObjectID(AbilityState.OwnerStateObject.ObjectID));
				else if (EffectState != none)
					SourceUnitState = XComGameState_Unit(History.GetGameStateForObjectID(EffectState.ApplyEffectParameters.SourceStateObjectRef.ObjectID));	

				if (SourceUnitState != none)
				{
					if (SourceUnitState.IsUnitAffectedByEffectName(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.EMPOWER_EFFECT_NAME))
					{
						if (EmpoweredFocusCostCheck(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.SKYFALL_FOCUS_COST, SourceUnitState))
						{
							OutString = default.strEmpoweredSkyfallDesc;
				}	}	}
			}
			Outstring = `XEXPAND.ExpandString(Outstring);
			break;

		// Sundering Storm
		case 'SUNDERING_STORM_COOLDOWN':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.SUNDERING_STORM_COOLDOWN - 1);
			break;
		case 'SUNDERING_STORM_FOCUS_COST':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.SUNDERING_STORM_FOCUS_COST);
			break;
		case 'SUNDERING_STORM_EMPOWERED_FOCUS_COST':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.SUNDERING_STORM_FOCUS_COST + class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.EMPOWER_FOCUS_COST_INCREASE);
			break;
		case 'SUNDERING_STORM_TILE_RADIUS':
			TrimTrailingZerosFromFloat(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.SUNDERING_STORM_TILE_RADIUS, Outstring);
			break;
		case 'SUNDERING_STORM_SMOKE_TILE_RADIUS':
			TrimTrailingZerosFromFloat(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.SUNDERING_STORM_SMOKE_TILE_RADIUS, Outstring);
			break;
		case 'SUNDERING_STORM_ENVIRONMENTAL_DAMAGE':
			OutString = string(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.SUNDERING_STORM_ENVIRONMENTAL_DAMAGE);
			break;
		case 'DYNAMIC_SUNDERING_STORM_DESCRIPTION':
			OutString = default.strBaseSunderingStormDesc;
			if (StrategyParseObj == none)
			{
				AbilityState = XComGameState_Ability(ParseObj);
				EffectState = XComGameState_Effect(ParseObj);
				if (AbilityState != none)
					SourceUnitState = XComGameState_Unit(History.GetGameStateForObjectID(AbilityState.OwnerStateObject.ObjectID));
				else if (EffectState != none)
					SourceUnitState = XComGameState_Unit(History.GetGameStateForObjectID(EffectState.ApplyEffectParameters.SourceStateObjectRef.ObjectID));	

				if (SourceUnitState != none)
				{
					if (SourceUnitState.IsUnitAffectedByEffectName(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.EMPOWER_EFFECT_NAME))
					{
						if (EmpoweredFocusCostCheck(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.SUNDERING_STORM_FOCUS_COST, SourceUnitState))
						{
							OutString = default.strEmpoweredSunderingStormDesc;
				}	}	}
			}
			Outstring = `XEXPAND.ExpandString(Outstring);
			break;



		// We don't handle this tag, check the wrapped tag.
		default:
			WrappedTag.ParseObj = ParseObj;
			WrappedTag.StrategyParseObj = StrategyParseObj;
			WrappedTag.GameState = GameState;
			WrappedTag.ExpandHandler(InString, OutString);
			// clear them out again (the 3 lines below are the part updated from 2.0.0 to prevent garbage collection-related crashes after missions)
			WrappedTag.ParseObj = none;
			WrappedTag.StrategyParseObj = none;
			WrappedTag.GameState = none;  
			return;
	}
}