# smeltery processes
# @s - smeltery that isn't pointing to a furnace
# called by process

# save initial state change
scoreboard players add furnace_state_initial gm4_bf_data 0
execute if entity @s[tag=gm4_bf_has_furnace] run scoreboard players add furnace_state_initial gm4_bf_data 1

# check for furnaces
tag @s remove gm4_bf_has_furnace
execute if block ~1 ~ ~ furnace[facing=east] run tp @s ~ ~ ~ -90 0
execute if block ~-1 ~ ~ furnace[facing=west] run tp @s ~ ~ ~ 90 0
execute if block ~ ~ ~1 furnace[facing=south] run tp @s ~ ~ ~ 0 0
execute if block ~ ~ ~-1 furnace[facing=north] run tp @s ~ ~ ~ 180 0
execute at @s if block ^ ^ ^1 furnace run tag @s add gm4_bf_has_furnace

# save final state
scoreboard players add furnace_state_final gm4_bf_data 0
execute if entity @s[tag=gm4_bf_has_furnace] run scoreboard players add furnace_state_final gm4_bf_data 1

# calculate change
scoreboard players operation furnace_state_final gm4_bf_data -= furnace_state_initial gm4_bf_data

# apply texture changes
execute if score furnace_state_final gm4_bf_data matches 1 run data merge entity @s {HandItems:[{},{id:"minecraft:stone_button",Count:1b,tag:{CustomModelData:3420004}}],Pose:{Head:[0f, 0f, 0f],LeftArm:[0f, 0f, 0f]}}
execute if score furnace_state_final gm4_bf_data matches -1 run data merge entity @s {HandItems:[{},{id:"minecraft:stone_button",Count:1b,tag:{CustomModelData:3420005}}],Pose:{Head:[0f, 0f, 0f],LeftArm:[0f, 0f, 0f]}}
scoreboard players reset furnace_state_initial gm4_bf_data
scoreboard players reset furnace_state_final gm4_bf_data

# tilt if no furnace was found
execute at @s unless block ^ ^ ^1 furnace run tp @s ~ ~ ~ 45 0
