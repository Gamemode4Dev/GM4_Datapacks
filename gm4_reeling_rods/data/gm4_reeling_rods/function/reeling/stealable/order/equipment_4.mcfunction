# Checks slots to steal
# @s = #gm4_reeling_rods:steal_equipment
# at bobber in @s
# run from reeling/stealable/steal_equipment

# 4
execute if items entity @s armor.chest * unless items entity @s armor.chest *[minecraft:enchantments={"minecraft:binding_curse":1}] \
  run return run function gm4_reeling_rods:reeling/stealable/steal_slot/chest
# 6
execute if items entity @s armor.feet * unless items entity @s armor.feet *[minecraft:enchantments={"minecraft:binding_curse":1}] \
  run return run function gm4_reeling_rods:reeling/stealable/steal_slot/feet
# 1
execute if items entity @s weapon.mainhand * \
  run return run function gm4_reeling_rods:reeling/stealable/steal_slot/mainhand
# 3
execute if items entity @s armor.head * unless items entity @s armor.head *[minecraft:enchantments={"minecraft:binding_curse":1}] \
  run return run function gm4_reeling_rods:reeling/stealable/steal_slot/head
# 5
execute if items entity @s armor.legs * unless items entity @s armor.legs *[minecraft:enchantments={"minecraft:binding_curse":1}] \
  run return run function gm4_reeling_rods:reeling/stealable/steal_slot/legs
# 2
execute if items entity @s weapon.offhand * \
  run return run function gm4_reeling_rods:reeling/stealable/steal_slot/offhand

return fail
