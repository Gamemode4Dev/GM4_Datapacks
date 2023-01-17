# grow slime in size
# @s = slime
# at @s
# run from mob/mob_type/slime

execute if score $size gm4_ce_data matches 2..3 if predicate gm4_combat_expanded:technical/chance/slime_grow_common run scoreboard players add $size gm4_ce_data 1
execute if score $size gm4_ce_data matches 2..3 if predicate gm4_combat_expanded:technical/chance/slime_grow_common run scoreboard players add $size gm4_ce_data 1
