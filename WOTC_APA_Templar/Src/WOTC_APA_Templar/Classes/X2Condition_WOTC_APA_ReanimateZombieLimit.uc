
class X2Condition_WOTC_APA_ReanimateZombieLimit extends X2Condition;

var int ZombieLimit;

event name CallMeetsConditionWithSource(XComGameState_BaseObject kTarget, XComGameState_BaseObject kSource)
{
	local XComGameState_Unit TargetUnit;
	local XComGameState_Effect EffectState;
	local int Counter;

	foreach `XCOMHISTORY.IterateByClassType(class'XComGameState_Unit', TargetUnit)
	{
		if (TargetUnit.bRemovedFromPlay || TargetUnit.GetMyTemplate().bNeverSelectable || TargetUnit.GetMyTemplate().bIsCosmetic || TargetUnit.ControllingPlayer.ObjectID <= 0)
		{
			continue;
		}

		if (TargetUnit.IsAlive() && TargetUnit.IsUnitAffectedByEffectName(class'X2Ability_Sectoid'.default.SireZombieLinkName))
		{
			EffectState = TargetUnit.GetUnitAffectedByEffectState(class'X2Ability_Sectoid'.default.SireZombieLinkName);
			if (EffectState.ApplyEffectParameters.SourceStateObjectRef.ObjectID == kSource.ObjectID)
			{
				Counter += 1;
				if (Counter >= ZombieLimit)
				{
					return 'AA_AlreadyAmplified';
		}	}	}
	}

	return 'AA_Success';
}