# @s = boiling zauber cauldron with recipe inside
# at @s
# run from recipes/crystals/zauber_crystals

# calculate amount of vexes to spawn
execute if score @s gm4_zc_fullness > $expected_item_amount gm4_zc_fullness run function gm4_zauber_cauldrons:cauldron/structure/use_extra_items

# make items in cauldron pickup-able instantly
execute align xyz as @e[type=item,dx=0,dy=0,dz=0] run data modify entity @s PickupDelay set value 0s

# sounds and visuals
particle entity_effect ~ ~.4 ~ .1 .1 .1 1 10
playsound entity.player.levelup block @a[distance=..16] ~ ~ ~ 1 1.5

# consume water
function gm4_zauber_cauldrons:cauldron/structure/modify/use_water
