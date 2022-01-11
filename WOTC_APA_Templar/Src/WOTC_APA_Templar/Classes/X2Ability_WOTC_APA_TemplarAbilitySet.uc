
class X2Ability_WOTC_APA_TemplarAbilitySet extends X2Ability config(WOTC_APA_TemplarSkills);

// Psionic Conduit Proficiency Level Variables
var config int					PSI_CONDUIT_I_MAX_FOCUS;
var config int					PSI_CONDUIT_II_MAX_FOCUS;
var config int					PSI_CONDUIT_III_MAX_FOCUS;

var config int					PSI_CONDUIT_II_STARTING_FOCUS;

var config int					PSI_CONDUIT_I_DEFLECT_CHANCE;
var config int					PSI_CONDUIT_II_DEFLECT_CHANCE;
var config int					PSI_CONDUIT_III_DEFLECT_CHANCE;

var name						PSI_CONDUIT_CURRENT_NAME;
var name						PSI_CONDUIT_MAX_NAME;

var config array<name>			PSI_CONDUIT_ABILITIES_GIVE_FOCUS;

var name						EMPOWER_EFFECT_NAME;
var name						EMPOWER_REMOVE_TRIGGER;
var name						FOCUS_GAIN_ON_KILL_TRIGGER;
var name						FOCUS_ABILITY_CAST_TRIGGER;

var name						SOULBIND_HEAL_ON_KILL_TRIGGER;
var name						SOULBIND_FOCUS_GAIN_TRIGGER;
var name						PARRY_UNIT_VALUE_NAME;
var name						FUSE_UNIT_VALUE_NAME;
var name						SUNDERING_STORM_SMOKE_TRIGGER;

var localized string			strPsiConduit1Name;
var localized string			strPsiConduit1Desc;
var localized string			strPsiConduit2Name;
var localized string			strPsiConduit2Desc;
var localized string			strPsiConduit3Name;
var localized string			strPsiConduit3Desc;

var localized string			strConduitLevelName;
var localized string			strConduitLevelDesc;


var localized string			strEmpowered;

var localized string			strBrandHelpText;
var localized string			strEmpoweredBrandHelpText;



// Ability Variables
var config int					EMPOWER_FOCUS_COST_INCREASE;
var config int					BRAND_COOLDOWN;
var config int					BRAND_FOCUS_COST;
var config int					BRAND_FOCUS_CHANCE;
var config int					BRAND_OFFENSE_STAT_BONUS;
var config int					BRAND_EMPOWERED_BASE_DAMAGE_BONUS;
var config int					BRAND_EMPOWERED_CRIT_DAMAGE_BONUS;
var config int					VOLT_FOCUS_COST;
var config int					PARRY_FOCUS_COST;
var config int					PARRY_ACTIVATIONS;
var config int					PSI_STRIKE_COOLDOWN;
var config int					PSI_STRIKE_FOCUS_COST;
var config int					PSI_STRIKE_STUN_CHANCE;
var config int					SOULBIND_FOCUS_CHANCE;
var config int					SOULBIND_HP_HEALED;
var config int					CONSECRATED_BLADES_DAMAGE_BONUS;
var config float				CONSECRATED_BLADES_DAMAGE_CHANCE;
var config int					CONSECRATED_BLADES_MAX_FOCUS_MODIFIER;
var config float				CASTIGATE_MENTAL_STAT_MODIFIER;
var config int					CASTIGATE_OFFENSE_STAT_MODIFIER;
var config int					FUSE_COOLDOWN;
var config int					FUSE_FOCUS_COST;
var config float				FUSE_EMPOWERED_EXPLOSION_RADIUS_BONUS;
var config int					HARDEN_COOLDOWN;
var config int					HARDEN_FOCUS_COST;
var config int					HARDEN_SHIELD_POINTS;
var config int					HARDEN_AREA_SHIELD_POINTS;
var config float				HARDEN_AREA_TILE_RADIUS;
var config int					MEDITATE_ACTION_COST;
var config int					MEDITATE_FOCUS_CAP;
var config int					REANIMATE_COOLDOWN;
var config int					REANIMATE_FOCUS_COST;
var config int					REANIMATE_TILE_RANGE;
var config int					REANIMATE_ZOMBIE_LIMIT;
var config int					ARCWAVE_BASE_DAMAGE;
var config int					ARCWAVE_BONUS_DAMAGE;
var config float				ARCWAVE_FOCUS_DIVISOR;
var config int					EXCHANGE_COOLDOWN;
var config int					EXCHANGE_FOCUS_COST;
var config int					VOID_CONDUIT_COOLDOWN;
var config int					VOID_CONDUIT_FOCUS_COST;
var config int					VOID_CONDUIT_BASE_DURATION;
var config int					VOID_CONDUIT_BONUS_DURATION;
var config int					VOID_CONDUIT_DAMAGE;
var config int					VOID_CONDUIT_HEALED;
var config int					SKYFALL_COOLDOWN;
var config int					SKYFALL_FOCUS_COST;
var config float				SKYFALL_DAMAGE_MULTIPLIER;
var config int					SKYFALL_ENVIRONMENTAL_DAMAGE;
var config float				SKYFALL_TILE_RADIUS;
var config int					SUNDERING_STORM_COOLDOWN;
var config int					SUNDERING_STORM_FOCUS_COST;
var config float				SUNDERING_STORM_TILE_RADIUS;
var config float				SUNDERING_STORM_SMOKE_TILE_RADIUS;
var config int					SUNDERING_STORM_ENVIRONMENTAL_DAMAGE;




static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	/**/`Log("WOTC_APA_Templar - Begin Adding Templates");

	Templates.AddItem(WOTC_APA_Conduit());
	/*»»»*/	Templates.AddItem(WOTC_APA_GainFocusOnKill());
	/*»»»*/	Templates.AddItem(WOTC_APA_Empower());
	/*»»»*/	Templates.AddItem(WOTC_APA_EmpowerRemove());
	Templates.AddItem(WOTC_APA_Rend());
	Templates.AddItem(WOTC_APA_Brand());

	Templates.AddItem(WOTC_APA_Volt());
	Templates.AddItem(WOTC_APA_Parry());
	/*»»»*/	Templates.AddItem(WOTC_APA_ReflectShot());
	Templates.AddItem(WOTC_APA_PsiStrike());

	Templates.AddItem(WOTC_APA_Soulbind());
	/*»»»*/	Templates.AddItem(WOTC_APA_SoulbindHeal());
	/*»»»*/	Templates.AddItem(WOTC_APA_SoulbindFocus());
	Templates.AddItem(WOTC_APA_ConsecratedBlades());
	Templates.AddItem(WOTC_APA_Castigate());
	/*»»»*/	Templates.AddItem(WOTC_APA_CastigateApply());

	Templates.AddItem(WOTC_APA_Fuse());
	Templates.AddItem(WOTC_APA_Harden());
	/*»»»*/	Templates.AddItem(WOTC_APA_HardenPassive());
	Templates.AddItem(WOTC_APA_Meditate());

	Templates.AddItem(WOTC_APA_Solace());

	Templates.AddItem(WOTC_APA_Reanimate());
	/*»»»*/	Templates.AddItem(WOTC_APA_KillSiredZombies());
	/*»»»*/	Templates.AddItem(WOTC_APA_ZombieClawSlash());
	Templates.AddItem(WOTC_APA_ArcWave());
	/*»»»*/	Templates.AddItem(WOTC_APA_ArcWaveRend());
	Templates.AddItem(WOTC_APA_Exchange());

	Templates.AddItem(WOTC_APA_VoidConduit());
	Templates.AddItem(WOTC_APA_Skyfall());
	/*»»»*/	Templates.AddItem(WOTC_APA_SkyfallPassive());
	/*»»»*/	Templates.AddItem(WOTC_APA_SkyfallAttack());
	Templates.AddItem(WOTC_APA_SunderingStorm());
	/*»»»*/	Templates.AddItem(WOTC_APA_SunderingStormSmoke());

	Templates.AddItem(WOTC_APA_AlchemicalCatalysts());
	
	/**/`Log("WOTC_APA_Templar - Finished Adding Templates");

	return Templates;
}



// Conduit - Base Class Proficiency Ability
static function X2AbilityTemplate WOTC_APA_Conduit()
{
	
	local X2AbilityTemplate										Template;
	local X2Condition_WOTC_APA_TargetRankRequirement			RankCondition1, RankCondition2, RankCondition2AndUp, RankCondition3;
	local X2Effect_SetUnitValue									SetMaxValue1, SetMaxValue2, SetMaxValue3;
	local X2Effect_SetUnitValue									SetStartValue2;
	local X2Effect_WOTC_APA_Deflect								DeflectEffect1, DeflectEffect2, DeflectEffect3;
	local X2Effect_AdditionalAnimSets							AnimSetsEffect;
	local array<string>											AnimSetsToAdd;
	local string												Path;
	
	
	`CREATE_X2ABILITY_TEMPLATE(Template, 'WOTC_APA_Conduit');
	Template.IconImage = "img:///UILibrary_WOTC_APA_Templar.perk_Conduit";
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	Template.bCrossClassEligible = false;
	
	
	// Establish Rank conditions for each Proficiency Level effect:
	RankCondition1 = new class 'X2Condition_WOTC_APA_TargetRankRequirement';
	RankCondition1.iMinRank = -1;	// No minimum rank for level 1 bonuses
	RankCondition1.iMaxRank = 2;	// Max rank is 1 below minimum rank for level 2 bonuses
	RankCondition1.ExcludeProject = 'WOTC_APA_TemplarUnlock1';

	RankCondition2 = new class 'X2Condition_WOTC_APA_TargetRankRequirement';
	RankCondition2.iMinRank = 3;
	RankCondition2.iMaxRank = 5;
	RankCondition2.ExcludeProject = 'WOTC_APA_TemplarUnlock2';
	RankCondition2.GiveProject = 'WOTC_APA_TemplarUnlock1';

	RankCondition2AndUp = new class 'X2Condition_WOTC_APA_TargetRankRequirement';
	RankCondition2AndUp.iMinRank = 3;
	RankCondition2AndUp.iMaxRank = -1;
	RankCondition2AndUp.GiveProject = 'WOTC_APA_TemplarUnlock1';
	
	RankCondition3 = new class 'X2Condition_WOTC_APA_TargetRankRequirement';
	RankCondition3.iMinRank = 6;
	RankCondition3.iMaxRank = -1;	// No max rank for level 3 bonuses
	RankCondition3.GiveProject = 'WOTC_APA_TemplarUnlock2';
	

	// Set Maximum Focus Levels
	SetMaxValue1 = new class'X2Effect_SetUnitValue';
	SetMaxValue1.UnitName = default.PSI_CONDUIT_MAX_NAME;
	SetMaxValue1.NewValueToSet = default.PSI_CONDUIT_I_MAX_FOCUS;
	SetMaxValue1.CleanupType = eCleanup_BeginTactical;
	SetMaxValue1.TargetConditions.AddItem(RankCondition1);
	Template.AddTargetEffect(SetMaxValue1);

	SetMaxValue2 = new class'X2Effect_SetUnitValue';
	SetMaxValue2.UnitName = default.PSI_CONDUIT_MAX_NAME;
	SetMaxValue2.NewValueToSet = default.PSI_CONDUIT_II_MAX_FOCUS;
	SetMaxValue2.CleanupType = eCleanup_BeginTactical;
	SetMaxValue2.TargetConditions.AddItem(RankCondition2);
	Template.AddTargetEffect(SetMaxValue2);

	SetMaxValue3 = new class'X2Effect_SetUnitValue';
	SetMaxValue3.UnitName = default.PSI_CONDUIT_MAX_NAME;
	SetMaxValue3.NewValueToSet = default.PSI_CONDUIT_III_MAX_FOCUS;
	SetMaxValue3.CleanupType = eCleanup_BeginTactical;
	SetMaxValue3.TargetConditions.AddItem(RankCondition3);
	Template.AddTargetEffect(SetMaxValue3);


	// Set starting Focus levels
	SetStartValue2 = new class'X2Effect_SetUnitValue';
	SetStartValue2.UnitName = default.PSI_CONDUIT_CURRENT_NAME;
	SetStartValue2.NewValueToSet = default.PSI_CONDUIT_II_STARTING_FOCUS;
	SetStartValue2.CleanupType = eCleanup_BeginTactical;
	SetStartValue2.TargetConditions.AddItem(RankCondition2AndUp);
	Template.AddTargetEffect(SetStartValue2);


	// Persistent effects that handle Deflect chance, passive ability icons, and trigger Focus gain from kills
	DeflectEffect1 = new class'X2Effect_WOTC_APA_Deflect';
	DeflectEffect1.DeflectChance = default.PSI_CONDUIT_I_DEFLECT_CHANCE;
	DeflectEffect1.BuildPersistentEffect(1, true, false);
	DeflectEffect1.EffectName = 'WOTC_APA_Conduit_UpdateFocusListener';
	DeflectEffect1.ParryUnitValueName = default.PARRY_UNIT_VALUE_NAME;
	DeflectEffect1.SetDisplayInfo(ePerkBuff_Passive, default.strPsiConduit1Name, default.strPsiConduit1Desc, "img:///UILibrary_WOTC_APA_Templar.perk_Conduit1", true,, Template.AbilitySourceName);
	DeflectEffect1.DuplicateResponse = eDupe_Ignore;
	DeflectEffect1.TargetConditions.AddItem(RankCondition1);
	Template.AddTargetEffect(DeflectEffect1);

	DeflectEffect2 = new class'X2Effect_WOTC_APA_Deflect';
	DeflectEffect2.DeflectChance = default.PSI_CONDUIT_II_DEFLECT_CHANCE;
	DeflectEffect2.BuildPersistentEffect(2, true, false);
	DeflectEffect2.EffectName = 'WOTC_APA_Conduit_UpdateFocusListener';
	DeflectEffect2.ParryUnitValueName = default.PARRY_UNIT_VALUE_NAME;
	DeflectEffect2.SetDisplayInfo(ePerkBuff_Passive, default.strPsiConduit2Name, default.strPsiConduit2Desc, "img:///UILibrary_WOTC_APA_Templar.perk_Conduit2", true,, Template.AbilitySourceName);
	DeflectEffect2.DuplicateResponse = eDupe_Ignore;
	DeflectEffect2.TargetConditions.AddItem(RankCondition2);
	Template.AddTargetEffect(DeflectEffect2);

	DeflectEffect3 = new class'X2Effect_WOTC_APA_Deflect';
	DeflectEffect3.DeflectChance = default.PSI_CONDUIT_III_DEFLECT_CHANCE;
	DeflectEffect3.BuildPersistentEffect(3, true, false);
	DeflectEffect3.EffectName = 'WOTC_APA_Conduit_UpdateFocusListener';
	DeflectEffect3.ParryUnitValueName = default.PARRY_UNIT_VALUE_NAME;
	DeflectEffect3.SetDisplayInfo(ePerkBuff_Passive, default.strPsiConduit3Name, default.strPsiConduit3Desc, "img:///UILibrary_WOTC_APA_Templar.perk_Conduit3", true,, Template.AbilitySourceName);
	DeflectEffect3.DuplicateResponse = eDupe_Ignore;
	DeflectEffect3.TargetConditions.AddItem(RankCondition3);
	Template.AddTargetEffect(DeflectEffect3);


	AnimSetsToAdd.AddItem("Templar_ANIM.Anims.AS_Templar");
	AnimSetsToAdd.AddItem("Templar_ANIM.Anims.AS_TemplarAutoPistol");
	AnimSetsToAdd.AddItem("Templar_Reflect_ANIM.Anims.AS_Reflect");
	AnimSetsToAdd.AddItem("Templar_Deflect_ANIM.Anims.AS_Deflect");
	AnimSetsToAdd.AddItem("Templar_GainingFocus_ANIM.Anims.AS_GainingFocus");
	AnimSetsToAdd.AddItem("Templar_Exchange_ANIM.Anims.AS_Exchange");
	AnimSetsToAdd.AddItem("Templar_Ghost_ANIM.Anims.AS_Ghost");
	AnimSetsToAdd.AddItem("Templar_Pillar_ANIM.Anims.AS_Pillar");
	AnimSetsToAdd.AddItem("Templar_VoidConduit_ANIM.Anims.AS_VoidConduit");
	AnimSetsToAdd.AddItem("Templar_Stunstrike_ANIM.Anims.AS_Stunstrike");
	foreach AnimSetsToAdd (Path)
	{
		AnimSetsEffect = new class'X2Effect_AdditionalAnimSets';
		AnimSetsEffect.AddAnimSetWithPath(Path);
		AnimSetsEffect.BuildPersistentEffect(1, true);
		Template.AddTargetEffect(AnimSetsEffect);
	}


	Template.AdditionalAbilities.AddItem('WOTC_APA_Empower');
	Template.AdditionalAbilities.AddItem('WOTC_APA_GainFocusOnKill');


	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	return Template;
}

static function X2AbilityTemplate WOTC_APA_GainFocusOnKill()
{
	local X2AbilityTemplate										Template;
	local X2AbilityTrigger_EventListener						EventTrigger;
	local X2Condition_WOTC_APA_BelowMaxFocus					MaxFocusCondition;
	local X2Effect_IncrementUnitValue							SetUnitValueEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'WOTC_APA_GainFocusOnKill');

	//Template.IconImage = "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_templarFocus";
	Template.IconImage = "img:///UILibrary_WOTC_APA_Templar.perk_Conduit";
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	
	EventTrigger = new class'X2AbilityTrigger_EventListener';
	EventTrigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	EventTrigger.ListenerData.EventID = default.FOCUS_GAIN_ON_KILL_TRIGGER;
	EventTrigger.ListenerData.Filter = eFilter_Unit;
	EventTrigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_Self;
	Template.AbilityTriggers.AddItem(EventTrigger);

	MaxFocusCondition = new class'X2Condition_WOTC_APA_BelowMaxFocus';
	MaxFocusCondition.CurrentFocusUnitValueName = default.PSI_CONDUIT_CURRENT_NAME;
	MaxFocusCondition.MaxFocusUnitValueName = default.PSI_CONDUIT_MAX_NAME;
	Template.AbilityShooterConditions.AddItem(MaxFocusCondition);

	SetUnitValueEffect = new class'X2Effect_IncrementUnitValue';
	SetUnitValueEffect.UnitName = default.PSI_CONDUIT_CURRENT_NAME;
	SetUnitValueEffect.NewValueToSet = 1;
	SetUnitValueEffect.CleanupType = eCleanup_BeginTactical;
	Template.AddTargetEffect(SetUnitValueEffect);

	Template.CustomFireAnim = 'HL_GainingFocus';
	Template.bShowPostActivation = true;

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	return Template;
}

// Empower - Active: Activate to make the next focus ability cast this turn cost 1 additional focus, but gain additional effects
static function X2AbilityTemplate WOTC_APA_Empower()
{

	local X2AbilityTemplate										Template;
	local X2AbilityCooldown										Cooldown;
	local X2AbilityCost_ActionPoints							ActionPointCost;
	local X2AbilityCost_WOTC_APA_TemplarFocus					FocusCost;
	local X2Effect_Persistent									EmpowerEffect;


	Template = CreateSelfActiveAbility('WOTC_APA_Empower', "img:///UILibrary_WOTC_APA_Templar.perk_Empower");
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SQUADDIE_PRIORITY;
	Template.AbilityConfirmSound = "TacticalUI_Activate_Ability_Wraith_Armor";
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.CustomSelfFireAnim = 'HL_Lens';


	// Set ability costs, cooldowns, and restrictions
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = 1;
	Template.AbilityCooldown = Cooldown;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bFreeCost = true;
	ActionPointCost.AllowedTypes.AddItem(class'X2CharacterTemplateManager'.default.MoveActionPoint);
	ActionPointCost.AllowedTypes.AddItem(class'X2CharacterTemplateManager'.default.MomentumActionPoint);
	Template.AbilityCosts.AddItem(ActionPointCost);
	
	FocusCost = new class'X2AbilityCost_WOTC_APA_TemplarFocus';
	FocusCost.bFreeCost = true;
	FocusCost.FocusCost = default.EMPOWER_FOCUS_COST_INCREASE + 1;
	FocusCost.FocusUnitValueName = default.PSI_CONDUIT_CURRENT_NAME;
	Template.AbilityCosts.AddItem(FocusCost);


	// Add the Empower notifier effect - other effects look for this effect name to determine if they should attempt to empower
	EmpowerEffect = new class'X2Effect_Persistent';
	EmpowerEffect.EffectName = default.EMPOWER_EFFECT_NAME;
	EmpowerEffect.BuildPersistentEffect(1, false, false, false, eGameRule_PlayerTurnEnd);
	EmpowerEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage);
	Template.AddTargetEffect(EmpowerEffect);


	Template.AdditionalAbilities.AddItem('WOTC_APA_EmpowerRemove');


	return Template;
}

// Triggered ability that removes the Empowering effect after an ability is successfully Empowered
static function X2AbilityTemplate WOTC_APA_EmpowerRemove()
{

	local X2AbilityTemplate										Template;
	local X2AbilityTrigger_EventListener						EventListener;
	local X2Effect_RemoveEffects								RemoveEmpowerEffect;


	`CREATE_X2ABILITY_TEMPLATE(Template, 'WOTC_APA_EmpowerRemove');
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.bDisplayInUITooltip = false;
	Template.bCrossClassEligible = false;
	Template.bShowActivation = false;
	Template.bSkipFireAction = true;


	// This ability triggers after a Focus ability has been successfully Empowered
	EventListener = new class'X2AbilityTrigger_EventListener';
	EventListener.ListenerData.Deferral = ELD_OnStateSubmitted;
	EventListener.ListenerData.EventID = default.EMPOWER_REMOVE_TRIGGER;
	EventListener.ListenerData.Filter = eFilter_Unit;
	EventListener.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_Self;
	Template.AbilityTriggers.AddItem(EventListener);


	// Remove Empowered effect if this ability is getting Empowered
	RemoveEmpowerEffect = new class'X2Effect_RemoveEffects';
	RemoveEmpowerEffect.EffectNamesToRemove.AddItem(default.EMPOWER_EFFECT_NAME);
	Template.AddTargetEffect(RemoveEmpowerEffect);

	
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	return Template;
}



