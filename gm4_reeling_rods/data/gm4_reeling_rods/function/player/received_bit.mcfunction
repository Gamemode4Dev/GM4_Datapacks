# Logic for when a player receives a bit
# @s = player who received a bit
# at @s
# with {bit, bit_tag}
# run from player/bit_{bit}_{value}

# Assumptions: 
  # bit and bit_tag are stored in storage gm4_reeling_rods:temp bit_data
  # this score is set to 0 after all bits received
scoreboard players add @s gm4_reeling_rods.bit_count 1

# if marker exists proceed to player/add_bit
execute as @e[type=minecraft:marker,distance=..0.001,tag=gm4_reeling_rods.player_marker,limit=1] run \
  return run function gm4_reeling_rods:player/add_bit with storage gm4_reeling_rods:temp bit_data

# first bit, no marker found, summon one
$summon minecraft:marker ~ ~ ~ \
  {\
    Tags:["gm4_reeling_rods.player_marker","smithed.strict","smithed.entity"],\
    data:{gm4_reeling_rods:{id:{bit_$(bit):"$(bit_tag)"}}},\
    CustomName:{"text":"gm4_reeling_rods.player_marker"}\
  }
