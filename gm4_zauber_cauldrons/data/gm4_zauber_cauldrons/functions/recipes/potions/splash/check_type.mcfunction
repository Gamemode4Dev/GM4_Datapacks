# @s = boiling zauber cauldron with prismarine crystals, golden apple and a splash potion inside
# at center of block
# run from recipes/potions/splash/check_liquid

# check which potion type to craft
execute if score $has_powder_snow gm4_zc_data matches 1 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:splash_potion"},Potion:"minecraft:strong_harming"}}] run function gm4_zauber_cauldrons:recipes/potions/splash/instant_damage
execute if score $recipe_success gm4_zc_data matches 0 if score $has_powder_snow gm4_zc_data matches 1 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:splash_potion"},Potion:"minecraft:strong_healing"}}] run function gm4_zauber_cauldrons:recipes/potions/splash/instant_health
execute if score $recipe_success gm4_zc_data matches 0 if score $has_powder_snow gm4_zc_data matches 1 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:splash_potion"},Potion:"minecraft:strong_leaping"}}] run function gm4_zauber_cauldrons:recipes/potions/splash/jump_boost
execute if score $recipe_success gm4_zc_data matches 0 if score $has_powder_snow gm4_zc_data matches 1 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:splash_potion"},Potion:"minecraft:strong_poison"}}] run function gm4_zauber_cauldrons:recipes/potions/splash/poison
execute if score $recipe_success gm4_zc_data matches 0 if score $has_powder_snow gm4_zc_data matches 1 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:splash_potion"},Potion:"minecraft:strong_regeneration"}}] run function gm4_zauber_cauldrons:recipes/potions/splash/regeneration
execute if score $recipe_success gm4_zc_data matches 0 if score $has_powder_snow gm4_zc_data matches 1 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:splash_potion"},Potion:"minecraft:strong_swiftness"}}] run function gm4_zauber_cauldrons:recipes/potions/splash/speed
execute if score $recipe_success gm4_zc_data matches 0 if score $has_powder_snow gm4_zc_data matches 1 if data storage gm4_zauber_cauldrons:temp/cauldron/ingredients Items[{Count:1b,tag:{gm4_zauber_cauldrons:{item:"minecraft:splash_potion"},Potion:"minecraft:strong_strength"}}] run function gm4_zauber_cauldrons:recipes/potions/splash/strength

# sounds
execute if score $recipe_success gm4_zc_data matches 1.. run playsound block.redstone_torch.burnout block @a[distance=..8] ~ ~ ~ 0.6 0.6
