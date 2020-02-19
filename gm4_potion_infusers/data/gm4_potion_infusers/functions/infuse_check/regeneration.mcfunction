#@s = potion tank
#run function from infusion_check

execute unless entity @s[tag=gm4_pi_infuser] positioned ~ ~ ~-1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ #potion_infusers:coral_fans run function gm4_potion_infusers:infuse_prime/corals/check
execute unless entity @s[tag=gm4_pi_infuser] positioned ~ ~ ~1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ #potion_infusers:coral_fans run function gm4_potion_infusers:infuse_prime/corals/check
execute unless entity @s[tag=gm4_pi_infuser] positioned ~-1 ~ ~ unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ #potion_infusers:coral_fans run function gm4_potion_infusers:infuse_prime/corals/check
execute unless entity @s[tag=gm4_pi_infuser] positioned ~1 ~ ~ unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ #potion_infusers:coral_fans run function gm4_potion_infusers:infuse_prime/corals/check
execute unless entity @s[tag=gm4_pi_infuser] positioned ~-1 ~ ~-1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ #potion_infusers:coral_fans run function gm4_potion_infusers:infuse_prime/corals/check
execute unless entity @s[tag=gm4_pi_infuser] positioned ~1 ~ ~-1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ #potion_infusers:coral_fans run function gm4_potion_infusers:infuse_prime/corals/check
execute unless entity @s[tag=gm4_pi_infuser] positioned ~-1 ~ ~1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ #potion_infusers:coral_fans run function gm4_potion_infusers:infuse_prime/corals/check
execute unless entity @s[tag=gm4_pi_infuser] positioned ~1 ~ ~1 unless entity @e[type=area_effect_cloud,tag=gm4_infusing,distance=..0.2] if block ~ ~ ~ #potion_infusers:coral_fans run function gm4_potion_infusers:infuse_prime/corals/check
