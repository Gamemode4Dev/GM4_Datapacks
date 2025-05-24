# @s = player with expeditious pneuma who stopped sneaking
# run from pneumas/expeditious/attempt

# get sneak-number-based distance
execute if score @s gm4_oa_snk_num matches 10..19 store result storage gm4_orb_of_ankou:temp pos.x int 1 run random value -4..4
execute if score @s gm4_oa_snk_num matches 10..19 store result storage gm4_orb_of_ankou:temp pos.z int 1 run random value -4..4
execute if score @s gm4_oa_snk_num matches 20..39 store result storage gm4_orb_of_ankou:temp pos.x int 1 run random value -8..8
execute if score @s gm4_oa_snk_num matches 20..39 store result storage gm4_orb_of_ankou:temp pos.z int 1 run random value -8..8
execute if score @s gm4_oa_snk_num matches 40..59 store result storage gm4_orb_of_ankou:temp pos.x int 1 run random value -12..12
execute if score @s gm4_oa_snk_num matches 40..59 store result storage gm4_orb_of_ankou:temp pos.z int 1 run random value -12..12
execute if score @s gm4_oa_snk_num matches 60.. store result storage gm4_orb_of_ankou:temp pos.x int 1 run random value -16..16
execute if score @s gm4_oa_snk_num matches 60.. store result storage gm4_orb_of_ankou:temp pos.z int 1 run random value -16..16

function gm4_orb_of_ankou:pneumas/expeditious/get_pos with storage gm4_orb_of_ankou:temp pos
data remove storage gm4_orb_of_ankou:temp pos
