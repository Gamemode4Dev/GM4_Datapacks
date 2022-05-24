# NOTE remove during 1.20 update: updates old machines to include a marker entity
execute as @e[type=armor_stand,tag=gm4_liquid_tank] at @s run function gm4_liquid_tanks:upgrade_machine_stand
# process machine
execute as @e[type=marker,tag=gm4_liquid_tank] at @s run function gm4_liquid_tanks:process

#tank level report
execute as @a[gamemode=!spectator] at @s run function gm4_liquid_tanks:level_report_ray

#self-perpetuating clock
schedule function gm4_liquid_tanks:main 16t
