# @s = gm4_ink_normal marker
# at sign block align xyz
# run from front_back_detection
tag @s add gm4_ink_normal
execute if block ~ ~ ~ #minecraft:all_signs[rotation=0] positioned ~0.5 ~0.5 ~0.5 rotated 0 0 run teleport @s ^ ^ ^1 ~ ~
execute if block ~ ~ ~ #minecraft:all_signs[rotation=1] positioned ~0.5 ~0.5 ~0.5 rotated 22.5 0 run teleport @s ^ ^ ^1 ~ ~
execute if block ~ ~ ~ #minecraft:all_signs[rotation=2] positioned ~0.5 ~0.5 ~0.5 rotated 45 0 run teleport @s ^ ^ ^1 ~ ~
execute if block ~ ~ ~ #minecraft:all_signs[rotation=3] positioned ~0.5 ~0.5 ~0.5 rotated 67.5 0 run teleport @s ^ ^ ^1 ~ ~
execute if block ~ ~ ~ #minecraft:all_signs[rotation=4] positioned ~0.5 ~0.5 ~0.5 rotated 90 0 run teleport @s ^ ^ ^1 ~ ~
execute if block ~ ~ ~ #minecraft:all_signs[rotation=5] positioned ~0.5 ~0.5 ~0.5 rotated 112.5 0 run teleport @s ^ ^ ^1 ~ ~
execute if block ~ ~ ~ #minecraft:all_signs[rotation=6] positioned ~0.5 ~0.5 ~0.5 rotated 135 0 run teleport @s ^ ^ ^1 ~ ~
execute if block ~ ~ ~ #minecraft:all_signs[rotation=7] positioned ~0.5 ~0.5 ~0.5 rotated 157.5 0 run teleport @s ^ ^ ^1 ~ ~
execute if block ~ ~ ~ #minecraft:all_signs[rotation=8] positioned ~0.5 ~0.5 ~0.5 rotated 180 0 run teleport @s ^ ^ ^1 ~ ~
execute if block ~ ~ ~ #minecraft:all_signs[rotation=9] positioned ~0.5 ~0.5 ~0.5 rotated 202.5 0 run teleport @s ^ ^ ^1 ~ ~
execute if block ~ ~ ~ #minecraft:all_signs[rotation=10] positioned ~0.5 ~0.5 ~0.5 rotated 225 0 run teleport @s ^ ^ ^1 ~ ~
execute if block ~ ~ ~ #minecraft:all_signs[rotation=11] positioned ~0.5 ~0.5 ~0.5 rotated 247.5 0 run teleport @s ^ ^ ^1 ~ ~
execute if block ~ ~ ~ #minecraft:all_signs[rotation=12] positioned ~0.5 ~0.5 ~0.5 rotated 270 0 run teleport @s ^ ^ ^1 ~ ~
execute if block ~ ~ ~ #minecraft:all_signs[rotation=13] positioned ~0.5 ~0.5 ~0.5 rotated 292.5 0 run teleport @s ^ ^ ^1 ~ ~
execute if block ~ ~ ~ #minecraft:all_signs[rotation=14] positioned ~0.5 ~0.5 ~0.5 rotated 315 0 run teleport @s ^ ^ ^1 ~ ~
execute if block ~ ~ ~ #minecraft:all_signs[rotation=15] positioned ~0.5 ~0.5 ~0.5 rotated 337.5 0 run teleport @s ^ ^ ^1 ~ ~

execute if block ~ ~ ~ #minecraft:wall_hanging_signs[facing=south] positioned ~0.5 ~0.5 ~0.5 rotated 0 0 run teleport @s ^ ^ ^1 ~ ~
execute if block ~ ~ ~ #minecraft:wall_hanging_signs[facing=west] positioned ~0.5 ~0.5 ~0.5 rotated 90 0 run teleport @s ^ ^ ^1 ~ ~
execute if block ~ ~ ~ #minecraft:wall_hanging_signs[facing=north] positioned ~0.5 ~0.5 ~0.5 rotated 180 0 run teleport @s ^ ^ ^1 ~ ~
execute if block ~ ~ ~ #minecraft:wall_hanging_signs[facing=east] positioned ~0.5 ~0.5 ~0.5 rotated -90 0 run teleport @s ^ ^ ^1 ~ ~

execute if block ~ ~ ~ #minecraft:wall_signs[facing=south] positioned ~0.5 ~0.5 ~0.5 rotated 0 0 run teleport @s ^ ^ ^0.5625 ~ ~
execute if block ~ ~ ~ #minecraft:wall_signs[facing=west] positioned ~0.5 ~0.5 ~0.5 rotated 90 0 run teleport @s ^ ^ ^0.5625 ~ ~
execute if block ~ ~ ~ #minecraft:wall_signs[facing=north] positioned ~0.5 ~0.5 ~0.5 rotated 180 0 run teleport @s ^ ^ ^0.5625 ~ ~
execute if block ~ ~ ~ #minecraft:wall_signs[facing=east] positioned ~0.5 ~0.5 ~0.5 rotated -90 0 run teleport @s ^ ^ ^0.5625 ~ ~
