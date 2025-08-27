# Pick an order to check hand slots for stealing
# @s = #gm4_reeling_rods:steal_hand
# at bobber in @s
# run from hooked_entity/select_type

execute store result score $mainhand_first gm4_reeling_rods.math run random value 0..1

execute if score $mainhand_first gm4_reeling_rods.math matches 1 if items entity @s weapon.mainhand * run return run function gm4_reeling_rods:reeling/stealable/steal_slot/mainhand
execute if items entity @s weapon.offhand * run return run function gm4_reeling_rods:reeling/stealable/steal_slot/offhand
execute if score $mainhand_first gm4_reeling_rods.math matches 0 if items entity @s weapon.mainhand * run return run function gm4_reeling_rods:reeling/stealable/steal_slot/mainhand

return fail
