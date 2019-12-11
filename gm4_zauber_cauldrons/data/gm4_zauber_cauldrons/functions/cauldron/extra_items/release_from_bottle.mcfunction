#@s=bottled vex item
#run from main
#at @s

scoreboard players add @s gm4_zc_data 1
#moves vex content to score
execute if score @s gm4_zc_data matches 2.. store result score @s gm4_zc_fullness run data get entity @s Item.tag.gm4_zauber_cauldrons.vex_count 1
#release the vexes
execute if score @s gm4_zc_data matches 2.. run particle minecraft:block glass ~ ~ ~ 0.12 0.12 0.12 0 15
execute if score @s gm4_zc_data matches 2.. run playsound minecraft:block.glass.break block @a[distance=..8] ~ ~ ~ 1 1.3
execute if score @s gm4_zc_data matches 2.. run function gm4_zauber_cauldrons:cauldron/extra_items/create_possessed_items
execute if score @s gm4_zc_data matches 2.. run kill @s
