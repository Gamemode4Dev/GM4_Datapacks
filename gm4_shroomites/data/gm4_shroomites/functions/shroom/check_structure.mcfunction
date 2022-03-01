# makes sure mushroom structure is still present before processing this shroom
# @s = @e[type=marker,tag=gm4_shroomite_shroom]
# at @s
# run from gm4_shroomites:slow_clock

# check that this is still inside a red_mushroom
execute if entity @s[tag=gm4_brown_shroomite] unless block ~ ~ ~ brown_mushroom run kill @s
execute if entity @s[tag=gm4_red_shroomite] unless block ~ ~ ~ red_mushroom run kill @s

# process this shroom
execute if block ~ ~ ~ #gm4_shroomites:mushrooms run function gm4_shroomites:shroom/process

