# checks drop chance against random
# run from reeling/stealable/steal_slot/*

execute store result score $rand gm4_reeling_rods.math run random value 1..1000
execute if score $rand gm4_reeling_rods.math <= $drop_chance gm4_reeling_rods.math run return 1
return fail
