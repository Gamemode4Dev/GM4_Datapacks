execute at @e[type=bat] run playsound minecraft:entity.bat.ambient hostile @a[gamemode=!creative,gamemode=!spectator,distance=..7]
execute as @e[type=bat] at @s if entity @a[gamemode=!creative,gamemode=!spectator,distance=..3] unless entity @s[tag=gm4_defused_bat] unless entity @s[nbt={NoAI:1b}] run function bat_grenades:explode
