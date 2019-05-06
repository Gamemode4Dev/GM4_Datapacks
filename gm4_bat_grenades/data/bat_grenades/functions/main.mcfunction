execute at @e[type=bat] run playsound minecraft:entity.bat.ambient hostile @a[gamemode=!creative,gamemode=!spectator,distance=..7]
execute as @e[type=bat,nbt=!{NoAI:1b}] at @s if entity @a[gamemode=!creative,gamemode=!spectator,distance=..3] run function bat_grenades:explode
