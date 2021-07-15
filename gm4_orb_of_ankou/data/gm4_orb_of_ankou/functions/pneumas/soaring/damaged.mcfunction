#@s = player with active soaring pneuma that has been damaged
#run from pneumas/advancement_triggers/player_damaged

summon area_effect_cloud ~ ~ ~ {Duration:1,Particle:"block air",Tags:["gm4_oa_soaring_location"]}
tp @e[tag=gm4_oa_soaring_location,limit=1,distance=..0.1] @s
tag @s add gm4_oa_soaring_damaged
schedule function gm4_orb_of_ankou:pneumas/temp_tick/soaring_damaged 1t
