#@s=boiling zauber cauldron with recipe inside
#at @s
#run from zauber_potions

execute align xyz run kill @e[type=item,dx=0,dy=0,dz=0]
scoreboard players reset expected_item_amount gm4_zc_fullness
summon tnt
kill @s
