# damage players hit by fire attacks
# @s = player that was hit
# at unspecified
advancement revoke @s only gm4_monsters_unbound:damaged/attack_effect/charging

execute as @e[type=#gm4_monsters_unbound:elite_types,tag=gm4_mu_charging_attack,limit=1,sort=nearest] run function gm4_monsters_unbound:mob/process/elite/zephyr/charge_complete

effect give @s slowness 1 3 true
effect give @s nausea 4 0 false
function gm4_monsters_unbound:effect/shield_break/apply
