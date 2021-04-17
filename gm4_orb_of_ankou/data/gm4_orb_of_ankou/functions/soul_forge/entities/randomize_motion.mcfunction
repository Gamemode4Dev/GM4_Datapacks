# @s = newly spawned entity
# run from soul_forge/entities/severed_soul, soul_forge_entities/fire_sprite, soul_forge/entities/congealed_shard, soul_forge/entites/living_orb, and soul_forge/outputs/fuse_pneuma

# set precursory values
scoreboard players set modulo_1 gm4_oa_forge 50
scoreboard players set modulo_2 gm4_oa_forge 71

# get own uuid into scoreboard and scale into range
execute store result score motion_x gm4_oa_forge run data get entity @s UUID[0]
scoreboard players operation motion_z gm4_oa_forge = motion_x gm4_oa_forge

scoreboard players operation motion_z gm4_oa_forge %= modulo_2 gm4_oa_forge

scoreboard players operation motion_x gm4_oa_forge %= modulo_1 gm4_oa_forge
scoreboard players operation motion_z gm4_oa_forge %= modulo_1 gm4_oa_forge

# remove 25 so it can be pos or neg
scoreboard players remove motion_x gm4_oa_forge 25
scoreboard players remove motion_z gm4_oa_forge 25

# modify motion
execute store result entity @s Motion[0] double 0.01 run scoreboard players get motion_x gm4_oa_forge
execute store result entity @s Motion[2] double 0.01 run scoreboard players get motion_z gm4_oa_forge

# mark as modified
tag @s remove gm4_oa_unset
