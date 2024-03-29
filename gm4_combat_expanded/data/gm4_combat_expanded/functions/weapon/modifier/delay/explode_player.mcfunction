# activate delayed damage on players
# @s = entity delay exploding
# at @s
# run from weapon/modifier/delay/tick

function gm4_combat_expanded:player/calculate_hp

execute if entity @s[tag=gm4_ce_delay_lvl_1] store result storage gm4_combat_expanded:temp damage_player.damage int 1 run scoreboard players set $delay_damage gm4_ce_data 8
execute if entity @s[tag=gm4_ce_delay_lvl_2] store result storage gm4_combat_expanded:temp damage_player.damage int 1 run scoreboard players set $delay_damage gm4_ce_data 12
execute if entity @s[tag=gm4_ce_delay_lvl_3] store result storage gm4_combat_expanded:temp damage_player.damage int 1 run scoreboard players set $delay_damage gm4_ce_data 16

# damage player if they are alive
execute if score $delay_damage gm4_ce_data < @s gm4_ce_health.current run function gm4_combat_expanded:weapon/modifier/delay/explode_player_eval with storage gm4_combat_expanded:temp damage_player

# kill player if health reached 0
execute if score $delay_damage gm4_ce_data >= s gm4_ce_health.current run function gm4_combat_expanded:weapon/modifier/delay/player_death

# reset entity
scoreboard players reset @s gm4_ce_t_delay
tag @s remove gm4_ce_delay_active
tag @s remove gm4_ce_delay_lvl_1
tag @s remove gm4_ce_delay_lvl_2
tag @s remove gm4_ce_delay_lvl_3

# particles and sound
execute anchored eyes run particle minecraft:sweep_attack ^ ^ ^ 0.3 0.3 0.3 0.1 3
particle minecraft:cloud ~ ~0.5 ~ 0.4 0.2 0.4 0.2 8
playsound minecraft:block.bell.use player @a ~ ~ ~ 0.7 1.6

# cleanup
data remove storage gm4_combat_expanded:temp damage_player
