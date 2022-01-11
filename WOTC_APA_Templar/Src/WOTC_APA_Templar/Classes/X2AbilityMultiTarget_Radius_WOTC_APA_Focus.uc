
class X2AbilityMultiTarget_Radius_WOTC_APA_Focus extends X2AbilityMultiTarget_Radius;

var name					RequiredEffectName;		// Name of required effect to modify radius based on Focus levels
var name					FocusUnitValueName;		// UnitValue to check current Focus levels
var int						RequiredFocusValue;		// Minimum Focus level to grant bonus Tile radius
var float					fFocusTileBonus;		// Bonus Tile radius to add if Focus requirements are met
var float					fTileRadius;			// Replaces fTargetRadius - base Tile radius
var float					fMeterRadius;			// Replaces fTargetRadius - base Meter radius
var bool					bGetWeaponRadius;		// Alt bool to get Weapon Radius that avoids unknown native stuff



simulated function GetMultiTargetsForLocation(const XComGameState_Ability Ability, const vector Location, out AvailableTarget Target)
{
	UpdateTargetRadius(Ability);
	super.GetMultiTargetsForLocation(Ability, Location, Target);
}

simulated function GetValidTilesForLocation(const XComGameState_Ability Ability, const vector Location, out array<TTile> ValidTiles)
{
	UpdateTargetRadius(Ability);
	super.GetValidTilesForLocation(Ability, Location, ValidTiles);
}

simulated function float GetTargetRadius(const XComGameState_Ability Ability)
{
	UpdateTargetRadius(Ability);
	return(`METERSTOUNITS(fTargetRadius));
}


function UpdateTargetRadius(const XComGameState_Ability Ability)
{
	local XComGameStateContext_Ability AbilityContext;
	local XComGameState_Unit SourceUnit;
	local XComGameState_Item SourceWeapon;
	local X2WeaponTemplate WeaponTemplate;
	local UnitValue CurrentFocusValue;
	local XComGameStateHistory History;

	History = `XCOMHISTORY;

	// Reset fTargetRadius
	fTargetRadius = 0;

	// Rebuild from modifiers: Weapon Radius
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

	// Rebuild from modifiers: Tile/Meter Radius (these are additive and not mutually exclusive)
	if (fTileRadius != 0)
	{
		fTargetRadius += `TILESTOMETERS(fTileRadius);
	}
	if (fMeterRadius != 0)
	{
		fTargetRadius += fMeterRadius;
	}

	// If Source Unit meets conditions (RequiredEffectName, FocusUnitValueName, & RequiredFocusValue), add bonus Tile Radius
	SourceUnit = XComGameState_Unit(History.GetGameStateForObjectID(Ability.OwnerStateObject.ObjectID));
	if (SourceUnit != none)
	{
		if (RequiredEffectName == '' || SourceUnit.IsUnitAffectedByEffectName(RequiredEffectName))
		{
			if (FocusUnitValueName != '')
			{
				SourceUnit.GetUnitValue(FocusUnitValueName, CurrentFocusValue);
				if (CurrentFocusValue.fValue >= RequiredFocusValue)
				{
					fTargetRadius += `TILESTOMETERS(fFocusTileBonus);
	}	}	}	}
}


defaultProperties
{
	bUseWeaponRadius=false
	bIgnoreBlockingCover=true  // unused here, but kept for reference
	bAddPrimaryTargetAsMultiTarget=false     //unused here, but kept for reference -- GetMultiTargetOptions & GetMultiTargetsForLocation will remove the primary target and add it to the multi target array.
	bAllowDeadMultiTargetUnits=false	//unused here, but kept for reference
	bAllowSameTarget=false
	RequiredEffectName=class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.EMPOWER_EFFECT_NAME
	FocusUnitValueName=class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.PSI_CONDUIT_CURRENT_NAME
}