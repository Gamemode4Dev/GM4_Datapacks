#@s = liquid tank
#run from liquid_value_update

#teleport stand down
execute as @e[type=armor_stand,tag=gm4_liquid_tank_display,distance=..0.5,limit=1] at @s run teleport @s ~ ~-.04 ~

scoreboard players add liquid_height_calc gm4_lt_disp_val 1

#loop if needed
execute if score liquid_height_calc gm4_lt_disp_val matches ..-1 run function liquid_tanks:teleport_display_down
