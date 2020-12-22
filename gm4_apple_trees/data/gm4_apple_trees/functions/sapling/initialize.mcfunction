# initializes the apple tree's AEC marker
# @s = raycast AEC
# at @s align xyz
# run from gm4_apple_trees:sapling/validate_species

# determine available height
summon area_effect_cloud ~0.5 ~ ~0.5 {Radius:0f,Age:-2147483648,Duration:2147483648,CustomName:'"Apple Tree Sapling"',Tags:["gm4_fruiting_sapling","gm4_apple_tree_sapling"],Particle:"block air"}
scoreboard players set @e[type=area_effect_cloud,tag=gm4_apple_tree_sapling,dx=0] gm4_sap_growth 2
