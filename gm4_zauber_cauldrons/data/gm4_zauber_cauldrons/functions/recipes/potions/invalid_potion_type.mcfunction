# @s = boiling zauber cauldron with recipe inside
# at @s
# run from zauber_potions

# remove ingredients
execute align xyz run kill @e[type=item,dx=0,dy=0,dz=0]

#visuals
scoreboard players reset $expected_item_amount gm4_zc_fullness
summon tnt
kill @s
