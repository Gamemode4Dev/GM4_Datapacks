#@s = potion tank
#run function from infusion_check

execute unless entity @s[tag=gm4_pi_infuser] positioned ~ ~ ~-1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ cobblestone run function potion_infusers:infuse_prime/netherrack
execute unless entity @s[tag=gm4_pi_infuser] positioned ~ ~ ~1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ cobblestone run function potion_infusers:infuse_prime/netherrack
execute unless entity @s[tag=gm4_pi_infuser] positioned ~-1 ~ ~ unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ cobblestone run function potion_infusers:infuse_prime/netherrack
execute unless entity @s[tag=gm4_pi_infuser] positioned ~1 ~ ~ unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ cobblestone run function potion_infusers:infuse_prime/netherrack
execute unless entity @s[tag=gm4_pi_infuser] positioned ~-1 ~ ~-1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ cobblestone run function potion_infusers:infuse_prime/netherrack
execute unless entity @s[tag=gm4_pi_infuser] positioned ~1 ~ ~-1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ cobblestone run function potion_infusers:infuse_prime/netherrack
execute unless entity @s[tag=gm4_pi_infuser] positioned ~-1 ~ ~1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ cobblestone run function potion_infusers:infuse_prime/netherrack
execute unless entity @s[tag=gm4_pi_infuser] positioned ~1 ~ ~1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ cobblestone run function potion_infusers:infuse_prime/netherrack

execute if score @s gm4_lt_value matches 3.. unless entity @s[tag=gm4_pi_infuser] positioned ~ ~ ~-1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ potatoes[age=7] run function potion_infusers:infuse_prime/infused_potato
execute if score @s gm4_lt_value matches 3.. unless entity @s[tag=gm4_pi_infuser] positioned ~ ~ ~1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ potatoes[age=7] run function potion_infusers:infuse_prime/infused_potato
execute if score @s gm4_lt_value matches 3.. unless entity @s[tag=gm4_pi_infuser] positioned ~-1 ~ ~ unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ potatoes[age=7] run function potion_infusers:infuse_prime/infused_potato
execute if score @s gm4_lt_value matches 3.. unless entity @s[tag=gm4_pi_infuser] positioned ~1 ~ ~ unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ potatoes[age=7] run function potion_infusers:infuse_prime/infused_potato
execute if score @s gm4_lt_value matches 3.. unless entity @s[tag=gm4_pi_infuser] positioned ~-1 ~ ~-1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ potatoes[age=7] run function potion_infusers:infuse_prime/infused_potato
execute if score @s gm4_lt_value matches 3.. unless entity @s[tag=gm4_pi_infuser] positioned ~1 ~ ~-1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ potatoes[age=7] run function potion_infusers:infuse_prime/infused_potato
execute if score @s gm4_lt_value matches 3.. unless entity @s[tag=gm4_pi_infuser] positioned ~-1 ~ ~1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ potatoes[age=7] run function potion_infusers:infuse_prime/infused_potato
execute if score @s gm4_lt_value matches 3.. unless entity @s[tag=gm4_pi_infuser] positioned ~1 ~ ~1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ potatoes[age=7] run function potion_infusers:infuse_prime/infused_potato

execute unless entity @s[tag=gm4_pi_infuser] positioned ~ ~ ~-1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ slime_block run function potion_infusers:infuse_prime/magma_cube
execute unless entity @s[tag=gm4_pi_infuser] positioned ~ ~ ~1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ slime_block run function potion_infusers:infuse_prime/magma_cube
execute unless entity @s[tag=gm4_pi_infuser] positioned ~-1 ~ ~ unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ slime_block run function potion_infusers:infuse_prime/magma_cube
execute unless entity @s[tag=gm4_pi_infuser] positioned ~1 ~ ~ unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ slime_block run function potion_infusers:infuse_prime/magma_cube
execute unless entity @s[tag=gm4_pi_infuser] positioned ~-1 ~ ~-1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ slime_block run function potion_infusers:infuse_prime/magma_cube
execute unless entity @s[tag=gm4_pi_infuser] positioned ~1 ~ ~-1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ slime_block run function potion_infusers:infuse_prime/magma_cube
execute unless entity @s[tag=gm4_pi_infuser] positioned ~-1 ~ ~1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ slime_block run function potion_infusers:infuse_prime/magma_cube
execute unless entity @s[tag=gm4_pi_infuser] positioned ~1 ~ ~1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ slime_block run function potion_infusers:infuse_prime/magma_cube
