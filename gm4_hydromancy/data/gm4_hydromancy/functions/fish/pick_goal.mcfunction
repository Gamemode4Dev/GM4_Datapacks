# pick a goal plant for newly tagged tropical fish
# @s = marker
# at coral flower positioned ~-5.5 ~-6.5 ~-5.5
# run from fish/tag

execute store result score $fish_goal gm4_hy_data run data get entity @s UUID[0]
scoreboard players operation $fish_goal gm4_hy_data %= #4 gm4_hy_data
kill @s

# | goals
# 0: lily pad
# 1: seagrass
# 2: sea pickle
# 3: kelp
