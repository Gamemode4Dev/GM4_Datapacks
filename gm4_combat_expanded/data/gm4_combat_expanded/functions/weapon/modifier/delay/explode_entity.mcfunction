# activate delayed damage on non-players
# @s = entity delay exploding
# at @s
# run from weapon/modifier/delay/tick

# get current health
# remove 1 less than intended to let wither damage effect show
execute store result score $health gm4_ce_data run data get entity @s Health
execute if entity @s[tag=gm4_cd_delay_lvl_1] run scoreboard players remove $health gm4_ce_data 3
execute if entity @s[tag=gm4_cd_delay_lvl_2] run scoreboard players remove $health gm4_ce_data 5
execute if entity @s[tag=gm4_cd_delay_lvl_3] run scoreboard players remove $health gm4_ce_data 7

# reduce health or kill entity
execute if score $health gm4_ce_data matches ..0 run kill @s
execute if score $health gm4_ce_data matches 1.. store result entity @s Health float 1 run scoreboard players get $health gm4_ce_data
effect give @s wither 1 1 true

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
