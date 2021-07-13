# @s = trunk marker on the furthest depth without a log above it
# positioned ~ ~1 ~
# runs from mark_neighbors

execute positioned ~1 ~ ~ if block ~ ~ ~ #minecraft:logs unless entity @e[type=marker,tag=gm4_arborenda_trunk,distance=..0.5] run summon marker ~ ~ ~ {CustomName:'"gm4_arborenda_trunk"',Tags:[gm4_arborenda_trunk,gm4_arborenda_init]}
execute positioned ~ ~ ~1 if block ~ ~ ~ #minecraft:logs unless entity @e[type=marker,tag=gm4_arborenda_trunk,distance=..0.5] run summon marker ~ ~ ~ {CustomName:'"gm4_arborenda_trunk"',Tags:[gm4_arborenda_trunk,gm4_arborenda_init]}
execute positioned ~-1 ~ ~ if block ~ ~ ~ #minecraft:logs unless entity @e[type=marker,tag=gm4_arborenda_trunk,distance=..0.5] run summon marker ~ ~ ~ {CustomName:'"gm4_arborenda_trunk"',Tags:[gm4_arborenda_trunk,gm4_arborenda_init]}
execute positioned ~ ~ ~-1 if block ~ ~ ~ #minecraft:logs unless entity @e[type=marker,tag=gm4_arborenda_trunk,distance=..0.5] run summon marker ~ ~ ~ {CustomName:'"gm4_arborenda_trunk"',Tags:[gm4_arborenda_trunk,gm4_arborenda_init]}

execute positioned ~1 ~ ~1 if block ~ ~ ~ #minecraft:logs unless block ~-1 ~ ~ #minecraft:logs unless block ~ ~ ~-1 #minecraft:logs unless entity @e[type=marker,tag=gm4_arborenda_trunk,distance=..0.5] run summon marker ~ ~ ~ {CustomName:'"gm4_arborenda_trunk"',Tags:[gm4_arborenda_trunk,gm4_arborenda_init]}
execute positioned ~1 ~ ~-1 if block ~ ~ ~ #minecraft:logs unless block ~-1 ~ ~ #minecraft:logs unless block ~ ~ ~1 #minecraft:logs unless entity @e[type=marker,tag=gm4_arborenda_trunk,distance=..0.5] run summon marker ~ ~ ~ {CustomName:'"gm4_arborenda_trunk"',Tags:[gm4_arborenda_trunk,gm4_arborenda_init]}
execute positioned ~-1 ~ ~1 if block ~ ~ ~ #minecraft:logs unless block ~1 ~ ~ #minecraft:logs unless block ~ ~ ~-1 #minecraft:logs unless entity @e[type=marker,tag=gm4_arborenda_trunk,distance=..0.5] run summon marker ~ ~ ~ {CustomName:'"gm4_arborenda_trunk"',Tags:[gm4_arborenda_trunk,gm4_arborenda_init]}
execute positioned ~-1 ~ ~-1 if block ~ ~ ~ #minecraft:logs unless block ~1 ~ ~ #minecraft:logs unless block ~ ~ ~1 #minecraft:logs unless entity @e[type=marker,tag=gm4_arborenda_trunk,distance=..0.5] run summon marker ~ ~ ~ {CustomName:'"gm4_arborenda_trunk"',Tags:[gm4_arborenda_trunk,gm4_arborenda_init]}
