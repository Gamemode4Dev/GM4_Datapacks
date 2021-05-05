
# remove tags
tag @s remove gm4_vt_show_job
tag @s remove gm4_vt_show_bell
tag @s remove gm4_vt_show_bed

# check if player is holding villager block
execute if data storage gm4_villager_telltale:temp/player {Item:"minecraft:blast_furnace"} run tag @s add gm4_vt_show_job
execute if data storage gm4_villager_telltale:temp/player {Item:"minecraft:smoker"} run tag @s add gm4_vt_show_job
execute if data storage gm4_villager_telltale:temp/player {Item:"minecraft:cartography_table"} run tag @s add gm4_vt_show_job
execute if data storage gm4_villager_telltale:temp/player {Item:"minecraft:brewing_stand"} run tag @s add gm4_vt_show_job
execute if data storage gm4_villager_telltale:temp/player {Item:"minecraft:composter"} run tag @s add gm4_vt_show_job
execute if data storage gm4_villager_telltale:temp/player {Item:"minecraft:barrel"} run tag @s add gm4_vt_show_job
execute if data storage gm4_villager_telltale:temp/player {Item:"minecraft:fletching_table"} run tag @s add gm4_vt_show_job
execute if data storage gm4_villager_telltale:temp/player {Item:"minecraft:cauldron"} run tag @s add gm4_vt_show_job
execute if data storage gm4_villager_telltale:temp/player {Item:"minecraft:lectern"} run tag @s add gm4_vt_show_job
execute if data storage gm4_villager_telltale:temp/player {Item:"minecraft:stonecutter"} run tag @s add gm4_vt_show_job
execute if data storage gm4_villager_telltale:temp/player {Item:"minecraft:loom"} run tag @s add gm4_vt_show_job
execute if data storage gm4_villager_telltale:temp/player {Item:"minecraft:smithing_table"} run tag @s add gm4_vt_show_job
execute if data storage gm4_villager_telltale:temp/player {Item:"minecraft:grindstone"} run tag @s add gm4_vt_show_job

execute if data storage gm4_villager_telltale:temp/player {Item:"minecraft:bell"} run tag @s add gm4_vt_show_bell

execute if data storage gm4_villager_telltale:temp/player {Item:"minecraft:white_bed"} run tag @s add gm4_vt_show_bed
execute if data storage gm4_villager_telltale:temp/player {Item:"minecraft:orange_bed"} run tag @s add gm4_vt_show_bed
execute if data storage gm4_villager_telltale:temp/player {Item:"minecraft:magenta_bed"} run tag @s add gm4_vt_show_bed
execute if data storage gm4_villager_telltale:temp/player {Item:"minecraft:light_blue_bed"} run tag @s add gm4_vt_show_bed
execute if data storage gm4_villager_telltale:temp/player {Item:"minecraft:yellow_bed"} run tag @s add gm4_vt_show_bed
execute if data storage gm4_villager_telltale:temp/player {Item:"minecraft:lime_bed"} run tag @s add gm4_vt_show_bed
execute if data storage gm4_villager_telltale:temp/player {Item:"minecraft:pink_bed"} run tag @s add gm4_vt_show_bed
execute if data storage gm4_villager_telltale:temp/player {Item:"minecraft:gray_bed"} run tag @s add gm4_vt_show_bed
execute if data storage gm4_villager_telltale:temp/player {Item:"minecraft:light_gray_bed"} run tag @s add gm4_vt_show_bed
execute if data storage gm4_villager_telltale:temp/player {Item:"minecraft:cyan_bed"} run tag @s add gm4_vt_show_bed
execute if data storage gm4_villager_telltale:temp/player {Item:"minecraft:purple_bed"} run tag @s add gm4_vt_show_bed
execute if data storage gm4_villager_telltale:temp/player {Item:"minecraft:blue_bed"} run tag @s add gm4_vt_show_bed
execute if data storage gm4_villager_telltale:temp/player {Item:"minecraft:brown_bed"} run tag @s add gm4_vt_show_bed
execute if data storage gm4_villager_telltale:temp/player {Item:"minecraft:green_bed"} run tag @s add gm4_vt_show_bed
execute if data storage gm4_villager_telltale:temp/player {Item:"minecraft:red_bed"} run tag @s add gm4_vt_show_bed
execute if data storage gm4_villager_telltale:temp/player {Item:"minecraft:black_bed"} run tag @s add gm4_vt_show_bed
