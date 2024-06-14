# apply sneak attack speed
# @s = player wearing armor
# at unspecified
# run from armor/modifier/type/sneak/check

# remove invisibility
effect clear @s invisibility

# activate armor with 2, mark for change and set the time when attack speed should be removed
scoreboard players set $change gm4_ce_data 1
execute store result score $stop_time gm4_ce_data run time query gametime
execute store result storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.stop_time int 1 run scoreboard players add $stop_time gm4_ce_data 79
data modify storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.active set value 2
scoreboard players set $active gm4_ce_data 2

# activate attributes
execute store result storage gm4_combat_expanded:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_combat_expanded:dynamic"}].amount float 0.25 run data get storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.level
execute store result storage gm4_combat_expanded:temp components."minecraft:attribute_modifiers".modifiers[{id:"gm4_combat_expanded:dynamic_2"}].amount float 0.01 run data get storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.level2
