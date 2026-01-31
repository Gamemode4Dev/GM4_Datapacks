# set generation of new zombie/husk/drowned
# @s = zombie/husk/drowned
# at @s
# run from mob/process/spore/activate

scoreboard players operation @s gm4_mu_generation = $generation gm4_mu_data
tag @s remove gm4_mu_spore_mob
tag @s add gm4_mu_spore_zombie
function gm4_monsters_unbound:mob/init/initiate
