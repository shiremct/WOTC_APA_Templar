
class X2Effect_WOTC_APA_SoulbindFocus extends X2Effect_Persistent;


function RegisterForEvents(XComGameState_Effect EffectGameState)
{
	local XComGameState_Unit UnitState;
	local X2EventManager EventMgr;
	local Object ListenerObj;

	EventMgr = `XEVENTMGR;

	UnitState = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(EffectGameState.ApplyEffectParameters.TargetStateObjectRef.ObjectID));

	ListenerObj = EffectGameState;

	EventMgr.RegisterForEvent(ListenerObj, 'RendActivated', UpdateFocusOnRend, ELD_OnStateSubmitted,, UnitState,, EffectGameState);
}

static function EventListenerReturn UpdateFocusOnRend(Object EventData, Object EventSource, XComGameState NewGameState, Name EventID, Object CallbackData)
{
	local XComGameState_Unit			TargetUnit, SourceUnit;
	local XComGameStateContext_Ability	AbilityContext;
	local XComGameStateHistory			History;
	local int							RandRoll;
	
	SourceUnit = XComGameState_Unit(EventSource);

	History = `XCOMHISTORY;

	AbilityContext = XComGameStateContext_Ability(NewGameState.GetContext());
	if (AbilityContext != None && AbilityContext.InterruptionStatus != eInterruptionStatus_Interrupt)
	{
		TargetUnit = XComGameState_Unit(History.GetGameStateForObjectID(AbilityContext.InputContext.PrimaryTarget.ObjectID));
		
		// Check that the TargetUnit is not dead
		if (TargetUnit == none || TargetUnit.IsDead())
			return ELR_NoInterrupt;

		// Check that the TargetUnit is not Robotic, the Lost, or a Zombie
		if (TargetUnit.IsRobotic() || TargetUnit.GetMyTemplate().CharacterGroupName == 'TheLost' || TargetUnit.GetTeam() == eTeam_TheLost || TargetUnit.HasSoldierAbility('ZombieInitialization'))
			return ELR_NoInterrupt;
		
		// Roll for Focus Gain
		RandRoll = `SYNC_RAND_STATIC(100);
		if (RandRoll <= class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.SOULBIND_FOCUS_CHANCE)
			`XEVENTMGR.TriggerEvent(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.SOULBIND_FOCUS_GAIN_TRIGGER, SourceUnit, SourceUnit, NewGameState);
	}

	return ELR_NoInterrupt;
}