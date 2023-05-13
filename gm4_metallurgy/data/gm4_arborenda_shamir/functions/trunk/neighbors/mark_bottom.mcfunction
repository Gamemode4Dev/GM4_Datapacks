# Breaks fungus cap foliage and mangrove roots from the top to the bottom.
# @s = trunk marker within foliage (#gm4_arborenda_shamir:foliage)
# at @s positioned ~ ~-1 ~
# run from gm4_arborenda_shamir:trunk/neighbors/mark

execute if block ~ ~ ~ #gm4_arborenda_shamir:trunks unless entity @e[type=marker,tag=gm4_arborenda_trunk,distance=..0.5] run summon marker ~ ~ ~ {CustomName:'"gm4_arborenda_trunk"',Tags:[gm4_arborenda_trunk,gm4_arborenda_init]}

execute positioned ~1 ~ ~ if block ~ ~ ~ #gm4_arborenda_shamir:trunks unless entity @e[type=marker,tag=gm4_arborenda_trunk,distance=..0.5] run summon marker ~ ~ ~ {CustomName:'"gm4_arborenda_trunk"',Tags:[gm4_arborenda_trunk,gm4_arborenda_init]}
execute positioned ~ ~ ~1 if block ~ ~ ~ #gm4_arborenda_shamir:trunks unless entity @e[type=marker,tag=gm4_arborenda_trunk,distance=..0.5] run summon marker ~ ~ ~ {CustomName:'"gm4_arborenda_trunk"',Tags:[gm4_arborenda_trunk,gm4_arborenda_init]}
execute positioned ~-1 ~ ~ if block ~ ~ ~ #gm4_arborenda_shamir:trunks unless entity @e[type=marker,tag=gm4_arborenda_trunk,distance=..0.5] run summon marker ~ ~ ~ {CustomName:'"gm4_arborenda_trunk"',Tags:[gm4_arborenda_trunk,gm4_arborenda_init]}
execute positioned ~ ~ ~-1 if block ~ ~ ~ #gm4_arborenda_shamir:trunks unless entity @e[type=marker,tag=gm4_arborenda_trunk,distance=..0.5] run summon marker ~ ~ ~ {CustomName:'"gm4_arborenda_trunk"',Tags:[gm4_arborenda_trunk,gm4_arborenda_init]}

execute positioned ~1 ~ ~1 if block ~ ~ ~ #gm4_arborenda_shamir:trunks unless block ~-1 ~ ~ #gm4_arborenda_shamir:trunks unless block ~ ~ ~-1 #gm4_arborenda_shamir:trunks unless entity @e[type=marker,tag=gm4_arborenda_trunk,distance=..0.5] run summon marker ~ ~ ~ {CustomName:'"gm4_arborenda_trunk"',Tags:[gm4_arborenda_trunk,gm4_arborenda_init]}
execute positioned ~1 ~ ~-1 if block ~ ~ ~ #gm4_arborenda_shamir:trunks unless block ~-1 ~ ~ #gm4_arborenda_shamir:trunks unless block ~ ~ ~1 #gm4_arborenda_shamir:trunks unless entity @e[type=marker,tag=gm4_arborenda_trunk,distance=..0.5] run summon marker ~ ~ ~ {CustomName:'"gm4_arborenda_trunk"',Tags:[gm4_arborenda_trunk,gm4_arborenda_init]}
execute positioned ~-1 ~ ~1 if block ~ ~ ~ #gm4_arborenda_shamir:trunks unless block ~1 ~ ~ #gm4_arborenda_shamir:trunks unless block ~ ~ ~-1 #gm4_arborenda_shamir:trunks unless entity @e[type=marker,tag=gm4_arborenda_trunk,distance=..0.5] run summon marker ~ ~ ~ {CustomName:'"gm4_arborenda_trunk"',Tags:[gm4_arborenda_trunk,gm4_arborenda_init]}
execute positioned ~-1 ~ ~-1 if block ~ ~ ~ #gm4_arborenda_shamir:trunks unless block ~1 ~ ~ #gm4_arborenda_shamir:trunks unless block ~ ~ ~1 #gm4_arborenda_shamir:trunks unless entity @e[type=marker,tag=gm4_arborenda_trunk,distance=..0.5] run summon marker ~ ~ ~ {CustomName:'"gm4_arborenda_trunk"',Tags:[gm4_arborenda_trunk,gm4_arborenda_init]}
