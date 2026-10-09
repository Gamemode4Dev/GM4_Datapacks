# add data
$data merge entity @s {teleport_duration:2,interpolation_duration:2,Tags:["gm4_swings.swing"],item:{id:"minecraft:diamond",components:{"minecraft:item_model":"$(item_model)","minecraft:custom_data":$(custom_data),"minecraft:custom_model_data":{floats:[$(length)]}}},transformation:{left_rotation:[0.0f,0.0,0.0f,1.0f],translation:[0.0f,0.0625f,0.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[1.0f,1.0f,1.0f]}}

# rotate
rotate @s ~ ~

# assign score
scoreboard players add $global gm4_swings.id 1
scoreboard players operation @s gm4_swings.id = $global gm4_swings.id

# create break interaction
execute summon minecraft:interaction run function gm4_swings:swing/break_interaction

# create seat
data modify storage gm4_swings:temp swings.rotation set from entity @s Rotation[0]
$execute rotated as @s positioned ^ ^-$(length) ^ positioned ^ ^-0.5 ^ run function gm4_swings:seat/create with storage gm4_swings:temp swings

# set initial velocity
scoreboard players set @s gm4_swings.angular_velocity 0

# set length
$scoreboard players set @s gm4_swings.length $(length)
