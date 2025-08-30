# Steal falling block of the enderman's held block
# @s = enderman
# at bobber in @s
# with {displacement}
# run from reeling/enderman/action

data modify storage gm4_reeling_rods:temp entity_data set value {}
$execute positioned ~ ~-$(displacement) ~ run function gm4_reeling_rods:get_motion_to_player
# | motion vector stored in gm4_reeling_rods:temp item_data.Motion
data modify storage gm4_reeling_rods:temp entity_type set value "minecraft:falling_block"
data modify storage gm4_reeling_rods:temp entity_data.Motion set from storage gm4_reeling_rods:temp item_data.Motion
data modify storage gm4_reeling_rods:temp entity_data.BlockState set from entity @s carriedBlockState
data remove entity @s carriedBlockState
$execute positioned ~ ~-$(displacement) ~ run function gm4_reeling_rods:reeling/summon_entity with storage gm4_reeling_rods:temp
