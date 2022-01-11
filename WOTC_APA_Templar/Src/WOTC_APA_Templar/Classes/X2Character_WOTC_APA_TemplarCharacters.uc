
class X2Character_WOTC_APA_TemplarCharacters extends X2Character_DefaultCharacters config(GameData_CharacterStats);


static function array<X2DataTemplate> CreateTemplates()
{
	local array<X2DataTemplate> Templates;

	Templates.AddItem(CreateTemplate_TemplarPsiZombie());
	Templates.AddItem(CreateTemplate_TemplarPsiZombieHuman());
	Templates.AddItem(CreateTemplate_TemplarEmpoweredPsiZombie());
	Templates.AddItem(CreateTemplate_TemplarEmpoweredPsiZombieHuman());

	return Templates;
}

static function X2CharacterTemplate CreateTemplate_TemplarPsiZombie()
{
	local X2CharacterTemplate CharTemplate;
	CharTemplate = CreateTemplate_PsiZombie('WOTC_APA_Templar_PsiZombie');

	CharTemplate.DefaultLoadout = 'SpectralZombieM2_Loadout';

	CharTemplate.Abilities.AddItem('WOTC_APA_ZombieClawSlash');

	CharTemplate.SightedNarrativeMoments.Length = 0;

	return CharTemplate;
}

static function X2CharacterTemplate CreateTemplate_TemplarPsiZombieHuman()
{
	local X2CharacterTemplate CharTemplate;
	CharTemplate = CreateTemplate_PsiZombie('WOTC_APA_Templar_PsiZombieHuman');

	CharTemplate.strPawnArchetypes.Length = 0;
	CharTemplate.strPawnArchetypes.AddItem("GameUnit_Zombie.ARC_GameUnit_Zombie_Human_M");
	CharTemplate.strPawnArchetypes.AddItem("GameUnit_Zombie.ARC_GameUnit_Zombie_Human_F");

	CharTemplate.DefaultLoadout = 'SpectralZombieM2_Loadout';

	CharTemplate.Abilities.AddItem('WOTC_APA_ZombieClawSlash');

	CharTemplate.SightedNarrativeMoments.Length = 0;

	return CharTemplate;
}

static function X2CharacterTemplate CreateTemplate_TemplarEmpoweredPsiZombie()
{
	local X2CharacterTemplate CharTemplate;
	CharTemplate = CreateTemplate_PsiZombie('WOTC_APA_Templar_EmpoweredPsiZombie');

	CharTemplate.DefaultLoadout = 'SpectralZombieM2_Loadout';

	CharTemplate.Abilities.AddItem('WOTC_APA_ZombieClawSlash');

	CharTemplate.SightedNarrativeMoments.Length = 0;

	return CharTemplate;
}

static function X2CharacterTemplate CreateTemplate_TemplarEmpoweredPsiZombieHuman()
{
	local X2CharacterTemplate CharTemplate;
	CharTemplate = CreateTemplate_PsiZombie('WOTC_APA_Templar_EmpoweredPsiZombieHuman');

	CharTemplate.strPawnArchetypes.Length = 0;
	CharTemplate.strPawnArchetypes.AddItem("GameUnit_Zombie.ARC_GameUnit_Zombie_Human_M");
	CharTemplate.strPawnArchetypes.AddItem("GameUnit_Zombie.ARC_GameUnit_Zombie_Human_F");

	CharTemplate.DefaultLoadout = 'SpectralZombieM2_Loadout';

	CharTemplate.Abilities.AddItem('WOTC_APA_ZombieClawSlash');

	CharTemplate.SightedNarrativeMoments.Length = 0;

	return CharTemplate;
}