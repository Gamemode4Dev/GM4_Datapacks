
# get speed effect data
data modify storage gm4_augmented_armor:temp active_effects set from entity @s active_effects
execute store result score $timer gm4_aa_data run data get storage gm4_augmented_armor:temp active_effect[{id:"minecraft:speed"}].duration
execute store result score $amplifier gm4_aa_data run data get storage gm4_augmented_armor:temp active_effect[{id:"minecraft:speed"}].amplifier
# only remove the speed effect if it should be removed
execute if score @s gm4_aa_augment.dashing.timer matches 1..4 unless score $amplifier gm4_aa_data matches 0 if score $timer gm4_aa_data matches ..40 run effect clear @s speed
execute if score @s gm4_aa_augment.dashing.timer matches 5..9 unless score $amplifier gm4_aa_data matches 1 if score $timer gm4_aa_data matches ..40 run effect clear @s speed
execute if score @s gm4_aa_augment.dashing.timer matches 10..14 unless score $amplifier gm4_aa_data matches 2 if score $timer gm4_aa_data matches ..40 run effect clear @s speed
execute if score @s gm4_aa_augment.dashing.timer matches 15..19 unless score $amplifier gm4_aa_data matches 3 if score $timer gm4_aa_data matches ..40 run effect clear @s speed
execute if score @s gm4_aa_augment.dashing.timer matches 20.. unless score $amplifier gm4_aa_data matches 4 if score $timer gm4_aa_data matches ..40 run effect clear @s speed
execute if score @s gm4_aa_augment.dashing.timer matches 25.. unless score $amplifier gm4_aa_data matches 5 if score $timer gm4_aa_data matches ..40 run effect clear @s speed
execute if score @s gm4_aa_augment.dashing.timer matches 30.. unless score $amplifier gm4_aa_data matches 6 if score $timer gm4_aa_data matches ..40 run effect clear @s speed
execute if score @s gm4_aa_augment.dashing.timer matches 35.. unless score $amplifier gm4_aa_data matches 7 if score $timer gm4_aa_data matches ..40 run effect clear @s speed

# we let the hunger effect linger as it is less important

# reset player scores, add a small delay before speed can be applied again
scoreboard players set @s gm4_aa_augment.dashing.timer -4
scoreboard players reset @s gm4_aa_augment.dashing.pieces_equipped
