
advancement revoke @s only gm4_monsters_unbound:elite/killed

execute as @e[type=marker,tag=gm4_mu_elite_death_marker] at @s run function gm4_monsters_unbound:mob/process/elite/on_death/check_marker
