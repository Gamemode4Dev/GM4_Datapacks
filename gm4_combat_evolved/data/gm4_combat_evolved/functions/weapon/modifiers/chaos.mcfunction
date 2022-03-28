# run from weapon/check_modifier
# @s = player wielding the weapon
# at @s

# get random enchants
# slots 0 is reserved for the weapon, slot 1 is reserved for the modifier
loot replace block 29999998 1 7134 container.2 loot gm4_combat_evolved:technical/enchant_randomly

# transfer enchants to item
data modify storage gm4_combat_evolved:temp tag.Enchantments set from block 29999998 1 7134 Items[{Slot:2b}].tag.StoredEnchantments
item modify entity @s weapon.mainhand gm4_combat_evolved:update
