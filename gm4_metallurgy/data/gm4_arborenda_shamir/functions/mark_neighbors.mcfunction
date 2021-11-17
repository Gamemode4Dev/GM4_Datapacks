# @s = trunk marker on the furthest depth
# runs from next_depth

execute positioned ~ ~1 ~ if block ~ ~ ~ #gm4_arborenda_shamir:logs unless entity @e[type=marker,tag=gm4_arborenda_trunk,distance=..0.5] run summon marker ~ ~ ~ {CustomName:'"gm4_arborenda_trunk"',Tags:[gm4_arborenda_trunk,gm4_arborenda_init]}

execute positioned ~1 ~ ~ if block ~ ~ ~ #gm4_arborenda_shamir:logs unless block ~ ~-1 ~ #gm4_arborenda_shamir:logs unless entity @e[type=marker,tag=gm4_arborenda_trunk,distance=..0.5] run summon marker ~ ~ ~ {CustomName:'"gm4_arborenda_trunk"',Tags:[gm4_arborenda_trunk,gm4_arborenda_init]}
execute positioned ~ ~ ~1 if block ~ ~ ~ #gm4_arborenda_shamir:logs unless block ~ ~-1 ~ #gm4_arborenda_shamir:logs unless entity @e[type=marker,tag=gm4_arborenda_trunk,distance=..0.5] run summon marker ~ ~ ~ {CustomName:'"gm4_arborenda_trunk"',Tags:[gm4_arborenda_trunk,gm4_arborenda_init]}
execute positioned ~-1 ~ ~ if block ~ ~ ~ #gm4_arborenda_shamir:logs unless block ~ ~-1 ~ #gm4_arborenda_shamir:logs unless entity @e[type=marker,tag=gm4_arborenda_trunk,distance=..0.5] run summon marker ~ ~ ~ {CustomName:'"gm4_arborenda_trunk"',Tags:[gm4_arborenda_trunk,gm4_arborenda_init]}
execute positioned ~ ~ ~-1 if block ~ ~ ~ #gm4_arborenda_shamir:logs unless block ~ ~-1 ~ #gm4_arborenda_shamir:logs unless entity @e[type=marker,tag=gm4_arborenda_trunk,distance=..0.5] run summon marker ~ ~ ~ {CustomName:'"gm4_arborenda_trunk"',Tags:[gm4_arborenda_trunk,gm4_arborenda_init]}

execute positioned ~1 ~ ~1 if block ~ ~ ~ #gm4_arborenda_shamir:logs unless block ~-1 ~ ~ #gm4_arborenda_shamir:logs unless block ~ ~ ~-1 #gm4_arborenda_shamir:logs unless entity @e[type=marker,tag=gm4_arborenda_trunk,distance=..0.5] run summon marker ~ ~ ~ {CustomName:'"gm4_arborenda_trunk"',Tags:[gm4_arborenda_trunk,gm4_arborenda_init]}
execute positioned ~1 ~ ~-1 if block ~ ~ ~ #gm4_arborenda_shamir:logs unless block ~-1 ~ ~ #gm4_arborenda_shamir:logs unless block ~ ~ ~1 #gm4_arborenda_shamir:logs unless entity @e[type=marker,tag=gm4_arborenda_trunk,distance=..0.5] run summon marker ~ ~ ~ {CustomName:'"gm4_arborenda_trunk"',Tags:[gm4_arborenda_trunk,gm4_arborenda_init]}
execute positioned ~-1 ~ ~1 if block ~ ~ ~ #gm4_arborenda_shamir:logs unless block ~1 ~ ~ #gm4_arborenda_shamir:logs unless block ~ ~ ~-1 #gm4_arborenda_shamir:logs unless entity @e[type=marker,tag=gm4_arborenda_trunk,distance=..0.5] run summon marker ~ ~ ~ {CustomName:'"gm4_arborenda_trunk"',Tags:[gm4_arborenda_trunk,gm4_arborenda_init]}
execute positioned ~-1 ~ ~-1 if block ~ ~ ~ #gm4_arborenda_shamir:logs unless block ~1 ~ ~ #gm4_arborenda_shamir:logs unless block ~ ~ ~1 #gm4_arborenda_shamir:logs unless entity @e[type=marker,tag=gm4_arborenda_trunk,distance=..0.5] run summon marker ~ ~ ~ {CustomName:'"gm4_arborenda_trunk"',Tags:[gm4_arborenda_trunk,gm4_arborenda_init]}

execute positioned ~ ~1 ~ unless block ~ ~ ~ #gm4_arborenda_shamir:logs run function gm4_arborenda_shamir:mark_neighbors_top

execute if block ~ ~ ~ #gm4_arborenda_shamir:huge_fungus positioned ~ ~-1 ~ run function gm4_arborenda_shamir:mark_neighbors_bottom

scoreboard players add chop_count gm4_ml_data 1
tag @s remove gm4_arborenda_init
