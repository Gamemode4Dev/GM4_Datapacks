

# select random roll
summon marker ~ ~ ~ {CustomName:'"GM4 GV Random Roll"',Tags:["gm4_gv_random_num"]}
execute store result score $random_roll gm4_gv_math_num run data get entity @e[type=marker,tag=gm4_gv_random_num,limit=1] UUID[3]
scoreboard players operation $random_roll gm4_gv_math_num %= $random_pool gm4_gv_math_num
kill @e[type=marker,tag=gm4_gv_random_num]
