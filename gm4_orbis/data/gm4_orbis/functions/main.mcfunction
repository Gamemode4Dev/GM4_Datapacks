# reset the orbis clock score
scoreboard players set $orbis_tick gm4_count 0
# for every player, generate the nearest chunk
execute at @a[tag=!gm4_orbis_disabled] positioned ~-8 ~ ~-8 as @e[type=area_effect_cloud,tag=gm4_chunk,tag=!gm4_generated,sort=nearest,limit=1] at @s if block ~ ~ ~ bedrock run function gm4_orbis:chunk/generate
# kill chunk markers that have been generated and have all adjacent chunks generated
execute as @e[type=area_effect_cloud,tag=gm4_chunk,tag=gm4_generated] at @s run function gm4_orbis:chunk/kill
# if the chunk where the player is in hasn't been generated, spawn a new chunk marker
execute as @a[tag=!gm4_orbis_disabled,nbt={Dimension:0}] at @s unless block ~ 0 ~ barrier run function gm4_orbis:chunk/init
