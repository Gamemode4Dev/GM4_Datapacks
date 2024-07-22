
advancement revoke @s only gm4_combat_expanded:elite/on_hit

execute as @e[type=#gm4_combat_expanded:elite_types,tag=gm4_ce_elite.on_hit,nbt={HurtTime:10s},limit=1,sort=nearest] at @s run function gm4_combat_expanded:mob/process/elite/on_hit/check_mob
