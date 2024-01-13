# Spawns a new version of the item from a loot table and deletes the old item entity
# @s = player head with a match in the registry
# at @s
# run from found_match

# spawn temp item below the world and remember it
$loot spawn ~ -4096 ~ loot $(loot_table)
execute positioned ~ -4096 ~ run tag @e[type=item,limit=1,distance=0,nbt={Age:0s}] add gm4_temp_player_head

# transfer data from new item onto old item
data modify entity @s Item set from entity @e[type=item,tag=gm4_temp_player_head,limit=1] Item

# kill temp item
kill @e[type=item,tag=gm4_temp_player_head,limit=1]
