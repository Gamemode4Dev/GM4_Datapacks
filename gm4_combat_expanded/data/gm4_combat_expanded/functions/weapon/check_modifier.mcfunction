# check the modifier on the used weapon
# @s = player wielding the weapon
# at @s
# run from weapon/process

execute if score $modifier gm4_ce_data matches 101 run function gm4_combat_expanded:weapon/modifiers/poison
execute if score $modifier gm4_ce_data matches 102 run function gm4_combat_expanded:weapon/modifiers/weakness
execute if score $modifier gm4_ce_data matches 103 run function gm4_combat_expanded:weapon/modifiers/glow/activate
execute if score $modifier gm4_ce_data matches 104 run function gm4_combat_expanded:weapon/modifiers/fly
execute if score $modifier gm4_ce_data matches 105 run function gm4_combat_expanded:weapon/modifiers/delay/activate
execute if score $modifier gm4_ce_data matches 106 if data storage gm4_combat_expanded:temp tag.Enchantments run function gm4_combat_expanded:weapon/modifiers/chaos
execute if score $modifier gm4_ce_data matches 107 run function gm4_combat_expanded:weapon/modifiers/eat
execute if score $modifier gm4_ce_data matches 108 run function gm4_combat_expanded:weapon/modifiers/heal/activate
execute if score $modifier gm4_ce_data matches 109 run function gm4_combat_expanded:weapon/modifiers/wither/activate
