# generates the tree's trunk layers 
# @s = TREE_TYPE trunk AEC marker
# run from gm4_MODULE_ID:generate/TREE_TYPE/initialize


### INITIALIZE ###

# debug
data remove storage gm4_garden_variety:debug/generation path
data modify storage gm4_garden_variety:debug/generation path append value "G: "

# prepare variables for generation
scoreboard players operation $trunk_layer_loop gm4_gv_gen_data = $trunk_layers gm4_gv_gen_data
scoreboard players operation $leaf_layer_loop gm4_gv_gen_data = $leaf_layers gm4_gv_gen_data
scoreboard players set $current_trunk_layer gm4_gv_gen_data 1
scoreboard players set $current_leaf_layer gm4_gv_gen_data 1


### PRE GENERATE ###

# soil conversion
#TD# execute if score $enable_soil_conversion gm4_gv_gen_data matches 1 unless score $corrosion gm4_gv_nbt_data matches 0 unless score $generation_mode_orbis gm4_gv_gen_data matches 1 run function gm4_garden_variety:generation/soil_conversion/initialize

# rooting
#TD# execute if score $enable_rooting gm4_gv_gen_data matches 1 unless score $rooting gm4_gv_nbt_data matches 0 unless score $generation_mode_orbis gm4_gv_gen_data matches 1 run function gm4_garden_variety:generation/soil_conversion/initialize

# summon name tag
execute if score $name_tag gm4_gv_nbt_data matches 1 run summon item ~ ~ ~ {Tags:["gm4_gv_add_mutation_lore"],Item:{id:"minecraft:name_tag",Count:1b}}
execute if score $name_tag gm4_gv_nbt_data matches 1 run data modify storage gm4_garden_variety:data/garden_variety_nbt convert set from storage gm4_garden_variety:data/garden_variety_nbt tree_generation
execute if score $name_tag gm4_gv_nbt_data matches 1 as @e[type=item,distance=..1,limit=1,sort=nearest,tag=gm4_gv_add_mutation_lore] run function gm4_garden_variety:data/lore/mutations/apply/to_item_from_marker

# remove name tag nbt
execute if score $name_tag gm4_gv_nbt_data matches 1 run data remove storage gm4_garden_variety:data/garden_variety_nbt tree_generation.name_tag
scoreboard players reset $name_tag gm4_gv_nbt_data


### GENERATE ###

# begin generation 
function gm4_garden_variety:generation/trees/palm_tree/trunk

# reset generation mode
scoreboard players set $generation_mode_orbis gm4_gv_gen_data 0
scoreboard players set $generation_mode_sapling gm4_gv_gen_data 0
scoreboard players set $generation_mode_command gm4_gv_gen_data 0

# debug
tellraw @a[tag=gm4_gv_debug_generation] {"nbt":"path","storage":"gm4_garden_variety:debug/generation","interpret":true}
