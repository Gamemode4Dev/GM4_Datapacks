#run from chop
#@s = freshly chopped log item
tag @s remove gm4_looking_for_log
execute if block ~1 ~ ~1 spruce_log run setblock ~1 ~ ~1 air destroy
execute if block ~1 ~ ~-1 spruce_log run setblock ~1 ~ ~-1 air destroy
execute if block ~-1 ~ ~1 spruce_log run setblock ~-1 ~ ~1 air destroy
execute if block ~-1 ~ ~-1 spruce_log run setblock ~-1 ~ ~-1 air destroy
execute if block ~ ~ ~1 spruce_log run setblock ~ ~ ~1 air destroy
execute if block ~1 ~ ~ spruce_log run setblock ~1 ~ ~ air destroy
execute if block ~ ~ ~-1 spruce_log run setblock ~ ~ ~-1 air destroy
execute if block ~-1 ~ ~ spruce_log run setblock ~-1 ~ ~ air destroy
execute align xyz positioned ~0.5 ~0.5 ~0.5 run summon area_effect_cloud ~ ~ ~ {Duration:30,Tags:["gm4_arborenda_trunk","gm4_spruce_feller"]}
