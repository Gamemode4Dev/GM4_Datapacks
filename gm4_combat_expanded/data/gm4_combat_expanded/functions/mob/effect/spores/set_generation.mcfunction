# set generation of new zombie/husk/drowned
# @s = zombie/husk/drowned
# at @s
# run from mob/effect/spores/activate

scoreboard players operation @s gm4_ce_generation = $generation gm4_ce_data
tag @s remove gm4_ce_spore_mob
function gm4_combat_expanded:mob/initiate
