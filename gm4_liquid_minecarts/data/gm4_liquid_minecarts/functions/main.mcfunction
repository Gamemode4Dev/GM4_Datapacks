# NOTE remove during 1.20 update: updates old machines to include a marker entity
execute as @e[type=armor_stand,tag=gm4_liquid_minecart_display] at @s run function gm4_liquid_minecarts:upgrade_machine_cart_stand

#look for hoppers pointing into or below the liquid minecart
execute as @e[type=command_block_minecart,tag=gm4_liquid_minecart] at @s run function gm4_liquid_minecarts:load_check

#minecart level report
execute as @a[gamemode=!spectator] at @s run function gm4_liquid_minecarts:level_report_ray

#self-perpetuating clock
schedule function gm4_liquid_minecarts:main 16t
