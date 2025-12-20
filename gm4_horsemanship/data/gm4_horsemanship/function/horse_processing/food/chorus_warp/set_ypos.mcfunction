# code taken from Orb of Ankou - expeditious
# @s = warp marker
# at @s
# run from horse_processing/food/chorus_warp/tp_marker

execute at @s run tp @s ~ ~-1 ~
scoreboard players add $set_y gm4_horse_data 1

execute store result score $warp_safe gm4_horse_data run function gm4_horsemanship:horse_processing/food/chorus_warp/check_warp_location with storage gm4_horsemanship:temp check

execute if score $warp_safe gm4_horse_data matches 1 as @e[type=#gm4_horsemanship:trainable,tag=gm4_horse_warping,limit=1] run function gm4_horsemanship:horse_processing/food/chorus_warp/tp_horse

execute if score $warp_safe gm4_horse_data matches 1 run scoreboard players set $warp_attempt gm4_horse_data 33
execute unless score $set_y gm4_horse_data matches 17.. at @s unless score $warp_safe gm4_horse_data matches 1 run function gm4_horsemanship:horse_processing/food/chorus_warp/set_ypos
