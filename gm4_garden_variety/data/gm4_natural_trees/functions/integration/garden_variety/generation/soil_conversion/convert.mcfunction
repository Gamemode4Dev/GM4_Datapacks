# generates the tree's trunk layers 
# @s = TREE_TYPE trunk AEC marker
# run from gm4_MODULE_ID:generate/TREE_TYPE/initialize

execute if data storage gm4_fruiting_trees:data Sapling{type:"king_palm"} run function gm4_natural_trees:generate/king_palm/soil_conversion/convert

