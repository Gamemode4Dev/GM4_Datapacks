# check if furniture fits here
# @s = player who placed the furniture player head
# at the center of the placed block rotated along axis to face towards player or away from the wall, positioned ^x ^ ^
# run from place/check_size/length_prep
# run from here

execute unless block ~ ~ ~ #gm4:replaceable run scoreboard players set $placement_blocked gm4_furniture_data 1
execute if score $placement_blocked gm4_furniture_data matches 1 run return 0
summon marker ~ ~ ~ {Tags:["gm4_furniture","gm4_furniture.marked_block"]}

scoreboard players remove $length gm4_furniture_data 1
execute if score $length gm4_furniture_data matches 1.. positioned ^-1 ^ ^ run function gm4_furniture:place/check_size/length_loop
