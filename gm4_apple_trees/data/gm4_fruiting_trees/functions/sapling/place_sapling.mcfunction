# @s = player that just placed a fruiting tree sapling
# run from advancement gm4_fruiting_trees:sapling/place_fruiting_sapling

advancement revoke @s only gm4_fruiting_trees:sapling/place_fruiting_sapling

summon marker ~ ~ ~ {Tags:["gm4_tree_ray"]}
execute anchored eyes positioned ^ ^ ^ anchored feet run tp @e[type=marker,tag=gm4_tree_ray,limit=1] ^ ^ ^ ~ ~
scoreboard players set $ray gm4_count 0
execute as @e[type=marker,tag=gm4_tree_ray,limit=1] at @s run function gm4_fruiting_trees:sapling/ray
execute unless score $found gm4_count matches 1 anchored eyes positioned ^ ^ ^ anchored feet run tp @e[type=marker,tag=gm4_tree_ray,limit=1] ^ ^ ^ ~ ~
execute unless score $found gm4_count matches 1 as @e[type=marker,tag=gm4_tree_ray,limit=1] at @s run function gm4_fruiting_trees:sapling/ray_backup

data modify storage gm4_fruiting_trees:data Sapling.type set from entity @s SelectedItem.tag.gm4_fruiting_trees.item.type
execute at @e[type=marker,tag=gm4_ray_loc,limit=1] if block ~ ~ ~ #minecraft:saplings run function #gm4_fruiting_trees:sapling/initialize

kill @e[type=marker,tag=gm4_tree_ray]
kill @e[type=marker,tag=gm4_ray_loc]
scoreboard players reset $ray gm4_count
scoreboard players reset $found gm4_count
