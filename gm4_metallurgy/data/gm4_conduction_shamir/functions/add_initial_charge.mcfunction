# @s = players holding conduction tools, but without a gm4_volt_time score (so players equiping the sword initially)
# at world spawn
# ran from conduction_shamir:main

scoreboard players reset @s gm4_volt_damage
scoreboard players set @s gm4_volt_time 200
effect give @s minecraft:haste 160 3
effect give @s minecraft:strength 160 1 true
