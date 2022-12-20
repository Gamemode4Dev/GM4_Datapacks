# update leaf marker and update player's hand items
# @s = player taking apple from tree while holding an item
# located at @s
# run from advancement apple_hand_item

advancement revoke @s only gm4_golden_apple_trees:apple_hand_item

tag @s add gm4_apple_take

execute store result score $item_count gm4_apple_data run data get entity @s SelectedItem.Count
execute positioned ^ ^ ^2.5 as @e[type=minecraft:armor_stand,tag=gm4_golden_apple,tag=gm4_ripe_apple,distance=..3,sort=nearest,limit=1,predicate=gm4_golden_apple_trees:apple_picked] at @s align xyz run function gm4_golden_apple_trees:leaf/apple/pick

tag @s remove gm4_apple_take
