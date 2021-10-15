# makes sure mushroom structure is still present before processing this shroom
# @s = @e[type=marker,tag=gm4_shroomite_shroom]
# at @s
# run from gm4_shroomites:slow_clock

# check that this is still inside a red_mushroom
execute unless block ~ ~ ~ red_mushroom run kill @s
execute if block ~ ~ ~ red_mushroom run function gm4_shroomites:shroom/process

