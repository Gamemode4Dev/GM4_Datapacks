# Gets motion vector to launch item to player
# run from pull_items


data modify storage gm4_reeling_rods:temp item_data.Motion set value [0d,0d,0d]

# Store item pos
data modify storage gm4_reeling_rods:temp item_data.Pos set from entity @s Pos
execute store result score $itemX gm4_reeling_rods.math run data get storage gm4_reeling_rods:temp item_data.Pos[0] 1
execute store result score $itemY gm4_reeling_rods.math run data get storage gm4_reeling_rods:temp item_data.Pos[1] 1
execute store result score $itemZ gm4_reeling_rods.math run data get storage gm4_reeling_rods:temp item_data.Pos[2] 1

# Player postion is stored in $motionX... ect from  store_player_pos.mcfunction

# Get delta from item to player
scoreboard players operation $motionX gm4_reeling_rods.math -= $itemX gm4_reeling_rods.math 
scoreboard players operation $motionY gm4_reeling_rods.math -= $itemY gm4_reeling_rods.math 
scoreboard players operation $motionZ gm4_reeling_rods.math -= $itemZ gm4_reeling_rods.math 


# store Motion, y to be edited after
execute store result storage gm4_reeling_rods:temp item_data.Motion[0] double 0.1 run scoreboard players get $motionX gm4_reeling_rods.math
execute store result storage gm4_reeling_rods:temp item_data.Motion[1] double 0.1 run scoreboard players get $motionY gm4_reeling_rods.math
execute store result storage gm4_reeling_rods:temp item_data.Motion[2] double 0.1 run scoreboard players get $motionZ gm4_reeling_rods.math

# Square
scoreboard players operation $motionX gm4_reeling_rods.math *= $motionX gm4_reeling_rods.math 
scoreboard players operation $motionY gm4_reeling_rods.math *= $motionY gm4_reeling_rods.math 
scoreboard players operation $motionZ gm4_reeling_rods.math *= $motionZ gm4_reeling_rods.math 

# Add the squares
scoreboard players operation $lookup_key gm4_reeling_rods.math = $motionX gm4_reeling_rods.math
scoreboard players operation $lookup_key gm4_reeling_rods.math += $motionY gm4_reeling_rods.math
execute store result storage gm4_reeling_rods:temp lookup_key int 1 \
    run scoreboard players operation $lookup_key gm4_reeling_rods.math += $motionZ gm4_reeling_rods.math

# store motion Y, scaled up
execute store result score $motionY gm4_reeling_rods.math run data get storage gm4_reeling_rods:temp item_data.Motion[1] 100

# Add looked up value
function gm4_reeling_rods:get_lookup with storage gm4_reeling_rods:temp

# Store the Completed YMotion
execute store result storage gm4_reeling_rods:temp item_data.Motion[1] double 0.01 run scoreboard players get $motionY gm4_reeling_rods.math
