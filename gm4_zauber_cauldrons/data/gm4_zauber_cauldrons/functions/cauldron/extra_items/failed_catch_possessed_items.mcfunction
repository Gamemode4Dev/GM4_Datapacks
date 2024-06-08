# @s = zauber cauldron with overflow items and bottle(s) inside
# at align xyz
# run from prepare_bottle

# animation
particle minecraft:block{block_state:"minecraft:glass"} ~ ~.3 ~ 0.12 0.12 0.12 0 23
playsound minecraft:block.glass.break block @a[distance=..8] ~ ~ ~ 1 1.3

# re-add one to fullness (shards of broken bottle)
scoreboard players add @s gm4_zc_fullness 1
