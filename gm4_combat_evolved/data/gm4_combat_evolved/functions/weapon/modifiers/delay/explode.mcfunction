# run from weapon/modifiers/delay/tick
# @s = entity delay exploding
# at @s

# get level
execute if entity @s[tag=gm4_cd_delay_lvl_1] run scoreboard players set $level gm4_ce_data 1
execute if entity @s[tag=gm4_cd_delay_lvl_2] run scoreboard players set $level gm4_ce_data 2
execute if entity @s[tag=gm4_cd_delay_lvl_3] run scoreboard players set $level gm4_ce_data 3

# reset entity
scoreboard players reset @s gm4_ce_t_delay
tag @s remove gm4_cd_delay_active
tag @s remove gm4_cd_delay_lvl_1
tag @s remove gm4_cd_delay_lvl_2
tag @s remove gm4_cd_delay_lvl_3

# damage entities in the blast zone
execute if score $level gm4_ce_data matches 1 as @e[distance=..0.8,team=!gm4_invalid,type=!player] run function gm4_combat_evolved:weapon/modifiers/delay/damaged
execute if score $level gm4_ce_data matches 2 as @e[distance=..1.6,team=!gm4_invalid,type=!player] run function gm4_combat_evolved:weapon/modifiers/delay/damaged
execute if score $level gm4_ce_data matches 3 as @e[distance=..2.4,team=!gm4_invalid,type=!player] run function gm4_combat_evolved:weapon/modifiers/delay/damaged

# particles and sound
execute anchored eyes run particle minecraft:sweep_attack ^ ^ ^ 0.3 0.3 0.3 0.1 3
particle minecraft:cloud ~ ~0.5 ~ 0.4 0.2 0.4 0.2 8
playsound minecraft:block.bell.use player @a ~ ~ ~ 0.7 1.6
