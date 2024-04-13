# @s = boiling zauber cauldron with recipe inside
# at @s (center of block)
# run from recipes/magicol/select_color

# calculate amount of vexes to spawn
execute if score @s gm4_zc_fullness > $expected_item_amount gm4_zc_fullness run function gm4_zauber_cauldrons:cauldron/structure/use_extra_items

# update cauldron liquid
execute align xyz run function gm4_zauber_cauldrons:cauldron/liquid/update/from_score

# sounds and visuals
particle minecraft:entity_effect{color:[0.1,0.1,0.1,1.0]} ~ ~.4 ~ 0 0 0 1 10
playsound entity.player.levelup block @a[distance=..16] ~ ~ ~ 1 1.5
