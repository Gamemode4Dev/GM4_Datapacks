# calculate modifiers for newly spawned slime / magma cube
# @s = slime / magma cube
# at @s
# run from mob/initiate

# calculate stats based on difficulty
scoreboard players operation $mob_health gm4_ce_data += $difficulty gm4_ce_data
execute if score $difficulty gm4_ce_data matches 8.. if predicate gm4_combat_expanded:technical/chance_5 run data modify entity @s Size set value 4
execute if score $difficulty gm4_ce_data matches 11.. if predicate gm4_combat_expanded:technical/chance_15 run data modify entity @s Size set value 4
execute if score $difficulty gm4_ce_data matches 11.. if predicate gm4_combat_expanded:technical/chance_5 run data modify entity @s Size set value 5

# biome specific modifiers for this mob
execute if predicate gm4_combat_expanded:mob/modifier/flowering store result score $size gm4_ce_data run data get entity @s Size
execute if predicate gm4_combat_expanded:mob/modifier/flowering if predicate gm4_combat_expanded:technical/chance_15 run scoreboard players add $size gm4_ce_data 1
execute if predicate gm4_combat_expanded:mob/modifier/flowering if predicate gm4_combat_expanded:technical/chance_15 run scoreboard players add $size gm4_ce_data 1
execute if predicate gm4_combat_expanded:mob/modifier/flowering store result entity @s Size int 1 run scoreboard players get $size gm4_ce_data
execute if predicate gm4_combat_expanded:mob/modifier/toxic run tag @s[type=slime] add gm4_ce_poison_landing

# set modifiers
function gm4_combat_expanded:mob/modifier/prep
