# @s = metachunk
# run from metachunk/generate_attempt

# generate one of the 9 subchunks, in a predefined order
scoreboard players add @s gm4_orbis_stage 1
execute if score @s gm4_orbis_stage matches 1 positioned ~ ~ ~ run function gm4_orbis:chunk/generate
execute if score @s gm4_orbis_stage matches 2 positioned ~-16 ~ ~ run function gm4_orbis:chunk/generate
execute if score @s gm4_orbis_stage matches 3 positioned ~16 ~ ~ run function gm4_orbis:chunk/generate
execute if score @s gm4_orbis_stage matches 4 positioned ~ ~ ~-16 run function gm4_orbis:chunk/generate
execute if score @s gm4_orbis_stage matches 5 positioned ~ ~ ~16 run function gm4_orbis:chunk/generate
execute if score @s gm4_orbis_stage matches 6 positioned ~-16 ~ ~-16 run function gm4_orbis:chunk/generate
execute if score @s gm4_orbis_stage matches 7 positioned ~-16 ~ ~16 run function gm4_orbis:chunk/generate
execute if score @s gm4_orbis_stage matches 8 positioned ~16 ~ ~-16 run function gm4_orbis:chunk/generate
execute if score @s gm4_orbis_stage matches 9 positioned ~16 ~ ~16 run function gm4_orbis:chunk/generate

tellraw @a[tag=gm4_orbis_debug] ["Generate stage ",{"score":{"objective": "gm4_orbis_stage", "name": "@s"}}," of metachunk at ",{"nbt":"Pos","entity": "@s"}]

# spread outwards
execute if score @s gm4_orbis_stage matches 9 positioned ~48 ~ ~ unless entity @e[type=marker,tag=gm4_metachunk,distance=..1] run function gm4_orbis:metachunk/new
execute if score @s gm4_orbis_stage matches 9 positioned ~-48 ~ ~ unless entity @e[type=marker,tag=gm4_metachunk,distance=..1] run function gm4_orbis:metachunk/new
execute if score @s gm4_orbis_stage matches 9 positioned ~ ~ ~48 unless entity @e[type=marker,tag=gm4_metachunk,distance=..1] run function gm4_orbis:metachunk/new
execute if score @s gm4_orbis_stage matches 9 positioned ~ ~ ~-48 unless entity @e[type=marker,tag=gm4_metachunk,distance=..1] run function gm4_orbis:metachunk/new

# this shouldn't be necessary, but somehow duplicate metachunks can still exist
tag @s add gm4_chunk_self
execute if entity @e[type=marker,tag=gm4_metachunk,tag=!gm4_chunk_self,distance=..1] run tellraw @a[tag=gm4_orbis_debug] ["Killed duplicate metachunk at ",{"nbt":"Pos","entity": "@s"}]
kill @e[type=marker,tag=gm4_metachunk,tag=!gm4_chunk_self,distance=..1]
tag @s remove gm4_chunk_self
