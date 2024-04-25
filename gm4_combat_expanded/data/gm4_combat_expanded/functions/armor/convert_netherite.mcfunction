# update the weapon damage tooltip and name when it is upgraded to netherite
# @s = player wielding the weapon
# at @s
# run from any armor/slot/<SLOT>

# set armor to be converted
data modify storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.netherite set value 1
data modify storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.material set value 6

# add stats from netherite
execute store result score $armor gm4_ce_data run data get storage gm4_combat_expanded:temp components."minecraft:attribute_modifiers".modifiers[{name:"generic.armor_toughness"}].amount 10
execute store result storage gm4_combat_expanded:temp components."minecraft:attribute_modifiers".modifiers[{name:"generic.armor_toughness"}].amount double 0.1 run scoreboard players add $armor gm4_ce_data 10
data modify storage gm4_combat_expanded:temp components."minecraft:attribute_modifiers".modifiers[{name:"generic.knockback_resistance"}].amount set value 0.1d

# set durability from netherite
execute store result score $slot gm4_ce_data run data get storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.slot
execute if score $slot gm4_ce_data matches 3 run data modify storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.durability set value 481
execute if score $slot gm4_ce_data matches 2 run data modify storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.durability set value 555
execute if score $slot gm4_ce_data matches 1 run data modify storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.durability set value 592
execute if score $slot gm4_ce_data matches 0 run data modify storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.durability set value 407

# update item
scoreboard players set $change gm4_ce_data 1
