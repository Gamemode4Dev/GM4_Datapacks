# @s = boiling zauber cauldron with crystal recipe inside
# at center of block
# run from zauber_crystals

# remove ingredients
execute align xyz run kill @e[type=item,dx=0,dy=0,dz=0]

# summon item
loot spawn ~ ~.2 ~ loot gm4_zauber_cauldrons:recipes/crystals/jump_boost

# set flag
scoreboard players set $recipe_success gm4_zc_data 1