// Rend - Active: Base moving melee attack that can trigger Momentum and generate Focus on kills
static function X2AbilityTemplate WOTC_APA_Rend()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityToHitCalc_StandardMelee  StandardMelee;
	local X2Effect_ApplyWeaponDamage        WeaponDamageEffect;
	local array<name>                       SkipExclusions;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'WOTC_APA_Rend');

	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.BuildNewGameStateFn = TypicalMoveEndAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.BuildInterruptGameStateFn = TypicalMoveEndAbility_BuildInterruptGameState;
	Template.IconImage = "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Rend";
	Template.bHideOnClassUnlock = false;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.REND_PRIORITY;
	Template.AbilityConfirmSound = "TacticalUI_SwordConfirm";


	// Set ability costs, cooldowns, and restrictions
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Template.AbilityTargetStyle = new class'X2AbilityTarget_MovingMelee';
	Template.TargetingMethod = class'X2TargetingMethod_MeleePath';

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
	Template.AbilityTriggers.AddItem(new class'X2AbilityTrigger_EndOfMove');

	Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);
	Template.AbilityTargetConditions.AddItem(default.MeleeVisibilityCondition);

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	SkipExclusions.AddItem(class'X2StatusEffects'.default.BurningName);
	Template.AddShooterEffectExclusions(SkipExclusions);

	StandardMelee = new class'X2AbilityToHitCalc_StandardMelee';
	StandardMelee.bGuaranteedHit = true;
	Template.AbilityToHitCalc = StandardMelee;


	// Damage Effect
	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	WeaponDamageEffect.DamageTypes.AddItem('Melee');
	Template.AddTargetEffect(WeaponDamageEffect);

	Template.PostActivationEvents.AddItem('RendActivated');

	Template.bAllowBonusWeaponEffects = true;
	Template.bSkipMoveStop = true;


	Template.SourceMissSpeech = 'SwordMiss';
	Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.MeleeLostSpawnIncreasePerUse;
	Template.bSkipExitCoverWhenFiring = false;
	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.ActivationSpeech = 'Rend';
	Template.CinescriptCameraType = "Templar_Rend";

	Template.AdditionalAbilities.AddItem('Momentum');

	return Template;
}



// Brand - Active: 
static function X2AbilityTemplate WOTC_APA_Brand()
{

	local X2AbilityTemplate										Template;
	local X2AbilityCooldown										Cooldown;
	local X2AbilityCost_ActionPoints							ActionPointCost;
	local X2AbilityCost_WOTC_APA_TemplarFocus					FocusCost;
	local X2Condition_WOTC_APA_DuplicateFocusEffect				DuplicateCondition;
	local X2Condition_UnitEffectsOnSource						EmpoweredEffectCondition;
	local X2Condition_WOTC_APA_SourceUnitValue					EmpoweredCostCondition;
	local X2Effect_WOTC_APA_BrandFocus							FocusEffect;
	local X2Effect_ToHitModifier								HitModEffect;
	local X2Effect_WOTC_APA_BrandDamage							DamageEffect;
	local X2Effect_TriggerEvent									FocusAbilityTriggered, RemoveEmpowerEffect;


	Template = CreateSingleTargetAbility('WOTC_APA_Brand', "img:///UILibrary_WOTC_APA_Templar.perk_Brand");
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SQUADDIE_PRIORITY + 1;
	Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.Hostility = eHostility_Offensive;
	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.ActivationSpeech = 'Amplify';
	Template.CustomFireAnim = 'HL_Lens';

	
	// Set ability costs, cooldowns, and restrictions
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.BRAND_COOLDOWN;
	Template.AbilityCooldown = Cooldown;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	Template.AbilityCosts.AddItem(ActionPointCost);

	FocusCost = new class'X2AbilityCost_WOTC_APA_TemplarFocus';
	FocusCost.FocusCost = default.BRAND_FOCUS_COST;
	FocusCost.FocusUnitValueName = default.PSI_CONDUIT_CURRENT_NAME;
	Template.AbilityCosts.AddItem(FocusCost);

	Template.AbilityTargetConditions.AddItem(default.LivingHostileUnitOnlyProperty);
	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	DuplicateCondition = new class'X2Condition_WOTC_APA_DuplicateFocusEffect';
	DuplicateCondition.BaseEffectName = 'WOTC_APA_BrandHitEffect';
	DuplicateCondition.EmpoweredEffectName = 'WOTC_APA_BrandDamageEffect';
	DuplicateCondition.EmpoweredCost = default.BRAND_FOCUS_COST + default.EMPOWER_FOCUS_COST_INCREASE;
	DuplicateCondition.FocusUnitValueName = default.PSI_CONDUIT_CURRENT_NAME;
	Template.AbilityTargetConditions.AddItem(DuplicateCondition);


	// Setup conditions that check for empowered effect and focus cost
	EmpoweredEffectCondition = new class'X2Condition_UnitEffectsOnSource';
	EmpoweredEffectCondition.AddRequireEffect(default.EMPOWER_EFFECT_NAME, 'AA_MissingRequiredEffect');

	EmpoweredCostCondition = new class'X2Condition_WOTC_APA_SourceUnitValue';
	EmpoweredCostCondition.AddCheckValue(default.PSI_CONDUIT_CURRENT_NAME, default.BRAND_FOCUS_COST + default.EMPOWER_FOCUS_COST_INCREASE, eCheck_GreaterThanOrEqual);


	// Apply effect granting chance to give Focus to caster
	FocusEffect = new class'X2Effect_WOTC_APA_BrandFocus';
	FocusEffect.EffectName = 'WOTC_APA_BrandFocusEffect';
	FocusEffect.BuildPersistentEffect(1, true, true);
	FocusEffect.DuplicateResponse = eDupe_Ignore;
	Template.AddTargetEffect(FocusEffect);


	// Apply ToHit modifying effect
	HitModEffect = new class'X2Effect_ToHitModifier';
	HitModEffect.EffectName = 'WOTC_APA_BrandHitEffect';
	HitModEffect.bApplyAsTarget = true;
	HitModEffect.bRemoveWhenTargetDies = true;
	HitModEffect.AddEffectHitModifier(eHit_Success, default.BRAND_OFFENSE_STAT_BONUS, Template.LocFriendlyName);
	HitModEffect.AddEffectHitModifier(eHit_Crit, default.BRAND_OFFENSE_STAT_BONUS, Template.LocFriendlyName);
	HitModEffect.SetDisplayInfo(ePerkBuff_Penalty, Template.LocFriendlyName, default.strBrandHelpText, Template.IconImage);
	HitModEffect.BuildPersistentEffect(1, true, true);
	HitModEffect.DuplicateResponse = eDupe_Ignore;
	Template.AddTargetEffect(HitModEffect);


	// Apply Damage-modifying effect if Empowered
	DamageEffect = new class'X2Effect_WOTC_APA_BrandDamage';
	DamageEffect.EffectName = 'WOTC_APA_BrandDamageEffect';
	DamageEffect.BonusDmg = default.BRAND_EMPOWERED_BASE_DAMAGE_BONUS;
	DamageEffect.BonusCritDmg = default.BRAND_EMPOWERED_CRIT_DAMAGE_BONUS;
	DamageEffect.SetDisplayInfo(ePerkBuff_Penalty, default.strEmpowered $ Template.LocFriendlyName, default.strEmpoweredBrandHelpText, Template.IconImage);
	DamageEffect.BuildPersistentEffect(1, true, true);
	DamageEffect.DuplicateResponse = eDupe_Ignore;
	DamageEffect.TargetConditions.AddItem(EmpoweredEffectCondition);
	DamageEffect.TargetConditions.AddItem(EmpoweredCostCondition);
	Template.AddTargetEffect(DamageEffect);


	// Trigger event to tie into cast focus abilities
	FocusAbilityTriggered = new class'X2Effect_TriggerEvent';
	FocusAbilityTriggered.TriggerEventName = default.FOCUS_ABILITY_CAST_TRIGGER;
	Template.AddTargetEffect(FocusAbilityTriggered);


	// Trigger event to remove Empowered effect if this ability is getting Empowered
	RemoveEmpowerEffect = new class'X2Effect_TriggerEvent';
	RemoveEmpowerEffect.TriggerEventName = default.EMPOWER_REMOVE_TRIGGER;
	RemoveEmpowerEffect.TargetConditions.AddItem(EmpoweredEffectCondition);
	RemoveEmpowerEffect.TargetConditions.AddItem(EmpoweredCostCondition);
	Template.AddShooterEffect(RemoveEmpowerEffect);


	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;

	return Template;
}



// Volt - Active:
static function X2AbilityTemplate WOTC_APA_Volt()
{
	
	local X2AbilityTemplate										Template;
	local X2AbilityCost_ActionPoints							ActionPointCost;
	local X2AbilityCost_WOTC_APA_TemplarFocus					FocusCost;
	local X2Condition_UnitEffectsOnSource						EmpoweredEffectCondition;
	local X2Condition_WOTC_APA_SourceUnitValue					EmpoweredCostCondition;
	local X2Condition_UnitProperty								TargetCondition;
	local X2Condition_WOTC_APA_VoltTarget						TargetSortCondition;
	local X2Effect_ApplyWeaponDamage							DamageEffect, RoboticDamageEffect;
	local X2Effect_ApplyWeaponDamage							EmpoweredDamageEffect, EmpoweredRoboticDamageEffect;
	local X2Effect_TriggerEvent									FocusAbilityTriggered, RemoveEmpowerEffect;


	Template = CreateSingleTargetAbility('WOTC_APA_Volt', "img:///UILibrary_WOTC_APA_Templar.perk_Volt");
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_CAPTAIN_PRIORITY + 1;
	Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.Hostility = eHostility_Offensive;
	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.ActionFireClass = class'X2Action_Fire_Volt';
	Template.ActivationSpeech = 'Volt';
	Template.CustomFireAnim = 'HL_Volt';

	
	// Set ability costs, cooldowns, and restrictions
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	Template.AbilityCosts.AddItem(ActionPointCost);

	FocusCost = new class'X2AbilityCost_WOTC_APA_TemplarFocus';
	FocusCost.FocusCost = default.VOLT_FOCUS_COST;
	FocusCost.FocusUnitValueName = default.PSI_CONDUIT_CURRENT_NAME;
	Template.AbilityCosts.AddItem(FocusCost);

	Template.AbilityTargetConditions.AddItem(default.LivingHostileUnitOnlyProperty);
	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	TargetCondition = new class'X2Condition_UnitProperty';
	TargetCondition.ExcludeAlive = false;
	TargetCondition.ExcludeDead = true;
	TargetCondition.ExcludeFriendlyToSource = true;
	TargetCondition.ExcludeHostileToSource = false;
	TargetCondition.TreatMindControlledSquadmateAsHostile = false;
	TargetCondition.FailOnNonUnits = true;
	TargetCondition.ExcludeCivilian = true;
	TargetCondition.ExcludeCosmetic = true;
	Template.AbilityTargetConditions.AddItem(TargetCondition);


	// Setup damage effects and target conditions (NOT Empowered): Base Damage
	TargetSortCondition = new class'X2Condition_WOTC_APA_VoltTarget';
	TargetSortCondition.bRobotic = false;
	TargetSortCondition.bEmpowered = false;
	TargetSortCondition.EmpoweredCost = default.VOLT_FOCUS_COST + default.EMPOWER_FOCUS_COST_INCREASE;
	TargetSortCondition.EmpoweredEffectName = default.EMPOWER_EFFECT_NAME;
	TargetSortCondition.FocusUnitValueName = default.PSI_CONDUIT_CURRENT_NAME;
	DamageEffect = new class'X2Effect_ApplyWeaponDamage';
	DamageEffect.bIgnoreBaseDamage = true;
	DamageEffect.DamageTag = 'WOTC_APA_Volt';
	//DamageEffect.bIgnoreArmor = true;
	DamageEffect.TargetConditions.AddItem(TargetSortCondition);
	Template.AddTargetEffect(DamageEffect);

	// Robot / NOT Empowered: Bonus Damage
	TargetSortCondition = new class'X2Condition_WOTC_APA_VoltTarget';
	TargetSortCondition.bRobotic = true;
	TargetSortCondition.bEmpowered = false;
	TargetSortCondition.EmpoweredCost = default.VOLT_FOCUS_COST + default.EMPOWER_FOCUS_COST_INCREASE;
	TargetSortCondition.EmpoweredEffectName = default.EMPOWER_EFFECT_NAME;
	TargetSortCondition.FocusUnitValueName = default.PSI_CONDUIT_CURRENT_NAME;
	RoboticDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	RoboticDamageEffect.bIgnoreBaseDamage = true;
	RoboticDamageEffect.DamageTag = 'WOTC_APA_Volt_Robotic';
	//RoboticDamageEffect.bIgnoreArmor = true;
	RoboticDamageEffect.TargetConditions.AddItem(TargetSortCondition);
	Template.AddTargetEffect(RoboticDamageEffect);


	// Setup damage effects and target conditions (IS Empowered): Bonus Damage
	TargetSortCondition = new class'X2Condition_WOTC_APA_VoltTarget';
	TargetSortCondition.bRobotic = false;
	TargetSortCondition.bEmpowered = true;
	TargetSortCondition.EmpoweredCost = default.VOLT_FOCUS_COST + default.EMPOWER_FOCUS_COST_INCREASE;
	TargetSortCondition.EmpoweredEffectName = default.EMPOWER_EFFECT_NAME;
	TargetSortCondition.FocusUnitValueName = default.PSI_CONDUIT_CURRENT_NAME;
	EmpoweredDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	EmpoweredDamageEffect.bIgnoreBaseDamage = true;
	EmpoweredDamageEffect.DamageTag = 'WOTC_APA_EmpoweredVolt';
	EmpoweredDamageEffect.bIgnoreArmor = true;
	EmpoweredDamageEffect.bBypassShields = true;
	EmpoweredDamageEffect.TargetConditions.AddItem(TargetSortCondition);
	Template.AddTargetEffect(EmpoweredDamageEffect);

	// Robot / IS Empowered: BonusBonus Damage
	TargetSortCondition = new class'X2Condition_WOTC_APA_VoltTarget';
	TargetSortCondition.bRobotic = true;
	TargetSortCondition.bEmpowered = true;
	TargetSortCondition.EmpoweredCost = default.VOLT_FOCUS_COST + default.EMPOWER_FOCUS_COST_INCREASE;
	TargetSortCondition.EmpoweredEffectName = default.EMPOWER_EFFECT_NAME;
	TargetSortCondition.FocusUnitValueName = default.PSI_CONDUIT_CURRENT_NAME;
	EmpoweredRoboticDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	EmpoweredRoboticDamageEffect.bIgnoreBaseDamage = true;
	EmpoweredRoboticDamageEffect.DamageTag = 'WOTC_APA_EmpoweredVolt_Robotic';
	EmpoweredRoboticDamageEffect.bIgnoreArmor = true;
	EmpoweredRoboticDamageEffect.bBypassShields = true;
	EmpoweredRoboticDamageEffect.TargetConditions.AddItem(TargetSortCondition);
	Template.AddTargetEffect(EmpoweredRoboticDamageEffect);


	// Trigger event to tie into cast focus abilities
	FocusAbilityTriggered = new class'X2Effect_TriggerEvent';
	FocusAbilityTriggered.TriggerEventName = default.FOCUS_ABILITY_CAST_TRIGGER;
	Template.AddTargetEffect(FocusAbilityTriggered);


	// Setup conditions that check for empowered effect and focus cost
	EmpoweredEffectCondition = new class'X2Condition_UnitEffectsOnSource';
	EmpoweredEffectCondition.AddRequireEffect(default.EMPOWER_EFFECT_NAME, 'AA_MissingRequiredEffect');

	EmpoweredCostCondition = new class'X2Condition_WOTC_APA_SourceUnitValue';
	EmpoweredCostCondition.AddCheckValue(default.PSI_CONDUIT_CURRENT_NAME, default.VOLT_FOCUS_COST + default.EMPOWER_FOCUS_COST_INCREASE, eCheck_GreaterThanOrEqual);


	// Trigger event to remove Empowered effect if this ability is getting Empowered
	RemoveEmpowerEffect = new class'X2Effect_TriggerEvent';
	RemoveEmpowerEffect.TriggerEventName = default.EMPOWER_REMOVE_TRIGGER;
	RemoveEmpowerEffect.TargetConditions.AddItem(EmpoweredEffectCondition);
	RemoveEmpowerEffect.TargetConditions.AddItem(EmpoweredCostCondition);
	Template.AddShooterEffect(RemoveEmpowerEffect);

	
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;

	return Template;
}



// Parry - Active:
static function X2AbilityTemplate WOTC_APA_Parry()
{
	
	local X2AbilityTemplate										Template;
	local X2AbilityCost_ActionPoints							ActionPointCost;
	local X2AbilityCost_WOTC_APA_TemplarFocus					FocusCost;
	local X2Condition_UnitEffectsOnSource						EmpoweredEffectCondition;
	local X2Condition_WOTC_APA_SourceUnitValue					EmpoweredCostCondition;
	local X2Effect_WOTC_APA_Parry								ReflectEffect, ParryEffect;
	local X2Effect_SetUnitValue									SetUnitValue;
	local X2Effect_TriggerEvent									RemoveEmpowerEffect;


	Template = CreateSelfActiveAbility('WOTC_APA_Parry', "img:///UILibrary_WOTC_APA_Templar.perk_Parry");
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_LIEUTENANT_PRIORITY;
	Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.Hostility = eHostility_Defensive;
	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.bShowActivation = true;
	Template.bSkipFireAction = true;

	
	// Set ability costs, cooldowns, and restrictions
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	ActionPointCost.AllowedTypes.AddItem(class'X2CharacterTemplateManager'.default.MoveActionPoint);
	ActionPointCost.AllowedTypes.AddItem(class'X2CharacterTemplateManager'.default.MomentumActionPoint);
	Template.AbilityCosts.AddItem(ActionPointCost);

	FocusCost = new class'X2AbilityCost_WOTC_APA_TemplarFocus';
	FocusCost.FocusCost = default.PARRY_FOCUS_COST;
	FocusCost.FocusUnitValueName = default.PSI_CONDUIT_CURRENT_NAME;
	Template.AbilityCosts.AddItem(FocusCost);

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();


	// Setup conditions that check for empowered effect and focus cost
	EmpoweredEffectCondition = new class'X2Condition_UnitEffectsOnSource';
	EmpoweredEffectCondition.AddRequireEffect(default.EMPOWER_EFFECT_NAME, 'AA_MissingRequiredEffect');

	EmpoweredCostCondition = new class'X2Condition_WOTC_APA_SourceUnitValue';
	EmpoweredCostCondition.AddCheckValue(default.PSI_CONDUIT_CURRENT_NAME, default.PARRY_FOCUS_COST + default.EMPOWER_FOCUS_COST_INCREASE, eCheck_GreaterThanOrEqual);
	

	// Add Reflect effect, if Empowered
	ReflectEffect = new class'X2Effect_WOTC_APA_Parry';
	ReflectEffect.bEmpowered = true;
	ReflectEffect.EffectName = 'WOTC_APA_ParryEffect';
	ReflectEffect.DuplicateResponse = eDupe_Ignore;
	ReflectEffect.ParryUnitValueName = default.PARRY_UNIT_VALUE_NAME;
	ReflectEffect.BuildPersistentEffect(1, false, false, false, eGameRule_PlayerTurnBegin);
	ReflectEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage);
	ReflectEffect.TargetConditions.AddItem(EmpoweredEffectCondition);
	ReflectEffect.TargetConditions.AddItem(EmpoweredCostCondition);
	Template.AddTargetEffect(ReflectEffect);


	// Add Parry effect, if not Empowered
	ParryEffect = new class'X2Effect_WOTC_APA_Parry';
	ParryEffect.EffectName = 'WOTC_APA_ParryEffect';
	ParryEffect.DuplicateResponse = eDupe_Ignore;
	ParryEffect.ParryUnitValueName = default.PARRY_UNIT_VALUE_NAME;
	ParryEffect.BuildPersistentEffect(1, false, false, false, eGameRule_PlayerTurnBegin);
	ParryEffect.SetDisplayInfo(ePerkBuff_Bonus, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage);
	Template.AddTargetEffect(ParryEffect);


	// Set activation counter UnitValue
	SetUnitValue = new class'X2Effect_SetUnitValue';
	SetUnitValue.UnitName = default.PARRY_UNIT_VALUE_NAME;
	SetUnitValue.NewValueToSet = default.PARRY_ACTIVATIONS;
	SetUnitValue.CleanupType = eCleanup_BeginTurn;
	Template.AddTargetEffect(SetUnitValue);

	
	// Trigger event to remove Empowered effect if this ability is getting Empowered
	RemoveEmpowerEffect = new class'X2Effect_TriggerEvent';
	RemoveEmpowerEffect.TriggerEventName = default.EMPOWER_REMOVE_TRIGGER;
	RemoveEmpowerEffect.TargetConditions.AddItem(EmpoweredEffectCondition);
	RemoveEmpowerEffect.TargetConditions.AddItem(EmpoweredCostCondition);
	Template.AddShooterEffect(RemoveEmpowerEffect);


	Template.AdditionalAbilities.AddItem('WOTC_APA_ReflectShot');

	
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;

	return Template;
}

