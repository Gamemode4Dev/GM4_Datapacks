# Action for reeled #gm4_reeling_rods:steal_body_and_saddle
# @s = #gm4_reeling_rods:steal_body_and_saddle
# at bobber in @s
# run from hooked_entity/select_type

# body, then saddle
execute unless function gm4_reeling_rods:reeling/stealable/steal_slot/body \
  run function gm4_reeling_rods:reeling/stealable/steal_slot/saddle
