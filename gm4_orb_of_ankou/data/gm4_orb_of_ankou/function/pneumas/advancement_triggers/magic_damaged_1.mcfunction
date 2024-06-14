# @s = any player who was hurt by magic that dealt <= 6 health
# run from advancement "triggers/magic_damaged_1"

advancement revoke @s only gm4_orb_of_ankou:triggers/magic_damaged_1
tag @s add gm4_oa_magic_1
tag @s add gm4_oa_magic_damaged
schedule function gm4_orb_of_ankou:pneumas/temp_tick/magic_damaged 1t