static function X2AbilityTemplate WOTC_APA_ReflectShot()
{

	local X2AbilityTemplate						Template;
	local X2AbilityTrigger_EventListener		EventListener;
	local X2Effect_ApplyReflectDamage			DamageEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'WOTC_APA_ReflectShot');

	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Defensive;
	Template.IconImage = "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_ReflectShot";

	EventListener = new class'X2AbilityTrigger_EventListener';
	EventListener.ListenerData.EventID = 'AbilityActivated';
	EventListener.ListenerData.Filter = eFilter_None;
	EventListener.ListenerData.Deferral = ELD_OnStateSubmitted;
	EventListener.ListenerData.EventFn = class'XComGameState_Ability'.static.TemplarReflectListener;
	Template.AbilityTriggers.AddItem(EventListener);

	Template.AbilityTargetStyle = default.SimpleSingleTarget;

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();
	Template.AbilityTargetConditions.AddItem(default.LivingHostileUnitDisallowMindControlProperty);
	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);

	DamageEffect = new class'X2Effect_ApplyReflectDamage';
	DamageEffect.EffectDamageValue.DamageType = 'Psi';
	Template.AddTargetEffect(DamageEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;
	Template.MergeVisualizationFn = ReflectShotMergeVisualization;
	
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;

	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.CustomFireAnim = 'HL_ReflectFire';
	Template.CustomFireKillAnim = 'HL_ReflectFire';

	return Template;
}

function ReflectShotMergeVisualization(X2Action BuildTree, out X2Action VisualizationTree)
{

	local XComGameStateVisualizationMgr VisMgr;
	local X2Action_ExitCover SourceExitCover;
	local Array<X2Action> SourceReacts;
	local X2Action_Fire SourceFire;
	local X2Action_ExitCover TargetExitCover;
	local X2Action_Fire TargetFire;
	local X2Action_EnterCover TargetEnterCover;
	local X2Action_ApplyWeaponDamageToUnit TargetReact;
	local X2Action_MarkerTreeInsertBegin InsertHere;
	local Actor SourceUnit;
	local Actor TargetUnit;

	VisMgr = `XCOMVISUALIZATIONMGR;

	SourceFire = X2Action_Fire(VisMgr.GetNodeOfType(BuildTree, class'X2Action_Fire'));
	SourceUnit = SourceFire.Metadata.VisualizeActor;
	TargetReact = X2Action_ApplyWeaponDamageToUnit(VisMgr.GetNodeOfType(BuildTree, class'X2Action_ApplyWeaponDamageToUnit'));
	TargetUnit = TargetReact.Metadata.VisualizeActor;

	SourceExitCover = X2Action_ExitCover(VisMgr.GetNodeOfType(BuildTree, class'X2Action_ExitCover', SourceUnit));
	VisMgr.GetNodesOfType(VisualizationTree, class'X2Action_ApplyWeaponDamageToUnit', SourceReacts, SourceUnit);

	TargetExitCover = X2Action_ExitCover(VisMgr.GetNodeOfType(VisualizationTree, class'X2Action_ExitCover', TargetUnit));
	TargetFire = X2Action_Fire(VisMgr.GetNodeOfType(VisualizationTree, class'X2Action_Fire', TargetUnit));
	TargetEnterCover = X2Action_EnterCover(VisMgr.GetNodeOfType(VisualizationTree, class'X2Action_EnterCover', TargetUnit));

	InsertHere = X2Action_MarkerTreeInsertBegin(VisMgr.GetNodeOfType(VisualizationTree, class'X2Action_MarkerTreeInsertBegin'));
	VisMgr.ConnectAction(BuildTree, VisualizationTree, false, InsertHere);

	VisMgr.ConnectAction(SourceExitCover, VisualizationTree, false, , TargetExitCover.ParentActions);
	VisMgr.ConnectAction(TargetExitCover, VisualizationTree, false, , SourceExitCover.ParentActions);

	VisMgr.ConnectAction(TargetFire, VisualizationTree, false, SourceExitCover);
	VisMgr.ConnectAction(TargetEnterCover, VisualizationTree, false, TargetReact);

	VisMgr.ConnectAction(SourceFire, VisualizationTree, false, , SourceReacts);
}



// Psi Strike - Active:
static function X2AbilityTemplate WOTC_APA_PsiStrike()
{
	
	local X2AbilityTemplate										Template;
	local X2AbilityCooldown										Cooldown;
	local X2AbilityCost_ActionPoints							ActionPointCost;
	local X2AbilityCost_WOTC_APA_TemplarFocus					FocusCost;
	local X2Condition_UnitEffectsOnSource						EmpoweredEffectCondition;
	local X2Condition_WOTC_APA_SourceUnitValue					EmpoweredCostCondition;
	local X2Condition_UnitProperty								TargetCondition, PsiCondition;
	local X2Condition_UnitEffects								TargetEffectsCondition;
	local X2Effect_ApplyWeaponDamage							DamageEffect, EmpoweredDamageEffect;
	local X2Effect_Stunned										StunnedEffect;
	local X2Effect_Knockback									KnockbackEffect;
	local X2Effect_PersistentStatChange							DisorientEffect;
	local X2Effect_SetUnitValue									SetSustainEffect;
	local X2Effect_TriggerEvent									FocusAbilityTriggered, RemoveEmpowerEffect;


	Template = CreateSingleTargetAbility('WOTC_APA_PsiStrike', "img:///UILibrary_WOTC_APA_Templar.perk_StunStrike");
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_CORPORAL_PRIORITY;
	Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.Hostility = eHostility_Offensive;
	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.CinescriptCameraType = "Psionic_FireAtUnit";
	Template.ActivationSpeech = 'StunStrike';
	Template.CustomFireAnim = 'HL_StunStrike';

	
	// Set ability costs, cooldowns, and restrictions
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.PSI_STRIKE_COOLDOWN;
	Template.AbilityCooldown = Cooldown;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	Template.AbilityCosts.AddItem(ActionPointCost);

	FocusCost = new class'X2AbilityCost_WOTC_APA_TemplarFocus';
	FocusCost.FocusCost = default.PSI_STRIKE_FOCUS_COST;
	FocusCost.FocusUnitValueName = default.PSI_CONDUIT_CURRENT_NAME;
	Template.AbilityCosts.AddItem(FocusCost);

	Template.AbilityTargetConditions.AddItem(default.LivingHostileUnitOnlyProperty);
	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	TargetCondition = new class'X2Condition_UnitProperty';
	TargetCondition.ExcludeAlive = false;
	TargetCondition.ExcludeDead = true;
	TargetCondition.ExcludeFriendlyToSource = true;
	TargetCondition.ExcludeHostileToSource = false;
	TargetCondition.TreatMindControlledSquadmateAsHostile = false;
	TargetCondition.FailOnNonUnits = true;
	TargetCondition.ExcludeCivilian = true;
	TargetCondition.ExcludeCosmetic = true;
	TargetCondition.ExcludeRobotic = true;
	Template.AbilityTargetConditions.AddItem(TargetCondition);

	TargetEffectsCondition = new class'X2Condition_UnitEffects';
	TargetEffectsCondition.AddExcludeEffect(class'X2Ability_Viper'.default.BindSustainedEffectName, 'AA_UnitIsBound');
	Template.AbilityTargetConditions.AddItem(TargetEffectsCondition);

	// Setup conditions that check for empowered effect and focus cost
	EmpoweredEffectCondition = new class'X2Condition_UnitEffectsOnSource';
	EmpoweredEffectCondition.AddRequireEffect(default.EMPOWER_EFFECT_NAME, 'AA_MissingRequiredEffect');

	EmpoweredCostCondition = new class'X2Condition_WOTC_APA_SourceUnitValue';
	EmpoweredCostCondition.AddCheckValue(default.PSI_CONDUIT_CURRENT_NAME, default.PSI_STRIKE_FOCUS_COST + default.EMPOWER_FOCUS_COST_INCREASE, eCheck_GreaterThanOrEqual);


	// Set the target's Sustain UnitValue to disable it if Empowered
	SetSustainEffect = new class'X2Effect_SetUnitValue';
	SetSustainEffect.UnitName = class'X2Effect_Sustain'.default.SustainUsed;
	SetSustainEffect.NewValueToSet = 1;
	SetSustainEffect.CleanupType = eCleanup_BeginTactical;
	SetSustainEffect.TargetConditions.AddItem(EmpoweredEffectCondition);
	SetSustainEffect.TargetConditions.AddItem(EmpoweredCostCondition);
	Template.AddTargetEffect(SetSustainEffect);


	// Setup base damage effects
	DamageEffect = new class'X2Effect_ApplyWeaponDamage';
	DamageEffect.bIgnoreBaseDamage = true;
	DamageEffect.DamageTag = 'WOTC_APA_PsiStrike';
	DamageEffect.bIgnoreArmor = true;
	DamageEffect.bBypassShields = true;
	Template.AddTargetEffect(DamageEffect);

	// Setup Empowered damage effects and target conditions
	PsiCondition = new class'X2Condition_UnitProperty';
	PsiCondition.ExcludeNonPsionic = true;
	EmpoweredDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	EmpoweredDamageEffect.bIgnoreBaseDamage = true;
	EmpoweredDamageEffect.DamageTag = 'WOTC_APA_EmpoweredPsiStrike';
	EmpoweredDamageEffect.bIgnoreArmor = true;
	EmpoweredDamageEffect.bBypassShields = true;
	EmpoweredDamageEffect.TargetConditions.AddItem(PsiCondition);
	EmpoweredDamageEffect.TargetConditions.AddItem(EmpoweredEffectCondition);
	EmpoweredDamageEffect.TargetConditions.AddItem(EmpoweredCostCondition);
	Template.AddTargetEffect(EmpoweredDamageEffect);


	// Setup Knockback effect
	TargetCondition = new class'X2Condition_UnitProperty';
	TargetCondition.ExcludeLargeUnits = true;

	KnockbackEffect = new class'X2Effect_Knockback';
	KnockbackEffect.KnockbackDistance = 3;
	KnockbackEffect.OnlyOnDeath = false;
	KnockbackEffect.ApplyChanceFn = none;
	KnockbackEffect.TargetConditions.AddItem(TargetCondition);
	Template.AddTargetEffect(KnockbackEffect);


	// Setup guaranteed Stun effect if Empowered vs Psionic
	StunnedEffect = class'X2StatusEffects'.static.CreateStunnedStatusEffect(2, 100, false);
	StunnedEffect.EffectName = 'WOTC_APA_PsiStrikeImpaired';
	StunnedEffect.DuplicateResponse = eDupe_Ignore;
	StunnedEffect.bRemoveWhenSourceDies = false;
	StunnedEffect.TargetConditions.AddItem(PsiCondition);
	Template.AddTargetEffect(StunnedEffect);

	// Setup chance-based Stun effect if Empowered vs non-Psionic
	StunnedEffect = class'X2StatusEffects'.static.CreateStunnedStatusEffect(2, default.PSI_STRIKE_STUN_CHANCE, false);
	StunnedEffect.EffectName = 'WOTC_APA_PsiStrikeImpaired';
	StunnedEffect.DuplicateResponse = eDupe_Ignore;
	StunnedEffect.bRemoveWhenSourceDies = false;
	StunnedEffect.TargetConditions.AddItem(EmpoweredEffectCondition);
	StunnedEffect.TargetConditions.AddItem(EmpoweredCostCondition);
	Template.AddTargetEffect(StunnedEffect);

	
	// Setup Disorient effect if Stun was not applied
	DisorientEffect = class'X2StatusEffects'.static.CreateDisorientedStatusEffect(, , false);
	DisorientEffect.EffectName = 'WOTC_APA_PsiStrikeImpaired';
	DisorientEffect.DuplicateResponse = eDupe_Ignore;
	Template.AddTargetEffect(DisorientEffect);


	// Trigger event to tie into cast focus abilities
	FocusAbilityTriggered = new class'X2Effect_TriggerEvent';
	FocusAbilityTriggered.TriggerEventName = default.FOCUS_ABILITY_CAST_TRIGGER;
	Template.AddTargetEffect(FocusAbilityTriggered);

	FocusAbilityTriggered = new class'X2Effect_TriggerEvent';
	FocusAbilityTriggered.TriggerEventName = 'StunStrikeActivated';
	Template.AddTargetEffect(FocusAbilityTriggered);

	
	// Trigger event to remove Empowered effect if this ability is getting Empowered
	RemoveEmpowerEffect = new class'X2Effect_TriggerEvent';
	RemoveEmpowerEffect.TriggerEventName = default.EMPOWER_REMOVE_TRIGGER;
	RemoveEmpowerEffect.TargetConditions.AddItem(EmpoweredEffectCondition);
	RemoveEmpowerEffect.TargetConditions.AddItem(EmpoweredCostCondition);
	Template.AddShooterEffect(RemoveEmpowerEffect);

	
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;

	return Template;
}



// Soulbind - Passive: 
static function X2AbilityTemplate WOTC_APA_Soulbind()
{

	local X2AbilityTemplate										Template;
	local X2Effect_WOTC_APA_SoulbindFocus						FocusEffect;


	Template = CreatePassiveAbility('WOTC_APA_Soulbind', "img:///UILibrary_WOTC_APA_Templar.perk_Soulbind");


	FocusEffect = new class'X2Effect_WOTC_APA_SoulbindFocus';
	FocusEffect.EffectName = 'WOTC_APA_Soulbind_UpdateFocusListener';
	FocusEffect.BuildPersistentEffect(1, true, false);
	Template.AddTargetEffect(FocusEffect);


	Template.AdditionalAbilities.AddItem('WOTC_APA_SoulbindHeal');
	Template.AdditionalAbilities.AddItem('WOTC_APA_SoulbindFocus');
	

	return Template;
}

static function X2AbilityTemplate WOTC_APA_SoulbindHeal()
{
	local X2AbilityTemplate										Template;
	local X2AbilityTrigger_EventListener						EventTrigger;
	local X2Condition_UnitProperty								UnitPropertyCondition;
	local X2Effect_ApplyMedikitHeal								HealEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'WOTC_APA_SoulbindHeal');
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	
	EventTrigger = new class'X2AbilityTrigger_EventListener';
	EventTrigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	EventTrigger.ListenerData.EventID = default.SOULBIND_HEAL_ON_KILL_TRIGGER;
	EventTrigger.ListenerData.Filter = eFilter_Unit;
	EventTrigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_Self;
	Template.AbilityTriggers.AddItem(EventTrigger);

	UnitPropertyCondition = new class'X2Condition_UnitProperty';
	UnitPropertyCondition.ExcludeFriendlyToSource = false;
	UnitPropertyCondition.ExcludeFullHealth = true;
	Template.AbilityTargetConditions.AddItem(UnitPropertyCondition);

	HealEffect = new class'X2Effect_ApplyMedikitHeal';
	HealEffect.PerUseHP = default.SOULBIND_HP_HEALED;
	Template.AddTargetEffect(HealEffect);

	Template.bSkipFireAction = true;
	Template.bShowActivation = true;

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;

	return Template;
}

static function X2AbilityTemplate WOTC_APA_SoulbindFocus()
{
	local X2AbilityTemplate										Template;
	local X2AbilityTrigger_EventListener						EventTrigger;
	local X2Condition_WOTC_APA_BelowMaxFocus					MaxFocusCondition;
	local X2Effect_IncrementUnitValue							SetUnitValueEffect;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'WOTC_APA_SoulbindFocus');
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.bShowPostActivation = true;
	Template.bSkipFireAction = true;

	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	
	EventTrigger = new class'X2AbilityTrigger_EventListener';
	EventTrigger.ListenerData.Deferral = ELD_OnStateSubmitted;
	EventTrigger.ListenerData.EventID = default.SOULBIND_FOCUS_GAIN_TRIGGER;
	EventTrigger.ListenerData.Filter = eFilter_Unit;
	EventTrigger.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_Self;
	Template.AbilityTriggers.AddItem(EventTrigger);

	MaxFocusCondition = new class'X2Condition_WOTC_APA_BelowMaxFocus';
	MaxFocusCondition.CurrentFocusUnitValueName = default.PSI_CONDUIT_CURRENT_NAME;
	MaxFocusCondition.MaxFocusUnitValueName = default.PSI_CONDUIT_MAX_NAME;
	Template.AbilityShooterConditions.AddItem(MaxFocusCondition);

	SetUnitValueEffect = new class'X2Effect_IncrementUnitValue';
	SetUnitValueEffect.UnitName = default.PSI_CONDUIT_CURRENT_NAME;
	SetUnitValueEffect.NewValueToSet = 1;
	SetUnitValueEffect.CleanupType = eCleanup_BeginTactical;
	Template.AddTargetEffect(SetUnitValueEffect);	

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;

	return Template;
}



// Consecrated Blades - Passive: 
static function X2AbilityTemplate WOTC_APA_ConsecratedBlades()
{

	local X2AbilityTemplate											Template;
	local X2Effect_WOTC_APA_ConsecratedBladesDamage					DamageEffect;
	local X2Effect_IncrementUnitValue								ModifyUnitValue;

	Template = CreatePassiveAbility('WOTC_APA_ConsecratedBlades', "img:///UILibrary_WOTC_APA_Templar.perk_ConsecratedBlades",, false);
	

	// Apply Damage-modifying effect from Focus
	DamageEffect = new class'X2Effect_WOTC_APA_ConsecratedBladesDamage';
	DamageEffect.EffectName = 'WOTC_APA_ConsecratedBladesDamag';
	DamageEffect.BonusDmg = default.CONSECRATED_BLADES_DAMAGE_BONUS;
	DamageEffect.fBonusDmgChance = default.CONSECRATED_BLADES_DAMAGE_CHANCE;
	DamageEffect.FocusUnitValueName = default.PSI_CONDUIT_CURRENT_NAME;
	DamageEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage,,,Template.AbilitySourceName);
	
	DamageEffect.BuildPersistentEffect(1, true, true);
	DamageEffect.DuplicateResponse = eDupe_Ignore;
	Template.AddTargetEffect(DamageEffect);


	// Modify maximum focus cap
	ModifyUnitValue = new class'X2Effect_IncrementUnitValue';
	ModifyUnitValue.UnitName = default.PSI_CONDUIT_MAX_NAME;
	ModifyUnitValue.NewValueToSet = default.CONSECRATED_BLADES_MAX_FOCUS_MODIFIER;
	ModifyUnitValue.CleanupType = eCleanup_BeginTactical;
	Template.AddTargetEffect(ModifyUnitValue);


	return Template;
}



// Castigate - Passive: Offensive Focus abilities also apply a permenant debuff on the target
static function X2AbilityTemplate WOTC_APA_Castigate()
{

	local X2AbilityTemplate			Template;

	Template = CreatePassiveAbility('WOTC_APA_Castigate', "img:///UILibrary_WOTC_APA_Templar.perk_Castigate");
	
	Template.AdditionalAbilities.AddItem('WOTC_APA_CastigateApply');

	return Template;
}

static function X2AbilityTemplate WOTC_APA_CastigateApply()
{

	local X2AbilityTemplate											Template;
	local X2AbilityTrigger_EventListener							EventListener;
	local X2Condition_UnitProperty									TargetCondition;
	local X2Condition_UnitImmunities								UnitImmunityCondition;
	local X2Effect_PersistentStatChange								StatEffect;


	`CREATE_X2ABILITY_TEMPLATE(Template, 'WOTC_APA_CastigateApply');
	Template.IconImage = "img:///UILibrary_WOTC_APA_Templar.perk_Castigate";
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SimpleSingleTarget;
	Template.bSkipFireAction = true;
	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.bCrossClassEligible = false;


	// This ability applies after an offensive focus ability is used
	EventListener = new class'X2AbilityTrigger_EventListener';
	EventListener.ListenerData.Deferral = ELD_OnStateSubmitted;
	EventListener.ListenerData.EventID = default.FOCUS_ABILITY_CAST_TRIGGER;
	EventListener.ListenerData.Filter = eFilter_Unit;
	EventListener.ListenerData.EventFn = class'XComGameState_Ability'.static.VoidRiftInsanityListener;
	Template.AbilityTriggers.AddItem(EventListener);


	// Target cannot be immune to Mental damage or Robotic
	TargetCondition = new class'X2Condition_UnitProperty';
	TargetCondition.ExcludeAlive = false;
	TargetCondition.ExcludeDead = true;
	TargetCondition.ExcludeFriendlyToSource = true;
	TargetCondition.ExcludeHostileToSource = false;
	TargetCondition.TreatMindControlledSquadmateAsHostile = false;
	TargetCondition.FailOnNonUnits = true;
	TargetCondition.ExcludeCivilian = true;
	TargetCondition.ExcludeCosmetic = true;
	TargetCondition.ExcludeRobotic = true;

	UnitImmunityCondition = new class'X2Condition_UnitImmunities';
	UnitImmunityCondition.AddExcludeDamageType('Mental');
	UnitImmunityCondition.bOnlyOnCharacterTemplate = true;
	
	Template.AbilityTargetConditions.AddItem(TargetCondition);
	Template.AbilityTargetConditions.AddItem(UnitImmunityCondition);


	// Create debuff stat effect
	StatEffect = new class'X2Effect_PersistentStatChange';
	StatEffect.AddPersistentStatChange(eStat_PsiOffense, default.CASTIGATE_MENTAL_STAT_MODIFIER, MODOP_Multiplication);
	StatEffect.AddPersistentStatChange(eStat_Will, default.CASTIGATE_MENTAL_STAT_MODIFIER, MODOP_Multiplication);
	StatEffect.AddPersistentStatChange(eStat_Offense, default.CASTIGATE_OFFENSE_STAT_MODIFIER);
	StatEffect.AddPersistentStatChange(eStat_CritChance, default.CASTIGATE_OFFENSE_STAT_MODIFIER);
	StatEffect.SetDisplayInfo(ePerkBuff_Penalty, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage);
	StatEffect.BuildPersistentEffect(1, true, false, true);
	StatEffect.bRemoveWhenTargetDies = true;
	StatEffect.DuplicateResponse = eDupe_Ignore;
	Template.AddTargetEffect(StatEffect);

	
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	return Template;
}



