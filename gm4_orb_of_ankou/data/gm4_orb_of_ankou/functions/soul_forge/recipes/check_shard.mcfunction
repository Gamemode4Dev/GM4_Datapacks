# @s =  soul shard item in a soul forge
# located at the position of the soul forge armor stand (align xyz)
# run from soul_forge/recipes/check_item

# store shard if it doesn't have one stored already, summon congealed shard if an shard is already stored in the forge
execute as @e[type=armor_stand,tag=gm4_oa_selected_forge,limit=1] store success score has_shard gm4_oa_forge if entity @s[tag=gm4_oa_has_shard]

execute if score has_shard gm4_oa_forge matches 0 run function gm4_orb_of_ankou:soul_forge/recipes/add_shard
execute if score has_shard gm4_oa_forge matches 1 store result score shard_count gm4_oa_forge run data get storage gm4_orb_of_ankou:temp Item.Count
execute if score has_shard gm4_oa_forge matches 1 run function gm4_orb_of_ankou:soul_forge/entities/summon_congealed_shard
