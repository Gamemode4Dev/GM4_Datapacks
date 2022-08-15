schedule function gm4_combat_expanded:main 16t

# player submain
schedule function gm4_combat_expanded:player/submain 8t

# initiate new mobs
execute as @e[type=#gm4_combat_expanded:modify,tag=!smithed.entity,tag=!gm4_ce_processed,nbt=!{PersistenceRequired:1b}] at @s run function gm4_combat_expanded:mob/check_mob

# process cloaked creepers
execute as @e[type=creeper,tag=gm4_ce_cloaked_creeper] at @s if entity @a[gamemode=!spectator,gamemode=!creative,distance=..3.1] run function gm4_combat_expanded:mob/effect/cloaked_creeper

# remove old light sources from beacons
execute as @e[type=marker,tag=gm4_ce_beacon] at @s run function gm4_combat_expanded:armor/modifier/type/beacon/remove

# process canine set wolves
execute as @e[type=wolf,tag=gm4_ce_wolf] run function gm4_combat_expanded:armor/modifier/type/canine/wolf_process

# advance spores
execute as @e[type=item,tag=gm4_ce_spore] at @s run function gm4_combat_expanded:mob/effect/spores/advance