// Fuse - Active:
static function X2AbilityTemplate WOTC_APA_Fuse()
{
	local X2AbilityTemplate										Template;
	local X2AbilityCost_ActionPoints							ActionPointCost;
	local X2AbilityCost_WOTC_APA_TemplarFocus					FocusCost;
	local X2Condition_UnitEffectsOnSource						EmpoweredEffectCondition;
	local X2Condition_WOTC_APA_SourceUnitValue					EmpoweredCostCondition;
	local X2Effect_TriggerEvent									FocusAbilityTriggered, RemoveEmpowerEffect;


	Template = CreateSingleTargetAbility('WOTC_APA_Fuse', "img:///UILibrary_WOTC_APA_Templar.perk_Fuse");
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_CAPTAIN_PRIORITY;
	Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.Hostility = eHostility_Offensive;
	Template.TargetingMethod = class'X2TargetingMethod_WOTC_APA_Fuse';
	Template.CinescriptCameraType = "Psionic_FireAtUnit";
	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.CustomFireAnim = 'HL_Volt';
	Template.bShowActivation = true;
	
	Template.DamagePreviewFn = FuseDamagePreview;

	
	// Set ability costs, cooldowns, and restrictions
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	Template.AbilityCosts.AddItem(ActionPointCost);

	FocusCost = new class'X2AbilityCost_WOTC_APA_TemplarFocus';
	FocusCost.FocusCost = default.FUSE_FOCUS_COST;
	FocusCost.FocusUnitValueName = default.PSI_CONDUIT_CURRENT_NAME;
	Template.AbilityCosts.AddItem(FocusCost);

	Template.AbilityTargetConditions.AddItem(default.LivingHostileUnitOnlyProperty);
	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);
	Template.AbilityTargetConditions.AddItem(new class'X2Condition_FuseTarget');	
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();


	// Setup conditions that check for empowered effect and focus cost
	EmpoweredEffectCondition = new class'X2Condition_UnitEffectsOnSource';
	EmpoweredEffectCondition.AddRequireEffect(default.EMPOWER_EFFECT_NAME, 'AA_MissingRequiredEffect');

	EmpoweredCostCondition = new class'X2Condition_WOTC_APA_SourceUnitValue';
	EmpoweredCostCondition.AddCheckValue(default.PSI_CONDUIT_CURRENT_NAME, default.FUSE_FOCUS_COST + default.EMPOWER_FOCUS_COST_INCREASE, eCheck_GreaterThanOrEqual);


	// Trigger Fuse events
	Template.PostActivationEvents.AddItem(class'X2Ability_PsiOperativeAbilitySet'.default.FuseEventName);
	Template.PostActivationEvents.AddItem(class'X2Ability_PsiOperativeAbilitySet'.default.FusePostEventName);

	
	// Trigger event to tie into cast focus abilities
	FocusAbilityTriggered = new class'X2Effect_TriggerEvent';
	FocusAbilityTriggered.TriggerEventName = default.FOCUS_ABILITY_CAST_TRIGGER;
	Template.AddTargetEffect(FocusAbilityTriggered);


	// Trigger event to remove Empowered effect if this ability is getting Empowered
	RemoveEmpowerEffect = new class'X2Effect_TriggerEvent';
	RemoveEmpowerEffect.TriggerEventName = default.EMPOWER_REMOVE_TRIGGER;
	RemoveEmpowerEffect.TargetConditions.AddItem(EmpoweredEffectCondition);
	RemoveEmpowerEffect.TargetConditions.AddItem(EmpoweredCostCondition);
	Template.AddShooterEffect(RemoveEmpowerEffect);


	// Retain concealment when activating Fuse - then break it after the explosions have occurred.
	Template.ConcealmentRule = eConceal_Always;
	Template.AdditionalAbilities.AddItem('FusePostActivationConcealmentBreaker');


	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;

	return Template;
}

function bool FuseDamagePreview(XComGameState_Ability AbilityState, StateObjectReference TargetRef, out WeaponDamageValue MinDamagePreview, out WeaponDamageValue MaxDamagePreview, out int AllowsShield)
{
	local XComGameStateHistory History;
	local XComGameState_Ability FuseTargetAbility;
	local XComGameState_Unit TargetUnit, SourceUnit;
	local StateObjectReference EmptyRef, FuseRef;

	History = `XCOMHISTORY;
	TargetUnit = XComGameState_Unit(History.GetGameStateForObjectID(TargetRef.ObjectID));
	SourceUnit = XComGameState_Unit(History.GetGameStateForObjectID(AbilityState.OwnerStateObject.ObjectID));
	if (TargetUnit != none && SourceUnit != none)
	{
		if (class'X2Condition_FuseTarget'.static.GetAvailableFuse(TargetUnit, FuseRef))
		{
			FuseTargetAbility = XComGameState_Ability(History.GetGameStateForObjectID(FuseRef.ObjectID));
			if (FuseTargetAbility != None)
			{
				//  pass an empty ref because we assume the ability will use multi target effects.
				FuseTargetAbility.GetDamagePreview(EmptyRef, MinDamagePreview, MaxDamagePreview, AllowsShield);
				return true;
			}
		}
	}
	return false;
}



// CHECK - log sourceunit in multi-target - May not be getting proper sourceunit for some calls. Maybe try grabbing primary target instead?

// TODO - Attempt reversing logic in custom multi-target to start big and get reduced.
// Or, transfer to activated ability with variable range for preview only. Trigger different abilities for
// single or multi target versions for different animations/effects (no shieldbearer pound for single target)

// Harden - Active: 
static function X2AbilityTemplate WOTC_APA_Harden()
{

	local X2AbilityTemplate										Template;
	local X2AbilityCooldown										Cooldown;
	local X2AbilityCost_ActionPoints							ActionPointCost;
	local X2AbilityCost_WOTC_APA_TemplarFocus					FocusCost;
	local X2AbilityMultiTarget_Radius_WOTC_APA_Focus			RadiusMultiTarget;
	local X2Condition_UnitProperty								MultiTargetCondition;
	local X2Condition_UnitStatCheck								TargetShieldCondition;
	local X2Condition_UnitEffectsOnSource						EmpoweredEffectCondition;
	local X2Condition_WOTC_APA_SourceUnitValue					EmpoweredCostCondition;
	local X2Effect_WOTC_APA_HardenShield						TargetShieldEffect, MultiTargetShieldEffect;
	local X2Effect_TriggerEvent									TriggerAOEEffect, RemoveEmpowerEffect;


	Template = CreateSelfActiveAbility('WOTC_APA_Harden', "img:///UILibrary_WOTC_APA_Templar.perk_Harden");
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SERGEANT_PRIORITY + 1;
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.ConcealmentRule = eConceal_Never;
	Template.Hostility = eHostility_Defensive;
	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.CinescriptCameraType = "AdvShieldBearer_EnergyShieldArmor";
	//Template.CustomFireAnim = 'HL_EnergyShieldA';
	Template.CustomFireAnim = 'HL_Ghost';
	Template.ActivationSpeech = 'Inspire';

	
	// Set ability costs, cooldowns, and restrictions
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.HARDEN_COOLDOWN;
	Template.AbilityCooldown = Cooldown;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.AllowedTypes.AddItem(class'X2CharacterTemplateManager'.default.MoveActionPoint);
	ActionPointCost.AllowedTypes.AddItem(class'X2CharacterTemplateManager'.default.MomentumActionPoint);
	Template.AbilityCosts.AddItem(ActionPointCost);

	FocusCost = new class'X2AbilityCost_WOTC_APA_TemplarFocus';
	FocusCost.FocusCost = default.HARDEN_FOCUS_COST;
	FocusCost.FocusUnitValueName = default.PSI_CONDUIT_CURRENT_NAME;
	Template.AbilityCosts.AddItem(FocusCost);

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AbilityTargetConditions.AddItem(new class'X2Condition_WOTC_APA_HardenTarget');
	Template.AddShooterEffectExclusions();
	

	// Setup self-target stat condition
	TargetShieldCondition = new class'X2Condition_UnitStatCheck';
	TargetShieldCondition.AddCheckStat(eStat_ShieldHP, default.HARDEN_SHIELD_POINTS, eCheck_LessThan);

	// Setup effect that sets the target's Shields to the desired stat, if below
	TargetShieldEffect = new class'X2Effect_WOTC_APA_HardenShield';
	TargetShieldEffect.BuildPersistentEffect(1, true);
	TargetShieldEffect.EffectName = 'WOTC_APA_TargetHardenEffect';
	TargetShieldEffect.ShieldAmount = default.HARDEN_SHIELD_POINTS;
	TargetShieldEffect.bCappedAmount = true;
	TargetShieldEffect.EffectRemovedVisualizationFn = OnShieldRemoved_BuildVisualization;
	TargetShieldEffect.TargetConditions.AddItem(TargetShieldCondition);
	Template.AddShooterEffect(TargetShieldEffect);


	// Setup AbilityMultiTarget
	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius_WOTC_APA_Focus';
	RadiusMultiTarget.fTileRadius = 0.75;
	RadiusMultiTarget.bIgnoreBlockingCover = true;
	RadiusMultiTarget.bExcludeSelfAsTargetIfWithinRadius = true;
	RadiusMultiTarget.RequiredEffectName = default.EMPOWER_EFFECT_NAME;
	RadiusMultiTarget.FocusUnitValueName = default.PSI_CONDUIT_CURRENT_NAME;
	RadiusMultiTarget.RequiredFocusValue = default.HARDEN_FOCUS_COST + default.EMPOWER_FOCUS_COST_INCREASE;
	RadiusMultiTarget.fFocusTileBonus = default.HARDEN_AREA_TILE_RADIUS - 0.75;
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;

	Template.TargetingMethod = class'X2TargetingMethod_WOTC_APA_FocusRadius';

	MultiTargetCondition = new class'X2Condition_UnitProperty';
	MultiTargetCondition.ExcludeDead = true;
	MultiTargetCondition.ExcludeFriendlyToSource = false;
	MultiTargetCondition.ExcludeHostileToSource = true;
	MultiTargetCondition.TreatMindControlledSquadmateAsHostile = true;
	MultiTargetCondition.FailOnNonUnits = true;
	MultiTargetCondition.ExcludeTurret = true;
	Template.AbilityMultiTargetConditions.AddItem(MultiTargetCondition);


	// Setup conditions that check for empowered effect and focus cost
	EmpoweredEffectCondition = new class'X2Condition_UnitEffectsOnSource';
	EmpoweredEffectCondition.AddRequireEffect(default.EMPOWER_EFFECT_NAME, 'AA_MissingRequiredEffect');

	EmpoweredCostCondition = new class'X2Condition_WOTC_APA_SourceUnitValue';
	EmpoweredCostCondition.AddCheckValue(default.PSI_CONDUIT_CURRENT_NAME, default.HARDEN_FOCUS_COST + default.EMPOWER_FOCUS_COST_INCREASE, eCheck_GreaterThanOrEqual);


	// Apply [default: +1] Shield to allies in radius, if empowered
	MultiTargetShieldEffect = new class'X2Effect_WOTC_APA_HardenShield';
	MultiTargetShieldEffect.BuildPersistentEffect(1, true, true);
	MultiTargetShieldEffect.DuplicateResponse = eDupe_Ignore;
	MultiTargetShieldEffect.EffectName = 'WOTC_APA_MultiTargetHardenEffect';
	MultiTargetShieldEffect.ShieldAmount = default.HARDEN_AREA_SHIELD_POINTS;
	MultiTargetShieldEffect.EffectRemovedVisualizationFn = OnShieldRemoved_BuildVisualization;
	MultiTargetShieldEffect.TargetConditions.AddItem(EmpoweredEffectCondition);
	MultiTargetShieldEffect.TargetConditions.AddItem(EmpoweredCostCondition);
	Template.AddMultiTargetEffect(MultiTargetShieldEffect);

	
	// Trigger event to remove Empowered effect if this ability is getting Empowered
	RemoveEmpowerEffect = new class'X2Effect_TriggerEvent';
	RemoveEmpowerEffect.TriggerEventName = default.EMPOWER_REMOVE_TRIGGER;
	RemoveEmpowerEffect.TargetConditions.AddItem(EmpoweredEffectCondition);
	RemoveEmpowerEffect.TargetConditions.AddItem(EmpoweredCostCondition);
	Template.AddShooterEffect(RemoveEmpowerEffect);


	//Template.AdditionalAbilities.AddItem('WOTC_APA_HardenPassive');


	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;
	
	return Template;
}

static function X2AbilityTemplate WOTC_APA_HardenPassive()
{
	local X2AbilityTemplate						Template;
	local X2Effect_AdditionalAnimSets			AnimSetEffect;

	Template = CreatePassiveAbility('WOTC_APA_HardenPassive', "img:///UILibrary_WOTC_APA_Templar.perk_Harden",, false);

	AnimSetEffect = new class'X2Effect_AdditionalAnimSets';
	AnimSetEffect.AddAnimSetWithPath("Advent_ANIM.Anims.AS_Advent");
	Template.AddTargetEffect(AnimSetEffect);

	return Template;
}

simulated function OnShieldRemoved_BuildVisualization(XComGameState VisualizeGameState, out VisualizationActionMetadata ActionMetadata, const name EffectApplyResult)
{
	local X2Action_PlaySoundAndFlyOver SoundAndFlyOver;

	if (XGUnit(ActionMetadata.VisualizeActor).IsAlive())
	{
		SoundAndFlyOver = X2Action_PlaySoundAndFlyOver(class'X2Action_PlaySoundAndFlyOver'.static.AddToVisualizationTree(ActionMetadata, VisualizeGameState.GetContext(), false, ActionMetadata.LastActionAdded));
		SoundAndFlyOver.SetSoundAndFlyOverParameters(None, class'XLocalizedData'.default.ShieldRemovedMsg, '', eColor_Bad, , 0.75, true);
	}
}



// Meditate - Active: Activate to spend the turn drawing in Focus
static function X2AbilityTemplate WOTC_APA_Meditate()
{

	local X2AbilityTemplate										Template;
	local X2AbilityCooldown										Cooldown;
	local X2AbilityCost_ActionPoints							ActionPointCost;
	local X2Condition_WOTC_APA_SourceUnitValue					FocusCondition;
	local X2Effect_SetUnitValue									SetValue;


	Template = CreateSelfActiveAbility('WOTC_APA_Meditate', "img:///UILibrary_WOTC_APA_Templar.perk_Meditate");
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SQUADDIE_PRIORITY - 1;
	Template.CustomFireAnim = 'HL_GainingFocus';


	// Set ability costs, cooldowns, and restrictions
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = default.MEDITATE_ACTION_COST;
	ActionPointCost.bConsumeAllPoints = true;
	Template.AbilityCosts.AddItem(ActionPointCost);


	// Current Focus must be below the cap to activate
	FocusCondition = new class'X2Condition_WOTC_APA_SourceUnitValue';
	FocusCondition.AddCheckValue(default.PSI_CONDUIT_CURRENT_NAME, default.MEDITATE_FOCUS_CAP, eCheck_LessThan);
	Template.AbilityTargetConditions.AddItem(FocusCondition);


	// Set Focus to the cap
	SetValue = new class'X2Effect_SetUnitValue';
	SetValue.UnitName = default.PSI_CONDUIT_CURRENT_NAME;
	SetValue.NewValueToSet = default.MEDITATE_FOCUS_CAP;
	SetValue.CleanupType = eCleanup_BeginTactical;
	Template.AddTargetEffect(SetValue);
	

	return Template;
}



// Solace - Passive:
static function X2AbilityTemplate WOTC_APA_Solace()
{
	local X2AbilityTemplate			Template;

	Template = CreatePassiveAbility('WOTC_APA_Solace', "img:///UILibrary_PerkIcons.UIPerk_solace", 'SolacePassive');
	
	Template.AdditionalAbilities.AddItem('Solace');

	return Template;
}



// Reanimate - Active:
static function X2AbilityTemplate WOTC_APA_Reanimate()
{
	
	local X2AbilityTemplate										Template;
	local X2AbilityCooldown										Cooldown;
	local X2AbilityCost_ActionPoints							ActionPointCost;
	local X2AbilityCost_WOTC_APA_TemplarFocus					FocusCost;
	local X2AbilityPassiveAOE_WeaponRadius						PassiveAOEStyle;
	local X2Condition_UnitEffectsOnSource						EmpoweredEffectCondition;
	local X2Condition_WOTC_APA_SourceUnitValue					EmpoweredCostCondition;
	local X2Condition_UnitProperty								TargetCondition;
	local X2Condition_UnitType									UnitTypeCondition;
	local X2Condition_UnitEffects								TargetEffectsCondition;
	local X2Condition_WOTC_APA_ReanimateTarget					TargetSortCondition;
	local X2Condition_WOTC_APA_ReanimateZombieLimit				ZombieLimitCondition;
	local X2Effect_WOTC_APA_ReanimateZombieSpawn				SpawnZombieEffect, SpawnEmpoweredZombieEffect;
	local X2Effect_TriggerEvent									RemoveEmpowerEffect;


	Template = CreateSingleTargetAbility('WOTC_APA_Reanimate', "img:///UILibrary_WOTC_APA_Templar.perk_Reanimate");
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_LIEUTENANT_PRIORITY + 1;
	Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.ConcealmentRule = eConceal_Never;
	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.CinescriptCameraType = "Sectoid_PsiReanimation";
	//Template.CinescriptCameraType = "AdvShieldBearer_EnergyShieldArmor";
	Template.ActivationSpeech = 'Domination';
	Template.CustomFireAnim = 'HL_Pillar';
	Template.bSkipFireAction = true;

	
	// Set ability costs, cooldowns, and restrictions
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.REANIMATE_COOLDOWN;
	Template.AbilityCooldown = Cooldown;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	Template.AbilityCosts.AddItem(ActionPointCost);

	FocusCost = new class'X2AbilityCost_WOTC_APA_TemplarFocus';
	FocusCost.FocusCost = default.REANIMATE_FOCUS_COST;
	FocusCost.FocusUnitValueName = default.PSI_CONDUIT_CURRENT_NAME;
	Template.AbilityCosts.AddItem(FocusCost);

	PassiveAOEStyle = new class'X2AbilityPassiveAOE_WeaponRadius';
	PassiveAOEStyle.fTargetRadius = `TILESTOMETERS(default.REANIMATE_TILE_RANGE);
	Template.AbilityPassiveAOEStyle = PassiveAOEStyle;

	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	TargetCondition = new class'X2Condition_UnitProperty';
	TargetCondition.ExcludeFriendlyToSource = false;
	TargetCondition.ExcludeHostileToSource = false;
	TargetCondition.ExcludeDead = false;
	TargetCondition.ExcludeCivilian = false;
	TargetCondition.ExcludeOrganic = false;
	TargetCondition.ExcludeAlive = true;
	TargetCondition.ExcludeSquadmates = true;
	TargetCondition.ExcludeCosmetic = true;
	TargetCondition.ExcludeRobotic = true;
	TargetCondition.ExcludeAlien = true;
	TargetCondition.FailOnNonUnits = true;
	TargetCondition.RequireWithinRange = true;
	TargetCondition.WithinRange = `TILESTOUNITS(default.REANIMATE_TILE_RANGE);
	Template.AbilityTargetConditions.AddItem(TargetCondition);

	TargetEffectsCondition = new class'X2Condition_UnitEffects';
	TargetEffectsCondition.AddExcludeEffect(class'X2Ability_CarryUnit'.default.CarryUnitEffectName, 'AA_UnitIsImmune');
	TargetEffectsCondition.AddExcludeEffect(class'X2AbilityTemplateManager'.default.BeingCarriedEffectName, 'AA_UnitIsImmune');
	Template.AbilityTargetConditions.AddItem(TargetEffectsCondition);

	// Enforce Zombie spawn limit
	ZombieLimitCondition = new class' X2Condition_WOTC_APA_ReanimateZombieLimit';
	ZombieLimitCondition.ZombieLimit = default.REANIMATE_ZOMBIE_LIMIT;
	Template.AbilityTargetConditions.AddItem(ZombieLimitCondition);
	

	// Units of these types may not be turned into a zombie
	UnitTypeCondition = new class'X2Condition_UnitType';
	UnitTypeCondition.ExcludeTypes = class'X2Ability_Sectoid'.default.SECTOID_REANIMATION_EXCLUDE_UNIT_TYPES;
	UnitTypeCondition.ExcludeTypes.AddItem('TheLost');
	Template.AbilityTargetConditions.AddItem(UnitTypeCondition);

	// The target's tile must be clear of obstruction. 
	Template.AbilityTargetConditions.AddItem(new class'X2Condition_ValidUnburrowTile');


	// Setup conditions that check for empowered effect and focus cost
	EmpoweredEffectCondition = new class'X2Condition_UnitEffectsOnSource';
	EmpoweredEffectCondition.AddRequireEffect(default.EMPOWER_EFFECT_NAME, 'AA_MissingRequiredEffect');

	EmpoweredCostCondition = new class'X2Condition_WOTC_APA_SourceUnitValue';
	EmpoweredCostCondition.AddCheckValue(default.PSI_CONDUIT_CURRENT_NAME, default.REANIMATE_FOCUS_COST + default.EMPOWER_FOCUS_COST_INCREASE, eCheck_GreaterThanOrEqual);


	// The target will now be turned into a zombie
	TargetSortCondition = new class'X2Condition_WOTC_APA_ReanimateTarget';
	TargetSortCondition.bEmpowered = false;
	TargetSortCondition.EmpoweredCost = default.REANIMATE_FOCUS_COST + default.EMPOWER_FOCUS_COST_INCREASE;
	TargetSortCondition.EmpoweredEffectName = default.EMPOWER_EFFECT_NAME;
	TargetSortCondition.FocusUnitValueName = default.PSI_CONDUIT_CURRENT_NAME;
	SpawnZombieEffect = new class'X2Effect_WOTC_APA_ReanimateZombieSpawn';
	SpawnZombieEffect.BuildPersistentEffect(1, true);
	SpawnZombieEffect.bLimitActions = true;
	SpawnZombieEffect.bCopyTargetAppearance = true;
	SpawnZombieEffect.UnitToSpawnName = 'WOTC_APA_Templar_PsiZombie';
	SpawnZombieEffect.AltUnitToSpawnName= 'WOTC_APA_Templar_PsiZombieHuman';
	SpawnZombieEffect.TargetConditions.AddItem(TargetSortCondition);
	Template.AddTargetEffect(SpawnZombieEffect);


	TargetSortCondition = new class'X2Condition_WOTC_APA_ReanimateTarget';
	TargetSortCondition.bEmpowered = true;
	TargetSortCondition.EmpoweredCost = default.REANIMATE_FOCUS_COST + default.EMPOWER_FOCUS_COST_INCREASE;
	TargetSortCondition.EmpoweredEffectName = default.EMPOWER_EFFECT_NAME;
	TargetSortCondition.FocusUnitValueName = default.PSI_CONDUIT_CURRENT_NAME;
	SpawnEmpoweredZombieEffect = new class'X2Effect_WOTC_APA_ReanimateZombieSpawn';
	SpawnEmpoweredZombieEffect.BuildPersistentEffect(1, true);
	SpawnEmpoweredZombieEffect.bCopyTargetAppearance = true;
	SpawnEmpoweredZombieEffect.UnitToSpawnName = 'WOTC_APA_Templar_EmpoweredPsiZombie';
	SpawnEmpoweredZombieEffect.AltUnitToSpawnName= 'WOTC_APA_Templar_EmpoweredPsiZombieHuman';
	//SpawnEmpoweredZombieEffect.AnimationName = 'HL_ResurrectRise';
	SpawnEmpoweredZombieEffect.TargetConditions.AddItem(TargetSortCondition);
	Template.AddTargetEffect(SpawnEmpoweredZombieEffect);


	// Trigger event to remove Empowered effect if this ability is getting Empowered
	RemoveEmpowerEffect = new class'X2Effect_TriggerEvent';
	RemoveEmpowerEffect.TriggerEventName = default.EMPOWER_REMOVE_TRIGGER;
	RemoveEmpowerEffect.TargetConditions.AddItem(EmpoweredEffectCondition);
	RemoveEmpowerEffect.TargetConditions.AddItem(EmpoweredCostCondition);
	Template.AddShooterEffect(RemoveEmpowerEffect);

	
	Template.AdditionalAbilities.AddItem('WOTC_APA_KillSiredZombies');


	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;

	Template.BuildVisualizationFn = Reanimation_BuildVisualization;

	return Template;
}

simulated function Reanimation_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateHistory History;
	local XComGameStateContext_Ability Context;
	local StateObjectReference InteractingUnitRef;
	local X2Action_PlayAnimation AnimationAction;

	local VisualizationActionMetadata EmptyTrack;
	local VisualizationActionMetadata ActionMetadata, ZombieTrack, DeadUnitTrack;
	local XComGameState_Unit SpawnedUnit, DeadUnit, CastingUnit;
	local UnitValue SpawnedUnitValue;
	local X2Effect_WOTC_APA_ReanimateZombieSpawn SpawnPsiZombieEffect;
	local X2Action_TimedWait ReanimateTimedWaitAction;

	History = `XCOMHISTORY;

	Context = XComGameStateContext_Ability(VisualizeGameState.GetContext());
	InteractingUnitRef = Context.InputContext.SourceObject;

	//Configure the visualization track for the shooter
	//****************************************************************************************
	ActionMetadata = EmptyTrack;
	ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	ActionMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
	ActionMetadata.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);

	CastingUnit = XComGameState_Unit(ActionMetadata.StateObject_NewState);

	if (CastingUnit != none)
	{
		// Configure the visualization track for the psi zombie
		//******************************************************************************************
		DeadUnitTrack.StateObject_OldState = History.GetGameStateForObjectID(Context.InputContext.PrimaryTarget.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex);
		DeadUnitTrack.StateObject_NewState = DeadUnitTrack.StateObject_OldState;
		DeadUnit = XComGameState_Unit(VisualizeGameState.GetGameStateForObjectID(Context.InputContext.PrimaryTarget.ObjectID));
		DeadUnitTrack.VisualizeActor = History.GetVisualizer(DeadUnit.ObjectID);

		// Get the ObjectID for the ZombieUnit created from the DeadUnit
		DeadUnit.GetUnitValue(class'X2Effect_SpawnUnit'.default.SpawnedUnitValueName, SpawnedUnitValue);

		ZombieTrack = EmptyTrack;
		ZombieTrack.StateObject_OldState = History.GetGameStateForObjectID(SpawnedUnitValue.fValue, eReturnType_Reference, VisualizeGameState.HistoryIndex);
		ZombieTrack.StateObject_NewState = ZombieTrack.StateObject_OldState;
		SpawnedUnit = XComGameState_Unit(ZombieTrack.StateObject_NewState);
		ZombieTrack.VisualizeActor = History.GetVisualizer(SpawnedUnit.ObjectID);

		// Get appropriate X2Effect_SpawnPsiZombie effect
		SpawnPsiZombieEffect = X2Effect_WOTC_APA_ReanimateZombieSpawn(Context.ResultContext.TargetEffectResults.Effects[0]);
		if (SpawnPsiZombieEffect == none )
		{
			return;
		}

		// Build the tracks
		class'X2Action_ExitCover'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded);
		class'X2Action_AbilityPerkStart'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded);

		// Dead unit should wait for the Casting to play its Reanimation animation
		// Preferable to have an anim notify from content but can't do that currently, animation gave the time to wait before the zombie rises
		ReanimateTimedWaitAction = X2Action_TimedWait(class'X2Action_TimedWait'.static.AddToVisualizationTree(DeadUnitTrack, Context));
		ReanimateTimedWaitAction.DelayTimeSec = 3;

		SpawnPsiZombieEffect.AddSpawnVisualizationsToTracks(Context, SpawnedUnit, ZombieTrack, DeadUnit, DeadUnitTrack);

		AnimationAction = X2Action_PlayAnimation(class'X2Action_PlayAnimation'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded));
		AnimationAction.Params.AnimName = 'HL_Pillar';//SpawnPsiZombieEffect.AnimationName; //'HL_Psi_ReAnimate';

		class'X2Action_AbilityPerkEnd'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded);
		class'X2Action_EnterCover'.static.AddToVisualizationTree(ActionMetadata, Context, false, ActionMetadata.LastActionAdded);
	}
}

