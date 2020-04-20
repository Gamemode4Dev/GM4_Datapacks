# @s=boiling zauber cauldron with recipe inside
# at @s
# run from zauber_potions

# calculate amount of vexes to spawn
execute if score @s gm4_zc_fullness > expected_item_amount gm4_zc_fullness run function gm4_zauber_cauldrons:cauldron/use_extra_items

# sounds and visuals
playsound entity.fishing_bobber.splash block @a[distance=..16] ~ ~ ~ 0.5 1
function gm4_zauber_cauldrons:cauldron/use_water
