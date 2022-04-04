schedule function gm4_combat_evolved:main 16t

# initiate new mobs
execute as @e[predicate=gm4_combat_evolved:mobs/list,tag=] at @s run function gm4_combat_evolved:mobs/initiate

# process cloaked creepers
execute as @e[type=creeper,tag=gm4_ce_cloaked_creeper] at @s if entity @a[gamemode=!spectator,gamemode=!creative,distance=..3.1] run function gm4_combat_evolved:mobs/effects/cloaked_creeper

# process canine set wolves
execute as @e[type=wolf,tag=gm4_ce_wolf] run function gm4_combat_evolved:armor/modifiers/type/canine/wolf_process

# remove light sources from beacons
execute as @e[type=marker,tag=gm4_ce_beacon] at @s run function gm4_combat_evolved:armor/modifiers/type/beacon/remove

# transfer damage from players that were guarded
execute as @a[tag=gm4_ce_guarded] at @s run function gm4_combat_evolved:armor/modifiers/type/guardian/guard_end

# process players
execute as @a[gamemode=!spectator] run function gm4_combat_evolved:player/process

# advance spores
execute as @e[type=item,tag=gm4_ce_spore] at @s run function gm4_combat_evolved:mobs/effects/spores/advance
