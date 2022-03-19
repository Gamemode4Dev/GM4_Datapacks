# run from mobs/initiate
# @s = slime / magma cube
# at @s

# calculate stats based on difficulty
scoreboard players operation $mob_health gm4_ce_data += $difficulty gm4_ce_data
execute if score $difficulty gm4_ce_data matches 8.. if predicate gm4_combat_evolved:technical/chance_5 run data modify entity @s Size set value 4
execute if score $difficulty gm4_ce_data matches 11.. if predicate gm4_combat_evolved:technical/chance_15 run data modify entity @s Size set value 4
execute if score $difficulty gm4_ce_data matches 11.. if predicate gm4_combat_evolved:technical/chance_5 run data modify entity @s Size set value 5

# biome specific modifiers for this mob
execute if predicate gm4_combat_evolved:mobs/modifiers/flowering run tag @s add gm4_ce_growing_slime
execute if predicate gm4_combat_evolved:mobs/modifiers/toxic run tag @s[type=slime] add gm4_ce_poison_landing

# set modifiers
function gm4_combat_evolved:mobs/modifiers/prep
