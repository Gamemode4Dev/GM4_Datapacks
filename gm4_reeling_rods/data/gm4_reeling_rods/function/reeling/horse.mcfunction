# Action for reeled horse
# @s = horse
# at bobber in @s
# run from hooked_entity/select_type

# armor, then saddle
execute unless function gm4_reeling_rods:reeling/stealable/steal_slot/body \
  run function gm4_reeling_rods:reeling/stealable/steal_slot/saddle
