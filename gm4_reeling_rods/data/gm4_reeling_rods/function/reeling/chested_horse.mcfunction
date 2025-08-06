# Action for reeled #gm4_reeling_rods:chested_horse
# @s = #gm4_reeling_rods:chested_horse
# at bobber in @s
# run from hooked_entity/select_type

# chest, then saddle
execute unless function gm4_reeling_rods:reeling/stealable/steal_slot/chested_horse \
  run function gm4_reeling_rods:reeling/stealable/steal_slot/saddle
