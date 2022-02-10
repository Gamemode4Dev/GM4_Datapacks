# @s = boiling zauber cauldron with enchanted prismarine shard, golden leggings and glistering melon inside
# at center of block
# run from recipe/armor/leggings/apply_modifier

# remove ingredients
execute align xyz run kill @e[type=item,dx=0,dy=0,dz=0]

# set blueprint
data modify storage gm4_zauber_cauldrons:blueprint/item/zauber_armor/attribute/health_boost CustomModelData set value 3420002

# summon item
loot spawn ~ ~.2 ~ loot gm4_zauber_cauldrons:recipes/armor/leggings/health_boost

# set flag
scoreboard players set $recipe_success gm4_zc_data 1
