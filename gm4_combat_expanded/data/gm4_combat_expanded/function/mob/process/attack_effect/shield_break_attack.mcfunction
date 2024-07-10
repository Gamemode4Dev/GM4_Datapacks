# disable players shield if hit by a shield break attack while blocking
# @s = player that was hit
# at unspecified
advancement revoke @s only gm4_combat_expanded:damaged/mob/shield_break
say shield break!
function gm4_combat_expanded:effect/shield_break/apply
