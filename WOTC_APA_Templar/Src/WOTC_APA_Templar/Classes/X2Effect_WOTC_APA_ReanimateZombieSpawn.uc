
class X2Effect_WOTC_APA_ReanimateZombieSpawn extends X2Effect_SpawnPsiZombie;

//var privatewrite name TurnedZombieName;
var bool bLimitActions;


function OnSpawnComplete(const out EffectAppliedData ApplyEffectParameters, StateObjectReference NewUnitRef, XComGameState NewGameState, XComGameState_Effect NewEffectState)
{
	local XComGameState_Unit ZombieGameState, DeadUnitGameState;
	local UnitValue ZombieUnitValue;
	local EffectAppliedData NewEffectParams;
	local X2Effect SireZombieEffect;
	local X2EventManager EventManager;

	EventManager = `XEVENTMGR;

	DeadUnitGameState = XComGameState_Unit(NewGameState.GetGameStateForObjectID(ApplyEffectParameters.TargetStateObjectRef.ObjectID));
	if( DeadUnitGameState == none )
	{
		DeadUnitGameState = XComGameState_Unit(NewGameState.ModifyStateObject(class'XComGameState_Unit', ApplyEffectParameters.TargetStateObjectRef.ObjectID));
	}

	// The zombie can't become a zombie once dead and save the dead unit's ref so it can be accessed later
	ZombieGameState = XComGameState_Unit(NewGameState.GetGameStateForObjectID(NewUnitRef.ObjectID));
	ZombieGameState.SetUnitFloatValue(TurnedZombieName, 1, eCleanup_BeginTactical);
	ZombieGameState.kAppearance.bGhostPawn = true;

	// Link the source and zombie
	NewEffectParams = ApplyEffectParameters;
	NewEffectParams.EffectRef.ApplyOnTickIndex = INDEX_NONE;
	NewEffectParams.EffectRef.LookupType = TELT_AbilityTargetEffects;
	NewEffectParams.EffectRef.SourceTemplateName = class'X2Ability_Sectoid'.default.SireZombieLinkName;
	NewEffectParams.EffectRef.TemplateEffectLookupArrayIndex = 0;
	NewEffectParams.TargetStateObjectRef = ZombieGameState.GetReference();

	SireZombieEffect = class'X2Effect'.static.GetX2Effect(NewEffectParams.EffectRef);
	SireZombieEffect.ApplyEffect(NewEffectParams, ZombieGameState, NewGameState);

	// Don't allow the dead unit to become a zombie again
	DeadUnitGameState.SetUnitFloatValue(TurnedZombieName, 1, eCleanup_BeginTactical);

	// Remove the dead unit from play
	EventManager.TriggerEvent('UnitRemovedFromPlay', DeadUnitGameState, DeadUnitGameState, NewGameState);

	// Limit the Zombie to one action point when spawned, if set
	if (bLimitActions)
		ZombieGameState.ActionPoints.Length = 1;

	EventManager.TriggerEvent('UnitMoveFinished', ZombieGameState, ZombieGameState, NewGameState);
}