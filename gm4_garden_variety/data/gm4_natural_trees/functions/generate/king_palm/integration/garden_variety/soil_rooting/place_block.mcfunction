# generates the tree's trunk layers 
# @s = TREE_TYPE trunk AEC marker
# run from gm4_MODULE_ID:generate/TREE_TYPE/initialize

# place block
execute if block ~ ~ ~ #gm4_garden_variety:soil_rooting_replace_soft run setblock ~ ~ ~ rooted_dirt
