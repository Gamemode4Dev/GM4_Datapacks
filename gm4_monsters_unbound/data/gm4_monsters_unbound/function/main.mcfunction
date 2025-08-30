schedule function gm4_monsters_unbound:main 16t

# modify mobs
# if survival_refightalized is installed the modification is instead started from there
execute unless score gm4_survival_refightalized load.status matches 1.. as @e[type=#gm4_monsters_unbound:modify,tag=!smithed.entity,tag=!gm4_mu_processed,nbt=!{PersistenceRequired:1b}] at @s run function gm4_monsters_unbound:mob/init/check_mob

# process cloaked creepers
execute as @e[type=creeper,tag=gm4_mu_cloaked_creeper] at @s if entity @a[gamemode=!spectator,gamemode=!creative,distance=..3.1] run function gm4_monsters_unbound:mob/process/cloaked_creeper

# zombie spores
execute as @e[type=item,tag=gm4_mu_spore] at @s run function gm4_monsters_unbound:mob/process/spore/advance
execute as @e[type=#gm4_monsters_unbound:zombie_types,tag=gm4_mu_spore_zombie,predicate=gm4_monsters_unbound:technical/on_fire] run function gm4_monsters_unbound:mob/process/spore/burn_on_head

# traps
execute as @e[type=marker,tag=gm4_mu_snowy_trap] at @s if entity @a[gamemode=!spectator,gamemode=!creative,distance=..7] run function gm4_monsters_unbound:mob/process/reveal_snowy_trap
execute as @e[type=marker,tag=gm4_mu_dripstone_trap] at @s positioned ~-3.5 ~-34 ~-3.5 if entity @a[gamemode=!spectator,gamemode=!creative,dx=6,dy=28,dz=6] at @s run function gm4_monsters_unbound:mob/process/reveal_dripstone_trap

# elites
execute as @e[type=#gm4_monsters_unbound:elite_types,tag=gm4_mu_elite.process] at @s run function gm4_monsters_unbound:mob/process/elite/check_type
