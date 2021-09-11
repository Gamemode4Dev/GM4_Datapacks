schedule function gm4_garden_variety:clock/tick 1t

# process saplings
execute as @e[type=marker,tag=gm4_gv_sapling] at @s align xyz run function gm4_garden_variety:mechanics/custom_sapling/process

# update analyzer visuals
execute as @e[tag=gm4_gv_analyzing] if score @s gm4_gv_analyzer matches 1.. at @s run function gm4_garden_variety:mechanics/analyzer/update_visuals
