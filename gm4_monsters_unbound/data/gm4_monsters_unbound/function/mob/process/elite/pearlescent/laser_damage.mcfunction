# deal damage to hit player
# @s = player hit by laser
# at @s
# run from mob/process/elite/pearlescent/laser_raycast

damage @s 1 in_fire by @n[type=#gm4_monsters_unbound:elite_types,tag=gm4_mu_self]
scoreboard players set $attack_hit gm4_mu_data 1
scoreboard players set $laser_limit gm4_mu_data 0
