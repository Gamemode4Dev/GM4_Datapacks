# Checks slots to steal
# @s = #gm4_reeling_rods:steal_equipment
# at bobber in @s
# run from fished/stealable/steal_equipment

# 3
execute if items entity @s armor.head * run return run function gm4_reeling_rods:fished/stealable/steal_slot/head
# 5
execute if items entity @s armor.legs * run return run function gm4_reeling_rods:fished/stealable/steal_slot/legs
# 2
execute if items entity @s weapon.offhand * run return run function gm4_reeling_rods:fished/stealable/steal_slot/offhand
# 4
execute if items entity @s armor.chest * run return run function gm4_reeling_rods:fished/stealable/steal_slot/chest
# 6
execute if items entity @s armor.feet * run return run function gm4_reeling_rods:fished/stealable/steal_slot/feet
# 1
execute if items entity @s weapon.mainhand * run return run function gm4_reeling_rods:fished/stealable/steal_slot/mainhand

return fail
