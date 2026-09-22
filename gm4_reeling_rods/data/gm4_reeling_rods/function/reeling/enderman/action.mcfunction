# Action for reeled enderman
# @s = enderman
# at bobber in @s
# run from hooked_entity/select_type

# fail if no held block
execute unless data entity @s carriedBlockState run return fail

## determine summon location
# | bobber sits at 80% up the hitbox, we want 30% up from the feet for the held block, which is also 50% of the hitbox height down from the bobber
# | this works out to taking 62.5% of the height from feet to bobber, and going down from the bobber that far

# bobber height
execute summon marker run function gm4_reeling_rods:get_execution_pos
# | position stored in storage gm4_reeling_rods:temp position
data modify storage gm4_reeling_rods:temp y1 set from storage gm4_reeling_rods:temp position[1]

# feet height
execute at @s summon marker run function gm4_reeling_rods:get_execution_pos
# | position stored in storage gm4_reeling_rods:temp position
data modify storage gm4_reeling_rods:temp y2 set from storage gm4_reeling_rods:temp position[1]

data modify storage gm4_reeling_rods:temp displacement set compute default float { \
  "type":"minecraft:mul", \
  "inputs":[ \
    0.625, \
    { \
      "type": "minecraft:sub", \
      "left": { \
        "type": "minecraft:storage", \
        "storage": "gm4_reeling_rods:temp", \
        "path": "y1" \
      }, \
      "right": { \
        "type": "minecraft:storage", \
        "storage": "gm4_reeling_rods:temp", \
        "path": "y2" \
      } \
    } \
  ] \
}

# use this as a macro for the falling block displacement
function gm4_reeling_rods:reeling/enderman/falling_block with storage gm4_reeling_rods:temp
