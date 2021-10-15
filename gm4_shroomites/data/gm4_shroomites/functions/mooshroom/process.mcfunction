# runs actions on and as mooshrooms
# @s = @e[type=mooshroom]
# at @s
# run from gm4_shroomites:slow_clock

# chance to spawn shroom unless this mooshroom is on cooldown from previous spawn
execute unless score @s gm4_shroom_data matches 1.. if predicate gm4_shroomites:mooshroom/shroom_spawn_chance if block ~ ~-1 ~ #gm4_shroomites:spore_convertable if block ~ ~ ~ #gm4_shroomites:shroom_replacable unless entity @e[type=marker,tag=gm4_shroomite_shroom,distance=..4.5] run function gm4_shroomites:shroom/create
execute if score @s gm4_shroom_data matches 1.. run scoreboard players remove @s gm4_shroom_data 1

