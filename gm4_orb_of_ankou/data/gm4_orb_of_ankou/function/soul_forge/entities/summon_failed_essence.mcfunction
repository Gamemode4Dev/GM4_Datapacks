# @s = soul forge without fire
# run from soul_forge/destroy

# summon endermite
execute positioned ~ ~0.2 ~ summon endermite run function gm4_orb_of_ankou:soul_forge/entities/set_data/severed_soul with storage gm4_orb_of_ankou:temp equipment.feet.components."minecraft:custom_data".gm4_orb_of_ankou.stored_pneuma

# loop
scoreboard players remove failed_count gm4_oa_essence 1
execute if score failed_count gm4_oa_essence matches 1.. run function gm4_orb_of_ankou:soul_forge/entities/summon_failed_essence
