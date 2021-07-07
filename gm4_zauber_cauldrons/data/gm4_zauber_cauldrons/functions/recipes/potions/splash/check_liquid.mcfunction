# @s = boiling zauber cauldron with prismarine crystals, golden apple and a splash potion inside
# at @s align xyz
# run from recipes/potions/zauber_potions

# if powder snow is present, run type checks
execute if score $has_powder_snow gm4_zc_data matches 1.. run function gm4_zauber_cauldrons:recipes/potions/splash/check_type

# no powder snow
execute unless score $has_powder_snow gm4_zc_data matches 1.. run say EXPLOSION
