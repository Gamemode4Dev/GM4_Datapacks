# Generates tree seed based on world seed and location.
# @s = @e[type=minecraft:area_effect_cloud,tag=gm4_TREE_TYPE_tree_new,limit=1]
# at tree spawn position
# run from gm4_garden_variety_trees:generate/TREE_TYPE/integration/orbis/scan_column


# store tree coordinates + debug text
data modify storage gm4_garden_variety:temp/orbis Pos set from entity @s Pos
execute store result score $loc_x_bits gm4_gv_tree_gen run data get storage gm4_garden_variety:temp/orbis Pos[0]
execute store result score $loc_y_bits gm4_gv_tree_gen run data get storage gm4_garden_variety:temp/orbis Pos[1]
execute store result score $loc_z_bits gm4_gv_tree_gen run data get storage gm4_garden_variety:temp/orbis Pos[2]
data remove storage gm4_garden_variety:temp/orbis Pos
scoreboard players add king_palm_tree_count gm4_orbis_config 1
execute if score structure_debug gm4_orbis_config matches 1 run tellraw @a[gamemode=!survival,gamemode=!adventure] [{"translate":"%1$s%3427655$s","with":["Spawned ",{"translate":"text.gm4.orbis_pre_gen.spawned"}],"color":"green"},{"translate":"%1$s%3427655$s","with":["King Palm Tree",{"translate":"text.gm4.orbis_pre_gen.apple_tree"}],"color":"red"},{"translate":"%1$s%3427655$s","with":[" at ",{"translate":"text.gm4.orbis_pre_gen.spawned.at"}],"color":"green"},{"score":{"objective":"gm4_gv_tree_gen","name":"$loc_x_bits"},"color":"gold"}," ",{"score":{"objective":"gm4_gv_tree_gen","name":"$loc_y_bits"},"color":"gold"}," ",{"score":{"objective":"gm4_gv_tree_gen","name":"$loc_z_bits"},"color":"gold"}]

# set seed and generation mode
scoreboard players set $seed_mode_orbis gm4_gv_tree_gen 1
scoreboard players set $generation_mode_orbis gm4_gv_tree_gen 1

# spawn tree
function gm4_garden_variety_trees:generate/king_palm/generate

# remove new tree marker (used for targeting of initialize onto freshly spawned AECs that should be grown instantly)
tag @s remove gm4_king_palm_tree_new
