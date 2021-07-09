# @s = boiling zauber cauldron with recipe inside
# at center of block
# run from recipes/armor/zauber_armor

# calculate amount of vexes to spawn
execute if score @s gm4_zc_fullness > $expected_item_amount gm4_zc_fullness run function gm4_zauber_cauldrons:cauldron/structure/use_extra_items

# sounds and visuals
particle entity_effect ~ ~.4 ~ .1 .1 .1 1 10
playsound entity.player.levelup block @a[distance=..16] ~ ~ ~ 1 1.5

# consume water
function gm4_zauber_cauldrons:cauldron/structure/modify/use_water
