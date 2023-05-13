# randomly enchant the weapon with level 15-40 enchants
# @s = player wielding the weapon
# at @s
# run from weapon/check_modifier

# get random enchants
# slots 0 is reserved for the weapon, slot 1 is reserved for the modifier
loot replace block 29999998 1 7134 container.2 loot gm4_combat_expanded:technical/enchant_randomly

# transfer enchants to item
data modify storage gm4_combat_expanded:temp tag.Enchantments set from block 29999998 1 7134 Items[{Slot:2b}].tag.StoredEnchantments
item modify entity @s weapon.mainhand gm4_combat_expanded:update

# particles
particle minecraft:entity_effect ~ ~0.7 ~ 0.25 0.5 0.25 1 15
