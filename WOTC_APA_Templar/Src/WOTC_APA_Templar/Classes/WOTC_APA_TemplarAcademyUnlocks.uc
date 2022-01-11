
class WOTC_APA_TemplarAcademyUnlocks extends X2StrategyElement config(WOTC_APA_TemplarSkills);


var config int			CLASS_UNLOCK_1_COST;
var config int			CLASS_UNLOCK_2_COST;

static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;
		
	Templates.AddItem(WOTC_APA_TemplarUnlock1());
	Templates.AddItem(WOTC_APA_TemplarUnlock2());

	return Templates;
}


static function X2SoldierAbilityUnlockTemplate WOTC_APA_TemplarUnlock1()
{
	local X2SoldierAbilityUnlockTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2SoldierAbilityUnlockTemplate', Template, 'WOTC_APA_TemplarUnlock1');
	
	Template.AllowedClasses.AddItem('Templar');
	Template.AllowedClasses.AddItem('WOTC_APA_TemplarAcolyte');
	Template.strImage = "img:///UILibrary_StrategyImages.GTS.GTS_SquadSize1";

	// Requirements
	Template.Requirements.RequiredHighestSoldierRank = 3;
	Template.Requirements.RequiredSoldierClass = 'Templar';
	Template.Requirements.RequiredSoldierRankClassCombo = true;
	Template.Requirements.bVisibleIfSoldierRankGatesNotMet = true;

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.CLASS_UNLOCK_1_COST;
	Template.Cost.ResourceCosts.AddItem(Resources);

	// Ability
	Template.AbilityName = 'WOTC_APA_AcademyAbility';
	
	return Template;
}

static function X2SoldierAbilityUnlockTemplate WOTC_APA_TemplarUnlock2()
{
	local X2SoldierAbilityUnlockTemplate Template;
	local ArtifactCost Resources;

	`CREATE_X2TEMPLATE(class'X2SoldierAbilityUnlockTemplate', Template, 'WOTC_APA_TemplarUnlock2');

	Template.AllowedClasses.AddItem('Templar');
	Template.AllowedClasses.AddItem('WOTC_APA_TemplarAcolyte');
	Template.strImage = "img:///UILibrary_StrategyImages.GTS.GTS_SquadSize2";

	// Requirements
	Template.Requirements.RequiredHighestSoldierRank = 6;
	Template.Requirements.RequiredSoldierClass = 'Templar';
	Template.Requirements.RequiredSoldierRankClassCombo = true;
	Template.Requirements.bVisibleIfSoldierRankGatesNotMet = true;
	Template.Requirements.SpecialRequirementsFn = IsTemplarUnlock1Purchased;

	// Cost
	Resources.ItemTemplateName = 'Supplies';
	Resources.Quantity = default.CLASS_UNLOCK_2_COST;
	Template.Cost.ResourceCosts.AddItem(Resources);

	// Ability
	Template.AbilityName = 'WOTC_APA_AcademyAbility';
	
	return Template;
}

function bool IsTemplarUnlock1Purchased()
{
	local XComGameState_HeadquartersXCom XComHQ;

	XComHQ = XComGameState_HeadquartersXCom(`XCOMHISTORY.GetSingleGameStateObjectForClass(class'XComGameState_HeadquartersXCom'));
	if (XComHQ.SoldierUnlockTemplates.Find('WOTC_APA_TemplarUnlock1') != INDEX_NONE)
	{
		return true;
	}
		
	return false;
}