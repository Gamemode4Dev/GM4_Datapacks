# @s = any player who was hurt by an evoker fang
# run from advancement "triggers/magic_evoker_fang"

advancement revoke @s only gm4_orb_of_ankou:triggers/magic_evoker_fang
tag @s add gm4_oa_magic_ignore
tag @s add gm4_oa_magic_damaged
schedule function gm4_orb_of_ankou:pneumas/temp_tick/magic_damaged 1t
