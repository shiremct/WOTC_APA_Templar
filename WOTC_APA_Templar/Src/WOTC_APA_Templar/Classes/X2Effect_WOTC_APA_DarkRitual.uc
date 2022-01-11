
class X2Effect_WOTC_APA_DarkRitual extends X2Effect_PersistentVoidConduit;

var int TickDuration;

// Setup focus directed to caster on target death
function RegisterForEvents(XComGameState_Effect EffectGameState)
{
	local XComGameState_Unit TargetUnit, SourceUnit;
	local X2EventManager EventMgr;
	local Object ListenerObj;

	EventMgr = `XEVENTMGR;

	TargetUnit = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(EffectGameState.ApplyEffectParameters.TargetStateObjectRef.ObjectID));
	SourceUnit = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(EffectGameState.ApplyEffectParameters.SourceStateObjectRef.ObjectID));

	ListenerObj = EffectGameState;

	EventMgr.RegisterForEvent(ListenerObj, 'UnitDied', UpdateFocusOnKill, ELD_OnStateSubmitted,, TargetUnit,, SourceUnit);
}

static function EventListenerReturn UpdateFocusOnKill(Object EventData, Object EventSource, XComGameState NewGameState, Name EventID, Object CallbackData)
{
	local XComGameState_Unit			TargetUnit, SourceUnit;
	local XComGameStateContext_Ability	AbilityContext;
	local XComGameStateHistory			History;
	local int							RandRoll;
	
	TargetUnit = XComGameState_Unit(EventData);
	SourceUnit = XComGameState_Unit(CallbackData);

	History = `XCOMHISTORY;

	AbilityContext = XComGameStateContext_Ability(NewGameState.GetContext());
	if (AbilityContext != None && AbilityContext.InterruptionStatus != eInterruptionStatus_Interrupt)
	{
		// Check that the killing ability is not one that normally grants Focus
		if (class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.PSI_CONDUIT_ABILITIES_GIVE_FOCUS.Find(AbilityContext.InputContext.AbilityTemplateName) != INDEX_NONE)
			return ELR_NoInterrupt;

		// Check that the TargetUnit is not Robotic, the Lost, or a Zombie
		if (TargetUnit.IsRobotic() || TargetUnit.GetMyTemplate().CharacterGroupName == 'TheLost' || TargetUnit.GetTeam() == eTeam_TheLost || TargetUnit.HasSoldierAbility('ZombieInitialization'))
			return ELR_NoInterrupt;
		
		`XEVENTMGR.TriggerEvent(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.FOCUS_GAIN_ON_KILL_TRIGGER, SourceUnit, SourceUnit, NewGameState);
	}

	return ELR_NoInterrupt;
}


simulated protected function OnEffectAdded(const out EffectAppliedData ApplyEffectParameters, XComGameState_BaseObject kNewTargetState, XComGameState NewGameState, XComGameState_Effect NewEffectState)
{
	local XComGameState_Unit TargetUnit, SourceUnit;
	local int StartingHP, DamagedHP, DifferenceHP, HealedHP;
	local DamageResult DmgResult;

	TargetUnit = XComGameState_Unit(kNewTargetState);	
	TargetUnit.SetUnitFloatValue(class'X2Ability_DefaultAbilitySet'.default.ImmobilizedValueName, 1);

	SourceUnit = XComGameState_Unit(NewGameState.GetGameStateForObjectID(ApplyEffectParameters.SourceStateObjectRef.ObjectID));
	if (SourceUnit == none)
	{
		SourceUnit = XComGameState_Unit(NewGameState.ModifyStateObject(class'XComGameState_Unit', ApplyEffectParameters.SourceStateObjectRef.ObjectID));
	}

	StartingHP = TargetUnit.GetCurrentStat(eStat_HP);
	TargetUnit.TakeEffectDamage(self, InitialDamage, 0, 0, ApplyEffectParameters, NewGameState);
	DamagedHP = TargetUnit.GetCurrentStat(eStat_HP);
	DifferenceHP = StartingHP - DamagedHP;
	HealedHP = Clamp(DifferenceHP, 0, class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.VOID_CONDUIT_HEALED);
	if (HealedHP > 0)
	{
		SourceUnit.ModifyCurrentStat(eStat_HP, HealedHP);
	}

	//	kind of gnarly but this should get the visualization correct
	//	store the damage info for what just happened
	DmgResult = TargetUnit.DamageResults[TargetUnit.DamageResults.Length - 1];
	//	take it off the unit
	TargetUnit.DamageResults.Remove(TargetUnit.DamageResults.Length - 1, 1);
	//	add it back on to the previous damage result (the first tick of damage)
	TargetUnit.DamageResults[TargetUnit.DamageResults.Length - 1].Shred += DmgResult.Shred;
	TargetUnit.DamageResults[TargetUnit.DamageResults.Length - 1].DamageAmount += DmgResult.DamageAmount;
	TargetUnit.DamageResults[TargetUnit.DamageResults.Length - 1].MitigationAmount += DmgResult.MitigationAmount;
	TargetUnit.DamageResults[TargetUnit.DamageResults.Length - 1].ShieldHP += DmgResult.ShieldHP;
}


simulated function OnEffectRemoved(const out EffectAppliedData ApplyEffectParameters, XComGameState NewGameState, bool bCleansed, XComGameState_Effect RemovedEffectState)
{
	local XComGameState_Unit TargetUnit;

	TargetUnit = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(ApplyEffectParameters.TargetStateObjectRef.ObjectID));
	if( TargetUnit != None )
	{
		TargetUnit.ClearUnitValue(class'X2Ability_DefaultAbilitySet'.default.ImmobilizedValueName);
	}
}


function bool TickVoidConduit(X2Effect_Persistent PersistentEffect, const out EffectAppliedData ApplyEffectParameters, XComGameState_Effect kNewEffectState, XComGameState NewGameState, bool FirstApplication)
{
	return false;
}


function ModifyTurnStartActionPoints(XComGameState_Unit UnitState, out array<name> ActionPoints, XComGameState_Effect EffectState)
{
	if (EffectState.iTurnsRemaining > 1)
	{
		ActionPoints.Length = 0;
	}
}