# initializes the TREE_TYPE tree's AEC marker
# @s = raycast AEC
# at @s align xyz
# run from TODO


# summon marker and set scoreboard
summon marker ~ ~ ~ {CustomName:'"King Palm Sapling"',Tags:["gm4_gv_sapling","gm4_king_palm_sapling"]}
scoreboard players set @e[type=marker,tag=gm4_king_palm_sapling,sort=nearest,limit=1] gm4_sap_growth 2
