# @s = any player who has been damaged
# run from advancement "triggers/damaged"

advancement revoke @s only gm4_orb_of_ankou:triggers/damaged

execute if entity @s[tag=gm4_pneuma_retreating] run function gm4_orb_of_ankou:pneumas/retreating

effect give @s[tag=gm4_pneuma_aggressive] strength 3 1 true

execute if entity @s[tag=gm4_pneuma_volatile] run function gm4_orb_of_ankou:pneumas/volatile

execute if entity @s[tag=gm4_pneuma_feigning,scores={gm4_health=..10}] run function gm4_orb_of_ankou:pneumas/feigning/apply

execute if entity @s[tag=gm4_oa_soaring_off_ground] run function gm4_orb_of_ankou:pneumas/soaring/damaged
