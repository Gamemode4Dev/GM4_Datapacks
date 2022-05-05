schedule function gm4_combat_expanded:main 16t

# initiate new mobs (mobs that do not have any tags)
execute as @e[predicate=gm4_combat_expanded:mobs/list_full,tag=] at @s run function gm4_combat_expanded:mobs/check_mob

# process cloaked creepers
execute as @e[type=creeper,tag=gm4_ce_cloaked_creeper] at @s if entity @a[gamemode=!spectator,gamemode=!creative,distance=..3.1] run function gm4_combat_expanded:mobs/effects/cloaked_creeper

# remove old light sources from beacons
execute as @e[type=marker,tag=gm4_ce_beacon] at @s run function gm4_combat_expanded:armor/modifiers/type/beacon/remove

# transfer damage from players that were guarded
execute as @a[tag=gm4_ce_guarded] at @s run function gm4_combat_expanded:armor/modifiers/type/guardian/guard_end

# process players
execute as @a[gamemode=!spectator] run function gm4_combat_expanded:player/process

# process canine set wolves
execute as @e[type=wolf,tag=gm4_ce_wolf] run function gm4_combat_expanded:armor/modifiers/type/canine/wolf_process

# advance spores
execute as @e[type=item,tag=gm4_ce_spore] at @s run function gm4_combat_expanded:mobs/effects/spores/advance
