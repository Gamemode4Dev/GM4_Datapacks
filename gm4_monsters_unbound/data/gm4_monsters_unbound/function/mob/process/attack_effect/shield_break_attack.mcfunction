# disable players shield if hit by a shield break attack while blocking
# @s = player that was hit
# at unspecified
advancement revoke @s only gm4_monsters_unbound:damaged/attack_effect/shield_break
say shield break!
function gm4_monsters_unbound:effect/shield_break/apply
