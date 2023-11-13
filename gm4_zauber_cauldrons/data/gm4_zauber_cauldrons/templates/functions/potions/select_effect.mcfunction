# @s = heated water zauber cauldron with potion recipe inside
# at @s (center of block)
# run from recipes/potions/{{bottle}}/check_liquid

# templates/functions/potions/select_effect.mcfunction

# check which potion type to craft
execute if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"{{bottle_item_id}}"},Potion:"minecraft:strong_harming"}}] run function gm4_zauber_cauldrons:recipes/potions/{{bottle}}/instant_damage
execute unless score $recipe_success gm4_zc_data matches 1.. if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"{{bottle_item_id}}"},Potion:"minecraft:strong_healing"}}] run function gm4_zauber_cauldrons:recipes/potions/{{bottle}}/instant_health
execute unless score $recipe_success gm4_zc_data matches 1.. if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"{{bottle_item_id}}"},Potion:"minecraft:strong_leaping"}}] run function gm4_zauber_cauldrons:recipes/potions/{{bottle}}/jump_boost
execute unless score $recipe_success gm4_zc_data matches 1.. if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"{{bottle_item_id}}"},Potion:"minecraft:strong_poison"}}] run function gm4_zauber_cauldrons:recipes/potions/{{bottle}}/poison
execute unless score $recipe_success gm4_zc_data matches 1.. if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"{{bottle_item_id}}"},Potion:"minecraft:strong_regeneration"}}] run function gm4_zauber_cauldrons:recipes/potions/{{bottle}}/regeneration
execute unless score $recipe_success gm4_zc_data matches 1.. if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"{{bottle_item_id}}"},Potion:"minecraft:strong_swiftness"}}] run function gm4_zauber_cauldrons:recipes/potions/{{bottle}}/speed
execute unless score $recipe_success gm4_zc_data matches 1.. if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"{{bottle_item_id}}"},Potion:"minecraft:strong_strength"}}] run function gm4_zauber_cauldrons:recipes/potions/{{bottle}}/strength
