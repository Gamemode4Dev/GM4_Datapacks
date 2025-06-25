# process (gm4_)horses that completed grazing
# @s = (gm4_)horse
# at @s
# run from need/graze/tick

tag @s remove gm4_horse.grazing
tag @s remove gm4_horse.force_graze

# if this is a baby horse accelerate its growth by 10% (same effect as on sheep)
execute store result score $Age gm4_horse_data run data get entity @s Age
execute if score $Age gm4_horse_data matches ..-1 store result entity @s Age int 0.9 run data get entity @s Age

# if block was hay bale grant more score and don't run rest
execute if block ~ ~-1 ~ hay_block run return run function gm4_horsemanship:need/graze/hay_block

# if this is a gm4_horse fill its grazing needs
execute if entity @s[tag=gm4_horse.tamed] run scoreboard players add @s gm4_horse_need.graze 360
scoreboard players operation @s[tag=gm4_horse.tamed] gm4_horse_need.graze < $need_cap.graze gm4_horse_data

# break grass (block) if mobGriefing is enabled
# horses can only eat grass or grass blocks but not flowers or tall grass, similar to sheep
execute store result score $mobGriefing gm4_horse_data run gamerule mobGriefing
execute if score $mobGriefing gm4_horse_data matches 1 unless block ~ ~ ~ short_grass run fill ~ ~ ~ ~ ~-1 ~ dirt replace grass_block
execute if score $mobGriefing gm4_horse_data matches 1 if block ~ ~ ~ short_grass run fill ~ ~ ~ ~ ~ ~ air replace short_grass
playsound minecraft:block.grass.break block @a ~ ~ ~ 1 1
particle block{block_state:"grass_block"} ~ ~ ~ 0.2 0.05 0.2 0 4
