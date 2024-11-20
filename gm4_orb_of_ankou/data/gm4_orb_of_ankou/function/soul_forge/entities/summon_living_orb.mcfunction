# @s = orb of ankou item in a soul forge that already has an orb
# run from both soul_forge/recipes/check_orb and soul_forge/recipes/add_orb

# summon silverfish
function gm4_orb_of_ankou:soul_forge/entities/living_orb

# loop
scoreboard players remove orb_count gm4_oa_forge 1
execute if score orb_count gm4_oa_forge matches 1.. run function gm4_orb_of_ankou:soul_forge/entities/summon_living_orb