// Kill Linked Zombies - differs from Sectoid ability by not killing on impair, only death
static function X2AbilityTemplate WOTC_APA_KillSiredZombies()
{
	return class'X2Ability_Sectoid'.static.AddKillLinkedUnits('WOTC_APA_KillSiredZombies', 'SireZombieLink', class'X2Action_ZombieSireDeath', false);
}

// Zombie Claw Slash - Active:
static function X2AbilityTemplate WOTC_APA_ZombieClawSlash()
{
	local X2AbilityTemplate			Template;

	Template = class'X2Ability_RangerAbilitySet'.static.AddSwordSliceAbility('WOTC_APA_ZombieClawSlash');
	Template.IconImage = "img:///UILibrary_PerkIcons.UIPerk_chryssalid_slash";
	Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;

	Template.OverrideAbilities.AddItem('StandardMelee');

	return Template;
}



// Arcwave - Passive: 
static function X2AbilityTemplate WOTC_APA_Arcwave()
{

	local X2AbilityTemplate			Template;

	Template = CreatePassiveAbility('WOTC_APA_Arcwave', "img:///UILibrary_WOTC_APA_Templar.perk_Arcwave");
	
	Template.AdditionalAbilities.AddItem('WOTC_APA_ArcwaveRend');

	return Template;
}

// ArcwaveRend - Active: AOE moving melee attack that can trigger Momentum and generate Focus on kills. Replace standard Rend.
static function X2AbilityTemplate WOTC_APA_ArcwaveRend()
{
	local X2AbilityTemplate                 Template;
	local X2AbilityCost_ActionPoints        ActionPointCost;
	local X2AbilityToHitCalc_StandardMelee  StandardMelee;
	local X2Effect_ApplyWeaponDamage        WeaponDamageEffect;
	local X2AbilityMultiTarget_Cone			ConeMultiTarget;
	local array<name>                       SkipExclusions;

	`CREATE_X2ABILITY_TEMPLATE(Template, 'WOTC_APA_ArcwaveRend');
	
	Template.OverrideAbilities.AddItem('WOTC_APA_Rend');
	Template.TargetingMethod = class'X2TargetingMethod_ArcWave';
	Template.ActionFireClass = class'X2Action_Fire_Wave';

	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.BuildNewGameStateFn = TypicalMoveEndAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.BuildInterruptGameStateFn = TypicalMoveEndAbility_BuildInterruptGameState;
	Template.IconImage = "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Rend";
	Template.bHideOnClassUnlock = false;
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.REND_PRIORITY;
	Template.AbilityConfirmSound = "TacticalUI_SwordConfirm";


	// Set ability costs, cooldowns, and restrictions
	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	Template.AbilityCosts.AddItem(ActionPointCost);

	Template.AbilityTargetStyle = new class'X2AbilityTarget_MovingMelee';

	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
	Template.AbilityTriggers.AddItem(new class'X2AbilityTrigger_EndOfMove');

	Template.AbilityTargetConditions.AddItem(default.LivingHostileTargetProperty);
	Template.AbilityTargetConditions.AddItem(default.MeleeVisibilityCondition);

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	SkipExclusions.AddItem(class'X2StatusEffects'.default.BurningName);
	Template.AddShooterEffectExclusions(SkipExclusions);

	StandardMelee = new class'X2AbilityToHitCalc_StandardMelee';
	StandardMelee.bGuaranteedHit = true;
	Template.AbilityToHitCalc = StandardMelee;


	// Damage Effect
	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	WeaponDamageEffect.DamageTypes.AddItem('Melee');
	Template.AddTargetEffect(WeaponDamageEffect);

	ConeMultiTarget = new class'X2AbilityMultiTarget_Cone';
	ConeMultiTarget.ConeEndDiameter = class'X2Ability_TemplarAbilitySet'.default.ArcWaveConeEndDiameterTiles * class'XComWorldData'.const.WORLD_StepSize;
	ConeMultiTarget.ConeLength = class'X2Ability_TemplarAbilitySet'.default.ArcWaveConeLengthTiles * class'XComWorldData'.const.WORLD_StepSize;
	ConeMultiTarget.fTargetRadius = Sqrt(Square(ConeMultiTarget.ConeEndDiameter / 2) + Square(ConeMultiTarget.ConeLength)) * class'XComWorldData'.const.WORLD_UNITS_TO_METERS_MULTIPLIER;
	ConeMultiTarget.bExcludeSelfAsTargetIfWithinRadius = true;
	ConeMultiTarget.bLockShooterZ = true;
	Template.AbilityMultiTargetStyle = ConeMultiTarget;

	Template.AbilityMultiTargetConditions.AddItem(default.LivingHostileUnitOnlyProperty);

	Template.AddMultiTargetEffect(new class'X2Effect_WOTC_APA_ArcWaveMultiDamage');


	Template.PostActivationEvents.AddItem('RendActivated');

	Template.bAllowBonusWeaponEffects = true;


	Template.SourceMissSpeech = 'SwordMiss';
	Template.SuperConcealmentLoss = class'X2AbilityTemplateManager'.default.SuperConcealmentStandardShotLoss;
	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.MeleeLostSpawnIncreasePerUse;
	Template.bSkipExitCoverWhenFiring = false;
	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.bSkipMoveStop = false;
	Template.CustomFireAnim = 'FF_ArcWave_MeleeA';
	Template.CustomFireKillAnim = 'FF_ArcWave_MeleeKillA';
	Template.CustomMovingFireAnim = 'MV_ArcWave_MeleeA';
	Template.CustomMovingFireKillAnim = 'MV_ArcWave_MeleeKillA';
	Template.CustomMovingTurnLeftFireAnim = 'MV_ArcWave_RunTurn90LeftMeleeA';
	Template.CustomMovingTurnLeftFireKillAnim = 'MV_ArcWave_RunTurn90LeftMeleeKillA';
	Template.CustomMovingTurnRightFireAnim = 'MV_ArcWave_RunTurn90RightMeleeA';
	Template.CustomMovingTurnRightFireKillAnim = 'MV_ArcWave_RunTurn90RightMeleeKillA';
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.ActivationSpeech = 'Rend';
	Template.CinescriptCameraType = "Templar_Rend";


	return Template;
}



// Exchange - Active:
static function X2AbilityTemplate WOTC_APA_Exchange()
{
	
	local X2AbilityTemplate										Template;
	local X2AbilityCooldown										Cooldown;
	local X2AbilityCost_ActionPoints							ActionPointCost;
	local X2AbilityCost_WOTC_APA_TemplarFocus					FocusCost;
	local X2Condition_UnitEffectsOnSource						EmpoweredEffectCondition;
	local X2Condition_WOTC_APA_SourceUnitValue					EmpoweredCostCondition;
	local X2Condition_UnitProperty								TargetCondition;
	local X2Condition_UnitEffects								ExcludeEffects;
	local X2Effect_TriggerEvent									RemoveEmpowerEffect;


	Template = CreateSingleTargetAbility('WOTC_APA_Exchange', "img:///UILibrary_WOTC_APA_Templar.perk_Exchange");
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_SERGEANT_PRIORITY;
	Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.ConcealmentRule = eConceal_Never;
	Template.Hostility = eHostility_Neutral;
	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.CinescriptCameraType = "Templar_Exchange";
	Template.ActivationSpeech = 'Exchange';
	Template.CustomFireAnim = 'HL_ExchangeStart';

	
	// Set ability costs, cooldowns, and restrictions
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.PSI_STRIKE_COOLDOWN;
	Template.AbilityCooldown = Cooldown;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.AllowedTypes.AddItem(class'X2CharacterTemplateManager'.default.MoveActionPoint);
	ActionPointCost.AllowedTypes.AddItem(class'X2CharacterTemplateManager'.default.MomentumActionPoint);
	Template.AbilityCosts.AddItem(ActionPointCost);

	FocusCost = new class'X2AbilityCost_WOTC_APA_TemplarFocus';
	FocusCost.FocusCost = default.EXCHANGE_FOCUS_COST;
	FocusCost.FocusUnitValueName = default.PSI_CONDUIT_CURRENT_NAME;
	Template.AbilityCosts.AddItem(FocusCost);

	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	TargetCondition = new class'X2Condition_UnitProperty';
	TargetCondition.ExcludeAlive = false;
	TargetCondition.ExcludeDead = true;
	TargetCondition.ExcludeFriendlyToSource = false;
	TargetCondition.ExcludeHostileToSource = true;
	TargetCondition.TreatMindControlledSquadmateAsHostile = false;
	TargetCondition.FailOnNonUnits = true;
	TargetCondition.RequireSquadmates = true;
	TargetCondition.ExcludeLargeUnits = true;
	Template.AbilityTargetConditions.AddItem(TargetCondition);

	ExcludeEffects = new class'X2Condition_UnitEffects';
	ExcludeEffects.AddExcludeEffect(class'X2AbilityTemplateManager'.default.BoundName, 'AA_UnitIsBound');
	ExcludeEffects.AddExcludeEffect(class'X2Ability_CarryUnit'.default.CarryUnitEffectName, 'AA_CarryingUnit');
	ExcludeEffects.AddExcludeEffect(class'X2Effect_PersistentVoidConduit'.default.EffectName, 'AA_UnitIsBound');
	ExcludeEffects.AddExcludeEffect(class'X2Ability_ChryssalidCocoon'.default.GestationStage1EffectName, 'AA_UnitHasCocoonOnIt');
	ExcludeEffects.AddExcludeEffect(class'X2Ability_ChryssalidCocoon'.default.GestationStage2EffectName, 'AA_UnitHasCocoonOnIt');
	ExcludeEffects.AddExcludeEffect('IcarusDropGrabbeeEffect_Sustained', 'AA_UnitIsBound');
	ExcludeEffects.AddExcludeEffect('IcarusDropGrabberEffect', 'AA_UnitIsBound');
	Template.AbilityTargetConditions.AddItem(ExcludeEffects);

	
	// Setup conditions that check for empowered effect and focus cost
	EmpoweredEffectCondition = new class'X2Condition_UnitEffectsOnSource';
	EmpoweredEffectCondition.AddRequireEffect(default.EMPOWER_EFFECT_NAME, 'AA_MissingRequiredEffect');

	EmpoweredCostCondition = new class'X2Condition_WOTC_APA_SourceUnitValue';
	EmpoweredCostCondition.AddCheckValue(default.PSI_CONDUIT_CURRENT_NAME, default.EXCHANGE_FOCUS_COST + default.EMPOWER_FOCUS_COST_INCREASE, eCheck_GreaterThanOrEqual);

		
	// Trigger event to remove Empowered effect if this ability is getting Empowered
	RemoveEmpowerEffect = new class'X2Effect_TriggerEvent';
	RemoveEmpowerEffect.TriggerEventName = default.EMPOWER_REMOVE_TRIGGER;
	RemoveEmpowerEffect.TargetConditions.AddItem(EmpoweredEffectCondition);
	RemoveEmpowerEffect.TargetConditions.AddItem(EmpoweredCostCondition);
	Template.AddShooterEffect(RemoveEmpowerEffect);


	Template.AdditionalAbilities.AddItem('SustainTriggered');


	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;

	Template.BuildNewGameStateFn = Exchange_BuildGameState;
	Template.BuildVisualizationFn = Exchange_BuildVisualization;
	Template.ModifyNewContextFn = Exchange_ModifyActivatedAbilityContext;

	return Template;
}

static simulated function XComGameState Exchange_BuildGameState(XComGameStateContext Context)
{
	local XComGameStateContext_Ability AbilityContext;
	local XComGameState	NewGameState;
	local XComGameState_Unit ShooterUnit, TargetUnit;
	local XComGameState_Ability AbilityState;
	local XComGameState_Item WeaponState;
	local X2EventManager EventManager;
	local UnitValue CurrentFocusValue;
	local TTile ShooterDesiredLoc;
	local TTile TargetDesiredLoc;
	local XComWorldData WorldData;

	WorldData = `XWORLD;

	NewGameState = `XCOMHISTORY.CreateNewGameState(true, Context);
	AbilityContext = XComGameStateContext_Ability(NewGameState.GetContext());

	ShooterUnit = XComGameState_Unit(NewGameState.ModifyStateObject(class'XComGameState_Unit', AbilityContext.InputContext.SourceObject.ObjectID));
	TargetUnit = XComGameState_Unit(NewGameState.ModifyStateObject(class'XComGameState_Unit', AbilityContext.InputContext.PrimaryTarget.ObjectID));
	AbilityState = XComGameState_Ability(NewGameState.ModifyStateObject(class'XComGameState_Ability', AbilityContext.InputContext.AbilityRef.ObjectID));
	if (AbilityContext.InputContext.ItemObject.ObjectID > 0)
	{
		WeaponState = XComGameState_Item(NewGameState.ModifyStateObject(class'XComGameState_Item', AbilityContext.InputContext.ItemObject.ObjectID));
	}
	ShooterDesiredLoc = TargetUnit.TileLocation;
	TargetDesiredLoc = ShooterUnit.TileLocation;

	ShooterDesiredLoc.Z = WorldData.GetFloorTileZ(ShooterDesiredLoc, true);
	TargetDesiredLoc.Z = WorldData.GetFloorTileZ(TargetDesiredLoc, true);

	ShooterUnit.SetVisibilityLocation(ShooterDesiredLoc);
	TargetUnit.SetVisibilityLocation(TargetDesiredLoc);

	EventManager = `XEVENTMGR;
	EventManager.TriggerEvent('ObjectMoved', ShooterUnit, ShooterUnit, NewGameState);
	EventManager.TriggerEvent('UnitMoveFinished', ShooterUnit, ShooterUnit, NewGameState);
	EventManager.TriggerEvent('ObjectMoved', TargetUnit, TargetUnit, NewGameState);
	EventManager.TriggerEvent('UnitMoveFinished', TargetUnit, TargetUnit, NewGameState);

	// Trigger Sustain if Empowered
	if (ShooterUnit.IsUnitAffectedByEffectName(default.EMPOWER_EFFECT_NAME))
	{
		ShooterUnit.GetUnitValue(default.PSI_CONDUIT_CURRENT_NAME, CurrentFocusValue);
		if (CurrentFocusValue.fValue >= default.EXCHANGE_FOCUS_COST + default.EMPOWER_FOCUS_COST_INCREASE)
		{
			EventManager.TriggerEvent(class'X2Effect_Sustain'.default.SustainEvent, ShooterUnit, ShooterUnit, NewGameState);
	}	}
	
	AbilityState.GetMyTemplate().ApplyCost(AbilityContext, AbilityState, ShooterUnit, WeaponState, NewGameState);

	return NewGameState;
}

