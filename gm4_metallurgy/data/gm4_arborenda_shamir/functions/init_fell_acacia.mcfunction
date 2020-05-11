#run from chop
#@s = freshly chopped log item
tag @s remove gm4_looking_for_log
execute align xyz positioned ~0.5 ~0.5 ~0.5 run summon area_effect_cloud ~ ~ ~ {Duration:12,Tags:["gm4_arborenda_trunk","gm4_acacia_feller"]}
