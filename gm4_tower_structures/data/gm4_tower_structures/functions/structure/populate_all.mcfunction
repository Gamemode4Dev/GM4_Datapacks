execute unless entity @s[tag=gm4_populate_stop] run function #gm4_tower_structures:structure/populate
tag @e[type=area_effect_cloud,tag=gm4_orbis_populate_marker,dx=0] add gm4_populate_stop
