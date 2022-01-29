# gets the block state/data from the relocator item
# @s = player who placed the relocator
# located at the center of the placed relocator
# run from gm4_relocators:machine/verify_place_down

# get data from item
data modify storage gm4_relocators:temp gm4_relocation set from entity @s SelectedItem.tag.gm4_relocation

# place block (with respective block state)
setblock ~ ~ ~ air
execute store result score $facing gm4_rl_data run data get storage gm4_relocators:temp gm4_relocation.block_state.facing
execute store result score $waterlogged gm4_rl_data run data get storage gm4_relocators:temp gm4_relocation.block_state.waterlogged
execute store result score $lit gm4_rl_data run data get storage gm4_relocators:temp gm4_relocation.block_state.lit
function #gm4_relocators:place_down/place_block
execute if block ~ ~ ~ air if data storage gm4_relocators:temp gm4_relocation.block_state{id:"dropper"} run function gm4_relocators:place_down/place_block/dropper
execute if block ~ ~ ~ air if data storage gm4_relocators:temp gm4_relocation.block_state{id:"hopper"} run function gm4_relocators:place_down/place_block/hopper
execute if block ~ ~ ~ air if data storage gm4_relocators:temp gm4_relocation.block_state{id:"chest"} run function gm4_relocators:place_down/place_block/chest
execute if block ~ ~ ~ air if data storage gm4_relocators:temp gm4_relocation.block_state{id:"barrel"} run function gm4_relocators:place_down/place_block/barrel
execute if block ~ ~ ~ air if data storage gm4_relocators:temp gm4_relocation.block_state{id:"dispenser"} run function gm4_relocators:place_down/place_block/dispenser
execute if block ~ ~ ~ air if data storage gm4_relocators:temp gm4_relocation.block_state{id:"furnace"} run function gm4_relocators:place_down/place_block/furnace
execute if block ~ ~ ~ air if data storage gm4_relocators:temp gm4_relocation.block_state{id:"blast_furnace"} run function gm4_relocators:place_down/place_block/blast_furnace
execute if block ~ ~ ~ air if data storage gm4_relocators:temp gm4_relocation.block_state{id:"smoker"} run function gm4_relocators:place_down/place_block/smoker
execute if block ~ ~ ~ air if data storage gm4_relocators:temp gm4_relocation.block_state{id:"trapped_chest"} run function gm4_relocators:place_down/place_block/trapped_chest
execute if block ~ ~ ~ air if data storage gm4_relocators:temp gm4_relocation.block_state{id:"brewing_stand"} run setblock ~ ~ ~ brewing_stand

execute if block ~ ~ ~ air if data storage gm4_relocators:temp gm4_relocation.block_state{id:"shulker_box"} run function gm4_relocators:place_down/place_block/shulker_boxes/shulker_box
execute if block ~ ~ ~ air if data storage gm4_relocators:temp gm4_relocation.block_state{id:"white_shulker_box"} run function gm4_relocators:place_down/place_block/shulker_boxes/white_shulker_box
execute if block ~ ~ ~ air if data storage gm4_relocators:temp gm4_relocation.block_state{id:"orange_shulker_box"} run function gm4_relocators:place_down/place_block/shulker_boxes/orange_shulker_box
execute if block ~ ~ ~ air if data storage gm4_relocators:temp gm4_relocation.block_state{id:"magenta_shulker_box"} run function gm4_relocators:place_down/place_block/shulker_boxes/magenta_shulker_box
execute if block ~ ~ ~ air if data storage gm4_relocators:temp gm4_relocation.block_state{id:"light_blue_shulker_box"} run function gm4_relocators:place_down/place_block/shulker_boxes/light_blue_shulker_box
execute if block ~ ~ ~ air if data storage gm4_relocators:temp gm4_relocation.block_state{id:"yellow_shulker_box"} run function gm4_relocators:place_down/place_block/shulker_boxes/yellow_shulker_box
execute if block ~ ~ ~ air if data storage gm4_relocators:temp gm4_relocation.block_state{id:"lime_shulker_box"} run function gm4_relocators:place_down/place_block/shulker_boxes/lime_shulker_box
execute if block ~ ~ ~ air if data storage gm4_relocators:temp gm4_relocation.block_state{id:"pink_shulker_box"} run function gm4_relocators:place_down/place_block/shulker_boxes/pink_shulker_box
execute if block ~ ~ ~ air if data storage gm4_relocators:temp gm4_relocation.block_state{id:"gray_shulker_box"} run function gm4_relocators:place_down/place_block/shulker_boxes/gray_shulker_box
execute if block ~ ~ ~ air if data storage gm4_relocators:temp gm4_relocation.block_state{id:"light_gray_shulker_box"} run function gm4_relocators:place_down/place_block/shulker_boxes/light_gray_shulker_box
execute if block ~ ~ ~ air if data storage gm4_relocators:temp gm4_relocation.block_state{id:"cyan_shulker_box"} run function gm4_relocators:place_down/place_block/shulker_boxes/cyan_shulker_box
execute if block ~ ~ ~ air if data storage gm4_relocators:temp gm4_relocation.block_state{id:"purple_shulker_box"} run function gm4_relocators:place_down/place_block/shulker_boxes/purple_shulker_box
execute if block ~ ~ ~ air if data storage gm4_relocators:temp gm4_relocation.block_state{id:"blue_shulker_box"} run function gm4_relocators:place_down/place_block/shulker_boxes/blue_shulker_box
execute if block ~ ~ ~ air if data storage gm4_relocators:temp gm4_relocation.block_state{id:"brown_shulker_box"} run function gm4_relocators:place_down/place_block/shulker_boxes/brown_shulker_box
execute if block ~ ~ ~ air if data storage gm4_relocators:temp gm4_relocation.block_state{id:"green_shulker_box"} run function gm4_relocators:place_down/place_block/shulker_boxes/green_shulker_box
execute if block ~ ~ ~ air if data storage gm4_relocators:temp gm4_relocation.block_state{id:"red_shulker_box"} run function gm4_relocators:place_down/place_block/shulker_boxes/red_shulker_box
execute if block ~ ~ ~ air if data storage gm4_relocators:temp gm4_relocation.block_state{id:"black_shulker_box"} run function gm4_relocators:place_down/place_block/shulker_boxes/black_shulker_box

# copy data into block
data modify block ~ ~ ~ {} merge from storage gm4_relocators:temp gm4_relocation.data
scoreboard players set $placed_block gm4_rl_data 0
execute if data storage gm4_relocators:temp gm4_relocation.custom_block run function #gm4_relocators:place_down_check
execute if score $placed_block gm4_rl_data matches 0 if data storage gm4_relocators:temp gm4_relocation.custom_block run setblock ~ ~ ~ air

# return relocator
execute if block ~ ~ ~ air run function gm4_relocators:place_down/failed
execute unless block ~ ~ ~ air run function gm4_relocators:place_down/success

# clean up
data remove storage gm4_relocators:temp gm4_relocation
