#run from gm4_undead_players:summon_drowned
#@s = newly spawned drowned player

# TODO 1.21: parse the player's name from the zombie's "Undead <Name>" name
data modify storage gm4_undead_players:temp drowned_data set value {CustomName:'{"translate":"entity.gm4.drowned_player","fallback":"Drowned Player"}'}

# Copy other tags from the zombie to the drowned.
data modify storage gm4_undead_players:temp drowned_data.equipment set from storage gm4_undead_players:temp zombie_data.equipment

# Update the drowned based on the contents of storage.
data modify entity @s {} merge from storage gm4_undead_players:temp drowned_data
data remove storage gm4_undead_players:temp drowned_data

# Remove the temporary "new" tag from the drowned.
tag @s remove gm4_undead_player_new
