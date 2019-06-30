#@s = potion tank
#run function from infusion_check

execute if score @s gm4_lt_value matches 9.. unless entity @s[tag=gm4_pi_infuser] positioned ~ ~ ~-1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ beacon run function potion_infusers:infuse_prime/conduit
execute if score @s gm4_lt_value matches 9.. unless entity @s[tag=gm4_pi_infuser] positioned ~ ~ ~1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ beacon run function potion_infusers:infuse_prime/conduit
execute if score @s gm4_lt_value matches 9.. unless entity @s[tag=gm4_pi_infuser] positioned ~-1 ~ ~ unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ beacon run function potion_infusers:infuse_prime/conduit
execute if score @s gm4_lt_value matches 9.. unless entity @s[tag=gm4_pi_infuser] positioned ~1 ~ ~ unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ beacon run function potion_infusers:infuse_prime/conduit
execute if score @s gm4_lt_value matches 9.. unless entity @s[tag=gm4_pi_infuser] positioned ~-1 ~ ~-1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ beacon run function potion_infusers:infuse_prime/conduit
execute if score @s gm4_lt_value matches 9.. unless entity @s[tag=gm4_pi_infuser] positioned ~1 ~ ~-1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ beacon run function potion_infusers:infuse_prime/conduit
execute if score @s gm4_lt_value matches 9.. unless entity @s[tag=gm4_pi_infuser] positioned ~-1 ~ ~1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ beacon run function potion_infusers:infuse_prime/conduit
execute if score @s gm4_lt_value matches 9.. unless entity @s[tag=gm4_pi_infuser] positioned ~1 ~ ~1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ beacon run function potion_infusers:infuse_prime/conduit

execute unless entity @s[tag=gm4_pi_infuser] positioned ~ ~ ~-1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ #potion_infusers:dead_corals run function potion_infusers:infuse_prime/live_corals/check
execute unless entity @s[tag=gm4_pi_infuser] positioned ~ ~ ~1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ #potion_infusers:dead_corals run function potion_infusers:infuse_prime/live_corals/check
execute unless entity @s[tag=gm4_pi_infuser] positioned ~-1 ~ ~ unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ #potion_infusers:dead_corals run function potion_infusers:infuse_prime/live_corals/check
execute unless entity @s[tag=gm4_pi_infuser] positioned ~1 ~ ~ unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ #potion_infusers:dead_corals run function potion_infusers:infuse_prime/live_corals/check
execute unless entity @s[tag=gm4_pi_infuser] positioned ~-1 ~ ~-1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ #potion_infusers:dead_corals run function potion_infusers:infuse_prime/live_corals/check
execute unless entity @s[tag=gm4_pi_infuser] positioned ~1 ~ ~-1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ #potion_infusers:dead_corals run function potion_infusers:infuse_prime/live_corals/check
execute unless entity @s[tag=gm4_pi_infuser] positioned ~-1 ~ ~1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ #potion_infusers:dead_corals run function potion_infusers:infuse_prime/live_corals/check
execute unless entity @s[tag=gm4_pi_infuser] positioned ~1 ~ ~1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ #potion_infusers:dead_corals run function potion_infusers:infuse_prime/live_corals/check
