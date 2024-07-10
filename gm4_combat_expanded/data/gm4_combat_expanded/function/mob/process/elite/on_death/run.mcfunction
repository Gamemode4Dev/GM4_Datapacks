
advancement revoke @s only gm4_combat_expanded:elite/killed

execute as @e[type=marker,tag=gm4_ce_elite_death_marker] at @s run function gm4_combat_expanded:mob/process/elite/on_death/check_marker
