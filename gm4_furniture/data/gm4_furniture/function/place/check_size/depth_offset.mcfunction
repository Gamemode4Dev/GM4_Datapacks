# check if furniture fits here
# @s = player who placed the furniture player head
# at the center of the placed block rotated along axis to face towards player or away from the wall, positioned ^ ^ ^x
# run from place/check_size/depth_prep
# run from here

execute unless block ~ ~ ~ #gm4:replaceable run scoreboard players set $placement_blocked gm4_furniture_data 1
execute if score $placement_blocked gm4_furniture_data matches 0 align y if entity @e[type=interaction,tag=gm4_furniture,tag=!gm4_new_furniture,distance=..0.1] run scoreboard players set $placement_blocked gm4_furniture_data 1
execute if score $placement_blocked gm4_furniture_data matches 1 run return 0
summon marker ~ ~ ~ {Tags:["gm4_furniture","gm4_furniture.marked_block","gm4_furniture.depth_marker"]}
