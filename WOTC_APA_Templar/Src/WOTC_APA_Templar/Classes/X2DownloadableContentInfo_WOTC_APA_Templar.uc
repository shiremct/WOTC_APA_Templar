
class X2DownloadableContentInfo_WOTC_APA_Templar extends X2DownloadableContentInfo;


static event OnPostTemplatesCreated()
{
	PatchFuseAbilities();
	PatchMomentumAbility();
	PatchSolacePassiveAbility();
	PatchFortressPassiveAbility();
	PatchGrenadeThrowAbility();
	HideTemplarAcademyUnlock();
	ChainAbilityTag();
}



// Patch Fuse abilities with new AbilityMultiTarget
static function PatchFuseAbilities()
{
	local X2AbilityTemplateManager				AbilityTemplateMgr;
	local array<X2AbilityTemplate>				AbilityTemplateArray;
	local X2AbilityTemplate						AbilityTemplate;
	local X2AbilityMultiTarget_Radius_Fuse		AbilityMultiTarget;

	AbilityTemplateMgr = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

	// Grenade Fuse
	AbilityTemplateMgr.FindAbilityTemplateAllDifficulties('GrenadeFuse', AbilityTemplateArray);
	foreach AbilityTemplateArray(AbilityTemplate)
	{
		AbilityMultiTarget = new class'X2AbilityMultiTarget_Radius_Fuse';
		AbilityMultiTarget.bAddPrimaryTargetAsMultiTarget = true;
		AbilityMultiTarget.bGetWeaponRadius = true;
		AbilityTemplate.AbilityMultiTargetStyle = AbilityMultiTarget;
	}

	// Rocket Fuse
	AbilityTemplateMgr.FindAbilityTemplateAllDifficulties('RocketFuse', AbilityTemplateArray);
	foreach AbilityTemplateArray(AbilityTemplate)
	{
		AbilityMultiTarget = new class'X2AbilityMultiTarget_Radius_Fuse';
		AbilityMultiTarget.bAddPrimaryTargetAsMultiTarget = true;
		AbilityMultiTarget.bGetWeaponRadius = true;
		AbilityTemplate.AbilityMultiTargetStyle = AbilityMultiTarget;
	}

	// Micro-Missle Fuse
	AbilityTemplateMgr.FindAbilityTemplateAllDifficulties('MicroMissileFuse', AbilityTemplateArray);
	foreach AbilityTemplateArray(AbilityTemplate)
	{
		AbilityMultiTarget = new class'X2AbilityMultiTarget_Radius_Fuse';
		AbilityMultiTarget.bAddPrimaryTargetAsMultiTarget = true;
		AbilityMultiTarget.fMeterRadius = class'X2Ability_AdventMEC'.default.MICROMISSILE_DAMAGE_RADIUS;
		AbilityTemplate.AbilityMultiTargetStyle = AbilityMultiTarget;
	}
}

// Patch Momentum Passive ability to not be colored as Psionic
static function PatchMomentumAbility()
{
	local X2AbilityTemplateManager				AbilityTemplateMgr;
	local array<X2AbilityTemplate>				AbilityTemplateArray;
	local X2AbilityTemplate						AbilityTemplate;

	AbilityTemplateMgr = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

	AbilityTemplateMgr.FindAbilityTemplateAllDifficulties('MomentumPassive', AbilityTemplateArray);
	foreach AbilityTemplateArray(AbilityTemplate)
	{
		AbilityTemplate = class'X2Ability'.static.PurePassive('MomentumPassive', "img:///UILibrary_XPACK_Common.PerkIcons.UIPerk_Momentum", , 'eAbilitySource_Perk');
	}
}

// Patch Solace Passive ability to ignore duplicate effects, allowing it to not be colored as Psionic for the Templar
static function PatchSolacePassiveAbility()
{
	local X2AbilityTemplateManager				AbilityTemplateMgr;
	local array<X2AbilityTemplate>				AbilityTemplateArray;
	local X2AbilityTemplate						AbilityTemplate;

	AbilityTemplateMgr = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

	AbilityTemplateMgr.FindAbilityTemplateAllDifficulties('SolacePassive', AbilityTemplateArray);
	foreach AbilityTemplateArray(AbilityTemplate)
	{
		X2Effect_Persistent(AbilityTemplate.AbilityTargetEffects[0]).DuplicateResponse = eDupe_Ignore;
	}
}

