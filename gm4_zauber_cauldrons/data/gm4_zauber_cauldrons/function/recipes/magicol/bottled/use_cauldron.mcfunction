# @s = boiling zauber cauldron with recipe inside
# at @s (center of block)
# run from recipes/magicol/bottled/select_bottle

# calculate amount of vexes to spawn
execute if score @s gm4_zc_fullness > $expected_item_amount gm4_zc_fullness run function gm4_zauber_cauldrons:cauldron/structure/use_extra_items

# make items in cauldron pickup-able instantly
execute align xyz as @e[type=item,dx=0,dy=0,dz=0] run data modify entity @s PickupDelay set value 0s

# sounds and visuals
playsound minecraft:block.brewing_stand.brew block @a[distance=..16] ~ ~ ~ 0.6 0.66

# consume liquid
scoreboard players remove @s gm4_zc_liquid_level 1
execute align xyz run function gm4_zauber_cauldrons:cauldron/liquid/update/from_score
