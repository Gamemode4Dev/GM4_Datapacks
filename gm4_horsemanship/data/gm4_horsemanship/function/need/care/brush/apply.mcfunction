# apply brushing effects
# @s = gm4_horse being brushed
# at @s
# run from need/care/brush/process

# vfx
particle block{block_state:"dirt"} ~ ~0.6 ~ 0.4 1 0.4 0 12
execute if score @s gm4_horse_need.brushing matches 1375.. run playsound minecraft:entity.horse.ambient neutral @a ~ ~ ~ 2 0.7
execute at @p[tag=gm4_horse_self] run playsound item.brush.brushing.generic player @a ~ ~ ~ 3 0

# scoreboards
scoreboard players add @s gm4_horse_need.brushing 75
scoreboard players operation @s gm4_horse_need.brushing < $need_cap.brushing gm4_horse_data
