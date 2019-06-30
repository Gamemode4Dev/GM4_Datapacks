#@s = potion tank
#run function from infusion_check

execute unless entity @s[tag=gm4_pi_infuser] positioned ~ ~ ~-1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ cobblestone run function potion_infusers:infuse_prime/gravel
execute unless entity @s[tag=gm4_pi_infuser] positioned ~ ~ ~1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ cobblestone run function potion_infusers:infuse_prime/gravel
execute unless entity @s[tag=gm4_pi_infuser] positioned ~-1 ~ ~ unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ cobblestone run function potion_infusers:infuse_prime/gravel
execute unless entity @s[tag=gm4_pi_infuser] positioned ~1 ~ ~ unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ cobblestone run function potion_infusers:infuse_prime/gravel
execute unless entity @s[tag=gm4_pi_infuser] positioned ~-1 ~ ~-1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ cobblestone run function potion_infusers:infuse_prime/gravel
execute unless entity @s[tag=gm4_pi_infuser] positioned ~1 ~ ~-1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ cobblestone run function potion_infusers:infuse_prime/gravel
execute unless entity @s[tag=gm4_pi_infuser] positioned ~-1 ~ ~1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ cobblestone run function potion_infusers:infuse_prime/gravel
execute unless entity @s[tag=gm4_pi_infuser] positioned ~1 ~ ~1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ cobblestone run function potion_infusers:infuse_prime/gravel

execute if score @s gm4_lt_value matches 3.. unless entity @s[tag=gm4_pi_infuser] positioned ~ ~ ~-1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ end_stone run function potion_infusers:infuse_prime/endermite
execute if score @s gm4_lt_value matches 3.. unless entity @s[tag=gm4_pi_infuser] positioned ~ ~ ~1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ end_stone run function potion_infusers:infuse_prime/endermite
execute if score @s gm4_lt_value matches 3.. unless entity @s[tag=gm4_pi_infuser] positioned ~-1 ~ ~ unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ end_stone run function potion_infusers:infuse_prime/endermite
execute if score @s gm4_lt_value matches 3.. unless entity @s[tag=gm4_pi_infuser] positioned ~1 ~ ~ unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ end_stone run function potion_infusers:infuse_prime/endermite
execute if score @s gm4_lt_value matches 3.. unless entity @s[tag=gm4_pi_infuser] positioned ~-1 ~ ~-1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ end_stone run function potion_infusers:infuse_prime/endermite
execute if score @s gm4_lt_value matches 3.. unless entity @s[tag=gm4_pi_infuser] positioned ~1 ~ ~-1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ end_stone run function potion_infusers:infuse_prime/endermite
execute if score @s gm4_lt_value matches 3.. unless entity @s[tag=gm4_pi_infuser] positioned ~-1 ~ ~1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ end_stone run function potion_infusers:infuse_prime/endermite
execute if score @s gm4_lt_value matches 3.. unless entity @s[tag=gm4_pi_infuser] positioned ~1 ~ ~1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ end_stone run function potion_infusers:infuse_prime/endermite
