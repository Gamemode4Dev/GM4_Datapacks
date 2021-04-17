#@s = sneaking player with pneuma
#run from main

tag @s add gm4_oa_sneaking
scoreboard players add @s gm4_oa_snk_num 1
execute as @s[tag=gm4_sneak_pneuma] at @s run function gm4_orb_of_ankou:pneumas/sneak/sound

effect give @s[tag=gm4_pneuma_vanishing] invisibility 90 0 true
execute at @a[tag=gm4_pneuma_blinding] run effect give @a[distance=..6,tag=!gm4_pneuma_blinding] blindness 7 1 false
effect give @a[tag=gm4_pneuma_feathery] slow_falling 7 0 true
effect give @a[tag=gm4_pneuma_gazing] night_vision 30 0 true
execute at @s[tag=gm4_pneuma_scaling] anchored eyes positioned ^ ^ ^1 align xyz unless block ~ ~ ~ #gm4:no_collision run effect give @s levitation 1 0 true

execute as @s[tag=gm4_pneuma_phasing] run function gm4_orb_of_ankou:pneumas/phasing/check_traversable

execute if entity @s[tag=gm4_pneuma_soaring,tag=!gm4_oa_soaring_toggled] run function gm4_orb_of_ankou:pneumas/soaring/toggle
