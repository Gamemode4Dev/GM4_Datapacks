# run from weapon/modifiers/delay/tick
# @s = entity delay exploding
# at @s

# damage undead
execute if entity @s[tag=gm4_cd_delay_lvl_1,predicate=gm4_combat_evolved:mobs/undead] run effect give @s instant_health 1 0
execute if entity @s[tag=gm4_cd_delay_lvl_2,predicate=gm4_combat_evolved:mobs/undead] run effect give @s instant_health 1 1
execute if entity @s[tag=gm4_cd_delay_lvl_3,predicate=gm4_combat_evolved:mobs/undead] run effect give @s instant_health 1 2
# damage living
execute if entity @s[tag=gm4_cd_delay_lvl_1,predicate=!gm4_combat_evolved:mobs/undead] run effect give @s instant_damage 1 0
execute if entity @s[tag=gm4_cd_delay_lvl_2,predicate=!gm4_combat_evolved:mobs/undead] run effect give @s instant_damage 1 1
execute if entity @s[tag=gm4_cd_delay_lvl_3,predicate=!gm4_combat_evolved:mobs/undead] run effect give @s instant_damage 1 2

# reset entity
scoreboard players reset @s gm4_ce_t_delay
tag @s remove gm4_cd_delay_active
tag @s remove gm4_cd_delay_lvl_1
tag @s remove gm4_cd_delay_lvl_2
tag @s remove gm4_cd_delay_lvl_3

# particles and sound
execute anchored eyes run particle minecraft:sweep_attack ^ ^ ^ 0.3 0.3 0.3 0.1 3
particle minecraft:cloud ~ ~0.5 ~ 0.4 0.2 0.4 0.2 8
playsound minecraft:block.bell.use player @a ~ ~ ~ 0.7 1.6
