
attribute @s generic.movement_speed modifier remove gm4_combat_expanded:elite_buff.speed.charged
attribute @s generic.attack_damage modifier remove gm4_combat_expanded:elite_buff.speed.charged

# don't charge again until player target is lost
tag @s remove gm4_ce_charging_attack
tag @s remove gm4_ce_elite.on_hit
scoreboard players set @s gm4_ce_timer -12
