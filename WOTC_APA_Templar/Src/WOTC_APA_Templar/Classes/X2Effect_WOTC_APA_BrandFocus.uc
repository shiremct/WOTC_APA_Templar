
class X2Effect_WOTC_APA_BrandFocus extends X2Effect_Persistent;


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
		
		// Check that the TargetUnit is not under the effects of Void Conduit
		if (TargetUnit.IsUnitAffectedByEffectName('VoidConduit'))
			return ELR_NoInterrupt;

		RandRoll = `SYNC_RAND_STATIC(100);
		if (RandRoll <= class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.BRAND_FOCUS_CHANCE)

			`XEVENTMGR.TriggerEvent(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.FOCUS_GAIN_ON_KILL_TRIGGER, SourceUnit, SourceUnit, NewGameState);
	}

	return ELR_NoInterrupt;
}