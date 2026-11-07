# Sets up a new swing
# @s = Item display, unsetup swing main body
# at @s rotated -180..180 0
# run from gm4_swings:place/place
# with $length = Length of the swing being placed
# with $item_model = Item model of the swing being placed
# with $custom_data = Custom data from the swing item

# add data
$data merge entity @s {width:$(length).5,height:-$(length).5,teleport_duration:2,interpolation_duration:2,Tags:["gm4_swings.swing"],item:{id:"minecraft:diamond",components:{"minecraft:item_model":"$(item_model)","minecraft:custom_data":$(custom_data),"minecraft:custom_model_data":{floats:[$(length)]}}},transformation:{left_rotation:[0.0f,0.0,0.0f,1.0f],translation:[0.0f,0.0625f,0.0f],right_rotation:[0.0f,0.0f,0.0f,1.0f],scale:[1.0f,1.0f,1.0f]}}

# rotate
rotate @s ~ ~

# assign score
scoreboard players add $global gm4_swings.id 1
scoreboard players operation @s gm4_swings.id = $global gm4_swings.id

# create break interaction
execute summon minecraft:interaction run function gm4_swings:swing/break_interaction

# create seat
$execute positioned ^ ^-$(length) ^ positioned ^ ^-0.5 ^ run function gm4_swings:seat/create

# set initial velocity
scoreboard players set @s gm4_swings.angular_velocity 0

# set length
$scoreboard players set @s gm4_swings.length $(length)
