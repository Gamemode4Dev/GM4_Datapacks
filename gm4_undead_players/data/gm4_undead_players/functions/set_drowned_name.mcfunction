#run from gm4_undead_players:init_drowned
#@s = newly spawned drowned player

# Generate name for entity ("Drowned <Name>") based on the contents of the name attribute.
loot replace entity @s armor.head loot gm4_undead_players:drowned_name
data modify storage gm4_undead_players:temp drowned_data.CustomName set from entity @s ArmorItems[3].tag.display.Name

# Copy player name attribute to the drowned (just in case it is needed for future update).
data modify entity @s Attributes[{Name:"minecraft:generic.movement_speed"}].Modifiers append from storage gm4_undead_players:temp name_attribute
data remove storage gm4_undead_players:temp name_attribute

# Clear the temporary item from the drowned.
item replace entity @s armor.head with air
