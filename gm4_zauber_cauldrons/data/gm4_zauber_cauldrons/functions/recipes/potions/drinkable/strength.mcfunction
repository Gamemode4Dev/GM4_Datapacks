# @s = boiling zauber cauldron with recipe inside
# at center of block
# run from recipes/potions/drinkable/check_type

# remove ingredients
execute align xyz run kill @e[type=item,dx=0,dy=0,dz=0]

# summon item
loot spawn ~ ~.2 ~ loot gm4_zauber_cauldrons:recipes/potions/drinkable/strength

# visuals
execute if score $has_water gm4_zc_data matches 1.. run function gm4_zauber_cauldrons:recipes/potions/environmental_effects/strength
execute if score $has_powder_snow gm4_zc_data matches 1.. run playsound block.redstone_torch.burnout block @a[distance=..8] ~ ~ ~ 0.6 0.6

# set flag
scoreboard players set $recipe_success gm4_zc_data 1
