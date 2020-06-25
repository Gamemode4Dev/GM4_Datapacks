tellraw @s ["",{"text":"Kicked ","color":"gray"},{"selector":"@a[tag=gm4_in_bed]"},{"text":" out of bed","color":"gray"}]
tellraw @a[tag=gm4_in_bed] ["",{"text":"Kicked out of bed by ","color":"gray"},{"selector":"@s"}]

effect give @a[tag=gm4_in_bed] minecraft:resistance 1 255 true
effect give @a[tag=gm4_in_bed] minecraft:instant_damage 1 1 true

scoreboard players set @s gm4_sleep_kick 0