simulated function Exchange_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateHistory History;
	local XComGameStateContext_Ability  AbilityContext;
	local StateObjectReference InteractingUnitRef;
	local VisualizationActionMetadata EmptyTrack, BuildTrack;
	local X2Action_MoveVisibleTeleport CasterTeleport, TargetTeleport;
	local XComGameStateVisualizationMgr VisMgr;
	local X2Action_MoveBegin CasterMoveBegin, TargetMoveBegin;
	local X2Action_MoveEnd CasterMoveEnd, TargetMoveEnd;

	History = `XCOMHISTORY;
	VisMgr = `XCOMVISUALIZATIONMGR;

	AbilityContext = XComGameStateContext_Ability(VisualizeGameState.GetContext());
	InteractingUnitRef = AbilityContext.InputContext.SourceObject;

	//****************************************************************************************
	//Configure the visualization track for the source
	//****************************************************************************************
	BuildTrack = EmptyTrack;
	BuildTrack.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	BuildTrack.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
	BuildTrack.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);

	// move action
	class'X2VisualizerHelpers'.static.ParsePath(AbilityContext, BuildTrack);

	CasterTeleport = X2Action_MoveVisibleTeleport(VisMgr.GetNodeOfType(VisMgr.BuildVisTree, class'X2Action_MoveVisibleTeleport', BuildTrack.VisualizeActor));
	CasterTeleport.ParamsStart.AnimName = 'HL_ExchangeStart';
	CasterTeleport.ParamsStop.AnimName = 'HL_ExchangeEnd';
	CasterMoveBegin = X2Action_MoveBegin(VisMgr.GetNodeOfType(VisMgr.BuildVisTree, class'X2Action_MoveBegin', BuildTrack.VisualizeActor));
	CasterMoveEnd = X2Action_MoveEnd(VisMgr.GetNodeOfType(VisMgr.BuildVisTree, class'X2Action_MoveEnd', BuildTrack.VisualizeActor));

	//****************************************************************************************
	//Configure the visualization track for the target
	//****************************************************************************************
	InteractingUnitRef = AbilityContext.InputContext.PrimaryTarget;
	BuildTrack = EmptyTrack;
	BuildTrack.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	BuildTrack.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
	BuildTrack.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);
	
	// move action
	class'X2VisualizerHelpers'.static.ParsePath(AbilityContext, BuildTrack);

	TargetTeleport = X2Action_MoveVisibleTeleport(VisMgr.GetNodeOfType(VisMgr.BuildVisTree, class'X2Action_MoveVisibleTeleport', BuildTrack.VisualizeActor));
	TargetTeleport.PlayAnim = false;
	TargetTeleport.WaitForTeleportEvent = true;
	TargetMoveBegin = X2Action_MoveBegin(VisMgr.GetNodeOfType(VisMgr.BuildVisTree, class'X2Action_MoveBegin', BuildTrack.VisualizeActor));
	TargetMoveEnd = X2Action_MoveEnd(VisMgr.GetNodeOfType(VisMgr.BuildVisTree, class'X2Action_MoveEnd', BuildTrack.VisualizeActor));

	// Jwats: Sync the move begins
	VisMgr.DisconnectAction(TargetMoveBegin);
	VisMgr.ConnectAction(TargetMoveBegin, VisMgr.BuildVisTree, false, , CasterMoveBegin.ParentActions);

	// Jwats: Sync the teleports
	VisMgr.ConnectAction(TargetTeleport, VisMgr.BuildVisTree, false, CasterTeleport);

	// Jwats: Sync the MoveEnds
	VisMgr.ConnectAction(TargetMoveEnd, VisMgr.BuildVisTree, false, CasterMoveEnd);
}


static simulated function Exchange_ModifyActivatedAbilityContext(XComGameStateContext Context)
{
	local XComGameState_Unit UnitState, TargetUnit;
	local XComGameStateContext_Ability AbilityContext;
	local XComGameStateHistory History;
	local PathPoint NextPoint, EmptyPoint;
	local PathingInputData InputData, EmptyData;
	local XComWorldData World;
	local vector NewLocation;
	local TTile ShooterDesiredLoc;
	local TTile TargetDesiredLoc;

	History = `XCOMHISTORY;
	World = `XWORLD;

	AbilityContext = XComGameStateContext_Ability(Context);
	UnitState = XComGameState_Unit(History.GetGameStateForObjectID(AbilityContext.InputContext.SourceObject.ObjectID));
	TargetUnit = XComGameState_Unit(History.GetGameStateForObjectID(AbilityContext.InputContext.PrimaryTarget.ObjectID));

	ShooterDesiredLoc = TargetUnit.TileLocation;
	TargetDesiredLoc = UnitState.TileLocation;

	ShooterDesiredLoc.Z = World.GetFloorTileZ(ShooterDesiredLoc, true);
	TargetDesiredLoc.Z = World.GetFloorTileZ(TargetDesiredLoc, true);

	// Build the MovementData for the path
	// First position is the current location
	InputData.MovementTiles.AddItem(UnitState.TileLocation);

	NextPoint.Position = World.GetPositionFromTileCoordinates(UnitState.TileLocation);
	NextPoint.Traversal = eTraversal_Teleport;
	NextPoint.PathTileIndex = 0;
	InputData.MovementData.AddItem(NextPoint);

	// Second position is the target unit location on the floor
	NewLocation = World.GetPositionFromTileCoordinates(ShooterDesiredLoc);

	NextPoint = EmptyPoint;
	NextPoint.Position = NewLocation;
	NextPoint.Traversal = eTraversal_Landing;
	NextPoint.PathTileIndex = 1;
	InputData.MovementData.AddItem(NextPoint);
	InputData.MovementTiles.AddItem(ShooterDesiredLoc);

	//Now add the path to the input context
	InputData.MovingUnitRef = UnitState.GetReference();
	AbilityContext.InputContext.MovementPaths.AddItem(InputData);

	// Jwats: Reset the InputData
	InputData = EmptyData;

	//	Build the MovementData for the target's path
	// First position is the current location
	InputData.MovementTiles.AddItem(TargetUnit.TileLocation);

	NextPoint.Position = World.GetPositionFromTileCoordinates(TargetUnit.TileLocation);
	NextPoint.Traversal = eTraversal_Teleport;
	NextPoint.PathTileIndex = 0;
	InputData.MovementData.AddItem(NextPoint);

	// Second position is the source unit location
	NewLocation = World.GetPositionFromTileCoordinates(TargetDesiredLoc);

	NextPoint = EmptyPoint;
	NextPoint.Position = NewLocation;
	NextPoint.Traversal = eTraversal_Landing;
	NextPoint.PathTileIndex = 1;
	InputData.MovementData.AddItem(NextPoint);
	InputData.MovementTiles.AddItem(TargetDesiredLoc);

	//Now add the path to the input context
	InputData.MovingUnitRef = TargetUnit.GetReference();
	AbilityContext.InputContext.MovementPaths.AddItem(InputData);
}




// Void Conduit - Active:
static function X2AbilityTemplate WOTC_APA_VoidConduit()
{

	local X2AbilityTemplate										Template;
	local X2AbilityCooldown										Cooldown;
	local X2AbilityCost_ActionPoints							ActionPointCost;
	local X2AbilityCost_WOTC_APA_TemplarFocus					FocusCost;
	local X2Condition_UnitProperty								TargetCondition;
	local X2Condition_UnitEffects								EffectCondition;
	local X2Condition_UnitEffectsOnSource						EmpoweredEffectCondition;
	local X2Condition_WOTC_APA_SourceUnitValue					EmpoweredCostCondition;
	local X2Effect_WOTC_APA_DarkRitual							RitualPersistentEffect;
	local X2Effect_WOTC_APA_DarkRitualDamage					RitualDamageEffect;
	local X2Effect_SetUnitValue									SetSustainEffect;
	local X2Effect_TriggerEvent									FocusAbilityTriggered, RemoveEmpowerEffect;


	Template = CreateSingleTargetAbility('WOTC_APA_VoidConduit', "img:///UILibrary_WOTC_APA_Templar.perk_DarkRitual");

	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_CORPORAL_PRIORITY + 1;
	Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.Hostility = eHostility_Offensive;
	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.CinescriptCameraType = "Templar_VoidConduit";
	Template.CustomFireKillAnim = 'HL_VoidConduit';
	Template.CustomFireAnim = 'HL_VoidConduit';
	Template.ActivationSpeech = 'VoidConduit';

	
	// Set ability costs, cooldowns, and restrictions
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.VOID_CONDUIT_COOLDOWN;
	Template.AbilityCooldown = Cooldown;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	Template.AbilityCosts.AddItem(ActionPointCost);

	FocusCost = new class'X2AbilityCost_WOTC_APA_TemplarFocus';
	FocusCost.FocusCost = default.VOID_CONDUIT_FOCUS_COST;
	FocusCost.FocusUnitValueName = default.PSI_CONDUIT_CURRENT_NAME;
	Template.AbilityCosts.AddItem(FocusCost);

	Template.AbilityTargetConditions.AddItem(default.GameplayVisibilityCondition);
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	TargetCondition = new class'X2Condition_UnitProperty';
	TargetCondition.ExcludeAlive = false;
	TargetCondition.ExcludeDead = true;
	TargetCondition.ExcludeFriendlyToSource = true;
	TargetCondition.ExcludeHostileToSource = false;
	TargetCondition.TreatMindControlledSquadmateAsHostile = false;
	TargetCondition.FailOnNonUnits = true;
	TargetCondition.ExcludeCivilian = true;
	TargetCondition.ExcludeCosmetic = true;
	TargetCondition.ExcludeRobotic = true;
	TargetCondition.ExcludeAlien = true;
	Template.AbilityTargetConditions.AddItem(TargetCondition);

	// Uses VoidConduit effect name to maintain compatibility with existing ability exclusions (like snake pull, etc)
	EffectCondition = new class'X2Condition_UnitEffects';
	EffectCondition.AddExcludeEffect(class'X2Effect_PersistentVoidConduit'.default.EffectName, 'AA_UnitIsImmune');
	Template.AbilityTargetConditions.AddItem(EffectCondition);


	// Setup conditions that check for empowered effect and focus cost
	EmpoweredEffectCondition = new class'X2Condition_UnitEffectsOnSource';
	EmpoweredEffectCondition.AddRequireEffect(default.EMPOWER_EFFECT_NAME, 'AA_MissingRequiredEffect');

	EmpoweredCostCondition = new class'X2Condition_WOTC_APA_SourceUnitValue';
	EmpoweredCostCondition.AddCheckValue(default.PSI_CONDUIT_CURRENT_NAME, default.VOID_CONDUIT_FOCUS_COST + default.EMPOWER_FOCUS_COST_INCREASE, eCheck_GreaterThanOrEqual);


	// Set the target's Sustain UnitValue to disable it
	SetSustainEffect = new class'X2Effect_SetUnitValue';
	SetSustainEffect.UnitName = class'X2Effect_Sustain'.default.SustainUsed;
	SetSustainEffect.NewValueToSet = 1;
	SetSustainEffect.CleanupType = eCleanup_BeginTactical;
	Template.AddTargetEffect(SetSustainEffect);


	// Build the per tick damage effect
	RitualDamageEffect = new class'X2Effect_WOTC_APA_DarkRitualDamage';
	RitualDamageEffect.DamagePerTurn = default.VOID_CONDUIT_DAMAGE;
	RitualDamageEffect.HealthPerTurn = default.VOID_CONDUIT_HEALED;


	// Build the Empowered effects
	RitualPersistentEffect = new class'X2Effect_WOTC_APA_DarkRitual';
	RitualPersistentEffect.InitialDamage = default.VOID_CONDUIT_DAMAGE;
	RitualPersistentEffect.ApplyOnTick.AddItem(RitualDamageEffect);
	RitualPersistentEffect.BuildPersistentEffect(default.VOID_CONDUIT_BASE_DURATION + default.VOID_CONDUIT_BONUS_DURATION + 1, false, true, false, eGameRule_PlayerTurnBegin);
	RitualPersistentEffect.SetDisplayInfo(ePerkBuff_Penalty, Template.LocFriendlyName, Template.LocLongDescription, Template.IconImage, false, , Template.AbilitySourceName);
	RitualPersistentEffect.bRemoveWhenTargetDies = true;
	RitualPersistentEffect.TargetConditions.AddItem(EmpoweredEffectCondition);
	RitualPersistentEffect.TargetConditions.AddItem(EmpoweredCostCondition);
	Template.AddTargetEffect(RitualPersistentEffect);


	// Build the base effects - these are ignored if the Empowered effects were applied
	RitualPersistentEffect = new class'X2Effect_WOTC_APA_DarkRitual';
	RitualPersistentEffect.InitialDamage = default.VOID_CONDUIT_DAMAGE;
	RitualPersistentEffect.ApplyOnTick.AddItem(RitualDamageEffect);
	RitualPersistentEffect.BuildPersistentEffect(default.VOID_CONDUIT_BASE_DURATION + 1, false, true, false, eGameRule_PlayerTurnBegin);
	RitualPersistentEffect.SetDisplayInfo(ePerkBuff_Penalty, Template.LocFriendlyName, Template.LocLongDescription, Template.IconImage, false, , Template.AbilitySourceName);
	RitualPersistentEffect.bRemoveWhenTargetDies = true;
	Template.AddTargetEffect(RitualPersistentEffect);

	Template.DamagePreviewFn = VoidConduitDamagePreview;

	
	// Trigger event to tie into cast focus abilities
	FocusAbilityTriggered = new class'X2Effect_TriggerEvent';
	FocusAbilityTriggered.TriggerEventName = default.FOCUS_ABILITY_CAST_TRIGGER;
	Template.AddTargetEffect(FocusAbilityTriggered);


	// Trigger event to remove Empowered effect if this ability is getting Empowered
	RemoveEmpowerEffect = new class'X2Effect_TriggerEvent';
	RemoveEmpowerEffect.TriggerEventName = default.EMPOWER_REMOVE_TRIGGER;
	RemoveEmpowerEffect.TargetConditions.AddItem(EmpoweredEffectCondition);
	RemoveEmpowerEffect.TargetConditions.AddItem(EmpoweredCostCondition);
	Template.AddShooterEffect(RemoveEmpowerEffect);


	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;

	return Template;
}

function bool VoidConduitDamagePreview(XComGameState_Ability AbilityState, StateObjectReference TargetRef, out WeaponDamageValue MinDamagePreview, out WeaponDamageValue MaxDamagePreview, out int AllowsShield)
{
	MinDamagePreview.Damage = default.VOID_CONDUIT_DAMAGE * (2 + VOID_CONDUIT_BASE_DURATION);
	MaxDamagePreview.Damage = default.VOID_CONDUIT_DAMAGE * (2 + VOID_CONDUIT_BASE_DURATION + VOID_CONDUIT_BONUS_DURATION);
	return true;
}



