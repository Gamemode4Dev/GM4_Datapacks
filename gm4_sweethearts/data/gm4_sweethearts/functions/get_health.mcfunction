# @s = players near sneaking player holding flower
# run from transferring

# get max health of player
execute store result score @s gm4_sh_data run attribute @s minecraft:generic.max_health get

# get current player health
execute store result score @s gm4_sh_health run data get entity @s Health 10
scoreboard players add @s gm4_sh_health 9
scoreboard players operation @s gm4_sh_health /= #10 gm4_sh_health
