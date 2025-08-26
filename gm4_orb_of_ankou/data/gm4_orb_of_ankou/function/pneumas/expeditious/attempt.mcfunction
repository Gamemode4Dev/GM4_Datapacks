# @s = player with expeditious pneuma who stopped sneaking
# run from pneumas/sneak/stopped

execute if score @s gm4_oa_snk_num matches ..9 run return fail
scoreboard players set expeditious_attempt gm4_pneuma_data 0
function gm4_orb_of_ankou:pneumas/expeditious/randomize
