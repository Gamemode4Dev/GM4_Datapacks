# Action for reeled enderman
# @s = enderman
# at bobber in @s
# run from hooked_entity/select_type

# fail if no held block
execute unless data entity @s carriedBlockState run return fail

## determine summon location
# | bobber sits at 80% up the hitbox, we want 30% up from the feet for the held block, which is also 50% of the hitbox height down from the bobber
# | this works out to taking 62.5% of the height from feet to bobber, and going down from the bobber that far
# | we can achieve this by dividing a 100x scaled up difference of feet and bobber height by 16

# bobber height
execute summon marker run function gm4_reeling_rods:get_execution_pos
# | position stored in storage gm4_reeling_rods:temp position
execute store result score $bobberY gm4_reeling_rods.math run data get storage gm4_reeling_rods:temp position[1] 100

# feet height
execute at @s summon marker run function gm4_reeling_rods:get_execution_pos
# | position stored in storage gm4_reeling_rods:temp position
execute store result score $feetY gm4_reeling_rods.math run data get storage gm4_reeling_rods:temp position[1] 100

scoreboard players operation $bobberY gm4_reeling_rods.math -= $feetY gm4_reeling_rods.math

scoreboard players set #16 gm4_reeling_rods.math 16
execute store result storage gm4_reeling_rods:temp displacement float 0.1 \
  run scoreboard players operation $bobberY gm4_reeling_rods.math /= #16 gm4_reeling_rods.math

# use this as a macro for the falling block displacement
function gm4_reeling_rods:reeling/enderman/falling_block with storage gm4_reeling_rods:temp
