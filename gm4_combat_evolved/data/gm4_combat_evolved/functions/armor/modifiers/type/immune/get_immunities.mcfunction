# grant immunity tags to player depending on the armor worn
# @s = player wearing immune armour above 50% health
# run from armor/modifiers/type/immune/check

# get levels
execute store result score $level gm4_ce_data run data get storage gm4_combat_evolved:temp tag.gm4_combat_evolved.level
execute store result score $level2 gm4_ce_data run data get storage gm4_combat_evolved:temp tag.gm4_combat_evolved.level2

# get effects to become immune to
execute if score $level gm4_ce_data matches 1 run tag @s add gm4_ce_immune_fatigue
execute if score $level gm4_ce_data matches 2 run tag @s add gm4_ce_immune_poison
execute if score $level gm4_ce_data matches 3 run tag @s add gm4_ce_immune_wither

execute if score $level2 gm4_ce_data matches 1 run tag @s add gm4_ce_immune_hunger
execute if score $level2 gm4_ce_data matches 2 run tag @s add gm4_ce_immune_blind
execute if score $level2 gm4_ce_data matches 3 run tag @s add gm4_ce_immune_nausea
execute if score $level2 gm4_ce_data matches 4 run tag @s add gm4_ce_immune_weakness

# tag for effect removal
tag @s add gm4_ce_immune_active
