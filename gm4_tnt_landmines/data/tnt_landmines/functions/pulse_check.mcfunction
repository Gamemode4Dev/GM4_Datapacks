#compares assigned run tick to current tick and calls main
execute if score current_tick gm4_clock_tick = tnt_landmines gm4_clock_tick run function tnt_landmines:main
execute as @e[type=armor_stand,tag=gm4_tnt_mine,tag=gm4_armed] at @s run function tnt_landmines:checks/blowup
