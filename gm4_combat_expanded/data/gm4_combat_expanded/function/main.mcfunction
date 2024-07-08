schedule function gm4_combat_expanded:main 16t

# | Mobs
# initiate new mobs
execute as @e[type=#gm4_combat_expanded:modify,tag=!smithed.entity,tag=!gm4_ce_processed,nbt=!{PersistenceRequired:1b}] at @s run function gm4_combat_expanded:mob/init/check_mob
schedule function gm4_combat_expanded:mob/init/modifier/stat/check_damage_cap_schedule 1t
# process cloaked creepers
execute as @e[type=creeper,tag=gm4_ce_cloaked_creeper] at @s if entity @a[gamemode=!spectator,gamemode=!creative,distance=..3.1] run function gm4_combat_expanded:mob/process/cloaked_creeper
# zombie spores
execute as @e[type=item,tag=gm4_ce_spore] at @s run function gm4_combat_expanded:mob/process/spore/advance
item replace entity @e[type=#gm4_combat_expanded:zombie_types,tag=gm4_ce_spore_zombie,predicate=gm4_combat_expanded:technical/on_fire] armor.head with air
# phantoms drown under water
execute as @e[type=phantom,tag=!smithed.entity] at @s if block ~ ~ ~ #gm4:water run damage @s 2 drown

# | Armor Expanded (expansion pack, run from here to keep in sync)
execute if score armor_expanded gm4_modules matches 1 run function gm4_armor_expanded:call/main

# | Boss
execute unless score $keep_tick.boss gm4_ce_keep_tick matches 1 if entity @e[type=shulker,tag=gm4_ce_boss.watcher] run schedule function gm4_combat_expanded:clocks/boss/watchers 1t

# | Players
# player submain
schedule function gm4_combat_expanded:clocks/player_submain 8t
# sustain armor double speed regen
execute if score $natural_regen gm4_ce_data matches 0 as @a[gamemode=!spectator,tag=gm4_ce_sustain_active] unless score @s[scores={gm4_ce_hunger=18..}] gm4_ce_combat_regen_timer matches 1.. run function gm4_combat_expanded:armor/modifier/type/sustain/extra_regen
# armor regens every 8 ticks
execute as @a[gamemode=!spectator,tag=gm4_ce_armor_reduced,scores={gm4_ce_armor_reduction_timer=0}] run function gm4_combat_expanded:player/health/regain_armor
