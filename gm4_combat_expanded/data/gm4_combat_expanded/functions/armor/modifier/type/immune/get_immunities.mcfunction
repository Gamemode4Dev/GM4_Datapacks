# grant immunity tags to player depending on the armor worn
# @s = player wearing immune armour below 50% health
# at unspecified
# run from armor/modifier/check_modifier/hp_check

# get levels
execute store result score $level gm4_ce_data run data get storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.level
execute store result score $level2 gm4_ce_data run data get storage gm4_combat_expanded:temp components."minecraft:custom_data".gm4_combat_expanded.level2

# get effects to become immune to
execute if score $level gm4_ce_data matches 1 run tag @s add gm4_ce_immune_fatigue
execute if score $level gm4_ce_data matches 2 run tag @s add gm4_ce_immune_poison
execute if score $level gm4_ce_data matches 3 run tag @s add gm4_ce_immune_weakness

execute if score $level2 gm4_ce_data matches 1 run tag @s add gm4_ce_immune_hunger
execute if score $level2 gm4_ce_data matches 2 run tag @s add gm4_ce_immune_blind
execute if score $level2 gm4_ce_data matches 3 run tag @s add gm4_ce_immune_nausea
execute if score $level2 gm4_ce_data matches 4 run tag @s add gm4_ce_immune_wither

# remove effects if they were present
execute if score $level gm4_ce_data matches 1 run effect clear @s mining_fatigue
execute if score $level gm4_ce_data matches 2 run effect clear @s poison
execute if score $level gm4_ce_data matches 3 run effect clear @s weakness

execute if score $level2 gm4_ce_data matches 1 run effect clear @s hunger
execute if score $level2 gm4_ce_data matches 2 run effect clear @s blindness
execute if score $level2 gm4_ce_data matches 3 run effect clear @s nausea
execute if score $level2 gm4_ce_data matches 4 run effect clear @s wither

# tag for effect removal
tag @s add gm4_ce_immune_active
