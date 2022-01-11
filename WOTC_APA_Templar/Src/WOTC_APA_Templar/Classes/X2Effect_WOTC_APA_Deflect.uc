
class X2Effect_WOTC_APA_Deflect extends X2Effect_Persistent;

var float			DeflectChance;
var name			ParryUnitValueName;


function RegisterForEvents(XComGameState_Effect EffectGameState)
{
	local XComGameState_Unit UnitState;
	local X2EventManager EventMgr;
	local Object ListenerObj;

	EventMgr = `XEVENTMGR;

	UnitState = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(EffectGameState.ApplyEffectParameters.TargetStateObjectRef.ObjectID));

	ListenerObj = EffectGameState;

	EventMgr.RegisterForEvent(ListenerObj, 'KillMail', UpdateFocusOnKill, ELD_OnStateSubmitted,, UnitState,, EffectGameState);
}

static function EventListenerReturn UpdateFocusOnKill(Object EventData, Object EventSource, XComGameState NewGameState, Name EventID, Object CallbackData)
{
	local XComGameState_Unit			TargetUnit, SourceUnit;
	local XComGameStateContext_Ability	AbilityContext;
	local XComGameStateHistory			History;
	local UnitValue						CurrentFocusValue;
	
	TargetUnit = XComGameState_Unit(EventData);
	SourceUnit = XComGameState_Unit(EventSource);

	History = `XCOMHISTORY;

	AbilityContext = XComGameStateContext_Ability(NewGameState.GetContext());
	if (AbilityContext != None && AbilityContext.InterruptionStatus != eInterruptionStatus_Interrupt)
	{
		if (class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.PSI_CONDUIT_ABILITIES_GIVE_FOCUS.Find(AbilityContext.InputContext.AbilityTemplateName) != INDEX_NONE)
		{
			// Check that the TargetUnit is not Robotic, the Lost, or a Zombie
			if (TargetUnit.IsRobotic() || TargetUnit.GetMyTemplate().CharacterGroupName == 'TheLost' || TargetUnit.GetTeam() == eTeam_TheLost || TargetUnit.HasSoldierAbility('ZombieInitialization'))
				return ELR_NoInterrupt;

			// If the SourceUnit has Soulbind, trigger the heal ability
			if (SourceUnit.HasSoldierAbility('WOTC_APA_Soulbind'))
				`XEVENTMGR.TriggerEvent(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.SOULBIND_HEAL_ON_KILL_TRIGGER, SourceUnit, SourceUnit, NewGameState);

			// If the target was killed by Skyfall, grant an additional Focus back to the caster
			if (AbilityContext.InputContext.AbilityTemplateName == 'WOTC_APA_SkyfallAttack')
			{
				SourceUnit.GetUnitValue(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.PSI_CONDUIT_CURRENT_NAME, CurrentFocusValue);
				SourceUnit.SetUnitFloatValue(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.PSI_CONDUIT_CURRENT_NAME, CurrentFocusValue.fValue + 1, eCleanup_BeginTactical);
			}

			`XEVENTMGR.TriggerEvent(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.FOCUS_GAIN_ON_KILL_TRIGGER, SourceUnit, SourceUnit, NewGameState);
	}	}

	return ELR_NoInterrupt;
}


function bool ChangeHitResultForTarget(XComGameState_Effect EffectState, XComGameState_Unit Attacker, XComGameState_Unit TargetUnit, XComGameState_Ability AbilityState, bool bIsPrimaryTarget, const EAbilityHitResult CurrentResult, out EAbilityHitResult NewHitResult)
{
	local X2AbilityToHitCalc_StandardAim AttackToHit;
	local UnitValue ParryUnitValue;
	local int RandRoll;
	local bool bDeflectTriggered;

	//	don't respond to reaction fire
	AttackToHit = X2AbilityToHitCalc_StandardAim(AbilityState.GetMyTemplate().AbilityToHitCalc);
	if (AttackToHit != none && AttackToHit.bReactionFire)
		return false;

	//	dont respond to melee or AOE attacks
	if (AbilityState.IsMeleeAbility() || !bIsPrimaryTarget)
		return false;

	//	don't respond if target is stunned, etc.
	if (!TargetUnit.IsAbleToAct())
		return false;

	//	don't change a natural miss
	if (!class'XComGameStateContext_Ability'.static.IsHitResultHit(CurrentResult))
		return false;	


	//	check for parry first - if the unit value is set, then a parry is guaranteed, so do not check for deflect
	if (TargetUnit.GetUnitValue(ParryUnitValueName, ParryUnitValue))
	{
		if (ParryUnitValue.fValue > 0)
		{
			return false;
	}	}		


	//	Roll for Deflect
	RandRoll = `SYNC_RAND(100);
	if (RandRoll <= DeflectChance)
	{
		// If roll is successful, downgrade hits to next lower level
		switch (CurrentResult)
		{
			case eHit_Crit:
				NewHitResult = eHit_Success;
				bDeflectTriggered = true;
				break;
			case eHit_Success:
				NewHitResult = eHit_Graze;
				bDeflectTriggered = true;
				break;
			case eHit_Graze:
				NewHitResult = eHit_Deflect;
				bDeflectTriggered = true;
				break;
			default:
				break;
	}	}		


	if (bDeflectTriggered)
	{
		return true;
	}

	return false;
}


DefaultProperties
{
	DuplicateResponse = eDupe_Ignore
	EffectName = "Deflect"
}