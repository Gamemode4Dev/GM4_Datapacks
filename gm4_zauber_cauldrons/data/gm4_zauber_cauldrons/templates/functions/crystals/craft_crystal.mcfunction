# @s = heated water zauber cauldron with crystal recipe inside
# at @s (center of block)
# run from recipes/crystals/select_effect

# templates/functions/crystals/craft_crystal.mcfunction

# remove ingredients
execute align xyz run kill @e[type=item,dx=0,dy=0,dz=0]

# summon item
# loot table is generated via beet from templates
loot spawn ~ ~.2 ~ loot gm4_zauber_cauldrons:items/crystals/{{effect}}

# set flag
scoreboard players set $recipe_success gm4_zc_data 1
