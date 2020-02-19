#tank process
execute align xyz positioned ~.5 ~1 ~.5 as @e[type=armor_stand,tag=gm4_liquid_tank,limit=1,distance=..0.1,sort=nearest] if score @s gm4_lt_value matches 1.. at @s align xyz positioned ~.5 ~-1 ~.5 run function gm4_potion_infusers:infusion_check

data merge entity @s {Fire:2000s}

particle minecraft:entity_effect ~ ~ ~ .03 1 .03 1 5

execute unless block ~ ~ ~ emerald_block run function gm4_potion_infusers:destroy
