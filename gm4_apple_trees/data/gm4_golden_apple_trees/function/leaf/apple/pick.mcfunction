# update leaf stage
# @s = player taking golden apple from tree
# located at @s
# run from advancement apple_pick

advancement revoke @s only gm4_golden_apple_trees:apple_pick

playsound minecraft:entity.item_frame.remove_item block @a[distance=..8] ~ ~ ~ 0.3 0.6

# find interacted-with-entity, with protections for multi-player activations in the same tick
tag @s add gm4_apple_take
execute positioned ^ ^ ^2.5 as @e[type=interaction,tag=gm4_golden_apple_interaction,distance=..3] if data entity @s interaction run tag @s add gm4_apple_taken
execute as @e[type=interaction,tag=gm4_apple_taken,distance=..10] at @s on target unless entity @s[tag=gm4_apple_take] run tag @e[type=interaction,distance=..0,limit=1] remove gm4_apple_taken
execute as @e[type=interaction,tag=gm4_apple_taken,distance=..10,limit=1] at @s positioned ~ ~0.75 ~ align xyz as @e[type=item_display,tag=gm4_golden_apple,tag=gm4_ripe_apple,dx=0,limit=1] run tag @s add gm4_apple_taken

# update item display
execute if predicate gm4_golden_apple_trees:empty_or_gapple_mainhand unless data entity @s SelectedItem.components run tag @e[type=item_display,tag=gm4_apple_taken,distance=..10] add gm4_skip_item_drop
execute as @e[type=item_display,tag=gm4_apple_taken,distance=..10] at @s run function gm4_golden_apple_trees:leaf/set_stage/0

# kill interaction
kill @e[type=interaction,tag=gm4_apple_taken,distance=..10]

# give apple to player directly if possible
execute if items entity @s weapon.mainhand minecraft:golden_apple[count={min:1,max:63}] unless data entity @s SelectedItem.components run item modify entity @s weapon.mainhand {function:"minecraft:set_count",count:1,add:1}
execute if predicate gm4_apple_trees:empty_mainhand run item replace entity @s weapon.mainhand with minecraft:golden_apple 1

tag @s remove gm4_apple_take
