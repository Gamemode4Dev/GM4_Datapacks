# apply a random effect to hit mobs
# @s = entity being hit with chaos
# at unspecified
# run from weapon/chaos/activate

execute summon marker run function gm4_combat_expanded:weapon/modifier/chaos/rng

scoreboard players operation $chaos_rng gm4_ce_data %= #14 gm4_ce_data

execute if score $chaos_rng gm4_ce_data matches 0 run effect give @s fire_resistance 6 0
execute if score $chaos_rng gm4_ce_data matches 1 run effect give @s glowing 6 0
execute if score $chaos_rng gm4_ce_data matches 2 run effect give @s invisibility 6 0
execute if score $chaos_rng gm4_ce_data matches 3 run effect give @s jump_boost 6 0
execute if score $chaos_rng gm4_ce_data matches 4 run effect give @s levitation 6 0
execute if score $chaos_rng gm4_ce_data matches 5 run effect give @s poison 6 0
execute if score $chaos_rng gm4_ce_data matches 6 run effect give @s regeneration 6 0
execute if score $chaos_rng gm4_ce_data matches 7 run effect give @s resistance 6 0
execute if score $chaos_rng gm4_ce_data matches 8 run effect give @s slow_falling 6 0
execute if score $chaos_rng gm4_ce_data matches 9 run effect give @s slowness 6 0
execute if score $chaos_rng gm4_ce_data matches 10 run effect give @s speed 6 0
execute if score $chaos_rng gm4_ce_data matches 11 run effect give @s strength 6 0
execute if score $chaos_rng gm4_ce_data matches 12 run effect give @s weakness 6 0
execute if score $chaos_rng gm4_ce_data matches 13 run effect give @s wither 6 0
