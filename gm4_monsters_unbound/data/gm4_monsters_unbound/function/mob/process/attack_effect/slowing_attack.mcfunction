# slow players hit with slowing attack
# @s = player that was hit
# at unspecified
advancement revoke @s only gm4_monsters_unbound:damaged/attack_effect/slowing

scoreboard players set $freeze_seconds gm4_mu_data 3
function gm4_monsters_unbound:effect/freeze/apply_chill
