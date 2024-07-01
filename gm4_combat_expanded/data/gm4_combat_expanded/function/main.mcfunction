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

# | Armor
# process canine set wolves
execute as @e[type=wolf,tag=gm4_ce_wolf] run function gm4_combat_expanded:armor/modifier/type/canine/wolf_process
# sword_ring
execute unless score $keep_tick.sword_ring gm4_ce_keep_tick matches 1 if entity @a[predicate=gm4_combat_expanded:modified_armor/sword_ring,gamemode=!spectator] run schedule function gm4_combat_expanded:clocks/temp/sword_ring 1t
# beacon
execute unless score $keep_tick.beacon gm4_ce_keep_tick matches 1 if entity @a[predicate=gm4_combat_expanded:modified_armor/beacon,gamemode=!spectator] run schedule function gm4_combat_expanded:clocks/temp/beacon 1t
# burn
execute unless score $keep_tick.burn gm4_ce_keep_tick matches 1 if entity @a[scores={gm4_ce_burning.duration=1..}] run schedule function gm4_combat_expanded:clocks/temp/burn 1t

# | Weapons
# pierce
execute as @e[type=!#gm4_combat_expanded:effect_immune,scores={gm4_ce_pierce_timer=1..}] at @s run function gm4_combat_expanded:weapon/modifier/pierce/tick_down

# | Boss
execute unless score $keep_tick.boss gm4_ce_keep_tick matches 1 if entity @e[type=shulker,tag=gm4_ce_boss.watcher] run schedule function gm4_combat_expanded:clocks/boss/watchers 1t

# | Players
# player submain
schedule function gm4_combat_expanded:clocks/player_submain 8t
# sustain armor double speed regen
execute if score $natural_regen gm4_ce_data matches 0 as @a[tag=gm4_ce_sustain_active] unless score @s[scores={gm4_ce_hunger=18..},predicate=!gm4_combat_expanded:technical/poisoned] gm4_ce_natural_regen_damage matches 1.. run function gm4_combat_expanded:armor/modifier/type/sustain/extra_regen
