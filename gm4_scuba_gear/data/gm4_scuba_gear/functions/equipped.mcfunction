execute if entity @s[tag=!gm4_in_water,predicate=gm4_scuba_gear:tank_equipped] at @s if block ~ ~1 ~ #gm4:water run function gm4_scuba_gear:breathe
execute if entity @s[tag=!gm4_in_water,predicate=gm4_scuba_gear:tank_equipped] at @s if block ~ ~1 ~ #gm4:waterloggable[waterlogged=true] run function gm4_scuba_gear:breathe
effect give @s[scores={gm4_sg_swim=1..},predicate=gm4_scuba_gear:flippers_equipped] dolphins_grace 3 0 true
