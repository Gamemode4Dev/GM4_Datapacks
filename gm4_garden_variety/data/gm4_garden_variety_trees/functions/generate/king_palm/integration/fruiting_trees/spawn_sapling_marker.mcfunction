# places the custom sapling
# @s = @e[type=marker,tag=gm4_ray_loc]
# at @s
# run from gm4_garden_variety_trees:integration/garden_variety/mechanics/custom_sapling/place


# summon marker and set scoreboard
summon marker ~ ~ ~ {CustomName:'"King Palm Sapling"',Tags:["gm4_gv_sapling","gm4_king_palm_sapling"]}
scoreboard players set @e[type=marker,tag=gm4_king_palm_sapling,sort=nearest,limit=1] gm4_gv_sap_grow 2
