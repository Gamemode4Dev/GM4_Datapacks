#run from gm4_undead_players:summon_drowned
#@s = newly spawned drowned player

# Copy the player name attribute from the undead player.
data modify storage gm4_undead_players:temp name_attribute set from storage gm4_undead_players:temp zombie_data.Attributes[{Name:"minecraft:generic.movement_speed"}].Modifiers[{UUID:[I;-582529518,-1683337792,-1808566840,504901848]}]

# If the undead player was from a previous version, it will not have the name attribute.
execute unless data storage gm4_undead_players:temp name_attribute run data modify storage gm4_undead_players:temp drowned_data set value {CustomName:'{"translate":"entity.gm4.drowned_player","fallback":"Drowned Player"}'}

# Otherwise, generate the drowned name ("Drowned <Name>") based on the name attribute.
execute if data storage gm4_undead_players:temp name_attribute run function gm4_undead_players:set_drowned_name

# Copy other tags from the zombie to the drowned.
data modify storage gm4_undead_players:temp drowned_data.ArmorItems set from storage gm4_undead_players:temp zombie_data.ArmorItems
data modify storage gm4_undead_players:temp drowned_data.HandItems set from storage gm4_undead_players:temp zombie_data.HandItems

# Update the drowned based on the contents of storage.
data modify entity @s {} merge from storage gm4_undead_players:temp drowned_data
data remove storage gm4_undead_players:temp drowned_data

# Remove the temporary "new" tag from the drowned.
tag @s remove gm4_undead_player_new
