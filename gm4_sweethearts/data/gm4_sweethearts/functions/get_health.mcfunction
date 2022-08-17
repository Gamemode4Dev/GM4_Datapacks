# @s = players near sneaking player holding flower
# run from transferring

# get max health of player
execute store result score @s gm4_sh_data run attribute @s minecraft:generic.max_health get

# get current player health
# health is stored as float, but displayed rounded up as integer (half hearts)
# these commands copy that by multiplying by 10, adding 9 and dividing by 10 again
# this can cause players to give/get more than 0.5f health
execute store result score @s gm4_sh_health run data get entity @s Health 10
scoreboard players add @s gm4_sh_health 9
scoreboard players operation @s gm4_sh_health /= #10 gm4_sh_health
