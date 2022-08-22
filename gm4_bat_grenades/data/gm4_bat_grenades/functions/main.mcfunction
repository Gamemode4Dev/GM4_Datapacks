execute at @e[type=bat,tag=!gm4_defused_bat,tag=!smithed.entity] run playsound minecraft:entity.bat.ambient hostile @a[gamemode=!creative,gamemode=!spectator,distance=..7]
execute as @e[type=bat,tag=!gm4_defused_bat,tag=!smithed.entity] at @s if entity @a[gamemode=!creative,gamemode=!spectator,distance=..3] unless entity @s[nbt={NoAI:1b}] run function gm4_bat_grenades:explode

schedule function gm4_bat_grenades:main 16t
