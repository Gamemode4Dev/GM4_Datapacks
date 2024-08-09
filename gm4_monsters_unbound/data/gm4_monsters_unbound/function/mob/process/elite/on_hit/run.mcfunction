
advancement revoke @s only gm4_monsters_unbound:elite/on_hit

execute as @e[type=#gm4_monsters_unbound:elite_types,tag=gm4_mu_elite.on_hit,nbt={HurtTime:10s},limit=1,sort=nearest] at @s run function gm4_monsters_unbound:mob/process/elite/on_hit/check_mob
