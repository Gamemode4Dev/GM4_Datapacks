# @s = boiling zauber cauldron with prismarine crystals, golden apple and a splash potion inside
# at center of block
# run from recipes/potions/select_bottle

# if powder snow is present, run effect checks
# the select_effect function is generated via beet from templates
execute if score $has_water gm4_zc_data matches 1.. run function gm4_zauber_cauldrons:recipes/potions/drinkable/select_effect

# strength recipe can also be executed with powder snow in the cauldron
execute if score $has_powder_snow gm4_zc_data matches 1.. unless score $recipe_success gm4_zc_data matches 1.. if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:potion"},Potion:"minecraft:strong_strength"}}] run function gm4_zauber_cauldrons:recipes/potions/drinkable/strength
