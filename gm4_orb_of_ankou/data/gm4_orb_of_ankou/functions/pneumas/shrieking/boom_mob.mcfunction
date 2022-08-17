# @s = mob hit by sonic boom
# run from pneumas/shrieking/boom

# apply new health
execute store result score $health gm4_pneuma_data run data get entity @s Health 100
scoreboard players remove $health gm4_pneuma_data 1200
execute if score $health gm4_pneuma_data matches 1.. run execute store result entity @s Health float .01 run scoreboard players get $health gm4_pneuma_data
execute if score $health gm4_pneuma_data matches ..0 run kill @s

# knockback mob
## get player pos
data modify storage gm4_oa_shrieking:temp Pos set from entity @a[tag=gm4_oa_shrieker,limit=1] Pos
execute store result score $target_x gm4_pneuma_data run data get storage gm4_oa_shrieking:temp Pos[0]
execute store result score $target_z gm4_pneuma_data run data get storage gm4_oa_shrieking:temp Pos[2]

## get vector
data modify storage gm4_oa_shrieking:temp Pos set from entity @s Pos
execute store result score $motion_x gm4_pneuma_data run data get storage gm4_oa_shrieking:temp Pos[0]
execute store result score $motion_z gm4_pneuma_data run data get storage gm4_oa_shrieking:temp Pos[2]

scoreboard players operation $motion_x gm4_pneuma_data -= $target_x gm4_pneuma_data
scoreboard players operation $motion_z gm4_pneuma_data -= $target_z gm4_pneuma_data

## set motion
execute store result entity @s Motion[0] double 0.2 run scoreboard players get $motion_x gm4_pneuma_data
execute store result entity @s Motion[2] double 0.2 run scoreboard players get $motion_z gm4_pneuma_data
data modify entity @s Motion[1] set value 0.35d

## clean up
data remove storage gm4_oa_shrieking:temp Pos

# visuals
effect give @s resistance 1 4 true
effect give @s[type=#gm4:undead] instant_health
effect give @s[type=!#gm4:undead] instant_damage
