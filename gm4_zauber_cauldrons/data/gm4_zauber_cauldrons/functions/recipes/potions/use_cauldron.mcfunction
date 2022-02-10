# @s = boiling zauber cauldron with recipe inside
# at @s
# run from zauber_potions

# calculate amount of vexes to spawn
execute if score @s gm4_zc_fullness > $expected_item_amount gm4_zc_fullness run function gm4_zauber_cauldrons:cauldron/structure/use_extra_items

# make items in cauldron pickup-able instantly
execute align xyz as @e[type=item,dx=0,dy=0,dz=0] run data modify entity @s PickupDelay set value 0s

# sounds and visuals
playsound entity.fishing_bobber.splash block @a[distance=..16] ~ ~ ~ 0.3 1

# consume liquid
function gm4_zauber_cauldrons:cauldron/structure/modify/use_liquid
