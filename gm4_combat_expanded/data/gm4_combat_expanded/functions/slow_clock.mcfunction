schedule function gm4_combat_expanded:slow_clock 30s

# calculate global difficulty score (go to 10 over 2 hours)
scoreboard players add $diff_clock gm4_ce_data 1
execute if score $diff_clock gm4_ce_data matches 24.. unless score $global_difficulty gm4_ce_data matches 10.. run scoreboard players add $global_difficulty gm4_ce_data 1
execute if score $diff_clock gm4_ce_data matches 24.. run scoreboard players reset $diff_clock gm4_ce_data

# toxic creepers
execute as @e[type=creeper,tag=gm4_ce_toxic_creeper] run function gm4_combat_expanded:mob/effect/toxic_creeper

# cloaked crepers
effect give @e[type=creeper,tag=gm4_ce_cloaked_creeper] invisibility 33 0

# cleanup totem displays (this is just in case a totem dies in an unexpected way)
execute as @e[type=block_display,tag=gm4_ce_totem_display] at @s unless entity @e[type=armor_stand,tag=gm4_ce_totem,distance=..5] run kill @s
