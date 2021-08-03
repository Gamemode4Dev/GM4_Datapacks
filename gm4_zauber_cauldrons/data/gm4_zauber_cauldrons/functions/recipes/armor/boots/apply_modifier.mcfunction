# @s = boiling zauber cauldron with enchanted prismarine shard and golden boots inside
# at @s align xyz
# run from recipe/armor/zauber_armor

execute if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:turtle_helmet"}}}] run function gm4_zauber_cauldrons:recipes/armor/boots/armor_boost
execute if score $recipe_success gm4_zc_data matches 0 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:blaze_powder"}}}] run function gm4_zauber_cauldrons:recipes/armor/boots/attack_boost
execute if score $recipe_success gm4_zc_data matches 0 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:glistering_melon_slice"}}}] run function gm4_zauber_cauldrons:recipes/armor/boots/health_boost
execute if score $recipe_success gm4_zc_data matches 0 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:sugar"}}}] run function gm4_zauber_cauldrons:recipes/armor/boots/speed_boost
