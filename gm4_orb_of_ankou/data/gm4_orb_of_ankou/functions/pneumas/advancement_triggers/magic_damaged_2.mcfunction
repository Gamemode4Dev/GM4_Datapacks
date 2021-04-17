#@s = any player who was hurt by magic that dealt >= 6 health
#run from advancement "triggers/magic_damaged_2"

advancement revoke @s only gm4_orb_of_ankou:triggers/magic_damaged_2
tag @s add gm4_oa_magic_2
tag @s add gm4_oa_magic_damaged
scoreboard players set magic_damaged gm4_pneuma_data 1
