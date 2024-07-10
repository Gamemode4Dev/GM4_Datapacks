
execute if predicate gm4_combat_expanded:technical/chance/frost_elite_warning_particle run particle snowflake ^ ^ ^4.8 0.005 0.005 0.005 0 1 normal
scoreboard players remove $frost_ring_pitch gm4_ce_data 5
execute if score $frost_ring_pitch gm4_ce_data matches -85.. rotated ~5 ~-5 run function gm4_combat_expanded:mob/process/elite/frost/warning_pitch_loop_small
