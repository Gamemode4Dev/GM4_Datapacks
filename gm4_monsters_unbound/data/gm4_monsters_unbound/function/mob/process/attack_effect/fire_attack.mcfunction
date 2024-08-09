# damage players hit by fire attacks
# @s = player that was hit
# at unspecified
advancement revoke @s only gm4_monsters_unbound:damaged/attack_effect/blazing

advancement grant @s only gm4_monsters_unbound:damaged/detect is_fire
damage @s 7 in_fire