// Skyfall - Active:
static function X2AbilityTemplate WOTC_APA_Skyfall()
{
	
	local X2AbilityTemplate										Template;
	local X2AbilityCooldown										Cooldown;
	local X2AbilityCost_ActionPoints							ActionPointCost;
	local X2AbilityCost_WOTC_APA_TemplarFocus					FocusCost;
	local X2AbilityMultiTarget_Radius_WOTC_APA_Focus			RadiusMultiTarget;
	local X2Condition_Visibility								VisCondition;
	local X2Condition_UnitEffectsOnSource						EmpoweredEffectCondition;
	local X2Condition_WOTC_APA_SourceUnitValue					EmpoweredCostCondition;
	local X2Effect_DLC_Day60Freeze								FreezeEffect;
	local X2Condition_UnitProperty								TargetCondition;
	local X2Effect_PersistentStatChange							DisorientEffect;
	local X2Effect_TriggerEvent									MomentumEffect, RemoveEmpowerEffect;


	Template = CreateSingleTargetAbility('WOTC_APA_Skyfall', "img:///UILibrary_WOTC_APA_Templar.perk_Smite");
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_MAJOR_PRIORITY + 1;
	Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.ConcealmentRule = eConceal_Never;
	Template.Hostility = eHostility_Neutral;
	Template.bFrameEvenWhenUnitIsHidden = true;
	//Template.CinescriptCameraType = "Templar_Invert";
	Template.ActivationSpeech = 'Invert';
	Template.bSkipFireAction = true;
	//Template.CustomFireAnim = 'HL_ExchangeStart';


	// Set ability costs, cooldowns, and restrictions
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.SKYFALL_COOLDOWN;
	Template.AbilityCooldown = Cooldown;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	Template.AbilityCosts.AddItem(ActionPointCost);

	FocusCost = new class'X2AbilityCost_WOTC_APA_TemplarFocus';
	FocusCost.FocusCost = default.SKYFALL_FOCUS_COST;
	FocusCost.FocusUnitValueName = default.PSI_CONDUIT_CURRENT_NAME;
	Template.AbilityCosts.AddItem(FocusCost);

	VisCondition = new class'X2Condition_Visibility';
	VisCondition.bRequireGameplayVisible = true;
	VisCondition.bVisibleToAnyAlly = true;
	Template.AbilityTargetConditions.AddItem(VisCondition);

	TargetCondition = new class'X2Condition_UnitProperty';
	TargetCondition.ExcludeAlive = false;
	TargetCondition.ExcludeDead = true;
	TargetCondition.ExcludeFriendlyToSource = true;
	TargetCondition.ExcludeHostileToSource = false;
	TargetCondition.TreatMindControlledSquadmateAsHostile = false;
	TargetCondition.FailOnNonUnits = true;
	TargetCondition.ExcludeCivilian = true;
	TargetCondition.ExcludeCosmetic = true;
	Template.AbilityMultiTargetConditions.AddItem(TargetCondition);


	//Template.AbilityTargetConditions.AddItem(new class'X2Condition_Wrath');
	Template.AbilityTargetConditions.AddItem(new class'X2Condition_UnblockedNeighborTile');
	Template.AbilityTargetConditions.AddItem(default.LivingHostileUnitOnlyProperty);

	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();


	// Setup AbilityMultiTarget
	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius_WOTC_APA_Focus';
	RadiusMultiTarget.fTileRadius = 0.75;
	RadiusMultiTarget.bIgnoreBlockingCover = true;
	RadiusMultiTarget.bAddPrimaryTargetAsMultiTarget = false;
	RadiusMultiTarget.bExcludeSelfAsTargetIfWithinRadius = true;
	RadiusMultiTarget.RequiredEffectName = default.EMPOWER_EFFECT_NAME;
	RadiusMultiTarget.FocusUnitValueName = default.PSI_CONDUIT_CURRENT_NAME;
	RadiusMultiTarget.RequiredFocusValue = default.SKYFALL_FOCUS_COST + default.EMPOWER_FOCUS_COST_INCREASE;
	RadiusMultiTarget.fFocusTileBonus = default.SKYFALL_TILE_RADIUS - 0.75;
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;

	Template.TargetingMethod = class'X2TargetingMethod_WOTC_APA_FocusRadius';


	// Setup conditions that check for empowered effect and focus cost
	EmpoweredEffectCondition = new class'X2Condition_UnitEffectsOnSource';
	EmpoweredEffectCondition.AddRequireEffect(default.EMPOWER_EFFECT_NAME, 'AA_MissingRequiredEffect');

	EmpoweredCostCondition = new class'X2Condition_WOTC_APA_SourceUnitValue';
	EmpoweredCostCondition.AddCheckValue(default.PSI_CONDUIT_CURRENT_NAME, default.SKYFALL_FOCUS_COST + default.EMPOWER_FOCUS_COST_INCREASE, eCheck_GreaterThanOrEqual);


	// Setup Disorient effect if this ability is getting Empowered
	DisorientEffect = class'X2StatusEffects'.static.CreateDisorientedStatusEffect(, , false);
	DisorientEffect.bRemoveWhenSourceDies = false;
	DisorientEffect.TargetConditions.AddItem(EmpoweredEffectCondition);
	DisorientEffect.TargetConditions.AddItem(EmpoweredCostCondition);
	Template.AddMultiTargetEffect(DisorientEffect);


	// Setup Freeze effect
	FreezeEffect = class'X2Effect_DLC_Day60Freeze'.static.CreateFreezeEffect(class'X2Item_DLC_Day60Grenades'.default.FROSTBOMB_MIN_RULER_FREEZE_DURATION, class'X2Item_DLC_Day60Grenades'.default.FROSTBOMB_MAX_RULER_FREEZE_DURATION);
	FreezeEffect.bApplyRulerModifiers = true;
	FreezeEffect.TargetConditions.AddItem(TargetCondition);
	Template.AddTargetEffect(FreezeEffect);
	Template.AddTargetEffect(class'X2Effect_DLC_Day60Freeze'.static.CreateFreezeRemoveEffects());
	

	// Trigger event to give Templar Momentum action if this ability is getting Empowered
	MomentumEffect = new class'X2Effect_TriggerEvent';
	MomentumEffect.TriggerEventName = 'RendActivated';
	MomentumEffect.TargetConditions.AddItem(EmpoweredEffectCondition);
	MomentumEffect.TargetConditions.AddItem(EmpoweredCostCondition);
	Template.AddShooterEffect(MomentumEffect);


	// Trigger event to remove Empowered effect if this ability is getting Empowered
	RemoveEmpowerEffect = new class'X2Effect_TriggerEvent';
	RemoveEmpowerEffect.TriggerEventName = default.EMPOWER_REMOVE_TRIGGER;
	RemoveEmpowerEffect.TargetConditions.AddItem(EmpoweredEffectCondition);
	RemoveEmpowerEffect.TargetConditions.AddItem(EmpoweredCostCondition);
	Template.AddShooterEffect(RemoveEmpowerEffect);
	

	Template.AdditionalAbilities.AddItem('WOTC_APA_SkyfallPassive');
	Template.AdditionalAbilities.AddItem('WOTC_APA_SkyfallAttack');

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;

	Template.ModifyNewContextFn = Skyfall_ModifyActivatedAbilityContext;
	Template.BuildNewGameStateFn = Skyfall_BuildGameState;
	Template.BuildVisualizationFn = Skyfall_BuildVisualization;

	return Template;
}

static simulated function Skyfall_ModifyActivatedAbilityContext(XComGameStateContext Context)
{
	local XComGameState_Unit UnitState;
	local XComGameStateContext_Ability AbilityContext;
	local XComGameStateHistory History;
	local XComWorldData World;
	local TTile NewTileLocation;

	History = `XCOMHISTORY;
	World = `XWORLD;

	AbilityContext = XComGameStateContext_Ability(Context);
	UnitState = XComGameState_Unit(History.GetGameStateForObjectID(AbilityContext.InputContext.SourceObject.ObjectID));
	UnitState.GetKeystoneVisibilityLocation(NewTileLocation);

	AbilityContext.InputContext.TargetLocations.Length = 0;
	AbilityContext.InputContext.TargetLocations.AddItem(World.GetPositionFromTileCoordinates(NewTileLocation));
}

static simulated function XComGameState Skyfall_BuildGameState(XComGameStateContext Context)
{

	local XComGameState NewGameState;
	local XComGameState_Unit UnitState;
	local XComGameState_Unit OldUnitState;
	local XComGameState_Unit TargetUnit;
	local XComGameStateContext_Ability AbilityContext;
	local vector NewLocation;
	local TTile NewTileLocation;
	local XComWorldData World;
	local X2EventManager EventManager;
	
	World = `XWORLD;
	EventManager = `XEVENTMGR;

	//Build the new game state frame
	NewGameState = TypicalAbility_BuildGameState(Context);

	AbilityContext = XComGameStateContext_Ability(NewGameState.GetContext());	
	UnitState = XComGameState_Unit(NewGameState.ModifyStateObject(class'XComGameState_Unit', AbilityContext.InputContext.SourceObject.ObjectID));
	TargetUnit = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(AbilityContext.InputContext.PrimaryTarget.ObjectID));
	OldUnitState = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(UnitState .ObjectID));

	NewTileLocation = class'Helpers'.static.GetClosestValidTile(TargetUnit.TileLocation);
	NewLocation = World.GetPositionFromTileCoordinates(NewTileLocation);
	
	World.GetTileCoordinatesFromPosition(NewLocation);
	UnitState.SetVisibilityLocation(NewTileLocation);

	AbilityContext.InputContext.MovementPaths.Add(1);
	AbilityContext.InputContext.MovementPaths[0].MovingUnitRef = AbilityContext.InputContext.SourceObject;
	AbilityContext.InputContext.MovementPaths[0].MovementTiles.AddItem(OldUnitState.TileLocation);	
	AbilityContext.InputContext.MovementPaths[0].MovementTiles.AddItem(NewTileLocation);
	AbilityContext.InputContext.MovementPaths[0].MovementData.Add(1);
	AbilityContext.InputContext.MovementPaths[0].MovementData[0].Position = NewLocation;
	AbilityContext.InputContext.MovementPaths[0].MovementData[0].Traversal = eTraversal_Teleport;	//	This will tell the visualization function to use HL_Teleport animations for MoveBegin / MoveEnd
	AbilityContext.InputContext.MovementPaths[0].MovementData[0].PathTileIndex = 0;
	

	AbilityContext.ResultContext.bPathCausesDestruction = true;
	MoveAbility_AddTileStateObjects(NewGameState, UnitState, AbilityContext.InputContext, 0, AbilityContext.InputContext.MovementPaths[0].MovementTiles.Length - 1);

	EventManager.TriggerEvent('ObjectMoved', UnitState, UnitState, NewGameState);
	EventManager.TriggerEvent('UnitMoveFinished', UnitState, UnitState, NewGameState);
	EventManager.TriggerEvent('WOTC_APA_SkyfallAttack_Triggered', TargetUnit, UnitState, NewGameState);

	//Return the game state we have created
	return NewGameState;
}

simulated function Skyfall_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateVisualizationMgr		VisMgr;
	local XComGameStateHistory				History;
	local XComGameStateContext_Ability		AbilityContext;
	local X2AbilityTemplate					AbilityTemplate;
	local StateObjectReference				InteractingUnitRef;
	local VisualizationActionMetadata		SourceTrack, EmptyTrack, ActionMetadata;
	local X2VisualizerInterface				TargetVisualizerInterface;
	local Actor								TargetVisualizer;
	local X2Action_CameraLookAt				LookAtAction;
	local X2Action_MoveVisibleTeleport		CasterTeleport;
	local X2Action_PlayEffect				OutEffectAction, InEffectAction, FreezeEffectAction;
	local X2Action_Delay					DelayAction;
	local X2Action_MoveBegin				CasterMoveBegin;
	local X2Action_MoveEnd					CasterMoveEnd;
	local X2Action_DLC_Day60Freeze			FreezeAction;
	local int								EffectIndex, i, j;

	VisMgr = `XCOMVISUALIZATIONMGR;
	History = `XCOMHISTORY;

	AbilityContext = XComGameStateContext_Ability(VisualizeGameState.GetContext());
	AbilityTemplate = class'XComGameState_Ability'.static.GetMyTemplateManager().FindAbilityTemplate(AbilityContext.InputContext.AbilityTemplateName);
	InteractingUnitRef = AbilityContext.InputContext.SourceObject;

	// ****************************************************************************************
	// Configure the visualization track for the source
	// ****************************************************************************************
	SourceTrack = EmptyTrack;
	SourceTrack.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	SourceTrack.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
	SourceTrack.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);

	//	Create X2Actions associated with moving the unit.
	class'X2VisualizerHelpers'.static.ParsePath(AbilityContext, SourceTrack);

	LookAtAction = X2Action_CameraLookAt(class'X2Action_CameraLookAt'.static.AddToVisualizationTree(SourceTrack, AbilityContext));
	LookAtAction.LookAtActor = SourceTrack.VisualizeActor;

	//CasterMoveBegin = X2Action_MoveBegin(VisMgr.GetNodeOfType(VisMgr.BuildVisTree, class'X2Action_MoveBegin', SourceTrack.VisualizeActor));

	CasterTeleport = X2Action_MoveVisibleTeleport(VisMgr.GetNodeOfType(VisMgr.BuildVisTree, class'X2Action_MoveVisibleTeleport', SourceTrack.VisualizeActor));
	CasterTeleport.ParamsStart.AnimName = 'HL_ExchangeStart';
	CasterTeleport.ParamsStop.AnimName = 'HL_ExchangeEnd';
	CasterTeleport.bLookAtEndPos = true;

	OutEffectAction = X2Action_PlayEffect(class'X2Action_PlayEffect'.static.AddToVisualizationTree(SourceTrack, AbilityContext, false, CasterTeleport));
	OutEffectAction.EffectName = "FX_Chosen_Teleport.P_Chosen_Teleport_Out_w_Sound";
	OutEffectAction.EffectLocation = AbilityContext.InputContext.MovementPaths[0].MovementData[0].Position;

	InEffectAction = X2Action_PlayEffect(class'X2Action_PlayEffect'.static.AddToVisualizationTree(SourceTrack, AbilityContext, false, CasterTeleport));
	InEffectAction.EffectName = "FX_Chosen_Teleport.P_Chosen_Teleport_In_w_Sound";
	InEffectAction.EffectLocation = AbilityContext.InputContext.MovementPaths[0].MovementData[1].Position;

	DelayAction = X2Action_Delay(class'X2Action_Delay'.static.AddToVisualizationTree(SourceTrack, AbilityContext, true, CasterTeleport));
	DelayAction.Duration = 0.0;

	FreezeEffectAction = X2Action_PlayEffect(class'X2Action_PlayEffect'.static.AddToVisualizationTree(SourceTrack, AbilityContext, false, DelayAction));
	FreezeEffectAction.EffectName = "DLC_60_FX_Frost_Bomb.P_Frost_Bomb_Explosion";
	FreezeEffectAction.EffectLocation = AbilityContext.InputContext.MovementPaths[0].MovementData[1].Position;
	
	//CasterMoveEnd = X2Action_MoveEnd(VisMgr.GetNodeOfType(VisMgr.BuildVisTree, class'X2Action_MoveEnd', SourceTrack.VisualizeActor));
	//VisMgr.ConnectAction(CasterMoveEnd, VisMgr.BuildVisTree, false, InEffectAction);

	//FreezeAction = X2Action_DLC_Day60Freeze(VisMgr.GetNodeOfType(VisMgr.BuildVisTree, class'X2Action_DLC_Day60Freeze', SourceTrack.VisualizeActor));
	//VisMgr.ConnectAction(FreezeAction, VisMgr.BuildVisTree, false, CasterMoveEnd);

	//****************************************************************************************
	//Configure the visualization track for the targets
	//****************************************************************************************
	for (i = 0; i < AbilityContext.InputContext.MultiTargets.Length; ++i)
	{
		InteractingUnitRef = AbilityContext.InputContext.MultiTargets[i];
		ActionMetadata = EmptyTrack;
		ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
		ActionMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
		ActionMetadata.VisualizeActor = History.GetVisualizer(InteractingUnitRef.ObjectID);

		class'X2Action_WaitForAbilityEffect'.static.AddToVisualizationTree( ActionMetadata, AbilityContext );

		for( j = 0; j < AbilityContext.ResultContext.MultiTargetEffectResults[i].Effects.Length; ++j )
		{
			AbilityContext.ResultContext.MultiTargetEffectResults[i].Effects[j].AddX2ActionsForVisualization(VisualizeGameState, ActionMetadata, AbilityContext.ResultContext.MultiTargetEffectResults[i].ApplyResults[j]);
		}

		TargetVisualizerInterface = X2VisualizerInterface(ActionMetadata.VisualizeActor);
		if( TargetVisualizerInterface != none )
		{
			//Allow the visualizer to do any custom processing based on the new game state. For example, units will create a death action when they reach 0 HP.
			TargetVisualizerInterface.BuildAbilityEffectsVisualization(VisualizeGameState, ActionMetadata);
		}
	}
	//****************************************************************************************

	//Configure the visualization track for the primary target
	//****************************************************************************************
	InteractingUnitRef = AbilityContext.InputContext.PrimaryTarget;
	ActionMetadata = EmptyTrack;
	ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(InteractingUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	ActionMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(InteractingUnitRef.ObjectID);
	ActionMetadata.VisualizeActor = TargetVisualizer;

	for (EffectIndex = 0; EffectIndex < AbilityTemplate.AbilityTargetEffects.Length; ++EffectIndex)
	{
		AbilityTemplate.AbilityTargetEffects[ EffectIndex ].AddX2ActionsForVisualization( VisualizeGameState, ActionMetadata, AbilityContext.FindTargetEffectApplyResult( AbilityTemplate.AbilityTargetEffects[ EffectIndex ] ) );
	}

	TargetVisualizerInterface = X2VisualizerInterface(ActionMetadata.VisualizeActor);
	if (TargetVisualizerInterface != none)
	{
		//Allow the visualizer to do any custom processing based on the new game state. For example, units will create a death action when they reach 0 HP.
		TargetVisualizerInterface.BuildAbilityEffectsVisualization(VisualizeGameState, ActionMetadata);
	}

	if (LookAtAction != none)
	{
		LookAtAction = X2Action_CameraLookAt(class'X2Action_CameraLookAt'.static.AddToVisualizationTree(ActionMetadata, AbilityContext, false, ActionMetadata.LastActionAdded));
		LookAtAction.CameraTag = 'TargetFocusCamera';
		LookAtAction.bRemoveTaggedCamera = true;
	}
}

// Skyfall Damage Modifier - Passive:
static function X2AbilityTemplate WOTC_APA_SkyfallPassive()
{

	local X2AbilityTemplate										Template;
	local X2Effect_WOTC_APA_BonusDamage							DamageEffect;

	Template = CreatePassiveAbility('WOTC_APA_SkyfallPassive', "img:///UILibrary_WOTC_APA_Templar.perk_Smite",,false);


	// Create a persistent effect that increases damage
	DamageEffect = new class'X2Effect_WOTC_APA_BonusDamage';
	DamageEffect.fBonusDmgMultiplier = default.SKYFALL_DAMAGE_MULTIPLIER;
	DamageEffect.ValidAbilities.AddItem('WOTC_APA_SkyfallAttack');
	DamageEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocLongDescription, Template.IconImage, false,, Template.AbilitySourceName);
	DamageEffect.BuildPersistentEffect(1, true, false, false);
	Template.AddTargetEffect(DamageEffect);


	return Template;
}

