#create liquid minecarts from hopper minecart
execute as @e[type=hopper_minecart,tag=!gm4_liquid_minecart,nbt={Items:[{id:"minecraft:hopper",Count:1b},{id:"minecraft:iron_trapdoor",Count:1b},{id:"minecraft:comparator",Count:1b},{id:"minecraft:dispenser",Count:1b},{id:"minecraft:bucket",Count:1b}]}] at @s run function liquid_minecarts:create

#detect destroyed liquid minecarts
execute as @e[type=armor_stand,tag=gm4_liquid_minecart_display] at @s unless entity @e[type=command_block_minecart,tag=gm4_liquid_minecart,distance=..0.5] run function liquid_minecarts:destroy

#look for hoppers pointing into or below the liquid minecart
execute as @e[type=command_block_minecart,tag=gm4_liquid_minecart] at @s run function liquid_minecarts:load_check

#minecart level report
execute as @a[gamemode=!spectator] at @s run function liquid_minecarts:level_report_ray
