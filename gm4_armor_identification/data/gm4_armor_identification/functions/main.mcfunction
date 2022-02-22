schedule function gm4_armor_identification:main 16t

# initiate new mobs
execute as @e[predicate=gm4_armor_identification:technical/mob_list,tag=] at @s run function gm4_armor_identification:mobs/initiate

# process canine set wolves
execute as @e[type=wolf,tag=gm4_ai_wolf] run function gm4_armor_identification:armor/modifiers/type/canine/wolf_process

# remove light sources from beacons
execute as @e[type=marker,tag=gm4_ai_beacon] at @s run function gm4_armor_identification:armor/modifiers/type/beacon/remove

# transfer damage from players that were guarded
execute as @a[tag=gm4_ai_guarded] at @s run function gm4_armor_identification:armor/modifiers/type/guardian/guard_end

# process players
execute as @a[gamemode=!spectator] run function gm4_armor_identification:player/process
