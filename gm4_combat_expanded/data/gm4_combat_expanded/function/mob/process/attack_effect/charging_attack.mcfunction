# damage players hit by fire attacks
# @s = player that was hit
# at unspecified
advancement revoke @s only gm4_combat_expanded:damaged/mob/charging

execute as @e[type=#gm4_combat_expanded:elite_types,tag=gm4_ce_charging_attack,limit=1,sort=nearest] run function gm4_combat_expanded:mob/process/elite/speed/charge_complete

effect give @s slowness 1 3 true
effect give @s nausea 4 0 false
function gm4_combat_expanded:effect/shield_break/apply
