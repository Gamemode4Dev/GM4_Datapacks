# updates every tick
# run from gm4_garden_variety:init


schedule function gm4_garden_variety:clock/tick 1t

# process saplings
execute as @e[type=marker,tag=gm4_gv_sapling] at @s align xyz run function gm4_garden_variety:mechanics/custom_sapling/process

# update analyzer visuals
execute as @e[tag=gm4_gv_analyzing] at @s run execute store result block ~ ~ ~ CookTime short 1 run scoreboard players get @s gm4_gv_analyze_p 
