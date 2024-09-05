# @s = boiling zauber cauldron with prismarine crystals, golden apple and a splash potion inside
# at center of block
# run from recipes/potions/select_bottle

# if powder snow is present, run effect checks
# the select_effect function is generated via beet from templates
execute if score $has_powder_snow gm4_zc_data matches 1.. run function gm4_zauber_cauldrons:recipes/potions/splash/select_effect

# water used instead of powder snow
execute if score $has_water gm4_zc_data matches 1.. run function gm4_zauber_cauldrons:recipes/potions/invalid_recipe
