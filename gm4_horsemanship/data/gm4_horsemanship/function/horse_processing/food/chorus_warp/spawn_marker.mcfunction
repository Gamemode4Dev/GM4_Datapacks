# spawn a marker and start the moving of it
# @s = warp marker
# at @s align y
# run from horse_processing/food/chorus_warp/attempt

tag @s add gm4_horse_warp_marker
execute store result score $y_pos gm4_horse_data run data get entity @s Pos[1]
scoreboard players set $warp_attempt gm4_horse_data 0

execute at @s run function gm4_horsemanship:horse_processing/food/chorus_warp/randomize
kill @s
