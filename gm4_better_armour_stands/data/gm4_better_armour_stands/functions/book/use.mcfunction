# @s = player giving writable_book to armor_stand
# at @s
# run from advancement book/use

advancement revoke @s only gm4_better_armour_stands:book/use

# Tag player and start ray in direction of targeted armor_stand
tag @s add gm4_bas_active
execute anchored eyes run function gm4_better_armour_stands:book/ray
tag @s remove gm4_bas_active
