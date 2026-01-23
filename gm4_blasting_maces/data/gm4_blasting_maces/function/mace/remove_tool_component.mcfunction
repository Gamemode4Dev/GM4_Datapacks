# Removes the tool component from a mace that no longer has the blasting enchantment
# @s = player holding a mace with tool component but no blasting enchantment
# at world spawn
# run from gm4_blasting_maces:tick

# remove tool component
execute if items entity @s weapon.mainhand minecraft:mace run item modify entity @s weapon.mainhand gm4_blasting_maces:remove_tool
execute if items entity @s weapon.offhand minecraft:mace run item modify entity @s weapon.offhand gm4_blasting_maces:remove_tool
