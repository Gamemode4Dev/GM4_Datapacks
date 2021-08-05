# generates the tree's trunk layers 
# @s = TREE_TYPE trunk AEC marker
# run from gm4_MODULE_ID:generate/TREE_TYPE/initialize



########## INITIALIZATION ##########

# debug storage
data remove storage gm4_garden_variety:debug/generation path
data modify storage gm4_garden_variety:debug/generation path append value "G: "
execute if score debug_generation gm4_gv_gen_data matches 1 run particle barrier ~ ~ ~-7
execute if score debug_generation gm4_gv_gen_data matches 1 at @s align xyz positioned ~.5 ~.5 ~.5 run particle barrier ~7 ~ ~

# prepare variables for generation
scoreboard players operation trunk_layer_loop gm4_gv_gen_data = trunk_layers gm4_gv_gen_data
scoreboard players operation leaf_layer_loop gm4_gv_gen_data = leaf_layers gm4_gv_gen_data
scoreboard players set current_trunk_layer gm4_gv_gen_data 1
scoreboard players set current_leaf_layer gm4_gv_gen_data 1



########## PRE GENERATION ##########

# summon name tag
execute if score name_tag gm4_gv_nbt_data matches 1 run summon item ~ ~ ~ {Tags:["gm4_gv_add_trait_lore"],Item:{id:"minecraft:name_tag",Count:1b}}
execute if score name_tag gm4_gv_nbt_data matches 1 as @e[type=item,distance=..1,limit=1,sort=nearest,tag=gm4_gv_add_trait_lore] run function gm4_garden_variety:data/lore/traits/apply/to_item

# remove tagged nbt
execute if score name_tag gm4_gv_nbt_data matches 1 run data modify storage gm4_garden_variety:data/garden_variety_nbt tree.name_tag set value 0b 
scoreboard players set name_tag gm4_gv_nbt_data 0



########## GENERATION ##########

# begin generation 
function gm4_garden_variety:generation/trees/palm_tree/trunk

# debug
tellraw @a[tag=gm4_gv_debug_generation] {"nbt":"path","storage":"gm4_garden_variety:debug/generation","interpret":true}
