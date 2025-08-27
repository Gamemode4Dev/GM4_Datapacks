# Logic for when a player receives a bit
# @s = player who received a bit
# at @s
# with {bit, UUID}
# run from player/bit_{bit}_{value}

$data modify storage gm4_reeling_rods:players "$(UUID)".bit_$(bit) set from storage gm4_reeling_rods:temp bit_data.bit_score

# fail if not all bits
$execute store result score $bit_count gm4_reeling_rods.math run data get storage gm4_reeling_rods:players "$(UUID)"
execute unless score $bit_count gm4_reeling_rods.math matches 16 run return fail

# all bits received
$function gm4_reeling_rods:player/find_hooked_entity with storage gm4_reeling_rods:players "$(UUID)"

# clear storage
$data remove storage gm4_reeling_rods:players "$(UUID)"
