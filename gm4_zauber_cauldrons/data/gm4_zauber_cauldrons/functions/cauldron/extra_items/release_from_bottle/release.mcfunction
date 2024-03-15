# @s = bottled vex item
# run from cauldron/extra_items/release_from_bottle/prepare_release
# at @s

# release vex and kill bottled vex item
function gm4_zauber_cauldrons:cauldron/extra_items/create_possessed_items
playsound minecraft:block.glass.break block @a[distance=..8] ~ ~ ~ 1 1.3
particle minecraft:block glass ~ ~ ~ 0.12 0.12 0.12 0 16
kill @s
