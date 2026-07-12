# Adds the consumable component so the mace responds to right click
# @s = player holding a mace with blasting enchantment
# at unspecified
# run from gm4_blasting_maces:main

execute if items entity @s weapon.mainhand minecraft:mace[minecraft:enchantments~[{enchantment:"gm4_blasting_maces:blasting"}],!minecraft:consumable] run item modify entity @s weapon.mainhand gm4_blasting_maces:add_consumable
execute if items entity @s weapon.offhand minecraft:mace[minecraft:enchantments~[{enchantment:"gm4_blasting_maces:blasting"}],!minecraft:consumable] run item modify entity @s weapon.offhand gm4_blasting_maces:add_consumable