// Patch Fortress ability to not be colored as Psionic (this one is lazy and will change the passive color for other classes too - maybe fix later)
static function PatchFortressPassiveAbility()
{
	local X2AbilityTemplateManager				AbilityTemplateMgr;
	local array<X2AbilityTemplate>				AbilityTemplateArray;
	local X2AbilityTemplate						AbilityTemplate;
	local X2Effect								TestEffect;
	local X2Effect_Fortress						FortressEffect;

	AbilityTemplateMgr = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();

	AbilityTemplateMgr.FindAbilityTemplateAllDifficulties('Fortress', AbilityTemplateArray);
	foreach AbilityTemplateArray(AbilityTemplate)
	{
		// Update the icon color for the ability and effect separately, which has already been set as psionic
		AbilityTemplate.AbilitySourceName = 'eAbilitySource_Perk';
		foreach AbilityTemplate.AbilityTargetEffects(TestEffect)
		{
			FortressEffect = X2Effect_Fortress(TestEffect);
			if (FortressEffect != none)
			{
				FortressEffect.AbilitySourceName = 'eAbilitySource_Perk';
	}	}	}
}

// Patch Grenade Throw ability to gain +1 radius from Alchemical Catalysts
static function PatchGrenadeThrowAbility()
{
	local X2AbilityTemplateManager				AbilityTemplateMgr;
	local array<X2AbilityTemplate>				AbilityTemplateArray;
	local X2AbilityTemplate						AbilityTemplate;

	AbilityTemplateMgr = class'X2AbilityTemplateManager'.static.GetAbilityTemplateManager();
	AbilityTemplateMgr.FindAbilityTemplateAllDifficulties('ThrowGrenade', AbilityTemplateArray);
	foreach AbilityTemplateArray(AbilityTemplate)
	{
		X2AbilityMultiTarget_Radius(AbilityTemplate.AbilityMultiTargetStyle).AddAbilityBonusRadius('WOTC_APA_AlchemicalCatalysts', 1);
	}
}




// Hide Templar's Meditation GTS Unlock
static function HideTemplarAcademyUnlock()
{
	local X2StrategyElementTemplateManager		TemplateManager;
	local X2FacilityTemplate					FacilityTemplate;
    local X2SoldierAbilityUnlockTemplate		SoldierAbilityUnlockTemplate;
    local array<X2DataTemplate>					DataTemplates;
    local X2DataTemplate						DiffTemplate;

    TemplateManager = class'X2StrategyElementTemplateManager'.static.GetStrategyElementTemplateManager();
	TemplateManager.FindDataTemplateAllDifficulties('OfficerTrainingSchool', DataTemplates);
	foreach DataTemplates(DiffTemplate)
	{
		FacilityTemplate = X2FacilityTemplate(DiffTemplate);
		if (FacilityTemplate != none)
		{
			FacilityTemplate.SoldierUnlockTemplates.RemoveItem('MeditationPreparationUnlock');
}	}	}


// Handle all the localization tags
static function ChainAbilityTag()
{
	local XComEngine						Engine;
	local X2AbilityTag_WOTC_APA_Templar		NewAbilityTag;
	local X2AbilityTag						OldAbilityTag;
	local int idx;
	
	Engine = `XENGINE;
	
	OldAbilityTag = Engine.AbilityTag;
	
	NewAbilityTag = new class'X2AbilityTag_WOTC_APA_Templar';
	NewAbilityTag.WrappedTag = OldAbilityTag;
	
	idx = Engine.LocalizeContext.LocalizeTags.Find(Engine.AbilityTag);
	Engine.AbilityTag = NewAbilityTag;
	Engine.LocalizeContext.LocalizeTags[idx] = NewAbilityTag;
}