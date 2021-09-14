# places the sapling
# run from gm4_garden_variety_trees:integration/podzol_rooting/plant_sapling


# summon marker and set scoreboard
summon marker ~0.5 ~ ~0.5 {CustomName:'"King Palm Sapling"',Tags:["gm4_fruiting_sapling","gm4_king_palm_sapling"]}
scoreboard players set @e[type=marker,tag=gm4_king_palm_sapling,sort=nearest,limit=1] gm4_gv_sap_grow 2

# store nbt
execute positioned ~0.5 ~ ~0.5 run data modify entity @e[type=marker,distance=..1,limit=1,tag=gm4_king_palm_sapling,sort=nearest] data.gm4_garden_variety set from entity @s Item.tag.gm4_garden_variety
