# process gm4_horses wearing a glider
# @s = tamed gm4_horse
# at @s
# run from horse_processing/general

# get stats from glider
execute store result score $grounded gm4_horse_data run data get entity @s equipment.body.components."minecraft:custom_data".gm4_horsemanship.glider.grounded

# check if horse is even mounted
execute if score $mounted gm4_horse_data matches 0 run return run function gm4_horsemanship:horse_processing/glider/unmounted

# get player pitch level, add deadzone
scoreboard players set $pitch_level gm4_horse_data 0
execute on passengers if entity @s[type=player] store result score $pitch_level gm4_horse_data run data get entity @s Rotation[1] 0.1
execute if score $pitch_level gm4_horse_data matches ..-1 run scoreboard players add $pitch_level gm4_horse_data 1
execute if score $pitch_level gm4_horse_data matches 1.. run scoreboard players remove $pitch_level gm4_horse_data 1

# if not riding ignore pitch
execute if score $riding gm4_horse_data matches 0 run scoreboard players set $pitch_level gm4_horse_data 0

# out of stamina (fall down)
execute if entity @s[tag=gm4_horse.tired] run scoreboard players set $pitch_level gm4_horse_data 25

# check for a jump
execute on passengers if entity @s[type=player,predicate=gm4_horsemanship:jumping]

# update glider
execute if score $grounded gm4_horse_data matches 0 if score $on_ground gm4_horse_data matches 1 unless score $pitch_level gm4_horse_data matches ..-1 run function gm4_horsemanship:horse_processing/glider/ground
execute if score $grounded gm4_horse_data matches 1 if score $pitch_level gm4_horse_data matches ..-2 run function gm4_horsemanship:horse_processing/glider/fly

# if flying update Y motion based on looking direction
execute if score $grounded gm4_horse_data matches 1 run return 0

# set gravity based on pitch
scoreboard players operation $set_gravity gm4_horse_data = $pitch_level gm4_horse_data
scoreboard players remove $set_gravity gm4_horse_data 50
execute store result entity @s equipment.body.components."minecraft:attribute_modifiers"[{"type":"minecraft:gravity","id":"gm4_horsemanship:horse_wings"}].amount float 0.02 run scoreboard players get $set_gravity gm4_horse_data
