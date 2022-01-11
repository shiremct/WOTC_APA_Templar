
class X2TargetingMethod_WOTC_APA_Fuse extends X2TargetingMethod_TopDown;


var protected XComGameState_Ability FuseAbility;

function DirectSetTarget(int TargetIndex)
{
	local StateObjectReference FuseRef;
	local XComGameState_Unit TargetUnit, SourceUnit;
	local int TargetID;
	local float fRadius;
	local UnitValue CurrentFocusValue;
	local XComWorldData WorldData;
	local vector vLocation;
	local array<TilePosPair> OutTiles;
	local TilePosPair TilePair;
	local array<TTile> Tiles;
	local TTile Tile;
	local array<Actor> CurrentlyMarkedTargets;

	super.DirectSetTarget(TargetIndex);

	FuseAbility = none;
	TargetID = GetTargetedObjectID();
	if (TargetID != 0)
	{
		TargetUnit = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(TargetID));
		SourceUnit = XComGameState_Unit(`XCOMHISTORY.GetGameStateForObjectID(Ability.OwnerStateObject.ObjectID));
		if (TargetUnit != none)
		{
			if (class'X2Condition_FuseTarget'.static.GetAvailableFuse(TargetUnit, FuseRef))
			{
				FuseAbility = XComGameState_Ability(`XCOMHISTORY.GetGameStateForObjectID(FuseRef.ObjectID));
				if (FuseAbility != none && FuseAbility.GetMyTemplate().AbilityMultiTargetStyle != none)
				{
					X2AbilityMultiTarget_Radius_Fuse(FuseAbility.GetMyTemplate().AbilityMultiTargetStyle).CasterObjectID = Ability.OwnerStateObject.ObjectID;
					FuseAbility.GetMyTemplate().AbilityMultiTargetStyle.GetValidTilesForLocation(FuseAbility, GetTargetedActor().Location, Tiles);	
					DrawAOETiles(Tiles);
				}
			}
		}
	}
}


function Update(float DeltaTime)
{
	local XComGameState_Ability ActualAbility;
	local array<Actor> CurrentlyMarkedTargets;
	local vector NewTargetLocation;
	local TTile SnapTile;

	NewTargetLocation = GetTargetedActor().Location;
	SnapTile = `XWORLD.GetTileCoordinatesFromPosition( NewTargetLocation );
	`XWORLD.GetFloorPositionForTile( SnapTile, NewTargetLocation );

	if(NewTargetLocation != CachedTargetLocation)
	{		
		ActualAbility = Ability;
		Ability = FuseAbility;
		GetTargetedActors(NewTargetLocation, CurrentlyMarkedTargets);
		CheckForFriendlyUnit(CurrentlyMarkedTargets);	
		MarkTargetedActors(CurrentlyMarkedTargets, (!AbilityIsOffensive) ? FiringUnit.GetTeam() : eTeam_None );

		Ability = ActualAbility;
		CachedTargetLocation = NewTargetLocation;
	}
}

function Canceled()
{
	ClearTargetedActors();
	super.Canceled();
}