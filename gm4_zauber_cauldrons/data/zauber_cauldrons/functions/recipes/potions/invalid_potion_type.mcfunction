#@s=boiling zauber cauldron with recipe inside
#at @s
#run from zauber_potions

execute align xyz run kill @e[type=item,dx=1,dy=1,dz=1]
scoreboard players reset expected_item_amount gm4_zc_fullness
summon tnt
kill @s
