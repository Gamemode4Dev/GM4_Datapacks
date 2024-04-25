
data modify storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.modifier set value "convert"
data remove storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.convert

scoreboard players set $change gm4_ce_data 1
