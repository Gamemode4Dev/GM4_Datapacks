# @s = soul shard item in a soul forge that already has an shard
# run from both soul_forge/recipes/check_shard and soul_forge/recipes/add_shard

# spawn bat
execute positioned ~ ~0.2 ~ summon bat run function gm4_orb_of_ankou:soul_forge/entities/set_data/congealed_shard with storage gm4_orb_of_ankou:temp Item.components."minecraft:custom_data".gm4_orb_of_ankou.pneumas[-1]

# visuals
playsound minecraft:entity.bat.hurt hostile @a[distance=..12] ~ ~ ~ 0.7 1

# loop
scoreboard players remove shard_count gm4_oa_forge 1
execute if score shard_count gm4_oa_forge matches 1.. run function gm4_orb_of_ankou:soul_forge/entities/summon_congealed_shard
