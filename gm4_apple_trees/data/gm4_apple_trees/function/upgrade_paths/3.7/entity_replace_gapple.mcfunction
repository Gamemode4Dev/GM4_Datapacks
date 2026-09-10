# upgrades armor stands to item displays and interaction entities
# @s = gm4_golden_apple armor stand
# located at center of leaf above their head

# summon item display
summon minecraft:item_display ~ ~ ~ {CustomName:"gm4_golden_apple",item:{id:"minecraft:golden_apple",count:1},Tags:['gm4_golden_apple','smithed.entity','smithed.strict','gm4_new_upgrade_gapple'],transformation:{right_rotation:{angle:1.57,axis:[0.0,1.0,0.0]},scale:[0.55f,0.55f,0.55f],left_rotation:{axis:[0,0,0],angle:0},translation:[0.25,-0.71,-0.06]}}

# fix facing direction
execute positioned as @e[type=item_display,tag=gm4_new_upgrade_gapple,distance=..10] run teleport @e[type=item_display,tag=gm4_new_upgrade_gapple,distance=..10] ~ ~ ~ ~ ~

# update scores and tags
scoreboard players operation @e[type=item_display,tag=gm4_new_upgrade_gapple,distance=..10] gm4_fruit_age = @s gm4_fruit_age
scoreboard players operation @e[type=item_display,tag=gm4_new_upgrade_gapple,distance=..10] gm4_fruit_stage = @s gm4_fruit_stage
scoreboard players set @e[type=item_display,tag=gm4_new_upgrade_gapple,distance=..10] gm4_entity_version 3
execute if entity @s[tag=gm4_ripe_apple] run tag @e[type=item_display,tag=gm4_new_upgrade_gapple,distance=..10] add gm4_ripe_apple

# if ripe, summon interaction
execute if entity @s[tag=gm4_ripe_apple] run summon minecraft:interaction ^0.25 ^-0.95 ^-0.06 {Tags:["gm4_golden_apple_interaction","smithed.entity","smithed.strict"],height:0.4,width:0.4,response:true}

# if unripe, give alternate texture
execute if entity @s[tag=!gm4_ripe_apple] if items entity @s weapon.offhand minecraft:golden_apple run item replace entity @e[type=item_display,tag=gm4_new_upgrade_gapple,distance=..10] contents with minecraft:golden_apple[custom_model_data={strings:["gm4_golden_apple_trees:block/golden_apple_unripe"]}] 1

# if not grown, remove item
execute if entity @s[tag=!gm4_ripe_apple] unless items entity @s weapon.offhand minecraft:golden_apple run item replace entity @e[type=item_display,tag=gm4_new_upgrade_gapple,distance=..10] contents with minecraft:air 1

# cleanup
tag @e[type=item_display,tag=gm4_new_upgrade_gapple,distance=..10] remove gm4_new_upgrade_gapple
kill @s
