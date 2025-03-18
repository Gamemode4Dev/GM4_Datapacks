# Gets the next id
# with {bit}
# run from id/set and self

# Data storage gm4_reeling_rods:id next
  # bit_0..15 : "gm4_reeling_rods.id.<0..15>.[0|1]"

# change bit 0 -> 1, return nothing else to do
$execute if data storage gm4_reeling_rods:id {next:{bit_$(bit):"gm4_reeling_rods.id.$(bit).0"}} \
  run return run data modify storage gm4_reeling_rods:id next.bit_$(bit) set value "gm4_reeling_rods.id.$(bit).1"

# change bit 1 -> 0, then go on to next bit
# from here we know the bit is 1 so we don't need to check it
$data modify storage gm4_reeling_rods:id next.bit_$(bit) set value "gm4_reeling_rods.id.$(bit).0"
execute if score $bit gm4_reeling_rods.math matches 15 run return 1
# next bit
execute store result storage gm4_reeling_rods:id bit int 1 run scoreboard players add $bit gm4_reeling_rods.math 1
function gm4_reeling_rods:id/get_next with storage gm4_reeling_rods:id
