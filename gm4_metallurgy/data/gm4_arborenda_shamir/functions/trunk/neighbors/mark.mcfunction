# Checks for adjacent trunk blocks and summons a marker at their locations.
# @s = trunk marker on the furthest depth (with gm4_arborenda_init tag)
# at @s
# run from gm4_arborenda_shamir:trunk/next_depth

execute positioned ~ ~1 ~ if block ~ ~ ~ #gm4_arborenda_shamir:trunks unless entity @e[type=marker,tag=gm4_arborenda_trunk,distance=..0.5] run summon marker ~ ~ ~ {CustomName:'"gm4_arborenda_trunk"',Tags:[gm4_arborenda_trunk,gm4_arborenda_init]}

execute positioned ~1 ~ ~ if block ~ ~ ~ #gm4_arborenda_shamir:trunks unless block ~ ~-1 ~ #gm4_arborenda_shamir:trunks unless entity @e[type=marker,tag=gm4_arborenda_trunk,distance=..0.5] run summon marker ~ ~ ~ {CustomName:'"gm4_arborenda_trunk"',Tags:[gm4_arborenda_trunk,gm4_arborenda_init]}
execute positioned ~ ~ ~1 if block ~ ~ ~ #gm4_arborenda_shamir:trunks unless block ~ ~-1 ~ #gm4_arborenda_shamir:trunks unless entity @e[type=marker,tag=gm4_arborenda_trunk,distance=..0.5] run summon marker ~ ~ ~ {CustomName:'"gm4_arborenda_trunk"',Tags:[gm4_arborenda_trunk,gm4_arborenda_init]}
execute positioned ~-1 ~ ~ if block ~ ~ ~ #gm4_arborenda_shamir:trunks unless block ~ ~-1 ~ #gm4_arborenda_shamir:trunks unless entity @e[type=marker,tag=gm4_arborenda_trunk,distance=..0.5] run summon marker ~ ~ ~ {CustomName:'"gm4_arborenda_trunk"',Tags:[gm4_arborenda_trunk,gm4_arborenda_init]}
execute positioned ~ ~ ~-1 if block ~ ~ ~ #gm4_arborenda_shamir:trunks unless block ~ ~-1 ~ #gm4_arborenda_shamir:trunks unless entity @e[type=marker,tag=gm4_arborenda_trunk,distance=..0.5] run summon marker ~ ~ ~ {CustomName:'"gm4_arborenda_trunk"',Tags:[gm4_arborenda_trunk,gm4_arborenda_init]}

execute positioned ~1 ~ ~1 if block ~ ~ ~ #gm4_arborenda_shamir:trunks unless block ~-1 ~ ~ #gm4_arborenda_shamir:trunks unless block ~ ~ ~-1 #gm4_arborenda_shamir:trunks unless entity @e[type=marker,tag=gm4_arborenda_trunk,distance=..0.5] run summon marker ~ ~ ~ {CustomName:'"gm4_arborenda_trunk"',Tags:[gm4_arborenda_trunk,gm4_arborenda_init]}
execute positioned ~1 ~ ~-1 if block ~ ~ ~ #gm4_arborenda_shamir:trunks unless block ~-1 ~ ~ #gm4_arborenda_shamir:trunks unless block ~ ~ ~1 #gm4_arborenda_shamir:trunks unless entity @e[type=marker,tag=gm4_arborenda_trunk,distance=..0.5] run summon marker ~ ~ ~ {CustomName:'"gm4_arborenda_trunk"',Tags:[gm4_arborenda_trunk,gm4_arborenda_init]}
execute positioned ~-1 ~ ~1 if block ~ ~ ~ #gm4_arborenda_shamir:trunks unless block ~1 ~ ~ #gm4_arborenda_shamir:trunks unless block ~ ~ ~-1 #gm4_arborenda_shamir:trunks unless entity @e[type=marker,tag=gm4_arborenda_trunk,distance=..0.5] run summon marker ~ ~ ~ {CustomName:'"gm4_arborenda_trunk"',Tags:[gm4_arborenda_trunk,gm4_arborenda_init]}
execute positioned ~-1 ~ ~-1 if block ~ ~ ~ #gm4_arborenda_shamir:trunks unless block ~1 ~ ~ #gm4_arborenda_shamir:trunks unless block ~ ~ ~1 #gm4_arborenda_shamir:trunks unless entity @e[type=marker,tag=gm4_arborenda_trunk,distance=..0.5] run summon marker ~ ~ ~ {CustomName:'"gm4_arborenda_trunk"',Tags:[gm4_arborenda_trunk,gm4_arborenda_init]}

execute positioned ~ ~1 ~ unless block ~ ~ ~ #gm4_arborenda_shamir:trunks run function gm4_arborenda_shamir:trunk/neighbors/mark_top

execute if block ~ ~ ~ #gm4_arborenda_shamir:foliage positioned ~ ~-1 ~ run function gm4_arborenda_shamir:trunk/neighbors/mark_bottom

scoreboard players add $chop_count gm4_arb_data 1
tag @s remove gm4_arborenda_init
