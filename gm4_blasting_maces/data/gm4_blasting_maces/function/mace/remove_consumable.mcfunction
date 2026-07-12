# Removes the consumable component from a mace that no longer has the blasting enchantment
# @s = player holding a mace without blasting enchantment
# at unspecified
# run from gm4_blasting_maces:main

execute if items entity @s weapon.mainhand minecraft:mace[minecraft:consumable,!minecraft:enchantments~[{enchantment:"gm4_blasting_maces:blasting"}]] run item modify entity @s weapon.mainhand gm4_blasting_maces:remove_consumable
execute if items entity @s weapon.offhand minecraft:mace[minecraft:consumable,!minecraft:enchantments~[{enchantment:"gm4_blasting_maces:blasting"}]] run item modify entity @s weapon.offhand gm4_blasting_maces:remove_consumable
