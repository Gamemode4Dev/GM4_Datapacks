# set this gm4_horses as flying
# @s = tamed gm4_horse
# at @s
# run from horse_processing/glider/process

tag @s add gm4_horse.gliding

data modify entity @s equipment.body.components."minecraft:custom_data".gm4_horsemanship.glider.grounded set value 0
data modify entity @s equipment.body.components."minecraft:attribute_modifiers"[{"type":"minecraft:jump_strength","id":"gm4_horsemanship:horse_wings"}].amount set value -1
data modify entity @s equipment.body.components."minecraft:attribute_modifiers"[{"type":"minecraft:movement_speed","id":"gm4_horsemanship:horse_wings"}].amount set value 1
scoreboard players set $grounded gm4_horse_data 0

tag @s add gm4_horse.target
execute store result storage gm4_horse:temp scale float 0.00001 run attribute @s scale get 100000
summon item_display ~ ~ ~ {teleport_duration:1,Tags:["gm4_horse.glider_wing","gm4_horse.new_glider_wing","gm4_horse.glider_wing.right"],transformation:{scale:[2,2,2],left_rotation:[0,1.5,0,1],right_rotation:[-1,0,0,1],translation:[-0.375,0,0.9375]},Rotation:[90,0],item:{id:"feather",count:1,components:{custom_model_data:"item/glider_wing"}}}
summon item_display ~ ~ ~ {teleport_duration:1,Tags:["gm4_horse.glider_wing","gm4_horse.new_glider_wing","gm4_horse.glider_wing.left"],transformation:{scale:[2,2,2],left_rotation:[0,0.5,0,1],right_rotation:[1,0,0,1],translation:[0.125,0,1]},Rotation:[-90,0],item:{id:"feather",count:1,components:{custom_model_data:"item/glider_wing"}}}
execute as @e[type=item_display,tag=gm4_horse.new_glider_wing,distance=..0.1] run function gm4_horsemanship:horse_processing/glider/wing/init
data remove storage gm4_horse:temp scale
tag @s remove gm4_horse.target
