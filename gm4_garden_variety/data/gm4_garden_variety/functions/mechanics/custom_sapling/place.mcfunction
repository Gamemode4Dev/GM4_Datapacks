# @s = player that just placed a fruiting tree sapling
# run from advancement gm4_fruiting_trees:sapling/place_fruiting_sapling

advancement revoke @s only gm4_garden_variety:place_fruiting_sapling

# summon ray
summon marker ~ ~ ~ {Tags:["gm4_tree_ray"]}
execute anchored eyes positioned ^ ^ ^ anchored feet run tp @e[type=marker,tag=gm4_tree_ray,limit=1] ^ ^ ^ ~ ~
scoreboard players set $ray gm4_gv_gen_data 0

# check 5 blocks
execute as @e[type=marker,tag=gm4_tree_ray,limit=1] at @s run function gm4_garden_variety:mechanics/custom_sapling/ray

# recheck 5 blocks (wide range)
execute unless score $found gm4_gv_gen_data matches 1 anchored eyes positioned ^ ^ ^ anchored feet run tp @e[type=marker,tag=gm4_tree_ray,limit=1] ^ ^ ^ ~ ~
execute unless score $found gm4_gv_gen_data matches 1 as @e[type=marker,tag=gm4_tree_ray,limit=1] at @s run function gm4_garden_variety:mechanics/custom_sapling/ray_backup

# get nbt from held sapling
data modify storage gm4_garden_variety:transfer/gv_nbt placed_sapling set from entity @s SelectedItem.tag.gm4_garden_variety

# plant sapling
execute at @e[type=marker,tag=gm4_ray_loc,limit=1] if block ~ ~ ~ #minecraft:saplings run function #gm4_garden_variety:mechanics/custom_sapling/place

# store nbt
execute at @e[type=marker,tag=gm4_ray_loc,limit=1] run data modify entity @e[type=marker,distance=..1,limit=1,tag=gm4_gv_sapling,sort=nearest] data.gm4_garden_variety set from storage gm4_garden_variety:transfer/gv_nbt placed_sapling

# reset
kill @e[type=marker,tag=gm4_tree_ray]
kill @e[type=marker,tag=gm4_ray_loc]
scoreboard players reset $ray gm4_gv_gen_data
scoreboard players reset $found gm4_gv_gen_data
