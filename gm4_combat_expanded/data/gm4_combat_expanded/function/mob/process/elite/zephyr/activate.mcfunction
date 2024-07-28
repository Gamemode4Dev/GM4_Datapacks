
execute anchored eyes positioned ^ ^-1.15 ^ run particle gust_emitter_small ~ ~ ~ 0 0 0 1 1 normal
playsound minecraft:entity.breeze.wind_burst hostile @a ~ ~ ~ 1 0

# skeletons shoot arrows instead of speed burst
execute if entity @s[type=#gm4_combat_expanded:skeleton_types] run return run function gm4_combat_expanded:mob/process/elite/zephyr/skeleton/start

summon breeze_wind_charge ~ ~ ~ {Motion:[0.0,-5.0,0.0]}
attribute @s generic.movement_speed modifier remove gm4_combat_expanded:elite_buff.speed.charging
attribute @s generic.movement_speed modifier add gm4_combat_expanded:elite_buff.speed.charged 1.5 add_multiplied_total
attribute @s generic.attack_damage modifier add gm4_combat_expanded:elite_buff.speed.charged 0.25 add_multiplied_total

tag @s add gm4_ce_charging_attack
