# @s = gm4_gv_analyzer
# run from main



# keep armorstand lit up
data merge entity @s {Fire:2000}

# destroy analzyer if broken
execute unless block ~ ~ ~ smoker run function gm4_garden_variety:mechanics/analyzer/block/destroy

# prepare item check
execute if entity @s[tag=!gm4_gv_analyzing] run scoreboard players set @s gm4_gv_analyze 0
tag @s remove gm4_gv_analyzing
data modify storage gm4_garden_variety:analyzer Items set from block ~ ~ ~ Items

# get slot amounts
execute store result score $slot_0_amount gm4_gv_analyze run data get storage gm4_garden_variety:analyzer Items[{Slot:0b}].Count
execute store result score $slot_1_amount gm4_gv_analyze run data get storage gm4_garden_variety:analyzer Items[{Slot:1b}].Count
execute store result score $slot_2_amount gm4_gv_analyze run data get storage gm4_garden_variety:analyzer Items[{Slot:2b}].Count

# analyze if recipe matches
execute if data storage gm4_garden_variety:analyzer Items[{Slot:0b,id:"minecraft:paper"}] run function gm4_garden_variety:mechanics/analyzer/recipes/paper_report/check
execute if data storage gm4_garden_variety:analyzer Items[{Slot:0b,id:"minecraft:book",Count:1b}] run function gm4_garden_variety:mechanics/analyzer/recipes/book_report/check
execute if data storage gm4_garden_variety:analyzer Items[{Slot:0b,id:"minecraft:name_tag"}] run function gm4_garden_variety:mechanics/analyzer/recipes/name_tag_sapling/check
execute if data storage gm4_garden_variety:analyzer Items[{Slot:0b,id:"minecraft:shears"}] run function gm4_garden_variety:mechanics/analyzer/recipes/remove_name_tag/check
execute if data storage gm4_garden_variety:analyzer Items[{Slot:0b,id:"minecraft:bone_meal"}] run function gm4_garden_variety:mechanics/analyzer/recipes/convert_sapling/check
execute if data storage gm4_garden_variety:analyzer Items[{Slot:0b,id:"minecraft:shears"}] run function gm4_garden_variety:mechanics/analyzer/recipes/clip_leaves/check

# enable / disable job site
tag @s remove gm4_gv_disable_job_site
execute if entity @s[tag=!gm4_gv_disable_job_site] at @s if block ~ ~-1 ~ minecraft:redstone_lamp[lit=false] run tag @s add gm4_gv_disable_job_site
execute if entity @s[tag=!gm4_gv_disable_job_site] at @s if block ~ ~1 ~ minecraft:redstone_lamp[lit=false] run tag @s add gm4_gv_disable_job_site

# force villager check
execute if entity @s[tag=!gm4_gv_disable_job_site,tag=!gm4_gv_analyzer_disable_check] if data storage gm4_garden_variety:analyzer Items[{Slot:0b,id:"minecraft:emerald"}] run function gm4_garden_variety:mechanics/arborist_villager/job_site/force_update
tag @s remove gm4_gv_analyzer_disable_check
