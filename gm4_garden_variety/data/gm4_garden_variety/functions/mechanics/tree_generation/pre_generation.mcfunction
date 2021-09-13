# initilizes anything needed before tree generation
# @s = @e[type=marker,tag=gm4_tree_trunk_marker]
# at @s
# run from gm4_garden_variety:mechanics/tree_generation/TREE_TYPE/generate


# delete sapling
fill ~ ~ ~ ~ ~ ~ air replace #minecraft:saplings

# soil conversion
execute if score $enable_soil_conversion gm4_gv_tree_gen matches 1 unless score $corrosion gm4_gv_nbt_data matches 0 unless score $generation_mode_orbis gm4_gv_tree_gen matches 1 run function gm4_garden_variety:mechanics/soil_conversion/initialize

# root generation
execute if score $enable_soil_rooting gm4_gv_tree_gen matches 1 unless score $roots gm4_gv_nbt_data matches 0 unless score $generation_mode_orbis gm4_gv_tree_gen matches 1 run function gm4_garden_variety:mechanics/soil_rooting/initialize

# summon name tag
execute if score $name_tag gm4_gv_nbt_data matches 1 run summon item ~ ~ ~ {Tags:["gm4_gv_add_mutation_lore"],Item:{id:"minecraft:name_tag",Count:1b}}
execute if score $name_tag gm4_gv_nbt_data matches 1 run data modify storage gm4_garden_variety:modify/item modifier.tag.gm4_garden_variety set from storage gm4_garden_variety:transfer/gv_nbt tree_generation
execute if score $name_tag gm4_gv_nbt_data matches 1 as @e[type=item,distance=..1,limit=1,sort=nearest,tag=gm4_gv_add_mutation_lore] run function gm4_garden_variety:utility/mutations/lore/apply/to_item_custom
execute if score $name_tag gm4_gv_nbt_data matches 1 run data remove storage gm4_garden_variety:transfer/gv_nbt tree_offspring.name_tag

# modify tags
tag @s add gm4_gv_tree_trunk_marker

# [Debug]
data modify storage gm4_garden_variety:debug/generation path append value "[TG: "
