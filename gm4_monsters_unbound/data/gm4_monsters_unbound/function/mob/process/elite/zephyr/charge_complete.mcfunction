# charge is complete
# @s = zephyr elite
# at @s
# run from mob/process/attack_effect/charging_attack

attribute @s movement_speed modifier remove gm4_monsters_unbound:elite_buff.speed.charged
attribute @s attack_damage modifier remove gm4_monsters_unbound:elite_buff.speed.charged

# don't charge again until player target is lost
tag @s remove gm4_mu_charging_attack
tag @s remove gm4_mu_elite.on_hit
scoreboard players set @s gm4_mu_timer -12
