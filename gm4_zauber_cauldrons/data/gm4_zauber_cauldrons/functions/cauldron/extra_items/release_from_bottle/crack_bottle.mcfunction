# @s = bottled vex item
# run from cauldron/extra_items/process_bottled_vex_items
# at @s

# initialize newly thrown bottles
execute unless score @s gm4_zc_bottled_vex_escape_timer matches 0.. run scoreboard players set @s gm4_zc_bottled_vex_escape_timer 3

# decrease timer
execute if score @s gm4_zc_bottled_vex_escape_timer matches 0.. run scoreboard players remove @s gm4_zc_bottled_vex_escape_timer 1
execute if score @s gm4_zc_bottled_vex_escape_timer matches 0.. run particle minecraft:block glass ~ ~ ~ 0.1 0.1 0.1 0 1

# play sound
execute if score @s gm4_zc_bottled_vex_escape_timer matches 0.. run playsound minecraft:block.glass.break block @a[distance=..8] ~ ~ ~ 0.1 1.9

# break free
execute if score @s gm4_zc_bottled_vex_escape_timer matches 1 run function gm4_zauber_cauldrons:cauldron/extra_items/release_from_bottle/prepare_release
execute if score @s gm4_zc_bottled_vex_escape_timer matches ..0 run function gm4_zauber_cauldrons:cauldron/extra_items/release_from_bottle/release
