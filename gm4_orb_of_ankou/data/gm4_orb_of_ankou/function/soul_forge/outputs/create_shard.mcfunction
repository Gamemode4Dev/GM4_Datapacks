# @s = soul forge without fire, that has enough soul essences
# run from soul_forge/destroy

# spawn bat
execute summon bat run function gm4_orb_of_ankou:soul_forge/outputs/set_shard_loot with storage gm4_orb_of_ankou:temp equipment.legs.components."minecraft:custom_data".gm4_orb_of_ankou.stored_pneuma

# loop if extra sets of 13
scoreboard players remove @s gm4_oa_essence 13
scoreboard players operation @s gm4_oa_powder -= required gm4_oa_powder
scoreboard players operation @s gm4_oa_glowstone -= required gm4_oa_glowstone
execute if score @s gm4_oa_essence matches 13.. if score @s gm4_oa_powder >= required gm4_oa_powder if score @s gm4_oa_glowstone >= required gm4_oa_glowstone run function gm4_orb_of_ankou:soul_forge/outputs/create_shard
