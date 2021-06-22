# @s=boiling zauber cauldron with prismarine crystals inside.
# at align xyz
# run from cauldron/recipe_checks

# set expected fullness for these recipes
scoreboard players set $expected_item_amount gm4_zc_fullness 3

# recipes
execute if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:potion",Count:1b,tag:{Potion:"minecraft:strong_harming"}}}] at @s run function gm4_zauber_cauldrons:recipes/potions/instant_damage
execute if score $recipe_success gm4_zc_data matches 0 unless score $has_powder_snow gm4_zc_data matches 1 if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:potion",Count:1b,tag:{Potion:"minecraft:strong_healing"}}}] at @s run function gm4_zauber_cauldrons:recipes/potions/instant_health
execute if score $recipe_success gm4_zc_data matches 0 unless score $has_powder_snow gm4_zc_data matches 1 if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:potion",Count:1b,tag:{Potion:"minecraft:strong_leaping"}}}] at @s run function gm4_zauber_cauldrons:recipes/potions/jump_boost
execute if score $recipe_success gm4_zc_data matches 0 unless score $has_powder_snow gm4_zc_data matches 1 if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:potion",Count:1b,tag:{Potion:"minecraft:strong_poison"}}}] at @s run function gm4_zauber_cauldrons:recipes/potions/poison
execute if score $recipe_success gm4_zc_data matches 0 unless score $has_powder_snow gm4_zc_data matches 1 if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:potion",Count:1b,tag:{Potion:"minecraft:strong_regeneration"}}}] at @s run function gm4_zauber_cauldrons:recipes/potions/regeneration
execute if score $recipe_success gm4_zc_data matches 0 unless score $has_powder_snow gm4_zc_data matches 1 if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:potion",Count:1b,tag:{Potion:"minecraft:strong_swiftness"}}}] at @s run function gm4_zauber_cauldrons:recipes/potions/speed
execute if score $recipe_success gm4_zc_data matches 0 if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:potion",Count:1b,tag:{Potion:"minecraft:strong_strength"}}}] at @s run function gm4_zauber_cauldrons:recipes/potions/strength
execute if score $recipe_success gm4_zc_data matches 0 unless score $has_powder_snow gm4_zc_data matches 1 if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:splash_potion",Count:1b}}] at @s run function gm4_zauber_cauldrons:recipes/potions/invalid_potion_type
execute if score $recipe_success gm4_zc_data matches 0 unless score $has_powder_snow gm4_zc_data matches 1 if entity @e[type=item,dx=0,dy=0,dz=0,nbt={Item:{id:"minecraft:lingering_potion",Count:1b}}] at @s run function gm4_zauber_cauldrons:recipes/potions/invalid_potion_type

# use water and play sound once a recipe ran
execute if score $recipe_success gm4_zc_data matches 1 at @s run function gm4_zauber_cauldrons:recipes/potions/craft

# reset fake players
scoreboard players reset $expected_item_amount gm4_zc_fullness
