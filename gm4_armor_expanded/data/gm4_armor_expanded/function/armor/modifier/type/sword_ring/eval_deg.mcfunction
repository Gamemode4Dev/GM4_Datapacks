# get degrees offset from 0 0 for first sword
# @s = player wearing armor
# at unspecified
# run from armor/modifier/type/sword_ring/prep

$execute positioned ~ ~$(height) ~ rotated 0 0 rotated ~$(deg) ~ run function gm4_armor_expanded:armor/modifier/type/sword_ring/find_sword with storage gm4_armor_expanded:temp sword_ring 
