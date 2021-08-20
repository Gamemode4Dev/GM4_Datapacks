#run from gm4_undead_players:summon_zombie
#@s = newly spawned undead player

# Store the original player name in an attribute modifier to be referenced in generating a
# drowned undead player name ("Drowned <Name>" rather than "Undead <Name>").
data modify storage gm4_undead_players:temp name_attribute set value {UUID:[I;-582529518,-1683337792,-1808566840,504901848],Operation:0,Amount:0d}
data modify storage gm4_undead_players:temp name_attribute.Name set from entity @s ArmorItems[3].tag.SkullOwner.Name
data modify entity @s Attributes[{Name:"minecraft:generic.movement_speed"}].Modifiers append from storage gm4_undead_players:temp name_attribute

# Use an item modifier to generate the undead player's CustomName ("Undead <Name>").
item modify entity @s armor.head gm4_undead_players:zombie_name
data modify entity @s CustomName set from entity @s ArmorItems[3].tag.display.Name
data remove storage gm4_undead_players:temp name_attribute

# Clear the temporary item from the undead player's hand and remove the temporary "new" tag.
tag @s remove gm4_undead_player_new
item replace entity @s armor.head with air
