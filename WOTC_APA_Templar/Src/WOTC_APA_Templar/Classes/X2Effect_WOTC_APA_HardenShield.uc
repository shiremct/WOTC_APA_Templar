
class X2Effect_WOTC_APA_HardenShield extends X2Effect_ModifyStats;

var int			ShieldAmount;
var bool		bCappedAmount;


function RegisterForEvents(XComGameState_Effect EffectGameState)
{
	local X2EventManager EventMgr;
	local XComGameState_Unit UnitState;
	local Object EffectObj;

	EventMgr = `XEVENTMGR;

	UnitState = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(EffectGameState.ApplyEffectParameters.TargetStateObjectRef.ObjectID));
	EffectObj = EffectGameState;

	EventMgr.RegisterForEvent(EffectObj, 'ShieldsExpended', EffectGameState.OnShieldsExpended, ELD_OnStateSubmitted, , UnitState);
}


simulated protected function OnEffectAdded(const out EffectAppliedData ApplyEffectParameters, XComGameState_BaseObject kNewTargetState, XComGameState NewGameState, XComGameState_Effect NewEffectState)
{
	local XComGameState_Unit UnitState;
	local int ShieldValue;
	local StatChange ShieldChange;

	ShieldChange.StatType = eStat_ShieldHP;

	UnitState = XComGameState_Unit(kNewTargetState);
	if (bCappedAmount)
	{
		ShieldValue = UnitState.GetCurrentStat(eStat_ShieldHP);
		ShieldChange.StatAmount = ShieldAmount - ShieldValue;
	}
	else
	{
		ShieldChange.StatAmount = ShieldAmount;
	}
	
	NewEffectState.StatChanges.AddItem(ShieldChange);

	super.OnEffectAdded(ApplyEffectParameters, kNewTargetState, NewGameState, NewEffectState);
}


defaultproperties
{
	DuplicateResponse=eDupe_Refresh
}