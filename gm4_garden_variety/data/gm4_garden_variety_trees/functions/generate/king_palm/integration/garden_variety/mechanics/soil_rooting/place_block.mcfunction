# generates the roots
# @s = @e[type=marker,tag=gm4_gv_rooting_marker]
# at @s
# run from gm4_garden_variety_trees:integration/garden_variety/mechanics/soil_rooting/place_block


# place block
execute if block ~ ~ ~ #gm4_garden_variety:soil_rooting_replace_soft run setblock ~ ~ ~ rooted_dirt
