
class X2EventListener_WOTC_APA_Templar extends X2EventListener config(WOTC_APA_TemplarSkills);

var config int						 TEMPLAR_ACOLYTE_PER_UPGRADE;


static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(CreateOverrideUnitFocusUIListenerTemplate());
	Templates.AddItem(CreateValidateGTSClassTrainingListenerTemplate());

	return Templates;
}


// 'OverrideUnitFocusUI' event listeners
static function X2EventListenerTemplate CreateOverrideUnitFocusUIListenerTemplate()
{
	local CHEventListenerTemplate Template;

	`CREATE_X2TEMPLATE(class'CHEventListenerTemplate', Template, 'WOTC_APA_TemplarUnitFocusUI');

	Template.RegisterInTactical = true;
	Template.AddCHEvent('OverrideUnitFocusUI', TemplarOnOverrideFocus, ELD_Immediate);

	return Template;
}

		// Handle UI for Templar's Focus Mechanic
		static function EventListenerReturn TemplarOnOverrideFocus(Object EventData, Object EventSource, XComGameState GameState, Name Event, Object CallbackData)
		{
			local XComGameState_Unit			UnitState;
			local XComLWTuple					Tuple;
			local UnitValue						CurrentFocusLevel, MaxFocusLevel;
			local int							CurrentFocus, MaxFocus;
			local string						TooltipLong, TooltipShort;
			local string						BarColor;


			Tuple = XComLWTuple(EventData);
			UnitState = XComGameState_Unit(EventSource);

			// Unit must have the appropriate ability
			if (UnitState.HasSoldierAbility('WOTC_APA_Conduit'))
			{
				BarColor = "a07ea3"; // Lilac from Templar's Faction Logo
				TooltipLong = class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.strConduitLevelDesc;
				TooltipShort = class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.strConduitLevelName;

				UnitState.GetUnitValue(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.PSI_CONDUIT_MAX_NAME, MaxFocusLevel);
				MaxFocus = MaxFocusLevel.fValue;

				UnitState.GetUnitValue(class'X2Ability_WOTC_APA_TemplarAbilitySet'.default.PSI_CONDUIT_CURRENT_NAME, CurrentFocusLevel);
				CurrentFocus = CurrentFocusLevel.fValue;
								
				Tuple.Data[0].b = true;
				Tuple.Data[1].i = CurrentFocus;
				Tuple.Data[2].i = MaxFocus;
				Tuple.Data[3].s = BarColor;
				Tuple.Data[5].s = TooltipLong;
				Tuple.Data[6].s = TooltipShort;
			}

			return ELR_NoInterrupt;
		}


// 'ValidateGTSClassTraining' event listeners
static function CHEventListenerTemplate CreateValidateGTSClassTrainingListenerTemplate()
{
	local CHEventListenerTemplate Template;

	`CREATE_X2TEMPLATE(class'CHEventListenerTemplate', Template, 'WOTC_APA_TemplarValidateGTSClassTraining');

	Template.RegisterInTactical = false;
	Template.RegisterInStrategy = true;
	Template.AddCHEvent('ValidateGTSClassTraining', TemplarValidateGTSClassTraining, ELD_Immediate);
	
	return Template;
}

		// Enable GTS Training and Choose My Class promotion of Templar Acolytes
		static function EventListenerReturn TemplarValidateGTSClassTraining(Object EventData, Object EventSource, XComGameState NewGameState, Name Event, Object CallbackData)
		{
			local XComLWTuple				OverrideTuple;
			local X2SoldierClassTemplate	SoldierClassTemplate;

			OverrideTuple = XComLWTuple(EventData);

			if (OverrideTuple != none)
			{
				SoldierClassTemplate = X2SoldierClassTemplate(OverrideTuple.Data[1].o);
				if (SoldierClassTemplate != none && SoldierClassTemplate.DataName == 'WOTC_APA_TemplarAcolyte')
				{
					if (IsTemplarAcolyteAvailable())
					{
						OverrideTuple.Data[0].b = true;
					}
				}
			}
			return ELR_NoInterrupt;
		}

		static private function bool IsTemplarAcolyteAvailable()
		{
			local XComGameState_HeadquartersXCom XComHQ;
			local XComGameState_HeadquartersProjectTrainRookie TrainProject;
			local XComGameState_Unit HQUnitState;
			local XComGameStateHistory History;
			local name TemplateName;
			local int i, j, NumUnlocks;

			XComHQ = `XCOMHQ;
			History = `XCOMHISTORY;

			// No Acolytes Given
			if (default.TEMPLAR_ACOLYTE_PER_UPGRADE == 0)
				return false;

			// Get number of Unlocks purchased
			foreach XComHQ.SoldierUnlockTemplates(TemplateName)
			{
				if (TemplateName == 'WOTC_APA_TemplarUnlock1' || TemplateName == 'WOTC_APA_TemplarUnlock2')
				{
					NumUnlocks++;
			}	}
			
			// Compare current Acolytes vs current limit
			if (NumUnlocks > 0)
			{
				if (default.TEMPLAR_ACOLYTE_PER_UPGRADE > 0)
				{
					// Count number of soldiers currently training to become Acolytes
					///**/`Log("WOTC_APA_Templar - Checking HQ Projects:");
					foreach History.IterateByClassType(class'XComGameState_HeadquartersProjectTrainRookie', TrainProject)
					{
						///**/`Log("WOTC_APA_Templar - HQ Train Project:" @ TrainProject.NewClassName);
						if (TrainProject.NewClassName == 'WOTC_APA_TemplarAcolyte')
						{
							j++;
							///**/`Log("WOTC_APA_Templar - HQ Projects Found:" @ string(j));
							if (j >= default.TEMPLAR_ACOLYTE_PER_UPGRADE * NumUnlocks)
							{
								return false;
					}	}	}

					// Count number of Acolytes
					///**/`Log("WOTC_APA_Templar - Checking HQ Soldiers:");
					for (i = 0; i < XComHQ.Crew.Length; i++)
					{
						HQUnitState = XComGameState_Unit(History.GetGameStateForObjectID(XComHQ.Crew[i].ObjectID));
						if(HQUnitState != none && HQUnitState.IsSoldier())
						{
							if (HQUnitState.GetSoldierClassTemplate().DataName == 'WOTC_APA_TemplarAcolyte')
							{
								j++;
								///**/`Log("WOTC_APA_Templar - HQ Soldiers Found:" @ string(j));
								if (j >= default.TEMPLAR_ACOLYTE_PER_UPGRADE * NumUnlocks)
								{
									return false;
				}	}	}	}	}
				return true;
			}

			return false;
		}