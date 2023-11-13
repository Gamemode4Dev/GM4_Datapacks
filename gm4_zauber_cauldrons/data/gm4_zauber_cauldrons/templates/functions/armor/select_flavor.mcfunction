# @s = heated water zauber cauldron with enchanted prismarine shard and golden {{piece}} inside
# at @s (center of block)
# run from recipe/armor/select_piece

# templates/functions/armor/select_flavor.mcfunction

execute if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:turtle_helmet"}}}] run function gm4_zauber_cauldrons:recipes/armor/{{piece}}/armor_boost
execute unless score $recipe_success gm4_zc_data matches 1.. if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:blaze_powder"}}}] run function gm4_zauber_cauldrons:recipes/armor/{{piece}}/attack_boost
execute unless score $recipe_success gm4_zc_data matches 1.. if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:glistering_melon_slice"}}}] run function gm4_zauber_cauldrons:recipes/armor/{{piece}}/health_boost
execute unless score $recipe_success gm4_zc_data matches 1.. if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:sugar"}}}] run function gm4_zauber_cauldrons:recipes/armor/{{piece}}/speed_boost
