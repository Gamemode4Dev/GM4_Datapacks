# Action for reeled llama or trader llama
# @s = llama or trader llama
# at bobber in @s
# run from hooked_entity/select_type

# chest, then carpet
execute unless function gm4_reeling_rods:reeling/stealable/steal_slot/chested_horse \
  run function gm4_reeling_rods:reeling/stealable/steal_slot/body
