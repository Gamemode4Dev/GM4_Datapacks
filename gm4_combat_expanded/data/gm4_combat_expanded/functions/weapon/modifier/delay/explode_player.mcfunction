# activate delayed damage on players
# @s = entity delay exploding
# at @s
# run from weapon/modifier/delay/tick

function gm4_combat_expanded:player/calculate_hp

# calculate amount of max_health to remove to get to new health
scoreboard players operation $remove_health gm4_ce_data = $max_health gm4_ce_data

scoreboard players operation $remove_health gm4_ce_data -= @s gm4_ce_health
execute if entity @s[tag=gm4_cd_delay_lvl_1] run scoreboard players add $remove_health gm4_ce_data 4
execute if entity @s[tag=gm4_cd_delay_lvl_2] run scoreboard players add $remove_health gm4_ce_data 6
execute if entity @s[tag=gm4_cd_delay_lvl_3] run scoreboard players add $remove_health gm4_ce_data 8

# damage player if they are alive
execute if score $remove_health gm4_ce_data < $max_health gm4_ce_data run function gm4_combat_expanded:player/damage/apply

# kill player if health reached 0
execute if score $remove_health gm4_ce_data >= $max_health gm4_ce_data run function gm4_combat_expanded:weapon/modifier/delay/player_death

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
