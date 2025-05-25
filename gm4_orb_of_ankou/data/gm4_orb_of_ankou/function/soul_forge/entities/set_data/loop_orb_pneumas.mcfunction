# @s = new living orb silverfish
# run from soul_forge/entities/set_data/living_orb

# get next pneuma
function gm4_orb_of_ankou:soul_forge/entities/set_data/get_orb_pneuma with storage gm4_orb_of_ankou:temp current_orb.components."minecraft:custom_data".gm4_orb_of_ankou.pneumas[0]
data remove storage gm4_orb_of_ankou:temp current_orb.components."minecraft:custom_data".gm4_orb_of_ankou.pneumas[0]
scoreboard players remove restore_pneuma_count gm4_oa_forge 1
execute if score restore_pneuma_count gm4_oa_forge matches 1.. run function gm4_orb_of_ankou:soul_forge/entities/set_data/loop_orb_pneumas
