#checks stonecutter damage tick
#@s - @e[type=!#damaging_stonecutters:stonecutter_immune]
#called by damaging_stonecutters:check_block

#add tick
scoreboard players add @s gm4_ds_dmg_tick 1
scoreboard players reset @s[gamemode=!survival,gamemode=!adventure] gm4_ds_dmg_tick

#check score
execute if score @s gm4_ds_dmg_tick matches 1 run function damaging_stonecutters:damage
execute if score @s gm4_ds_dmg_tick matches 10.. run scoreboard players reset @s gm4_ds_dmg_tick
