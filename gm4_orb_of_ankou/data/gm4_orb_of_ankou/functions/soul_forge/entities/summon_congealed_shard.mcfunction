# @s = soul shard item in a soul forge that already has an shard
# run from both soul_forge/recipes/check_shard and soul_forge/recipes/add_shard

# summon bat
function gm4_orb_of_ankou:soul_forge/entities/congealed_shard

# loop
scoreboard players remove shard_count gm4_oa_forge 1
execute if score shard_count gm4_oa_forge matches 1.. run function gm4_orb_of_ankou:soul_forge/entities/summon_congealed_shard
