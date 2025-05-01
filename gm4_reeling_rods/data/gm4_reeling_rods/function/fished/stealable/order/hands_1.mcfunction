# Checks slots to steal
# @s = #gm4_reeling_rods:steal_hand
# at @s
# run from fished/stealable/steal_hand

execute if items entity @s weapon.mainhand * run return run function gm4_reeling_rods:fished/stealable/steal_slot/mainhand
execute if items entity @s weapon.offhand * run return run function gm4_reeling_rods:fished/stealable/steal_slot/offhand

return fail
