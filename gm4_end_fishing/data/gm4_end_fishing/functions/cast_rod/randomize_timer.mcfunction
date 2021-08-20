# @s = fishing bait armor stand
# run from cast_rod/summon_bait and go_fish/bobber_animation

summon marker ~ ~ ~ {Tags:["gm4_ef_rand"]}
# randomizes between 19-76
execute store result score $rand gm4_ef_data run data get entity @e[type=marker,tag=gm4_ef_rand,limit=1] UUID[0]
scoreboard players operation $rand gm4_ef_data %= #57 gm4_ef_data
scoreboard players add $rand gm4_ef_data 19

# decrease time depending on lure
scoreboard players operation $decrease gm4_ef_data = @s gm4_ef_lure
scoreboard players operation $decrease gm4_ef_data *= #6 gm4_ef_data
scoreboard players operation $rand gm4_ef_data -= $decrease gm4_ef_data

# set score of fishing bait
scoreboard players operation @s gm4_ef_timer = $rand gm4_ef_data

# clean up
scoreboard players reset $rand gm4_ef_data
scoreboard players reset $decrease gm4_ef_data
kill @e[type=marker,tag=gm4_ef_rand]

# if too low, then re-randomize
execute if score @s gm4_ef_timer matches ..3 run function gm4_end_fishing:cast_rod/randomize_timer
