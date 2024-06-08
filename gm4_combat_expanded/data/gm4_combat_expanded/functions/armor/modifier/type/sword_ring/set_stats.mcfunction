# set sword stats when player is not sneaking
# @s = player wearing armor
# at unspecified
# run from armor/modifier/type/sword_ring/prep

execute store result storage gm4_combat_expanded:temp sword_ring.scale float 0.1 run attribute @s generic.scale get 10
execute store result storage gm4_combat_expanded:temp sword_ring.height float 0.11 run data get storage gm4_combat_expanded:temp sword_ring.scale 10 
execute store result storage gm4_combat_expanded:temp sword_ring.offset float 0.1 run attribute @s player.entity_interaction_range get 10
