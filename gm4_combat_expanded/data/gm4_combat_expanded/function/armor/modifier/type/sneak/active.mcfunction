# mark armor as active
# @s = player wearing armor
# at unspecified
# run from armor/modifier/type/sneak/check

# mark as active
scoreboard players set $change gm4_ce_data 1
data modify storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.active set value 1
scoreboard players set $active gm4_ce_data 1
