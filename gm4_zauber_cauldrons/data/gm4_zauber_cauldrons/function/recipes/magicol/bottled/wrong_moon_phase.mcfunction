# @s = magicol zauber cauldron with water bottle and prismarine crystals inside
# at center of block
# run from recipes/magicol/bottled

# calculate amount of vexes to spawn
scoreboard players set $expected_item_amount gm4_zc_fullness 0
execute if score @s gm4_zc_fullness > $expected_item_amount gm4_zc_fullness run function gm4_zauber_cauldrons:cauldron/structure/use_extra_items

# sounds and visuals
particle minecraft:block{block_state:"minecraft:glass"} ~ ~.3 ~ 0.12 0.12 0.12 0 23
playsound minecraft:block.glass.break block @a[distance=..8] ~ ~ ~ 1 1.3

# consume liquid
scoreboard players remove @s gm4_zc_liquid_level 1
execute align xyz run function gm4_zauber_cauldrons:cauldron/liquid/update/from_score

# return
return fail
