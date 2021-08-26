schedule function gm4_garden_variety:clock/tick 1t

# update analyzer visuals
execute as @e[tag=gm4_gv_analyzing] if score @s gm4_gv_analyze matches 1.. at @s run function gm4_garden_variety:mechanics/analyzer/update_visuals
