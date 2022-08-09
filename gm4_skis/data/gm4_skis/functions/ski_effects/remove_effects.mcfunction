# Remove effects from players no longer on snowy blocks or wearing skis
# @s = player not on snowy block or wearing skis
# at @s
# run from functions/check_ski_requirements_met

effect clear @s minecraft:speed
##################################### TODO: CHANGE ON_SNOWY_BLOCK #####################################
execute at @s anchored eyes positioned ^ ^ ^ unless predicate gm4_skis:on_snowy_block run tag @s remove gm4_on_snow