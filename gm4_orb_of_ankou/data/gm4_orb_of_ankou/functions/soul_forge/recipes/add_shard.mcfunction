# @s = shard of ankou item in a soul forge
# located at the position of the soul forge armor stand (align xyz)
# run from both soul_forge/recipes/check_shard

tag @s add gm4_oa_checked_item
playsound minecraft:entity.blaze.ambient block @a[distance=..12] ~0.5 ~0.5 ~0.5 0.2 0.6
particle minecraft:cloud ~0.5 ~1.5 ~0.5 0.2 1 0.2 0.01 5

# add single shard to forge storage
data modify storage gm4_orb_of_ankou:temp ArmorItems[2] set from storage gm4_orb_of_ankou:temp Item
data modify storage gm4_orb_of_ankou:temp ArmorItems[2].Count set value 1b
tag @e[type=armor_stand,tag=gm4_oa_selected_forge,limit=1] add gm4_oa_has_shard

# convert extra shards to congealed shards
execute store result score shard_count gm4_oa_forge run data get storage gm4_orb_of_ankou:temp Item.Count
scoreboard players remove shard_count gm4_oa_forge 1
execute if score shard_count gm4_oa_forge matches 1.. run function gm4_orb_of_ankou:soul_forge/entities/summon_congealed_shard
