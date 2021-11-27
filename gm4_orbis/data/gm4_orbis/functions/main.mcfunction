# run from tick

# reset the orbis clock score
scoreboard players set $orbis_tick gm4_count 0

# find uninitialized metachunks that need aligning
execute as @e[type=marker,tag=gm4_metachunk_init] at @s run function gm4_orbis:metachunk/init_attempt

# for every player, generate part of the nearest metachunk that's not fully generated
execute at @a[tag=!gm4_orbis_disabled] as @e[type=marker,tag=gm4_metachunk,scores={gm4_orbis_stage=..8},tag=!gm4_metachunk_init,sort=nearest,limit=1] at @s run function gm4_orbis:metachunk/generate_attempt

# if the chunk where the player is in doesn't have a marker, spawn a new chunk marker
execute in minecraft:overworld as @a[tag=!gm4_orbis_disabled,x=0] at @s run function gm4_orbis:metachunk/new
