# set damage on armor item
# @s = player wearing the item
# at unspecified
# run from armor/modifier/type/sword_ring/damage_dealt/apply_durability

$execute if score $sword_id gm4_ce_data matches 0 run item modify entity @s armor.head {function:"minecraft:set_components",components:{"minecraft:damage":$(damage)}}
$execute if score $sword_id gm4_ce_data matches 1 run item modify entity @s armor.chest {function:"minecraft:set_components",components:{"minecraft:damage":$(damage)}}
$execute if score $sword_id gm4_ce_data matches 2 run item modify entity @s armor.legs {function:"minecraft:set_components",components:{"minecraft:damage":$(damage)}}
$execute if score $sword_id gm4_ce_data matches 3 run item modify entity @s armor.feet {function:"minecraft:set_components",components:{"minecraft:damage":$(damage)}}
