#run from gm4_undead_players:summon_zombie
#@s = newly spawned undead player

# Store the player's name to storage
data modify storage gm4_undead_players:temp name_attribute.Name set from entity @s equipment.head.components."minecraft:profile".name

# Use an item modifier to generate the undead player's CustomName ("Undead <Name>").
item modify entity @s armor.head gm4_undead_players:zombie_name
data modify entity @s CustomName set from entity @s equipment.head.components."minecraft:custom_name"
data remove storage gm4_undead_players:temp name_attribute

# Clear the temporary item from the undead player's hand and remove the temporary "new" tag.
tag @s remove gm4_undead_player_new
item replace entity @s armor.head with air
