# damage players hit by fire attacks
# @s = player that was hit
# at unspecified
advancement revoke @s only gm4_combat_expanded:damaged/mob/fire

advancement grant @s only gm4_combat_expanded:damaged/detect is_fire
damage @s 7 in_fire
