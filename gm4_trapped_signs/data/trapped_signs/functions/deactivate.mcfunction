# @s = trapped sign
# run from process

execute if block ~ ~ ~ #minecraft:standing_signs run fill ~ ~-2 ~ ~ ~-2 ~ redstone_wire[power=0] replace redstone_wire[power=1]
execute if block ~ ~ ~ #minecraft:standing_signs run fill ~ ~-1 ~1 ~ ~ ~-1 redstone_wire[power=0] replace redstone_wire[power=1]
execute if block ~ ~ ~ #minecraft:standing_signs run fill ~ ~-2 ~ ~ ~-2 ~ redstone_wire[power=0] replace redstone_wire[power=1]
execute if block ~ ~ ~ #minecraft:standing_signs run fill ~ ~-1 ~1 ~ ~ ~-1 redstone_wire[power=0] replace redstone_wire[power=1]
execute if block ~ ~ ~ #minecraft:standing_signs run fill ~1 ~-1 ~ ~-1 ~ ~ redstone_wire[power=0] replace redstone_wire[power=1]
execute if block ~ ~ ~ #minecraft:wall_signs[facing=north] run fill ~1 ~ ~1 ~-1 ~ ~1 redstone_wire[power=0] replace redstone_wire[power=1]
execute if block ~ ~ ~ #minecraft:wall_signs[facing=north] run fill ~ ~-2 ~1 ~ ~1 ~1 redstone_wire[power=0] replace redstone_wire[power=1]
execute if block ~ ~ ~ #minecraft:wall_signs[facing=north] run fill ~ ~-2 ~1 ~ ~1 ~1 redstone_wire[power=0] replace redstone_wire[power=1]
execute if block ~ ~ ~ #minecraft:wall_signs[facing=north] run fill ~ ~ ~2 ~ ~ ~2 redstone_wire[power=0] replace redstone_wire[power=1]
execute if block ~ ~ ~ #minecraft:wall_signs[facing=south] run fill ~ ~-2 ~-1 ~ ~1 ~-1 redstone_wire[power=0] replace redstone_wire[power=1]
execute if block ~ ~ ~ #minecraft:wall_signs[facing=south] run fill ~1 ~ ~-1 ~-1 ~ ~-1 redstone_wire[power=0] replace redstone_wire[power=1]
execute if block ~ ~ ~ #minecraft:wall_signs[facing=south] run fill ~ ~ ~-2 ~ ~ ~-2 redstone_wire[power=0] replace redstone_wire[power=1]
execute if block ~ ~ ~ #minecraft:wall_signs[facing=west] run fill ~1 ~-2 ~ ~1 ~1 ~ redstone_wire[power=0] replace redstone_wire[power=1]
execute if block ~ ~ ~ #minecraft:wall_signs[facing=west] run fill ~1 ~ ~1 ~1 ~ ~-1 redstone_wire[power=0] replace redstone_wire[power=1]
execute if block ~ ~ ~ #minecraft:wall_signs[facing=west] run fill ~2 ~ ~ ~2 ~ ~ redstone_wire[power=0] replace redstone_wire[power=1]
execute if block ~ ~ ~ #minecraft:wall_signs[facing=east] run fill ~-1 ~-2 ~ ~-1 ~1 ~ redstone_wire[power=0] replace redstone_wire[power=1]
execute if block ~ ~ ~ #minecraft:wall_signs[facing=east] run fill ~-2 ~ ~ ~-2 ~ ~ redstone_wire[power=0] replace redstone_wire[power=1]
execute if block ~ ~ ~ #minecraft:wall_signs[facing=east] run fill ~-1 ~ ~1 ~-1 ~ ~-1 redstone_wire[power=0] replace redstone_wire[power=1]
tag @s remove gm4_trapped_signs_pulsed
