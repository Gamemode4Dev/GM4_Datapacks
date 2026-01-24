# Removes the tool component from a mace that no longer has the blasting enchantment
# @s = player holding a mace without blasting enchantment
# at @s
# run from gm4_blasting_maces:tick

# remove tool component from maces without the enchantment
execute if items entity @s weapon.mainhand minecraft:mace[!minecraft:enchantments~[{enchantment:"gm4_blasting_maces:blasting"}]] run item modify entity @s weapon.mainhand gm4_blasting_maces:remove_tool
execute if items entity @s weapon.offhand minecraft:mace[!minecraft:enchantments~[{enchantment:"gm4_blasting_maces:blasting"}]] run item modify entity @s weapon.offhand gm4_blasting_maces:remove_tool
