#create liquid minecarts from hopper minecart
execute as @e[type=item,tag=!gm4_liquid_minecarts_checked,nbt={Item:{id:"minecraft:glass",Count:1b},OnGround:1b}] at @s run function gm4_liquid_minecarts:glass_block

#detect destroyed liquid minecarts
execute as @e[type=armor_stand,tag=gm4_liquid_minecart_display] at @s unless entity @e[type=command_block_minecart,tag=gm4_liquid_minecart,distance=..0.5] run function gm4_liquid_minecarts:destroy

#look for hoppers pointing into or below the liquid minecart
execute as @e[type=command_block_minecart,tag=gm4_liquid_minecart] at @s run function gm4_liquid_minecarts:load_check

#minecart level report
execute as @a[gamemode=!spectator] at @s run function gm4_liquid_minecarts:level_report_ray

#self-perpetuating clock
schedule function gm4_liquid_minecarts:main 16t
