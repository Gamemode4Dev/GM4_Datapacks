# grow slime in size
# @s = slime
# at @s
# run from mob/init/mob_type/slime/base

execute if score $size gm4_sr_data matches 2..3 if predicate gm4_monsters_unbound:chance/slime/grow_common run scoreboard players add $size gm4_sr_data 1
execute if score $size gm4_sr_data matches 2..3 if predicate gm4_monsters_unbound:chance/slime/grow_common run scoreboard players add $size gm4_sr_data 1
