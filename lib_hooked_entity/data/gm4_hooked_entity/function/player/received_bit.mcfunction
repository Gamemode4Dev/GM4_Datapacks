# Logic for when a player receives a bit
# @s = player who received a bit
# at @s
# with {bit, UUID}
# run from player/bit_{bit}_{value}

$data modify storage gm4_hooked_entity:players "$(UUID)".bit_$(bit) set from storage gm4_hooked_entity:temp bit_data.bit_score

# fail if not all bits
$execute store result score $bit_count gm4_hooked_entity.math run data get storage gm4_hooked_entity:players "$(UUID)"
execute unless score $bit_count gm4_hooked_entity.math matches 16 run return fail

# all bits received
$function gm4_hooked_entity:player/find_hooked_entity with storage gm4_hooked_entity:players "$(UUID)"

# clear storage
$data remove storage gm4_hooked_entity:players "$(UUID)"
