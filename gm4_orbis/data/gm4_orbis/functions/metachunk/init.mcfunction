# @s = new metachunk that needs aligning, with the gm4_metachunk_init tag
# run from metachunk/init_attempt

scoreboard players set @s gm4_orbis_stage 0

execute store result score #x gm4_count run data get entity @s Pos[0] 0.02083333333
execute store result score #z gm4_count run data get entity @s Pos[2] 0.02083333333
scoreboard players operation #x gm4_count *= #48 gm4_count
scoreboard players operation #z gm4_count *= #48 gm4_count
scoreboard players add #x gm4_count 24
scoreboard players add #z gm4_count 24
execute store result entity @s Pos[0] double 1 run scoreboard players get #x gm4_count
execute store result entity @s Pos[2] double 1 run scoreboard players get #z gm4_count

tellraw @a[tag=gm4_orbis_debug] ["Created new metachunk at ",{"nbt":"Pos","entity": "@s"}]

tag @s remove gm4_metachunk_init

# make sure this is the only metachunk marker
execute at @s positioned ~-24 -1 ~-24 run kill @e[type=marker,tag=gm4_metachunk_init,dx=47,dy=1,dz=47]
