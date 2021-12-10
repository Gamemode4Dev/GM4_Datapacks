# run from tick

# reset the orbis clock score
scoreboard players set $orbis_tick gm4_count 0

# find uninitialized metachunks that need aligning
execute as @e[type=marker,tag=gm4_metachunk_init] at @s run function gm4_orbis:metachunk/init_attempt

# for a random player, generate part of the nearest metachunk that's not fully generated
execute at @a[tag=!gm4_orbis_disabled,sort=random,limit=1] as @e[type=marker,tag=gm4_metachunk,scores={gm4_orbis_stage=..8},tag=!gm4_metachunk_init,sort=nearest,limit=1] at @s run function gm4_orbis:metachunk/generate_attempt

# if the chunk where the player is in doesn't have a marker, spawn a new chunk marker
execute in minecraft:overworld as @a[tag=!gm4_orbis_disabled,x=0] at @s run function gm4_orbis:metachunk/new

# progress pregen if the the metachunk at the active pregen player is fully generated
execute if score pregen_enabled gm4_orbis_config matches 1 as @a[tag=gm4_orbis_pregen_active,limit=1] at @s positioned ~-24 -1 ~-24 if entity @e[type=marker,tag=gm4_metachunk,scores={gm4_orbis_stage=9},dx=47,dy=1,dz=47] at @s run function gm4_orbis:pregen/progress
