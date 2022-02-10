# Generates tree seed based on world seed and location.
# @s = @e[type=minecraft:marker,tag=gm4_apple_tree_new,limit=1]
# at tree spawn position
# run from gm4_apple_trees:chunk/spawn_tree

# store tree coordinates
data modify storage gm4_apple_trees:temp/sapling/position Pos set from entity @s Pos
execute store result score $loc_x_bits gm4_apple_data run data get storage gm4_apple_trees:temp/sapling/position Pos[0]
execute store result score $loc_y_bits gm4_apple_data run data get storage gm4_apple_trees:temp/sapling/position Pos[1]
execute store result score $loc_z_bits gm4_apple_data run data get storage gm4_apple_trees:temp/sapling/position Pos[2]
data remove storage gm4_apple_trees:temp/sapling/position Pos

# debug message
scoreboard players add apple_tree_count gm4_orbis_config 1
execute if score structure_debug gm4_orbis_config matches 1 run tellraw @a[gamemode=!survival,gamemode=!adventure] [{"translate":"%1$s%3427655$s","with":["Spawned ",{"translate":"text.gm4.orbis_pre_gen.spawned"}],"color":"green"},{"translate":"%1$s%3427655$s","with":["Apple Tree",{"translate":"text.gm4.orbis_pre_gen.apple_tree"}],"color":"red"},{"translate":"%1$s%3427655$s","with":[" at ",{"translate":"text.gm4.orbis_pre_gen.spawned.at"}],"color":"green"},{"score":{"objective":"gm4_apple_data","name":"$loc_x_bits"},"color":"gold"}," ",{"score":{"objective":"gm4_apple_data","name":"$loc_y_bits"},"color":"gold"}," ",{"score":{"objective":"gm4_apple_data","name":"$loc_z_bits"},"color":"gold"}]

# get bits from tree coordinates
scoreboard players operation $loc_x_bits gm4_apple_data %= #100 gm4_apple_data
scoreboard players operation $loc_y_bits gm4_apple_data %= #10 gm4_apple_data
scoreboard players operation $loc_z_bits gm4_apple_data %= #100 gm4_apple_data

# generate seed
scoreboard players operation $generated_seed gm4_tree_seed = #world_seed gm4_tree_seed
scoreboard players operation $generated_seed gm4_tree_seed *= $loc_x_bits gm4_apple_data
scoreboard players operation $generated_seed gm4_tree_seed *= $loc_y_bits gm4_apple_data
scoreboard players operation $generated_seed gm4_tree_seed *= $loc_z_bits gm4_apple_data


# spawn tree
function gm4_fruiting_trees:tree/initialize

# remove new tree marker (used for targeting of initialize onto freshly spawned markers that should be grown instantly, e.g. in gm4_apple_trees:chunk/spawn_tree)
tag @s remove gm4_apple_tree_new
