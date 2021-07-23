# @s = boiling zauber cauldron with enchanted prismarine shard, golden helmet and blaze powder inside
# at center of block
# run from recipe/armor/helmet/apply_modifier

# remove ingredients
execute align xyz run kill @e[type=item,dx=0,dy=0,dz=0]

# summon item
loot spawn ~ ~.1 ~ loot gm4_zauber_cauldrons:recipes/armor/helmet/attack_boost

# set flag
scoreboard players set $recipe_success gm4_zc_data 1
