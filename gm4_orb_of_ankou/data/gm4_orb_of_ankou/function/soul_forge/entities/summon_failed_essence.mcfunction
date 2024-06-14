# @s = soul forge without fire
# run from soul_forge/destroy

# summon endermite
function gm4_orb_of_ankou:soul_forge/entities/severed_soul

# loop
scoreboard players remove failed_count gm4_oa_essence 1
execute if score failed_count gm4_oa_essence matches 1.. run function gm4_orb_of_ankou:soul_forge/entities/summon_failed_essence
