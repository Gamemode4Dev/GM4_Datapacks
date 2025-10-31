
# get stats from glider
execute store result score $grounded gm4_horse_data run data get entity @s equipment.body.components."minecraft:custom_data".gm4_horsemanship.glider.grounded

# get player pitch level
scoreboard players set $pitch gm4_horse_data 0
execute on passengers if entity @s[type=player] store result score $pitch gm4_horse_data run data get entity @s Rotation[1] 0.1
execute if score $pitch gm4_horse_data matches ..-1 run scoreboard players add $pitch gm4_horse_data 1

# if not riding ignore pitch
execute if score $riding gm4_horse_data matches 0 run scoreboard players set $pitch gm4_horse_data 0

# out of stamina (fall down)
execute if entity @s[tag=gm4_horse.tired] run scoreboard players set $pitch gm4_horse_data 25

# update glider
execute if score $grounded gm4_horse_data matches 0 if score $on_ground gm4_horse_data matches 1 unless score $pitch gm4_horse_data matches ..-1 run function gm4_horsemanship:horse_processing/glider/ground
execute if score $grounded gm4_horse_data matches 1 if score $pitch gm4_horse_data matches ..-2 run function gm4_horsemanship:horse_processing/glider/fly

# if flying update Y motion based on looking direction
execute if score $grounded gm4_horse_data matches 1 run return 0

# set gravity based on pitch
scoreboard players operation $set_gravity gm4_horse_data = $pitch gm4_horse_data
scoreboard players remove $set_gravity gm4_horse_data 50
execute store result entity @s equipment.body.components."minecraft:attribute_modifiers"[{"type":"minecraft:gravity","id":"gm4_horsemanship:horse_wings"}].amount float 0.02 run scoreboard players get $set_gravity gm4_horse_data
