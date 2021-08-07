# initializes the TREE_TYPE tree's AEC marker
# @s = raycast AEC
# at @s align xyz
# run from TODO


# summon marker and set scoreboard
summon marker ~0.5 ~ ~0.5 {CustomName:'"King Palm Sapling"',Tags:["gm4_fruiting_sapling","gm4_king_palm_sapling"]}
scoreboard players set @e[type=marker,tag=gm4_king_palm_sapling,sort=nearest,limit=1] gm4_sap_growth 2

# store nbt
execute positioned ~0.5 ~ ~0.5 run data modify entity @e[type=marker,distance=..1,limit=1,tag=gm4_king_palm_sapling,sort=nearest] data.gm4_garden_variety set from storage gm4_garden_variety:data/garden_variety_nbt sapling
