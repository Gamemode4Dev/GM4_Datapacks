# generates the tree's leaf layers
# @s = TREE_TYPE leaf AEC marker
# run from gm4_garden_variety:analyzer/recipes/RECIPE_TYPE/complete

# lore
execute if data storage gm4_garden_variety:interpret/array mutations[0].value run item modify entity @e[type=trader_llama,limit=1,tag=gm4_gv_get_mutations] horse.0 gm4_garden_variety:lore/mutation_range
execute unless data storage gm4_garden_variety:interpret/array mutations[0].value run item modify entity @e[type=trader_llama,limit=1,tag=gm4_gv_get_mutations] horse.0 gm4_garden_variety:lore/mutation
data modify storage gm4_garden_variety:add/lore lines append from entity @e[type=trader_llama,limit=1,tag=gm4_gv_get_mutations] Items[0].tag.display.Lore[0]

# [Loop]
data remove storage gm4_garden_variety:interpret/array mutations[0]
scoreboard players remove $mutation_lore_loop gm4_gv_mutations 1
execute if score $mutation_lore_loop gm4_gv_mutations matches 1.. run function gm4_garden_variety:data/mutations/lore/get_mutations
