
# gain random mutation
scoreboard players add @s gm4_gv_mutations 1
function gm4_garden_variety:data/generate/random_mutation
data modify entity @s data.gm4_garden_variety.random_mutations append from storage gm4_garden_variety:generate/mutation output

# DEV TEST
setblock ~ ~ ~1 redstone_block
