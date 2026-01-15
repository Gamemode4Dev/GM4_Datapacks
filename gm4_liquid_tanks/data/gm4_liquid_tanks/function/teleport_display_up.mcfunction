#@s = liquid tank
#run from liquid_value_update

#teleport display up
execute as @e[type=item_display,tag=gm4_liquid_tank_liquid_display,distance=..0.5,limit=1] at @s run teleport @s ~ ~.04 ~

scoreboard players remove liquid_height_calc gm4_lt_disp_val 1

#loop if needed
execute if score liquid_height_calc gm4_lt_disp_val matches 1.. run function gm4_liquid_tanks:teleport_display_up
