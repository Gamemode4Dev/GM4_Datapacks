#run from gm4_undead_players:summon_drowned
#@s = newly spawned drowned player

# Copy the equipment from the zombie to the drowned.
data modify entity @s equipment merge from storage gm4_undead_players:temp zombie_data.equipment

# Update the name from "Undead <name>" to "Drowned <name>"
data modify storage gm4_undead_players:temp zombie_data.CustomName merge value {translate:"entity.gm4.drowned_player_name","fallback":"Drowned %s"}
data modify entity @s CustomName merge from storage gm4_undead_players:temp zombie_data.CustomName

# Remove the temporary "new" tag from the drowned.
tag @s remove gm4_undead_player_new
