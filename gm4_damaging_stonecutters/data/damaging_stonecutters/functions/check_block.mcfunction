#checks stonecutter block
#@s - @e[type=!#damaging_stonecutters:no_target]
#called by damaging_stonecutters:pulse_check

#if stonecutter, tick damage
execute if block ~ ~ ~ minecraft:stonecutter run function damaging_stonecutters:check_damage
#unless stonecutter, reset score
execute unless block ~ ~ ~ minecraft:stonecutter run scoreboard players reset @s gm4_ds_dmg_tick
