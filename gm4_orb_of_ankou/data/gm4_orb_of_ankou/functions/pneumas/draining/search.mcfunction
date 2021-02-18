#@s = player with draining pneuma who stopped sneaking
#run from pneumas/sneak/stopped

execute if score @s gm4_oa_snk_num matches 3..5 as @a[distance=0.001..16] run function gm4_orb_of_ankou:pneumas/draining/apply_effect
execute if score @s gm4_oa_snk_num matches 6..8 as @a[distance=0.001..32] run function gm4_orb_of_ankou:pneumas/draining/apply_effect
execute if score @s gm4_oa_snk_num matches 9..13 as @a[distance=0.001..48] run function gm4_orb_of_ankou:pneumas/draining/apply_effect
execute if score @s gm4_oa_snk_num matches 14.. as @a[distance=0.001..64] run function gm4_orb_of_ankou:pneumas/draining/apply_effect
