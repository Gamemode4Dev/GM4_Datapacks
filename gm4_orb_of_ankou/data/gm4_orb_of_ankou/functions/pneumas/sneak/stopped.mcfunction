# @s = sneaking player with pneuma that stopped sneaking
# run from player

execute if score @s gm4_oa_snk_num matches 3.. as @s[tag=gm4_pneuma_bounding] run function gm4_orb_of_ankou:pneumas/bounding
execute if score @s gm4_oa_snk_num matches 3.. as @s[tag=gm4_pneuma_rushing] run function gm4_orb_of_ankou:pneumas/rushing
execute if score @s gm4_oa_snk_num matches 3.. as @s[tag=gm4_pneuma_conjuring] at @s run function gm4_orb_of_ankou:pneumas/conjuring/prepare
execute if score @s gm4_oa_snk_num matches 3.. as @s[tag=gm4_pneuma_draining] at @s run function gm4_orb_of_ankou:pneumas/draining/search
execute if score @s gm4_oa_snk_num matches 3.. as @s[tag=gm4_pneuma_expeditious] at @s run function gm4_orb_of_ankou:pneumas/expeditious/attempt
execute if score @s gm4_oa_snk_num matches 60.. as @s[tag=gm4_pneuma_shrieking] at @s run function gm4_orb_of_ankou:pneumas/shrieking/release

tag @s remove gm4_oa_sneaking
tag @s remove gm4_oa_soaring_toggled
scoreboard players reset @s gm4_oa_snk_num

tag @s remove gm4_oa_phased
