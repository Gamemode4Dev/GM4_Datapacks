# @s = heated water zauber cauldron with potion recipe inside
# at @s (center of block)
# run from recipes/potions/{{bottle}}/select_effect

# templates/functions/potions/craft_potion.mcfunction

# remove ingredients
execute align xyz run kill @e[type=item,dx=0,dy=0,dz=0]

# summon item
loot spawn ~ ~.2 ~ loot gm4_zauber_cauldrons:items/potions/{{bottle}}/{{effect}}

# visuals
function gm4_zauber_cauldrons:recipes/potions/environmental_effects/{{effect}}

# set flag
scoreboard players set $recipe_success gm4_zc_data 1
