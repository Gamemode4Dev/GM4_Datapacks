#@s = potion tank
#run function from infusion_check

execute if score @s gm4_lt_value matches 6.. unless entity @s[tag=gm4_pi_infuser] positioned ~ ~ ~-1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ poppy run function potion_infusers:infuse_prime/wither_rose
execute if score @s gm4_lt_value matches 6.. unless entity @s[tag=gm4_pi_infuser] positioned ~ ~ ~1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ poppy run function potion_infusers:infuse_prime/wither_rose
execute if score @s gm4_lt_value matches 6.. unless entity @s[tag=gm4_pi_infuser] positioned ~-1 ~ ~ unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ poppy run function potion_infusers:infuse_prime/wither_rose
execute if score @s gm4_lt_value matches 6.. unless entity @s[tag=gm4_pi_infuser] positioned ~1 ~ ~ unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ poppy run function potion_infusers:infuse_prime/wither_rose
execute if score @s gm4_lt_value matches 6.. unless entity @s[tag=gm4_pi_infuser] positioned ~-1 ~ ~-1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ poppy run function potion_infusers:infuse_prime/wither_rose
execute if score @s gm4_lt_value matches 6.. unless entity @s[tag=gm4_pi_infuser] positioned ~1 ~ ~-1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ poppy run function potion_infusers:infuse_prime/wither_rose
execute if score @s gm4_lt_value matches 6.. unless entity @s[tag=gm4_pi_infuser] positioned ~-1 ~ ~1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ poppy run function potion_infusers:infuse_prime/wither_rose
execute if score @s gm4_lt_value matches 6.. unless entity @s[tag=gm4_pi_infuser] positioned ~1 ~ ~1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ poppy run function potion_infusers:infuse_prime/wither_rose
