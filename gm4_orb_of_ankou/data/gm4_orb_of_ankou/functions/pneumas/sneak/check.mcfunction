# @s = sneaking player with pneuma
# run from player

tag @s add gm4_oa_sneaking
scoreboard players add @s gm4_oa_snk_num 1
execute as @s[tag=gm4_sneak_pneuma] at @s run function gm4_orb_of_ankou:pneumas/sneak/sound

execute if score @s[tag=gm4_pneuma_shrieking] gm4_oa_snk_num matches 40 at @s run playsound minecraft:entity.warden.sonic_charge player @a[distance=..16] ~ ~ ~ 1.3
effect give @s[tag=gm4_pneuma_vanishing] invisibility 90 0 true
execute at @s[tag=gm4_pneuma_blinding] run effect give @a[distance=..6,tag=!gm4_pneuma_blinding] blindness 7 1 false
effect give @s[tag=gm4_pneuma_feathery] slow_falling 1 0 true
effect give @s[tag=gm4_pneuma_gazing] night_vision 30 0 true
execute at @s[tag=gm4_pneuma_scaling] anchored eyes positioned ^ ^ ^1 align xyz unless block ~ ~ ~ #gm4:no_collision run effect give @s levitation 1 0 true

execute if entity @s[tag=gm4_pneuma_phasing] run function gm4_orb_of_ankou:pneumas/phasing/check_traversable

execute if entity @s[tag=gm4_pneuma_soaring,tag=!gm4_oa_soaring_toggled] run function gm4_orb_of_ankou:pneumas/soaring/toggle
