class X2AbilityMultiTarget_Radius_Fuse extends X2AbilityMultiTarget_Radius;

var float					fTileRadius;		// Replaces fTargetRadius
var float					fMeterRadius;		// Replaces fTargetRadius
var bool					bGetWeaponRadius;	// Alt bool to get Weapon Radius that avoids unknown native stuff
var int						CasterObjectID;


simulated function GetValidTilesForLocation(const XComGameState_Ability Ability, const vector Location, out array<TTile> ValidTiles)
{
	///**/`Log("WOTC_APA_Templar - Fuse: Called GetValidTilesForLocation");
	UpdateTargetRadius(Ability);
	super.GetValidTilesForLocation(Ability, Location, ValidTiles);
}

simulated function float GetTargetRadius(const XComGameState_Ability Ability)
{
	///**/`Log("WOTC_APA_Templar - Fuse: Called GetTargetRadius");
	UpdateTargetRadius(Ability);
	return(`METERSTOUNITS(fTargetRadius));
}

function UpdateTargetRadius(const XComGameState_Ability Ability)
{
	local XComGameState_Unit SourceUnit, CastingUnit;
	local XComGameState_Item SourceWeapon;
	local X2WeaponTemplate WeaponTemplate;
	local UnitValue CurrentBonusValue;
	local XComGameStateHistory History;

	History = `XCOMHISTORY;

	// Reset fTargetRadius
	fTargetRadius = 0;
	///**/`Log("WOTC_APA_Templar - Fuse: Resetting fTargetRadius");

	// Rebuild from modifiers
	if (bGetWeaponRadius)
	{
		SourceWeapon = XComGameState_Item(History.GetGameStateForObjectID(Ability.SourceWeapon.ObjectID));
		if (SourceWeapon != none)
		{
			WeaponTemplate = X2WeaponTemplate(SourceWeapon.GetMyTemplate());
			if (WeaponTemplate != none)
			{
				fTargetRadius = WeaponTemplate.iRadius;
		}	}
	}
	
	//SourceUnit = XComGameState_Unit(History.GetGameStateForObjectID(Ability.OwnerStateObject.ObjectID));
	CastingUnit = XComGameState_Unit(History.GetGameStateForObjectID(CasterObjectID));
	if (CastingUnit != none)
	{
		if (CastingUnit.IsUnitAffectedByEffectName(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.EMPOWER_EFFECT_NAME))
		{
			CastingUnit.GetUnitValue(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.PSI_CONDUIT_CURRENT_NAME, CurrentBonusValue);
			if (CurrentBonusValue.fValue >= class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.FUSE_FOCUS_COST + class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.EMPOWER_FOCUS_COST_INCREASE)
			{
				fTargetRadius += `TILESTOMETERS(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.FUSE_EMPOWERED_EXPLOSION_RADIUS_BONUS);
		}	}
	}
	///**/`Log("WOTC_APA_Templar - Fuse: Source Unit is " $ SourceUnit.GetFullName());
	///**/`Log("WOTC_APA_Templar - Fuse: Caster Unit is " $ CastingUnit.GetFullName());

	if (fTileRadius != 0)
	{
		fTargetRadius += `TILESTOMETERS(fTileRadius);
	}
	if (fMeterRadius != 0)
	{
		fTargetRadius += fMeterRadius;
	}

	///**/`Log("WOTC_APA_Templar - Fuse: Modified fTargetRadius = " $ fTargetRadius);
}

defaultProperties
{
	bUseWeaponRadius=false
	bIgnoreBlockingCover=true  // unused here, but kept for reference
	bAddPrimaryTargetAsMultiTarget=false     //unused here, but kept for reference -- GetMultiTargetOptions & GetMultiTargetsForLocation will remove the primary target and add it to the multi target array.
	bAllowDeadMultiTargetUnits=false	//unused here, but kept for reference
	bAllowSameTarget=false
}