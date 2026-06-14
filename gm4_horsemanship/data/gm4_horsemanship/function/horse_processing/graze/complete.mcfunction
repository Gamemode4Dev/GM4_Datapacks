# process gm4_horses that completed grazing
# @s = gm4_horse
# at @s
# run from horse_processing/graze/tick

tag @s remove gm4_horse.grazing

# if this is a baby horse accelerate its growth by 10% (same effect as on sheep)
execute store result score $age gm4_horse_data run data get entity @s Age
execute if score $age gm4_horse_data matches ..-1 run function gm4_horsemanship:horse_processing/graze/foal

# break grass (block) if mob_griefing is enabled
# horses can only eat grass or grass blocks but not flowers or tall grass, similar to sheep
execute store result score $mob_griefing gm4_horse_data run gamerule mob_griefing
execute if score $mob_griefing gm4_horse_data matches 1 unless block ~ ~ ~ short_grass run fill ~ ~ ~ ~ ~-1 ~ dirt replace grass_block
execute if score $mob_griefing gm4_horse_data matches 1 if block ~ ~ ~ short_grass run fill ~ ~ ~ ~ ~ ~ air replace short_grass
playsound minecraft:block.grass.break block @a ~ ~ ~ 1 1
particle block{block_state:"grass_block"} ~ ~ ~ 0.2 0.05 0.2 0 4
