execute if entity @s[tag=!gm4_in_water] at @s if block ~ ~1 ~ water run function scuba_gear:breathe
execute if entity @s[tag=!gm4_in_water] at @s if block ~ ~1 ~ #scuba_gear:water_loggable[waterlogged=true] run function scuba_gear:breathe
