# checks the recipe
# @s = @s[tag=gm4_gv_analyzer]
# at @s
# run from gm4_garden_variety:mechanics/analyzer/process


# reset recipe check
scoreboard players set $recipe_check gm4_gv_analyzer 1

# check for conditions
execute unless score $slot_0_amount gm4_gv_analyzer >= $slot_1_amount gm4_gv_analyzer run scoreboard players set $recipe_check gm4_gv_analyzer 0
execute if data storage gm4_garden_variety:analyzer Items[{Slot:1b}].tag.gm4_garden_variety run scoreboard players set $recipe_check gm4_gv_analyzer 0
execute if data storage gm4_garden_variety:analyzer Items[{Slot:2b}] run scoreboard players set $recipe_check gm4_gv_analyzer 0
execute unless data storage gm4_garden_variety:analyzer Items[{Slot:1b,id:"minecraft:oak_sapling"}] unless data storage gm4_garden_variety:analyzer Items[{Slot:1b,id:"minecraft:birch_sapling"}] unless data storage gm4_garden_variety:analyzer Items[{Slot:1b,id:"minecraft:spruce_sapling"}] unless data storage gm4_garden_variety:analyzer Items[{Slot:1b,id:"minecraft:jungle_sapling"}] unless data storage gm4_garden_variety:analyzer Items[{Slot:1b,id:"minecraft:dark_oak_sapling"}] unless data storage gm4_garden_variety:analyzer Items[{Slot:1b,id:"minecraft:acacia_sapling"}] run scoreboard players set $recipe_check gm4_gv_analyzer 0

# complete
execute if score $recipe_check gm4_gv_analyzer matches 1 run function gm4_garden_variety:mechanics/analyzer/recipes/convert_sapling/analyzing
