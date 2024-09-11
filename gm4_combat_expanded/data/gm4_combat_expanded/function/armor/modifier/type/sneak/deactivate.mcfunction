# deactivate sneak attack speed
# @s = player wearing armor
# at unspecified
# run from armor/modifier/type/sneak/check_time
# run from armor/modifier/type/sneak/check

# remove invisibility
effect clear @s invisibility

# mark as inactive
scoreboard players set $change gm4_ce_data 1
data modify storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.active set value 0
scoreboard players set $active gm4_ce_data 0

# remove attribute
data modify storage gm4_combat_expanded:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_combat_expanded:dynamic"}].amount set value 0
data modify storage gm4_combat_expanded:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_combat_expanded:dynamic_2"}].amount set value 0
