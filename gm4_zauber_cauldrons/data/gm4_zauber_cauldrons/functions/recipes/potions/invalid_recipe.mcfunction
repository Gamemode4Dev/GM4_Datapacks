# @s = boiling zauber cauldron with recipe inside
# at @s
# run from potions/lingering/check_liquid and potions/splash/check_liquid

# remove ingredients
execute align xyz run kill @e[type=item,dx=0,dy=0,dz=0]

#visuals
scoreboard players reset $expected_item_amount gm4_zc_fullness
summon tnt

# kill marker and related entities
function gm4_zauber_cauldrons:cauldron/structure/destroy
