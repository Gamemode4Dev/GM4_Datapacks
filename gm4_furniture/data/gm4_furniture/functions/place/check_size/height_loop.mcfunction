# check if furniture fits here
# @s = player who placed the furniture player head
# at the center of the placed block rotated along axis to face towards player or away from the wall, positioned ^ ^ ^x
# run from place/check_size/height_prep
# run from here

execute unless block ~ ~ ~ #gm4:replaceable run scoreboard players set $placement_blocked gm4_furniture_data 1
execute if score $placement_blocked gm4_furniture_data matches 0 align y if entity @e[type=interaction,tag=gm4_furniture,tag=!gm4_new_furniture,distance=..0.1] run scoreboard players set $placement_blocked gm4_furniture_data 1
execute if score $placement_blocked gm4_furniture_data matches 1 run return 0
summon marker ~ ~ ~ {Tags:["gm4_furniture","gm4_furniture.marked_block"]}

scoreboard players add $height_done gm4_furniture_data 1
execute if score $height_done gm4_furniture_data = $height gm4_furniture_data run scoreboard players reset $height_done gm4_furniture_data
execute if score $height_done gm4_furniture_data < $height gm4_furniture_data positioned ^ ^1 ^ run function gm4_furniture:place/check_size/height_loop
