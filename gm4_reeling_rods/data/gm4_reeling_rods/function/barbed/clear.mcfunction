# stops bleeding damage
# @s = entity recently hit by a barbed fishing rod
# at @s
# run from barbed/bleed, barbed/on_bleeding_death, and barbed/on_scratch_death

scoreboard players reset @s gm4_reeling_rods.barbed_attacker_uuid0
scoreboard players reset @s gm4_reeling_rods.barbed_attacker_uuid1
scoreboard players reset @s gm4_reeling_rods.barbed_attacker_uuid2
scoreboard players reset @s gm4_reeling_rods.barbed_attacker_uuid3
scoreboard players reset @s gm4_reeling_rods.barbed_damage_period
scoreboard players reset @s gm4_reeling_rods.barbed_damage_timer
