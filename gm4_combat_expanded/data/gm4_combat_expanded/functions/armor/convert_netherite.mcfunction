# update the weapon damage tooltip and name when it is upgraded to netherite
# @s = player wielding the weapon
# at @s
# run from any armor/slot/<SLOT>/check

# set armor to be converted
data modify storage gm4_combat_expanded:temp tag.gm4_combat_expanded.netherite set value 1

# add stats from netherite
execute store result score $armor gm4_ce_data run data get storage gm4_combat_expanded:temp tag.AttributeModifiers[{Name:"generic.armor_toughness"}].Amount 10
execute store result storage gm4_combat_expanded:temp tag.AttributeModifiers[{Name:"generic.armor_toughness"}].Amount double 0.1 run scoreboard players add $armor gm4_ce_data 10
data modify storage gm4_combat_expanded:temp tag.AttributeModifiers[{Name:"generic.knockback_resistance"}].Amount set value 0.1d

# update item
scoreboard players set $change gm4_ce_data 1
