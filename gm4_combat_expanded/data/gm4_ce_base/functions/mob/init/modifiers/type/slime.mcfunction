# calculate modifiers for newly spawned slime / magma cube
# @s = slime / magma cube
# at @s
# run from mob/init/base_stats/check_type

# size changes based on difficulty
execute if score $size gm4_ce_data matches 1..3 if predicate gm4_ce_base:technical/chance/slime_grow_common run scoreboard players add $size gm4_ce_data 1
execute if score $size gm4_ce_data matches 1..3 if predicate gm4_ce_base:technical/chance/slime_grow_rare run scoreboard players add $size gm4_ce_data 1
