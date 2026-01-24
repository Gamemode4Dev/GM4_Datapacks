# Adds the tool component to the blasting mace so that it can break blocks
# @s = player holding a mace with blasting enchantment
# at @s
# run from gm4_blasting_maces:tick

# add tool component to enchanted mace
execute if items entity @s weapon.mainhand minecraft:mace[minecraft:enchantments~[{enchantment:"gm4_blasting_maces:blasting"}]] run item modify entity @s weapon.mainhand gm4_blasting_maces:add_tool
execute if items entity @s weapon.offhand minecraft:mace[minecraft:enchantments~[{enchantment:"gm4_blasting_maces:blasting"}]] run item modify entity @s weapon.offhand gm4_blasting_maces:add_tool
