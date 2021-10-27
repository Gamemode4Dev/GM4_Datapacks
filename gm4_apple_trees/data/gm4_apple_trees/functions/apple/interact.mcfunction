# @s = player taking apple from tree
# at @s
# run from advancement take_apple

advancement revoke @s only gm4_apple_trees:apple_hand_item

tag @s add gm4_apple_take

execute store result score $item_count gm4_apple_data run data get entity @s SelectedItem.Count
execute positioned ^ ^ ^2 as @e[type=minecraft:armor_stand,tag=gm4_ripe_apple,distance=..4,sort=nearest,limit=1,predicate=gm4_apple_trees:apple_picked] run function gm4_apple_trees:apple/pick

tag @s remove gm4_apple_take
