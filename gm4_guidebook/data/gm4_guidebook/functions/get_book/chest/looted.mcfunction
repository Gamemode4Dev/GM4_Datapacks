# inserts the guidebook into 45% of village chests
# @s = player that just looted a village chest
# located at @s
# run from advancement gm4_guidebook:loot_village_chest

# revoke advancement
advancement revoke @s only gm4_guidebook:loot_village_chest

# raycast to chest block
scoreboard players set $ray gm4_count 50
function gm4_guidebook:get_book/chest/ray

# clean up
scoreboard players reset $ray gm4_count
