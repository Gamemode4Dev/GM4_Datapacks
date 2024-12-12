schedule function gm4_combat_expanded:slow_clock 30s

# calculate player difficulty score every 5 min
scoreboard players add $calc_diff_clock gm4_ce_data 1
execute if score $calc_diff_clock gm4_ce_data matches 10.. as @a[gamemode=!spectator] run function gm4_combat_expanded:player/calculate_difficulty
execute if score $calc_diff_clock gm4_ce_data matches 10.. run scoreboard players set $calc_diff_clock gm4_ce_data 0

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

# cleanup totems
execute as @e[type=armor_stand,tag=gm4_ce_totem] at @s unless entity @a[distance=..32,gamemode=!spectator] run function gm4_combat_expanded:armor/modifier/type/totem/remove
execute as @e[type=block_display,tag=gm4_ce_totem_display] at @s unless entity @e[type=armor_stand,tag=gm4_ce_totem,distance=..5] run kill @s

# cleanup beacon light markers
execute as @e[type=marker,tag=gm4_ce_beacon.store_light] at @s unless entity @e[type=block_display,tag=gm4_ce_beacon,distance=..5] run kill @s
