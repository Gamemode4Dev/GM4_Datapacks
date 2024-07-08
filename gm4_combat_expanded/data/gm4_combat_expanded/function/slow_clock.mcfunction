schedule function gm4_combat_expanded:slow_clock 30s

# get moon cycle (0 = new moon, 4 = full moon)
execute store result score $moon gm4_ce_data run time query day
scoreboard players operation $moon gm4_ce_data %= #8 gm4_ce_data
scoreboard players set $8 gm4_ce_data 8
execute if score $moon gm4_ce_data matches ..3 store result score $moon gm4_ce_data run scoreboard players operation $8 gm4_ce_data -= $moon gm4_ce_data
scoreboard players remove $moon gm4_ce_data 4

# check bed markers
execute as @e[type=marker,tag=gm4_ce_bed] at @s unless block ~ ~ ~ #beds run kill @s

# toxic creepers
execute as @e[type=creeper,tag=gm4_ce_toxic_creeper] run function gm4_combat_expanded:mob/process/toxic_creeper

# cloaked crepers
effect give @e[type=creeper,tag=gm4_ce_cloaked_creeper] invisibility 33 0
