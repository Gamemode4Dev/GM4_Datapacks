schedule function gm4_monsters_unbound:main 16t

# process cloaked creepers
execute as @e[type=creeper,tag=gm4_mu_cloaked_creeper] at @s if entity @a[gamemode=!spectator,gamemode=!creative,distance=..3.1] run function gm4_monsters_unbound:mob/process/cloaked_creeper

# zombie spores
execute as @e[type=item,tag=gm4_mu_spore] at @s run function gm4_monsters_unbound:mob/process/spore/advance
item replace entity @e[type=#gm4_survival_refightalized:zombie_types,tag=gm4_mu_spore_zombie,predicate=gm4_monsters_unbound:technical/on_fire] armor.head with air

# elites
execute as @e[type=#gm4_monsters_unbound:elite_types,tag=gm4_mu_elite.process] at @s run function gm4_monsters_unbound:mob/process/elite/check_type

# tick down skeleton arrow fire delay
execute as @e[type=#gm4_survival_refightalized:skeleton_types,scores={gm4_mu_arrow_fire_delay_left=1..}] run function gm4_monsters_unbound:mob/process/arrow/tick_fire_delay

# Restart boss clock if it stopped
execute unless score $keep_tick.boss gm4_mu_keep_tick matches 1 if entity @e[type=shulker,tag=gm4_mu_boss.watcher] run schedule function gm4_monsters_unbound:clocks/boss/watchers 1t
