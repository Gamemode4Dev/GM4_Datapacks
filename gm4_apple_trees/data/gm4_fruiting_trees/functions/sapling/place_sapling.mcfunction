# @s = player that just placed a fruiting tree sapling
# run from advancement gm4_fruiting_trees:sapling/place_fruiting_sapling

advancement revoke @s only gm4_fruiting_trees:sapling/place_fruiting_sapling

summon area_effect_cloud ~ ~ ~ {Tags:["gm4_tree_ray"]}
execute anchored eyes positioned ^ ^ ^ anchored feet run tp @e[tag=gm4_tree_ray] ^ ^ ^ ~ ~
scoreboard players set gm4_ray_counter gm4_count 0
execute as @e[tag=gm4_tree_ray] at @s run function gm4_fruiting_trees:sapling/ray

data modify storage gm4_fruiting_trees:data Sapling.type set from entity @s SelectedItem.tag.gm4_fruiting_trees.item.type
execute at @e[tag=gm4_tree_ray] align xyz unless entity @e[type=area_effect_cloud,dx=0,dy=0,dz=0,tag=gm4_fruiting_sapling] run function #gm4_fruiting_trees:sapling/initialize

kill @e[tag=gm4_tree_ray]