// Skyfall Attack - Triggered:
static function X2AbilityTemplate WOTC_APA_SkyfallAttack()
{
	local X2AbilityTemplate										Template;
	local X2AbilityTrigger_EventListener						EventListener;
	local X2Effect_ApplyWeaponDamage							WeaponDamageEffect;
	local X2Effect_TriggerEvent									FocusAbilityTriggered;


	`CREATE_X2ABILITY_TEMPLATE(Template, 'WOTC_APA_SkyfallAttack');
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Offensive;
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SimpleSingleTarget;
	Template.bDisplayInUITooltip = false;
	Template.bCrossClassEligible = false;
	Template.CinescriptCameraType = "Templar_Rend";
	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.bShowActivation = true;
	Template.bSkipFireAction = false;
	Template.bSkipExitCoverWhenFiring = true;
	Template.bSkipMoveStop = true;


	// This ability triggers after Skyfall teleport has completed
	EventListener = new class'X2AbilityTrigger_EventListener';
	EventListener.ListenerData.Deferral = ELD_OnStateSubmitted;
	EventListener.ListenerData.EventID = 'WOTC_APA_SkyfallAttack_Triggered';
	EventListener.ListenerData.Filter = eFilter_Unit;
	EventListener.ListenerData.EventFn = class'XComGameState_Ability'.static.VoidRiftInsanityListener;
	Template.AbilityTriggers.AddItem(EventListener);

	
	// Create Damage effect
	WeaponDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	WeaponDamageEffect.DamageTypes.AddItem('Melee');
	WeaponDamageEffect.EnvironmentalDamageAmount = default.SKYFALL_ENVIRONMENTAL_DAMAGE;
	Template.AddTargetEffect(WeaponDamageEffect);
	Template.bAllowBonusWeaponEffects = true;


	// Trigger event to tie into cast focus abilities
	FocusAbilityTriggered = new class'X2Effect_TriggerEvent';
	FocusAbilityTriggered.TriggerEventName = default.FOCUS_ABILITY_CAST_TRIGGER;
	Template.AddTargetEffect(FocusAbilityTriggered);


	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	//Template.BuildNewGameStateFn = TypicalMoveEndAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.MergeVisualizationFn = DesiredVisualizationBlock_MergeVisualization;
	return Template;
}



//
static function X2AbilityTemplate WOTC_APA_SunderingStorm()
{
	local X2AbilityTemplate										Template;
	local X2AbilityCooldown										Cooldown;
	local X2AbilityCost_ActionPoints							ActionPointCost;
	local X2AbilityCost_WOTC_APA_TemplarFocus					FocusCost;
	local X2AbilityMultiTarget_Radius							RadiusMultiTarget;
	local X2Condition_UnitEffectsOnSource						EmpoweredEffectCondition;
	local X2Condition_WOTC_APA_SourceUnitValue					EmpoweredCostCondition;
	local X2Condition_UnitProperty								TargetCondition;
	local X2Condition_WOTC_APA_ReanimateTarget					TargetSortCondition;
	local X2Effect_ApplyWeaponDamage							DamageEffect, EmpoweredDamageEffect;
	local X2Effect_TriggerEvent									FocusAbilityTriggered, RemoveEmpowerEffect;


	Template = CreateSingleTargetAbility('WOTC_APA_SunderingStorm', "img:///UILibrary_WOTC_APA_Templar.perk_PurifyingSeal");
	Template.ShotHUDPriority = class'UIUtilities_Tactical'.const.CLASS_MAJOR_PRIORITY;
	Template.DefaultSourceItemSlot = eInvSlot_PrimaryWeapon;
	Template.AbilitySourceName = 'eAbilitySource_Psionic';
	Template.Hostility = eHostility_Offensive;
	Template.bFrameEvenWhenUnitIsHidden = true;
	Template.bSkipExitCoverWhenFiring = false;
	Template.bFriendlyFireWarning = false;
	Template.CinescriptCameraType = "Templar_IonicStorm";
	Template.CustomFireKillAnim = 'HL_IonicStorm';
	Template.CustomFireAnim = 'HL_IonicStorm';
	Template.ActivationSpeech = 'IonicStorm';

	
	// Set ability costs, cooldowns, and restrictions
	Cooldown = new class'X2AbilityCooldown';
	Cooldown.iNumTurns = default.SUNDERING_STORM_COOLDOWN;
	Template.AbilityCooldown = Cooldown;

	ActionPointCost = new class'X2AbilityCost_ActionPoints';
	ActionPointCost.iNumPoints = 1;
	ActionPointCost.bConsumeAllPoints = true;
	Template.AbilityCosts.AddItem(ActionPointCost);	

	FocusCost = new class'X2AbilityCost_WOTC_APA_TemplarFocus';
	FocusCost.FocusCost = default.SUNDERING_STORM_FOCUS_COST;
	FocusCost.FocusUnitValueName = default.PSI_CONDUIT_CURRENT_NAME;
	Template.AbilityCosts.AddItem(FocusCost);

	Template.AbilityTargetConditions.AddItem(default.LivingHostileUnitOnlyProperty);
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AddShooterEffectExclusions();

	Template.AbilityTargetStyle = new class'X2AbilityTarget_Cursor';
	Template.TargetingMethod = class'X2TargetingMethod_PathTarget';

	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
	RadiusMultiTarget.fTargetRadius = `TILESTOMETERS(default.SUNDERING_STORM_TILE_RADIUS);
	RadiusMultiTarget.bExcludeSelfAsTargetIfWithinRadius = true;
	RadiusMultiTarget.bIgnoreBlockingCover = true;
	Template.AbilityMultiTargetStyle = RadiusMultiTarget;

	TargetCondition = new class'X2Condition_UnitProperty';
	TargetCondition.ExcludeAlive = false;
	TargetCondition.ExcludeDead = true;
	TargetCondition.ExcludeFriendlyToSource = true;
	TargetCondition.ExcludeHostileToSource = false;
	TargetCondition.TreatMindControlledSquadmateAsHostile = false;
	TargetCondition.FailOnNonUnits = true;
	TargetCondition.ExcludeCivilian = true;
	TargetCondition.ExcludeCosmetic = true;
	Template.AbilityMultiTargetConditions.AddItem(TargetCondition);


	// Setup conditions that check for empowered effect and focus cost
	EmpoweredEffectCondition = new class'X2Condition_UnitEffectsOnSource';
	EmpoweredEffectCondition.AddRequireEffect(default.EMPOWER_EFFECT_NAME, 'AA_MissingRequiredEffect');

	EmpoweredCostCondition = new class'X2Condition_WOTC_APA_SourceUnitValue';
	EmpoweredCostCondition.AddCheckValue(default.PSI_CONDUIT_CURRENT_NAME, default.SUNDERING_STORM_FOCUS_COST + default.EMPOWER_FOCUS_COST_INCREASE, eCheck_GreaterThanOrEqual);


	// Setup damage/shred effects: Not Empowered
	TargetSortCondition = new class'X2Condition_WOTC_APA_ReanimateTarget';
	TargetSortCondition.bEmpowered = false;
	TargetSortCondition.EmpoweredCost = default.SUNDERING_STORM_FOCUS_COST + default.EMPOWER_FOCUS_COST_INCREASE;
	TargetSortCondition.EmpoweredEffectName = default.EMPOWER_EFFECT_NAME;
	TargetSortCondition.FocusUnitValueName = default.PSI_CONDUIT_CURRENT_NAME;
	DamageEffect = new class'X2Effect_ApplyWeaponDamage';
	DamageEffect.bIgnoreBaseDamage = true;
	DamageEffect.DamageTag = 'WOTC_APA_SunderingStorm';
	DamageEffect.bBypassShields = true;
	DamageEffect.TargetConditions.AddItem(TargetCondition);
	DamageEffect.TargetConditions.AddItem(TargetSortCondition);
	Template.AddMultiTargetEffect(DamageEffect);

	// Setup damage/shred effects: Is Empowered
	TargetSortCondition = new class'X2Condition_WOTC_APA_ReanimateTarget';
	TargetSortCondition.bEmpowered = true;
	TargetSortCondition.EmpoweredCost = default.SUNDERING_STORM_FOCUS_COST + default.EMPOWER_FOCUS_COST_INCREASE;
	TargetSortCondition.EmpoweredEffectName = default.EMPOWER_EFFECT_NAME;
	TargetSortCondition.FocusUnitValueName = default.PSI_CONDUIT_CURRENT_NAME;
	EmpoweredDamageEffect = new class'X2Effect_ApplyWeaponDamage';
	EmpoweredDamageEffect.bIgnoreBaseDamage = true;
	EmpoweredDamageEffect.DamageTag = 'WOTC_APA_EmpoweredSunderingStorm';
	EmpoweredDamageEffect.bBypassShields = true;
	EmpoweredDamageEffect.EnvironmentalDamageAmount = default.SUNDERING_STORM_ENVIRONMENTAL_DAMAGE;
	EmpoweredDamageEffect.TargetConditions.AddItem(TargetCondition);
	EmpoweredDamageEffect.TargetConditions.AddItem(TargetSortCondition);
	Template.AddMultiTargetEffect(EmpoweredDamageEffect);
		
	
	// Trigger event to tie into cast focus abilities
	FocusAbilityTriggered = new class'X2Effect_TriggerEvent';
	FocusAbilityTriggered.TriggerEventName = default.FOCUS_ABILITY_CAST_TRIGGER;
	Template.AddMultiTargetEffect(FocusAbilityTriggered);


	// Trigger smoke cloud ability if Empowered
	Template.AdditionalAbilities.AddItem('WOTC_APA_WOTC_APA_SunderingStormSmoke');

	FocusAbilityTriggered = new class'X2Effect_TriggerEvent';
	FocusAbilityTriggered.TriggerEventName = default.SUNDERING_STORM_SMOKE_TRIGGER;
	FocusAbilityTriggered.TargetConditions.AddItem(EmpoweredEffectCondition);
	FocusAbilityTriggered.TargetConditions.AddItem(EmpoweredCostCondition);
	Template.AddShooterEffect(FocusAbilityTriggered);

	
	// Trigger event to remove Empowered effect if this ability is getting Empowered
	RemoveEmpowerEffect = new class'X2Effect_TriggerEvent';
	RemoveEmpowerEffect.TriggerEventName = default.EMPOWER_REMOVE_TRIGGER;
	RemoveEmpowerEffect.TargetConditions.AddItem(EmpoweredEffectCondition);
	RemoveEmpowerEffect.TargetConditions.AddItem(EmpoweredCostCondition);
	Template.AddShooterEffect(RemoveEmpowerEffect);

	
	Template.BuildNewGameStateFn = TypicalMoveEndAbility_BuildGameState;
	Template.BuildInterruptGameStateFn = TypicalMoveEndAbility_BuildInterruptGameState;
	Template.BuildVisualizationFn = SunderingStorm_BuildVisualization;

	Template.ChosenActivationIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotChosenActivationIncreasePerUse;
	Template.LostSpawnIncreasePerUse = class'X2AbilityTemplateManager'.default.StandardShotLostSpawnIncreasePerUse;

	return Template;
}

simulated function SunderingStorm_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateHistory History;
	local XComGameStateVisualizationMgr VisMgr;
	local XComGameStateContext_Ability AbilityContext;
	local VisualizationActionMetadata SourceMetadata;
	local VisualizationActionMetadata ActionMetadata;
	local VisualizationActionMetadata BlankMetadata;
	local XGUnit SourceVisualizer;
	local X2Action_Fire FireAction;
	local X2Action_ExitCover ExitCoverAction;
	local StateObjectReference CurrentTarget;
	local int ScanTargets;
	local X2Action ParentAction;
	local X2Action_Delay CurrentDelayAction;
	local X2Action_ApplyWeaponDamageToUnit UnitDamageAction;
	local X2Effect CurrentEffect;
	local int ScanEffect;
	local Array<X2Action> LeafNodes;
	local X2Action_MarkerNamed JoinActions;
	local XComGameState_Effect_TemplarFocus FocusState;
	local int NumActualTargets;

	History = `XCOMHISTORY;
	VisMgr = `XCOMVISUALIZATIONMGR;

	AbilityContext = XComGameStateContext_Ability(VisualizeGameState.GetContext());

	SourceVisualizer = XGUnit(History.GetVisualizer(AbilityContext.InputContext.SourceObject.ObjectID));

	SourceMetadata.StateObject_OldState = History.GetGameStateForObjectID(SourceVisualizer.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	SourceMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(SourceVisualizer.ObjectID);
	SourceMetadata.StateObjectRef = AbilityContext.InputContext.SourceObject;
	SourceMetadata.VisualizeActor = SourceVisualizer;

	if( AbilityContext.InputContext.MovementPaths.Length > 0 )
	{
		class'X2VisualizerHelpers'.static.ParsePath(AbilityContext, SourceMetadata);
	}

	ExitCoverAction = X2Action_ExitCover(class'X2Action_ExitCover'.static.AddToVisualizationTree(SourceMetadata, AbilityContext, false, SourceMetadata.LastActionAdded));
	FireAction = X2Action_Fire(class'X2Action_Fire'.static.AddToVisualizationTree(SourceMetadata, AbilityContext, false, ExitCoverAction));
	class'X2Action_EnterCover'.static.AddToVisualizationTree(SourceMetadata, AbilityContext, false, FireAction);

	NumActualTargets = AbilityContext.InputContext.MultiTargets.Length;

	ParentAction = FireAction;
	for (ScanTargets = 0; ScanTargets < AbilityContext.InputContext.MultiTargets.Length; ++ScanTargets)
	{
		CurrentTarget = AbilityContext.InputContext.MultiTargets[ScanTargets];
		ActionMetadata = BlankMetadata;

		ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(CurrentTarget.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
		ActionMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(CurrentTarget.ObjectID);
		ActionMetadata.StateObjectRef = CurrentTarget;
		ActionMetadata.VisualizeActor = History.GetVisualizer(CurrentTarget.ObjectID);

		if (ScanTargets == 0)
		{
			ParentAction = class'X2Action_WaitForAbilityEffect'.static.AddToVisualizationTree(ActionMetadata, AbilityContext, false, ParentAction);
		}
		else
		{
			CurrentDelayAction = X2Action_Delay(class'X2Action_Delay'.static.AddToVisualizationTree(ActionMetadata, AbilityContext, false, ParentAction));
			CurrentDelayAction.Duration = (`SYNC_FRAND() * (0.32 - 0.18)) + 0.18;
			ParentAction = CurrentDelayAction;
		}

		UnitDamageAction = X2Action_ApplyWeaponDamageToUnit(class'X2Action_ApplyWeaponDamageToUnit'.static.AddToVisualizationTree(ActionMetadata, AbilityContext, false, ParentAction));
		for (ScanEffect = 0; ScanEffect < AbilityContext.ResultContext.MultiTargetEffectResults[ScanTargets].Effects.Length; ++ScanEffect)
		{
			if (AbilityContext.ResultContext.MultiTargetEffectResults[ScanTargets].ApplyResults[ScanEffect] == 'AA_Success')
			{
				CurrentEffect = AbilityContext.ResultContext.MultiTargetEffectResults[ScanTargets].Effects[ScanEffect];
				break;
			}
		}
		UnitDamageAction.OriginatingEffect = CurrentEffect;
		UnitDamageAction.bShowFlyovers = true;
		UnitDamageAction.bCombineFlyovers = true;
		XGUnit(ActionMetadata.VisualizeActor).BuildAbilityEffectsVisualization(VisualizeGameState, ActionMetadata);
	}

	VisMgr.GetAllLeafNodes(VisMgr.BuildVisTree, LeafNodes);
	JoinActions = X2Action_MarkerNamed(class'X2Action_MarkerNamed'.static.AddToVisualizationTree(SourceMetadata, AbilityContext, false, , LeafNodes));
	JoinActions.SetName("Join");
}

// 
static function X2AbilityTemplate WOTC_APA_SunderingStormSmoke()
{

	local X2AbilityTemplate										Template;
	local X2AbilityTrigger_EventListener						EventListener;
	local X2AbilityMultiTarget_Radius							RadiusMultiTarget;
	local X2Effect_ApplySmokeGrenadeToWorld						SmokeEffect;


	`CREATE_X2ABILITY_TEMPLATE(Template, 'WOTC_APA_WOTC_APA_SunderingStormSmoke');
	Template.IconImage = "img:///UILibrary_WOTC_APA_Templar.perk_PurifyingSeal";
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.bDontDisplayInAbilitySummary = true;
	Template.bDisplayInUITooltip = false;
	Template.bCrossClassEligible = false;
	Template.bSkipFireAction = true;
	Template.bUniqueSource = true;


	EventListener = new class'X2AbilityTrigger_EventListener';
	EventListener.ListenerData.Deferral = ELD_OnStateSubmitted;
	EventListener.ListenerData.EventID = default.SUNDERING_STORM_SMOKE_TRIGGER;
	EventListener.ListenerData.Filter = eFilter_Unit;
	EventListener.ListenerData.EventFn = class'XComGameState_Ability'.static.AbilityTriggerEventListener_Self;
	Template.AbilityTriggers.AddItem(EventListener);


	RadiusMultiTarget = new class'X2AbilityMultiTarget_Radius';
    RadiusMultiTarget.bUseWeaponRadius = false;
    RadiusMultiTarget.bUseSourceWeaponLocation = false;
    RadiusMultiTarget.fTargetRadius = `TILESTOMETERS(default.SUNDERING_STORM_SMOKE_TILE_RADIUS);
    Template.AbilityMultiTargetStyle = RadiusMultiTarget;

    SmokeEffect = new class'X2Effect_ApplySmokeGrenadeToWorld';
    Template.AddTargetEffect(SmokeEffect);

    Template.AddMultiTargetEffect(class'X2Item_DefaultGrenades'.static.SmokeGrenadeEffect());
	Template.AddShooterEffect(class'X2Item_DefaultGrenades'.static.SmokeGrenadeEffect());
	
	
	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	return Template;
}



// Alchemical Catalysts - Passive:
static function X2AbilityTemplate WOTC_APA_AlchemicalCatalysts()
{
	local X2AbilityTemplate			Template;

	Template = CreatePassiveAbility('WOTC_APA_AlchemicalCatalysts', "img:///UILibrary_PerkIcons.UIPerk_psibomb");
	
	return Template;
}



// ---------------------------------------------------------------------------------
// --------------------  ABILITY  FRAMEWORK  HELPER  FUNCTIONS  --------------------
// ---------------------------------------------------------------------------------


// Helper function to setup basic framework for passive abilities
static function X2AbilityTemplate CreatePassiveAbility(name AbilityName, optional string IconString, optional name IconEffectName = AbilityName, optional bool bDisplayIcon = true)
{
	
	local X2AbilityTemplate					Template;
	local X2Effect_Persistent				IconEffect;
	

	`CREATE_X2ABILITY_TEMPLATE (Template, AbilityName);
	Template.IconImage = IconString;
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = EAbilityIconBehavior_NeverShow;
	Template.Hostility = eHostility_Neutral;
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.UnitPostBeginPlayTrigger);
	Template.bCrossClassEligible = false;
	Template.bUniqueSource = true;
	Template.bIsPassive = true;

	// Dummy effect to show a passive icon in the tactical UI for the SourceUnit
	IconEffect = new class'X2Effect_Persistent';
	IconEffect.BuildPersistentEffect(1, true, false);
	IconEffect.SetDisplayInfo(ePerkBuff_Passive, Template.LocFriendlyName, Template.LocHelpText, Template.IconImage, bDisplayIcon,, Template.AbilitySourceName);
	IconEffect.EffectName = IconEffectName;
	Template.AddTargetEffect(IconEffect);

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	return Template;
}


// Helper function to setup basic framework for self-targeted activatible abilities
static function X2AbilityTemplate CreateSelfActiveAbility(name AbilityName, optional string IconString, optional bool bLimitWhenImpaired = true, optional array<name> SkipExclusions)
{
	
	local X2AbilityTemplate					Template;
	

	`CREATE_X2ABILITY_TEMPLATE (Template, AbilityName);
	Template.IconImage = IconString;
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.Hostility = eHostility_Neutral;
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SelfTarget;
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";
	Template.DisplayTargetHitChance = false;
	Template.bLimitTargetIcons = true;
	Template.bShowActivation = true;
	Template.bCrossClassEligible = false;
	Template.bUniqueSource = true;

	// Unit cannot be disoriented, confused, dazed, stunned, burning, bound, or carrying a unit
	if (bLimitWhenImpaired)
	{
		Template.AddShooterEffectExclusions(SkipExclusions);
	}

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	return Template;
}


// Helper function to setup basic framework for simple single-targeted activatible abilities
static function X2AbilityTemplate CreateSingleTargetAbility(name AbilityName, optional string IconString, optional bool bLimitWhenImpaired = true, optional array<name> SkipExclusions)
{
	
	local X2AbilityTemplate					Template;
	

	`CREATE_X2ABILITY_TEMPLATE (Template, AbilityName);
	Template.IconImage = IconString;
	Template.AbilitySourceName = 'eAbilitySource_Perk';
	Template.eAbilityIconBehaviorHUD = eAbilityIconBehavior_AlwaysShow;
	Template.Hostility = eHostility_Neutral;
	Template.AbilityToHitCalc = default.DeadEye;
	Template.AbilityTargetStyle = default.SimpleSingleTarget;
	Template.AbilityTriggers.AddItem(default.PlayerInputTrigger);
	Template.AbilityShooterConditions.AddItem(default.LivingShooterProperty);
	Template.AbilityConfirmSound = "TacticalUI_ActivateAbility";
	Template.DisplayTargetHitChance = false;
	Template.bLimitTargetIcons = true;
	Template.bShowActivation = true;
	Template.bCrossClassEligible = false;
	Template.bUniqueSource = true;


	// Unit cannot be disoriented, confused, dazed, stunned, burning, bound, or carrying a unit
	if (bLimitWhenImpaired)
	{
		Template.AddShooterEffectExclusions(SkipExclusions);
	}

	Template.BuildNewGameStateFn = TypicalAbility_BuildGameState;
	Template.BuildVisualizationFn = TypicalAbility_BuildVisualization;
	Template.BuildInterruptGameStateFn = TypicalAbility_BuildInterruptGameState;
	return Template;
}



// ------------------------------------------------------------------------------
// --------------------  ABILITY  EFFECT  HELPER  FUNCTIONS  --------------------
// ------------------------------------------------------------------------------



// -------------------------------------------------------------------------------------
// --------------------  ABILITY  VISUALIZATION  HELPER  FUNCTIONS  --------------------
// -------------------------------------------------------------------------------------


// Plays flyover message on the SourceUnit with ability's LocFlyOverText when the ability is activated
simulated function BasicSourceFlyover_BuildVisualization(XComGameState VisualizeGameState)
{
	local XComGameStateHistory					History;
	local XComGameStateContext_Ability			AbilityContext;
	local XComGameState_Ability					AbilityState;
	local X2AbilityTemplate						AbilityTemplate;
	local StateObjectReference					SourceUnitRef;
	local VisualizationActionMetadata			ActionMetadata;
	local X2Action_PlaySoundAndFlyOver			SoundAndFlyOver;
	
	History = `XCOMHISTORY;

	AbilityContext = XComGameStateContext_Ability(VisualizeGameState.GetContext());
	SourceUnitRef = AbilityContext.InputContext.SourceObject;
	AbilityState = XComGameState_Ability(History.GetGameStateForObjectID(AbilityContext.InputContext.AbilityRef.ObjectID));
	AbilityTemplate = AbilityState.GetMyTemplate();
	
	ActionMetadata.StateObject_OldState = History.GetGameStateForObjectID(SourceUnitRef.ObjectID, eReturnType_Reference, VisualizeGameState.HistoryIndex - 1);
	ActionMetadata.StateObject_NewState = VisualizeGameState.GetGameStateForObjectID(SourceUnitRef.ObjectID);
	if (ActionMetadata.StateObject_NewState == none)
		ActionMetadata.StateObject_NewState = ActionMetadata.StateObject_OldState;
	ActionMetadata.VisualizeActor = History.GetVisualizer(SourceUnitRef.ObjectID);
	
	SoundAndFlyOver = X2Action_PlaySoundAndFlyOver(class'X2Action_PlaySoundAndFlyover'.static.AddToVisualizationTree(ActionMetadata, AbilityContext));
	SoundAndFlyOver.SetSoundAndFlyOverParameters(None, AbilityTemplate.LocFlyOverText, '', eColor_Good, AbilityTemplate.IconImage, `DEFAULTFLYOVERLOOKATTIME * 2);
}





DefaultProperties
{
	PSI_CONDUIT_CURRENT_NAME = "WOTC_APA_Templar_CurrentFocusLevel"
	PSI_CONDUIT_MAX_NAME = "WOTC_APA_Templar_MaxFocusLevel"

	EMPOWER_EFFECT_NAME = "WOTC_APA_EmpowerEffect"
	EMPOWER_REMOVE_TRIGGER = "WOTC_APA_EmpowerEffectRemoveTriggered"
	FOCUS_GAIN_ON_KILL_TRIGGER = "WOTC_APA_Templar_FocusGainFromKillTriggered"
	FOCUS_ABILITY_CAST_TRIGGER = "WOTC_APA_Templar_FocusAbilityTriggered"

	SOULBIND_HEAL_ON_KILL_TRIGGER = "WOTC_APA_Templar_SoulbindHealTriggered"
	SOULBIND_FOCUS_GAIN_TRIGGER = "WOTC_APA_Templar_SoulbindFocusGainTriggered"
	PARRY_UNIT_VALUE_NAME = "WOTC_APA_Templar_ParryActivations"
	FUSE_UNIT_VALUE_NAME = "WOTC_APA_Templar_FuseBonusRadius"
	SUNDERING_STORM_SMOKE_TRIGGER = "WOTC_APA_Templar_SunderingStormSmokeTriggered"
}