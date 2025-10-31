# process (gm4_)horses that completed grazing
# @s = (gm4_)horse
# at @s
# run from need/graze/tick

tag @s remove gm4_horse.grazing

# if this is a baby horse accelerate its growth by 10% (same effect as on sheep)
execute if entity @s[tag=gm4_horse.foal] run function gm4_horsemanship:need/graze/foal

# break grass (block) if mobGriefing is enabled
# horses can only eat grass or grass blocks but not flowers or tall grass, similar to sheep
execute store result score $mobGriefing gm4_horse_data run gamerule mobGriefing
execute if score $mobGriefing gm4_horse_data matches 1 unless block ~ ~ ~ short_grass run fill ~ ~ ~ ~ ~-1 ~ dirt replace grass_block
execute if score $mobGriefing gm4_horse_data matches 1 if block ~ ~ ~ short_grass run fill ~ ~ ~ ~ ~ ~ air replace short_grass
playsound minecraft:block.grass.break block @a ~ ~ ~ 1 1
particle block{block_state:"grass_block"} ~ ~ ~ 0.2 0.05 0.2 0 4
