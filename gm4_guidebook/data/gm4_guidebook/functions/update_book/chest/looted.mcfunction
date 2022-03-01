# inserts the guidebook into 45% of village chests
# @s = player that just looted a village chest
# located at @s
# run from advancement gm4_guidebook:loot_village_chest

# revoke advancement
advancement revoke @s only gm4_guidebook:loot_village_chest

# raycast to chest block
summon marker ~ ~ ~ {Tags:["gm4_guidebook_chest_ray"]}
execute anchored eyes positioned ^ ^ ^ anchored feet run tp @e[type=marker,tag=gm4_guidebook_chest_ray,limit=1] ^ ^ ^ ~ ~
scoreboard players set $ray gm4_count 0
execute as @e[type=marker,tag=gm4_guidebook_chest_ray,limit=1] at @s run function gm4_guidebook:update_book/chest/ray

# if the chest was found, attempt to insert the guidebook
execute at @e[type=marker,tag=gm4_ray_loc,limit=1] unless data block ~ ~ ~ LootTableSeed if predicate gm4_guidebook:chance_chest run loot insert ~ ~ ~ loot gm4_guidebook:items/guidebook
execute at @e[type=marker,tag=gm4_ray_loc,limit=1] if data block ~ ~ ~ LootTableSeed run function gm4_guidebook:update_book/chest/insert_seed_random

# clean up
kill @e[type=marker,tag=gm4_guidebook_chest_ray]
kill @e[type=marker,tag=gm4_ray_loc]
scoreboard players reset $ray gm4_count
scoreboard players reset $found gm4_count
