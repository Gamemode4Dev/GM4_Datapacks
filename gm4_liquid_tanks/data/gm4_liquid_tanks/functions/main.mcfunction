#tank creation
execute as @e[type=item,nbt={Item:{id:"minecraft:glass",Count:1b},OnGround:1b}] at @s if block ~ ~ ~ hopper{Items:[{id:"minecraft:bucket",Count:1b},{id:"minecraft:hopper",Count:1b},{id:"minecraft:dispenser",Count:1b},{id:"minecraft:iron_trapdoor",Count:1b},{id:"minecraft:comparator",Count:1b}]} align xyz positioned ~.5 ~ ~.5 unless entity @e[type=armor_stand,tag=gm4_machine,distance=..0.5] run function gm4_liquid_tanks:create

#tank process
execute as @e[type=armor_stand,tag=gm4_liquid_tank] at @s run function gm4_liquid_tanks:process

#tank display maintenance
execute as @e[type=armor_stand,tag=gm4_liquid_tank_display] run data merge entity @s {Fire:20000}

#tank level report
execute as @a[gamemode=!spectator] at @s run function gm4_liquid_tanks:level_report_ray

#self-perpetuating clock
schedule function gm4_liquid_tanks:main 16t
